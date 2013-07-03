/*
 *  Buffer-based memory allocator
 *
 *  Copyright (C) 2006-2013, Brainspark B.V.
 *
 *  This file is part of PolarSSL (http://www.polarssl.org)
 *  Lead Maintainer: Paul Bakker <polarssl_maintainer at polarssl.org>
 *
 *  All rights reserved.
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License along
 *  with this program; if not, write to the Free Software Foundation, Inc.,
 *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#include "polarssl/config.h"

#if defined(POLARSSL_MEMORY_C) && defined(POLARSSL_MEMORY_BUFFER_ALLOC_C)

#include "polarssl/memory.h"

#include <string.h>

#if defined(POLARSSL_MEMORY_DEBUG)
#include <stdio.h>
#if defined(POLARSSL_MEMORY_BACKTRACE)
#include <execinfo.h>
#endif
#endif

#define MAGIC1       0xFF00AA55
#define MAGIC2       0xEE119966
#define MAX_BT 20

typedef struct _memory_header memory_header;
struct _memory_header
{
    size_t          magic1;
    size_t          size;
    size_t          alloc;
    memory_header   *prev;
    memory_header   *next;
#if defined(POLARSSL_MEMORY_BACKTRACE)
    char            **trace;
    size_t          trace_count;
#endif
    size_t          magic2;
};

typedef struct
{
    unsigned char   *buf;
    size_t          len;
    memory_header   *first;
    size_t          largest_free;
    size_t          current_alloc_size;
    int             verify;
}
buffer_alloc_ctx;

static buffer_alloc_ctx heap;

#if defined(POLARSSL_MEMORY_DEBUG)
static void debug_header( memory_header *hdr )
{
#if defined(POLARSSL_MEMORY_BACKTRACE)
    size_t i;
#endif

    fprintf(stderr, "HDR:  PTR(%10u), PREV(%10u), NEXT(%10u), ALLOC(%u), SIZE(%10u)\n",
            (size_t) hdr, (size_t) hdr->prev, (size_t) hdr->next,
            hdr->alloc, hdr->size );

#if defined(POLARSSL_MEMORY_BACKTRACE)
    fprintf(stderr, "TRACE: \n");
    for( i = 0; i < hdr->trace_count; i++ )
        fprintf(stderr, "%s\n", hdr->trace[i]);
#endif
}

static void debug_chain()
{
    memory_header *cur = heap.first;

    while( cur != NULL )
    {
        debug_header( cur );
        fprintf(stderr, "\n");
        cur = cur->next;
    }
}
#endif /* POLARSSL_MEMORY_DEBUG */

static int verify_header( memory_header *hdr )
{
    if( hdr->magic1 != MAGIC1 )
    {
#if defined(POLARSSL_MEMORY_DEBUG)
        fprintf(stderr, "FATAL: MAGIC1 mismatch\n");
#endif
        return( 1 );
    }

    if( hdr->magic2 != MAGIC2 )
    {
#if defined(POLARSSL_MEMORY_DEBUG)
        fprintf(stderr, "FATAL: MAGIC2 mismatch\n");
#endif
        return( 1 );
    }

    if( hdr->alloc > 1 )
    {
#if defined(POLARSSL_MEMORY_DEBUG)
        fprintf(stderr, "FATAL: alloc has illegal value\n");
#endif
        return( 1 );
    }

    return( 0 );
}

static int verify_chain()
{
    memory_header *prv = heap.first, *cur = heap.first->next;

    if( verify_header( heap.first ) != 0 )
    {
#if defined(POLARSSL_MEMORY_DEBUG)
        fprintf(stderr, "FATAL: verification of first header failed\n");
#endif
        return( 1 );
    }

    if( heap.first->prev != NULL )
    {
#if defined(POLARSSL_MEMORY_DEBUG)
        fprintf(stderr, "FATAL: verification failed: first->prev != NULL\n");
#endif
        return( 1 );
    }

    while( cur != NULL )
    {
        if( verify_header( cur ) != 0 )
        {
#if defined(POLARSSL_MEMORY_DEBUG)
            fprintf(stderr, "FATAL: verification of header failed\n");
#endif
            return( 1 );
        }

        if( cur->prev != prv )
        {
#if defined(POLARSSL_MEMORY_DEBUG)
            fprintf(stderr, "FATAL: verification failed: cur->prev != prv\n");
#endif
            return( 1 );
        }

        prv = cur;
        cur = cur->next;
    }

    return( 0 );
}

