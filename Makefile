OpenMM_INSTALL_DIR=OpenMM3.0-Linux64
JFLAGS = -g
JC = javac

CFLAGS = -g 
FFLAGS = -g -ffree-line-length-none

FCPPLIBS = -lstdc++

LIB_DIR=$(OpenMM_INSTALL_DIR)/lib
INCLUDE_DIR=$(OpenMM_INSTALL_DIR)/include
LIBS= -lOpenMM -lGL -lGLU -lglut -lstdc++ -lm -lpthread

ALL_CPP_EXAMPLES = simulate.cpp energy.cpp minimize.cpp

ALL_PROGS = $(ALL_CPP_EXAMPLES)

default: simulate energy minimize

all : $(ALL_PROGS)

.cpp : 
	g++ $(CFLAGS) -I$(INCLUDE_DIR) $< -L$(LIB_DIR) $(LIBS) -o $*

.SUFFIXES: .java .class
.java.class:
	$(JC) $(JFLAGS) $*.java

CLASSES = \
	Angles.java \
	Atom.java \
	Bond.java \
	Color.java \
	Darshan.java \
	GBC.java \
	MoleculeBuilder.java \
	Molecule.java \
	Num.java \
	Position.java \
	PostProcessor.java \
	Region.java \
	Simulator.java \
	Squares.java \
	SystemBuilder.java \
	SystemProperties.java \
	Torsion.java

default: classes

classes: $(CLASSES:.java=.class)

clean:
	$(RM) *.class simulate energy minimize
