# ----------------------------------------------------------------------
# Makefile for OpenMM Preview Release 4 workshop "hello world" examples.
# August 18, 2009
# See https://simtk.org/home/openmm.
# ----------------------------------------------------------------------
# This assumes you have gcc compilers for whatever language you are
# using: g++ for C++ and C, gfortran for Fortran 95.
# 
# For the C and Fortran examples, we're depending on your version of
# OpenMM to have been built with the automatically-generated API
# wrappers.
#
# This has had only minimal testing, although it has been known to
# work. It is likely to work fine for C and C++. For Fortran, you
# may need to add some of the C/C++ libraries: 
#    -lc -lm -lstdc++ (or -lstdc++.6) -lgcc -lgcc_s
# but this wasn't required for these examples on Centos 5.2 using
# gcc 4.1.2.

# Check whether this is the right capitalization for your install directory.
OpenMM_INSTALL_DIR=/home/omkar/Library/OpenMM3.0-Linux64
CFLAGS = -g 
FFLAGS = -g -ffree-line-length-none

# Extra libraries required when gfortran links with a C++ module.
# If this doesn't work, look in /usr/lib to
# see what versions of libstdc++.so you have and try different
# versions.
FCPPLIBS = -lstdc++

LIB_DIR=$(OpenMM_INSTALL_DIR)/lib
INCLUDE_DIR=$(OpenMM_INSTALL_DIR)/include
LIBS= -lOpenMM


default: HelloWaterBox HelloWaterBox1

# Treat all .cpp source files the same way.
.cpp : 
	g++ $(CFLAGS) -I$(INCLUDE_DIR) $< -L$(LIB_DIR) $(LIBS) -o $*


