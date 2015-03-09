# Microsoft Developer Studio Project File - Name="mbedtls" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

CFG=mbedtls - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "mbedtls.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "mbedtls.mak" CFG="mbedtls - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "mbedtls - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "mbedtls - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "mbedtls - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ""
# PROP BASE Intermediate_Dir "temp"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ""
# PROP Intermediate_Dir "temp"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_MBCS" /D "_LIB" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /I "../../include" /D "NDEBUG" /D "WIN32" /D "_MBCS" /D "_LIB" /YX /FD /c
# ADD BASE RSC /l 0x40c /d "NDEBUG"
# ADD RSC /l 0x40c /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "mbedtls - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ""
# PROP BASE Intermediate_Dir "temp"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ""
# PROP Intermediate_Dir "temp"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /D "WIN32" /D "_DEBUG" /D "_MBCS" /D "_LIB" /YX /FD /GZ /c
# ADD CPP /nologo /W3 /GX /Z7 /Od /I "../../include" /D "_DEBUG" /D "WIN32" /D "_MBCS" /D "_LIB" /YX /FD /GZ /c
# ADD BASE RSC /l 0x40c /d "_DEBUG"
# ADD RSC /l 0x40c /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ENDIF

# Begin Target

# Name "mbedtls - Win32 Release"
# Name "mbedtls - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=..\..\library\aes.c
# End Source File
# Begin Source File

SOURCE=..\..\library\aesni.c
# End Source File
# Begin Source File

SOURCE=..\..\library\arc4.c
# End Source File
# Begin Source File

SOURCE=..\..\library\asn1parse.c
# End Source File
# Begin Source File

SOURCE=..\..\library\asn1write.c
# End Source File
# Begin Source File

SOURCE=..\..\library\base64.c
# End Source File
# Begin Source File

SOURCE=..\..\library\bignum.c
# End Source File
# Begin Source File

SOURCE=..\..\library\blowfish.c
# End Source File
# Begin Source File

SOURCE=..\..\library\camellia.c
# End Source File
# Begin Source File

SOURCE=..\..\library\ccm.c
# End Source File
# Begin Source File

SOURCE=..\..\library\certs.c
# End Source File
# Begin Source File

SOURCE=..\..\library\cipher.c
# End Source File
# Begin Source File

SOURCE=..\..\library\cipher_wrap.c
# End Source File
# Begin Source File

SOURCE=..\..\library\ctr_drbg.c
# End Source File
# Begin Source File

SOURCE=..\..\library\debug.c
# End Source File
# Begin Source File

SOURCE=..\..\library\des.c
# End Source File
# Begin Source File

SOURCE=..\..\library\dhm.c
# End Source File
# Begin Source File

SOURCE=..\..\library\ecdh.c
# End Source File
# Begin Source File

SOURCE=..\..\library\ecdsa.c
# End Source File
# Begin Source File

SOURCE=..\..\library\ecp.c
# End Source File
# Begin Source File

SOURCE=..\..\library\ecp_curves.c
# End Source File
# Begin Source File

SOURCE=..\..\library\entropy.c
# End Source File
# Begin Source File

SOURCE=..\..\library\entropy_poll.c
# End Source File
# Begin Source File

SOURCE=..\..\library\error.c
# End Source File
# Begin Source File

SOURCE=..\..\library\gcm.c
# End Source File
# Begin Source File

SOURCE=..\..\library\havege.c
# End Source File
# Begin Source File

SOURCE=..\..\library\hmac_drbg.c
# End Source File
# Begin Source File

SOURCE=..\..\library\md.c
# End Source File
# Begin Source File

SOURCE=..\..\library\md2.c
# End Source File
# Begin Source File

SOURCE=..\..\library\md4.c
# End Source File
# Begin Source File

SOURCE=..\..\library\md5.c
# End Source File
# Begin Source File

SOURCE=..\..\library\md_wrap.c
# End Source File
# Begin Source File

SOURCE=..\..\library\memory_buffer_alloc.c
# End Source File
# Begin Source File

SOURCE=..\..\library\net.c
# End Source File
# Begin Source File

