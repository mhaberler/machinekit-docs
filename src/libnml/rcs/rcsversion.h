/********************************************************************
* Description: rcsversion.h
*   Library version number.
*
*   Derived from a work by Fred Proctor & Will Shackleford
*
* Author:
* License: GPL Version 2
* System: Linux
*    
* Copyright (c) 2004 All rights reserved.
*
* Last change: 
* $Revision$
* $Author$
* $Date$
********************************************************************/
#ifndef LIBVERSION_H
#define LIBVERSION_H

#define LIB_VERSION "5.1"
#define LIB_MAJOR_VERSION (5)
#define LIB_MINOR_VERSION (1)

const static int lib_major_version = LIB_MAJOR_VERSION;
const static int lib_minor_version = LIB_MINOR_VERSION;

const static char __attribute__ ((unused)) * rcs_version_info_string =
    "@(#)" " $Info: NML Library version " LIB_VERSION " Compiled on  "
    __DATE__ " at " __TIME__ " for Linux. $ \n";

#endif