static void *buffer_alloc_malloc( size_t len )
{
    memory_header *new, *cur = heap.first;
    unsigned char *p;
#if defined(POLARSSL_MEMORY_BACKTRACE)
    void *trace_buffer[MAX_BT];
    size_t trace_cnt;
#endif

    if( heap.buf == NULL || heap.first == NULL )
        return( NULL );

    if( len % POLARSSL_MEMORY_ALIGN_MULTIPLE )
    {
        len -= len % POLARSSL_MEMORY_ALIGN_MULTIPLE;
        len += POLARSSL_MEMORY_ALIGN_MULTIPLE;
    }

    // Find block that fits
    //
    while( cur != NULL )
    {
        if( cur->alloc == 0 && cur->size >= len )
            break;

        cur = cur->next;
    }

    if( cur == NULL )
        return( NULL );

    // Found location, split block if > memory_header + 4 room left
    //
    if( cur->size - len < sizeof(memory_header) + POLARSSL_MEMORY_ALIGN_MULTIPLE )
    {
        cur->alloc = 1;

#if defined(POLARSSL_MEMORY_BACKTRACE)
        trace_cnt = backtrace( trace_buffer, MAX_BT );
        cur->trace = backtrace_symbols( trace_buffer, trace_cnt );
        cur->trace_count = trace_cnt;
#endif

        if( ( heap.verify & MEMORY_VERIFY_ALLOC ) && verify_chain() != 0 )
            exit( 1 );

        return ( (unsigned char *) cur ) + sizeof(memory_header);
    }

    p = ( (unsigned char *) cur ) + sizeof(memory_header) + len;
    new = (memory_header *) p;

    new->size = cur->size - len - sizeof(memory_header);
    new->alloc = 0;
    new->prev = cur;
    new->next = cur->next;
#if defined(POLARSSL_MEMORY_BACKTRACE)
    new->trace = NULL;
    new->trace_count = 0;
#endif
    new->magic1 = MAGIC1;
    new->magic2 = MAGIC2;

    if( new->next != NULL )
        new->next->prev = new;

    cur->alloc = 1;
    cur->size = len;
    cur->next = new;

#if defined(POLARSSL_MEMORY_BACKTRACE)
    trace_cnt = backtrace( trace_buffer, MAX_BT );
    cur->trace = backtrace_symbols( trace_buffer, trace_cnt );
    cur->trace_count = trace_cnt;
#endif

    if( ( heap.verify & MEMORY_VERIFY_ALLOC ) && verify_chain() != 0 )
        exit( 1 );

    return ( (unsigned char *) cur ) + sizeof(memory_header);
}

static void buffer_alloc_free( void *ptr )
{
    memory_header *hdr, *old;
    unsigned char *p = (unsigned char *) ptr;


    if( ptr == NULL || heap.buf == NULL || heap.first == NULL )
        return;

    if( p < heap.buf || p > heap.buf + heap.len )
    {
#if defined(POLARSSL_MEMORY_DEBUG)
        fprintf(stderr, "FATAL: polarssl_free() outside of managed space\n");
#endif
        exit(1);
    }

    p -= sizeof(memory_header);
    hdr = (memory_header *) p;

    if( verify_header( hdr ) != 0 )
        exit( 1 );

    if( hdr->alloc != 1 )
    {
#if defined(POLARSSL_MEMORY_DEBUG)
        fprintf(stderr, "FATAL: polarssl_free() on unallocated data\n");
#endif
        exit(1);
    }

    hdr->alloc = 0;

    // Regroup with block before
    //
    if( hdr->prev != NULL && hdr->prev->alloc == 0 )
    {
        hdr->prev->size += sizeof(memory_header) + hdr->size;
        hdr->prev->next = hdr->next;
        old = hdr;
        hdr = hdr->prev;

        if( hdr->next != NULL )
            hdr->next->prev = hdr;

#if defined(POLARSSL_MEMORY_BACKTRACE)
        free( old->trace );
#endif
        memset( old, 0, sizeof(memory_header) );
    }

    // Regroup with block after
    //
    if( hdr->next != NULL && hdr->next->alloc == 0 )
    {
        hdr->size += sizeof(memory_header) + hdr->next->size;
        old = hdr->next;
        hdr->next = hdr->next->next;

        if( hdr->next != NULL )
            hdr->next->prev = hdr;

#if defined(POLARSSL_MEMORY_BACKTRACE)
        free( old->trace );
#endif
        memset( old, 0, sizeof(memory_header) );
    }

#if defined(POLARSSL_MEMORY_BACKTRACE)
    hdr->trace = NULL;
    hdr->trace_count = 0;
#endif

    if( ( heap.verify & MEMORY_VERIFY_FREE ) && verify_chain() != 0 )
        exit( 1 );
}

int memory_buffer_alloc_verify()
{
    return verify_chain();
}

#if defined(POLARSSL_MEMORY_DEBUG)
void memory_buffer_alloc_status()
{
    if( heap.first->next == NULL )
        fprintf(stderr, "All memory de-allocated in stack buffer\n");
    else
    {
        fprintf(stderr, "Memory currently allocated:\n");
        debug_chain();
    }
}
#endif /* POLARSSL_MEMORY_BUFFER_ALLOC_DEBUG */

int memory_buffer_alloc_init( unsigned char *buf, size_t len )
{
    polarssl_malloc = buffer_alloc_malloc;
    polarssl_free = buffer_alloc_free;

    memset( &heap, 0, sizeof(buffer_alloc_ctx) );
    memset( buf, 0, len );

    heap.buf = buf;
    heap.len = len;

    heap.first = (memory_header *) buf;
    heap.first->size = len - sizeof(memory_header);
    heap.first->magic1 = MAGIC1;
    heap.first->magic2 = MAGIC2;

    heap.largest_free = heap.first->size;

    return( 0 );
}

#endif /* POLARSSL_MEMORY_C && POLARSSL_MEMORY_BUFFER_ALLOC_C */