SOURCE=..\..\library\oid.c
# End Source File
# Begin Source File

SOURCE=..\..\library\padlock.c
# End Source File
# Begin Source File

SOURCE=..\..\library\pbkdf2.c
# End Source File
# Begin Source File

SOURCE=..\..\library\pem.c
# End Source File
# Begin Source File

SOURCE=..\..\library\pk.c
# End Source File
# Begin Source File

SOURCE=..\..\library\pk_wrap.c
# End Source File
# Begin Source File

SOURCE=..\..\library\pkcs11.c
# End Source File
# Begin Source File

SOURCE=..\..\library\pkcs12.c
# End Source File
# Begin Source File

SOURCE=..\..\library\pkcs5.c
# End Source File
# Begin Source File

SOURCE=..\..\library\pkparse.c
# End Source File
# Begin Source File

SOURCE=..\..\library\pkwrite.c
# End Source File
# Begin Source File

SOURCE=..\..\library\platform.c
# End Source File
# Begin Source File

SOURCE=..\..\library\ripemd160.c
# End Source File
# Begin Source File

SOURCE=..\..\library\rsa.c
# End Source File
# Begin Source File

SOURCE=..\..\library\sha1.c
# End Source File
# Begin Source File

SOURCE=..\..\library\sha256.c
# End Source File
# Begin Source File

SOURCE=..\..\library\sha512.c
# End Source File
# Begin Source File

SOURCE=..\..\library\ssl_cache.c
# End Source File
# Begin Source File

SOURCE=..\..\library\ssl_ciphersuites.c
# End Source File
# Begin Source File

SOURCE=..\..\library\ssl_cli.c
# End Source File
# Begin Source File

SOURCE=..\..\library\ssl_cookie.c
# End Source File
# Begin Source File

SOURCE=..\..\library\ssl_srv.c
# End Source File
# Begin Source File

SOURCE=..\..\library\ssl_tls.c
# End Source File
# Begin Source File

SOURCE=..\..\library\threading.c
# End Source File
# Begin Source File

SOURCE=..\..\library\timing.c
# End Source File
# Begin Source File

SOURCE=..\..\library\version.c
# End Source File
# Begin Source File

SOURCE=..\..\library\version_features.c
# End Source File
# Begin Source File

SOURCE=..\..\library\x509.c
# End Source File
# Begin Source File

SOURCE=..\..\library\x509_create.c
# End Source File
# Begin Source File

SOURCE=..\..\library\x509_crl.c
# End Source File
# Begin Source File

SOURCE=..\..\library\x509_crt.c
# End Source File
# Begin Source File

SOURCE=..\..\library\x509_csr.c
# End Source File
# Begin Source File

SOURCE=..\..\library\x509write_crt.c
# End Source File
# Begin Source File

SOURCE=..\..\library\x509write_csr.c
# End Source File
# Begin Source File

SOURCE=..\..\library\xtea.c
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=..\..\include\mbedtls\aes.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\aesni.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\arc4.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\asn1.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\asn1write.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\base64.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\bignum.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\blowfish.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\bn_mul.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\camellia.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\ccm.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\certs.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\check_config.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\cipher.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\cipher_wrap.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\config.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\ctr_drbg.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\debug.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\des.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\dhm.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\ecdh.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\ecdsa.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\ecp.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\entropy.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\entropy_poll.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\error.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\gcm.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\havege.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\hmac_drbg.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\md.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\md2.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\md4.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\md5.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\md_wrap.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\memory.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\memory_buffer_alloc.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\net.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\oid.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\padlock.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\pbkdf2.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\pem.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\pk.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\pk_wrap.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\pkcs11.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\pkcs12.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\pkcs5.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\platform.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\ripemd160.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\rsa.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\sha1.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\sha256.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\sha512.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\ssl.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\ssl_cache.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\ssl_ciphersuites.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\ssl_cookie.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\threading.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\timing.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\version.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\x509.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\x509_crl.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\x509_crt.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\x509_csr.h
# End Source File
# Begin Source File

SOURCE=..\..\include\mbedtls\xtea.h
# End Source File
# End Group
# End Target
# End Project