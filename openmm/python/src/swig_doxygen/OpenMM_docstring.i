%feature("docstring") Force "Force objects apply forces to the particles in a System, or alter their behavior in other ways. This is an abstract class. Subclasses define particular forces.

More specifically, a Force object can do any or all of the following:

<ul>
<li>
Add a contribution to the force on each particle 

</li>
<li>
Add a contribution to the potential energy of the System 

</li>
<li>
Modify the positions and velocities of particles at the start of each time step 

</li>
<li>
Define parameters which are stored in the Context and can be modified by the user 

</li>
<li>
Change the values of parameters defined by other Force objects at the start of each time step 

</li>
</ul>


Forces may be organized into \"force groups\". This is used for multiple time step integration, and allows subsets of the Forces in a System to be evaluated at different times. By default, all Forces are in group 0. Call setForceGroup() to change this. Some Force subclasses may provide additional methods to further split their computations into multiple groups. Be aware that particular Platforms may place restrictions on the use of force groups, such as requiring all nonbonded forces to be in the same group.";


%feature("docstring") OpenMM::Force::getForceGroup "Get the force group this Force belongs to.";


%feature("docstring") OpenMM::Force::setForceGroup "Set the force group this Force belongs to.
   Parameters:
    - group the group index. Legal values are between 0 and 31 (inclusive).";


%feature("docstring") AmoebaGeneralizedKirkwoodForce "This class implements an implicit solvation force using the generalized Kirkwood/OBC model. 

To use this class, create a AmoebaGeneralizedKirkwoodForce object, then call addParticle() once for each particle in the System to define its parameters. The number of particles for which you define GBSA parameters must be equal to the number of particles in the System, or else an exception will be thrown when you try to create a Context. After a particle has been added, you can modify its force field parameters by calling setParticleParameters().";


%feature("docstring") OpenMM::AmoebaGeneralizedKirkwoodForce::getNumParticles "Get the number of particles in the system.";


%feature("docstring") OpenMM::AmoebaGeneralizedKirkwoodForce::addParticle "Add the parameters for a particle. This should be called once for each particle in the System. When it is called for the i'th time, it specifies the parameters for the i'th particle.
   Parameters:
    - charge the charge of the particle, measured in units of the proton charge
    - radius the GBSA radius of the particle, measured in nm
    - scalingFactor the OBC scaling factor for the particle";


%feature("docstring") OpenMM::AmoebaGeneralizedKirkwoodForce::getParticleParameters "Get the force field parameters for a particle.
   Parameters:
    - index the index of the particle for which to get parameters
    - charge the charge of the particle, measured in units of the proton charge
    - radius the GBSA radius of the particle, measured in nm
    - scalingFactor the OBC scaling factor for the particle";


%feature("docstring") OpenMM::AmoebaGeneralizedKirkwoodForce::setParticleParameters "Set the force field parameters for a particle.
   Parameters:
    - index the index of the particle for which to set parameters
    - charge the charge of the particle, measured in units of the proton charge
    - radius the GBSA radius of the particle, measured in nm
    - scalingFactor the OBC scaling factor for the particle";


%feature("docstring") OpenMM::AmoebaGeneralizedKirkwoodForce::getSolventDielectric "Get the dielectric constant for the solvent.";


%feature("docstring") OpenMM::AmoebaGeneralizedKirkwoodForce::setSolventDielectric "Set the dielectric constant for the solvent.";


%feature("docstring") OpenMM::AmoebaGeneralizedKirkwoodForce::getSoluteDielectric "Get the dielectric constant for the solute.";


%feature("docstring") OpenMM::AmoebaGeneralizedKirkwoodForce::setSoluteDielectric "Set the dielectric constant for the solute.";


%feature("docstring") OpenMM::AmoebaGeneralizedKirkwoodForce::getIncludeCavityTerm "Get the dielectric offset (nm) used in OBC Set the dielectric offset (nm) used in OBC Get the flag signalling whether the cavity term should be included";


%feature("docstring") OpenMM::AmoebaGeneralizedKirkwoodForce::setIncludeCavityTerm "Set the flag signalling whether the cavity term should be included";


%feature("docstring") OpenMM::AmoebaGeneralizedKirkwoodForce::getProbeRadius "Get the probe radius (nm) used in SASA contribution";


%feature("docstring") OpenMM::AmoebaGeneralizedKirkwoodForce::setProbeRadius "Set the probe radius (nm) used in SASA contribution";


%feature("docstring") OpenMM::AmoebaGeneralizedKirkwoodForce::getSurfaceAreaFactor "Get the surface area factor kJ/(nm*nm) used in SASA contribution";


%feature("docstring") OpenMM::AmoebaGeneralizedKirkwoodForce::setSurfaceAreaFactor "Set the surface area factor kJ/(nm*nm) used in SASA contribution";


%feature("docstring") AmoebaHarmonicAngleForce "This class implements an interaction between triplets of particles that varies harmonically with the angle between them. To use it, create a AmoebaHarmonicAngleForce object then call addAngle() once for each angle. After a angle has been added, you can modify its force field parameters by calling setAngleParameters().";
%feature("docstring") OpenMM::AmoebaHarmonicAngleForce::AmoebaHarmonicAngleForce "Create a Amoeba HarmonicAngleForce.";


%feature("docstring") OpenMM::AmoebaHarmonicAngleForce::getNumAngles "Get the number of harmonic angle stretch terms in the potential function";


%feature("docstring") OpenMM::AmoebaHarmonicAngleForce::setAmoebaGlobalHarmonicAngleCubic "Set the global cubic term
   Parameters:
    - cubicK the cubic harmonic force constant for the angle";


%feature("docstring") OpenMM::AmoebaHarmonicAngleForce::getAmoebaGlobalHarmonicAngleCubic "Get the global cubic term";


%feature("docstring") OpenMM::AmoebaHarmonicAngleForce::setAmoebaGlobalHarmonicAngleQuartic "Set the global cubic term
   Parameters:
    - quarticK the quartic harmonic force constant for the angle";


%feature("docstring") OpenMM::AmoebaHarmonicAngleForce::getAmoebaGlobalHarmonicAngleQuartic "Get the global quartic term";


%feature("docstring") OpenMM::AmoebaHarmonicAngleForce::setAmoebaGlobalHarmonicAnglePentic "Set the global pentic term
   Parameters:
    - penticK the pentic harmonic force constant for the angle";


%feature("docstring") OpenMM::AmoebaHarmonicAngleForce::getAmoebaGlobalHarmonicAnglePentic "Get the global pentic term";


%feature("docstring") OpenMM::AmoebaHarmonicAngleForce::setAmoebaGlobalHarmonicAngleSextic "Set the global sextic term
   Parameters:
    - sexticK the sextic harmonic force constant for the angle";


%feature("docstring") OpenMM::AmoebaHarmonicAngleForce::getAmoebaGlobalHarmonicAngleSextic "Get the global sextic term";


%feature("docstring") OpenMM::AmoebaHarmonicAngleForce::addAngle "Add a angle term to the force field.
   Parameters:
    - particle1 the index of the first particle connected by the angle
    - particle2 the index of the second particle connected by the angle
    - particle3 the index of the third particle connected by the angle
    - length the angle measured in radians
    - quadratic k the quadratic harmonic force constant for the angle, measured in kJ/mol/radian^2";


%feature("docstring") OpenMM::AmoebaHarmonicAngleForce::getAngleParameters "Get the force field parameters for a angle term.
   Parameters:
    - index the index of the angle for which to get parameters
    - particle1 the index of the first particle connected by the angle
    - particle2 the index of the second particle connected by the angle
    - particle3 the index of the third particle connected by the angle
    - length the equilibrium angle, measured in radians
    - quadratic k the quadratic harmonic force constant for the angle, measured in kJ/mol/radian^2";


%feature("docstring") OpenMM::AmoebaHarmonicAngleForce::setAngleParameters "Set the force field parameters for a angle term.
   Parameters:
    - index the index of the angle for which to set parameters
    - particle1 the index of the first particle connected by the angle
    - particle2 the index of the second particle connected by the angle
    - particle3 the index of the third particle connected by the angle
    - length the equilibrium angle, measured in radians
    - quadratic k the quadratic harmonic force constant for the angle, measured in kJ/mol/radian^2";


%feature("docstring") AmoebaHarmonicBondForce "This class implements an interaction between pairs of particles that varies harmonically with the distance between them. To use it, create a AmoebaHarmonicBondForce object then call addBond() once for each bond. After a bond has been added, you can modify its force field parameters by calling setBondParameters().";
%feature("docstring") OpenMM::AmoebaHarmonicBondForce::AmoebaHarmonicBondForce "Create a Amoeba HarmonicBondForce.";


%feature("docstring") OpenMM::AmoebaHarmonicBondForce::getNumBonds "Get the number of harmonic bond stretch terms in the potential function";


%feature("docstring") OpenMM::AmoebaHarmonicBondForce::setAmoebaGlobalHarmonicBondCubic "Set the global cubic term
   Parameters:
    - cubicK the cubic harmonic force constant for the bond";


%feature("docstring") OpenMM::AmoebaHarmonicBondForce::getAmoebaGlobalHarmonicBondCubic "Get the global cubic term";


%feature("docstring") OpenMM::AmoebaHarmonicBondForce::setAmoebaGlobalHarmonicBondQuartic "Set the global cubic term
   Parameters:
    - quarticK the quartic harmonic force constant for the bond";


%feature("docstring") OpenMM::AmoebaHarmonicBondForce::getAmoebaGlobalHarmonicBondQuartic "Get the global quartic term";


%feature("docstring") OpenMM::AmoebaHarmonicBondForce::addBond "Add a bond term to the force field.
   Parameters:
    - particle1 the index of the first particle connected by the bond
    - particle2 the index of the second particle connected by the bond
    - length the equilibrium length of the bond, measured in nm
    - k the quadratic harmonic force constant for the bond";


%feature("docstring") OpenMM::AmoebaHarmonicBondForce::getBondParameters "Get the force field parameters for a bond term.
   Parameters:
    - index the index of the bond for which to get parameters
    - particle1 the index of the first particle connected by the bond
    - particle2 the index of the second particle connected by the bond
    - length the equilibrium length of the bond, measured in nm
    - quadratic k the quadratic harmonic force constant for the bond";


%feature("docstring") OpenMM::AmoebaHarmonicBondForce::setBondParameters "Set the force field parameters for a bond term.
   Parameters:
    - index the index of the bond for which to set parameters
    - particle1 the index of the first particle connected by the bond
    - particle2 the index of the second particle connected by the bond
    - length the equilibrium length of the bond, measured in nm
    - k the quadratic harmonic force constant for the bond";


%feature("docstring") AmoebaHarmonicInPlaneAngleForce "This class implements an interaction at trigonal centers corresponding to the projected in-plane angle bend energy between four particles; the energy varies harmonically with the angle between them. To use it, create a AmoebaHarmonicInPlaneAngle object then call addAngle() once for each angle. After a angle has been added, you can modify its force field parameters by calling setAngleParameters().";
%feature("docstring") OpenMM::AmoebaHarmonicInPlaneAngleForce::AmoebaHarmonicInPlaneAngleForce "Create a Amoeba HarmonicAngleForce.";


%feature("docstring") OpenMM::AmoebaHarmonicInPlaneAngleForce::getNumAngles "Get the number of harmonic angle stretch terms in the potential function";


%feature("docstring") OpenMM::AmoebaHarmonicInPlaneAngleForce::setAmoebaGlobalHarmonicInPlaneAngleCubic "Set the global cubic term
   Parameters:
    - cubicK the cubic harmonic force constant for the angle";


%feature("docstring") OpenMM::AmoebaHarmonicInPlaneAngleForce::getAmoebaGlobalHarmonicInPlaneAngleCubic "Get the global cubic term";


%feature("docstring") OpenMM::AmoebaHarmonicInPlaneAngleForce::setAmoebaGlobalHarmonicInPlaneAngleQuartic "Set the global quartic term
   Parameters:
    - quarticK the quartic harmonic force constant for the angle";


%feature("docstring") OpenMM::AmoebaHarmonicInPlaneAngleForce::getAmoebaGlobalHarmonicInPlaneAngleQuartic "Get the global quartic term";


%feature("docstring") OpenMM::AmoebaHarmonicInPlaneAngleForce::setAmoebaGlobalHarmonicInPlaneAnglePentic "Set the global pentic term
   Parameters:
    - penticK the pentic harmonic force constant for the angle";


%feature("docstring") OpenMM::AmoebaHarmonicInPlaneAngleForce::getAmoebaGlobalHarmonicInPlaneAnglePentic "Get the global pentic term";


%feature("docstring") OpenMM::AmoebaHarmonicInPlaneAngleForce::setAmoebaGlobalHarmonicInPlaneAngleSextic "Set the global sextic term
   Parameters:
    - sexticK the sextic harmonic force constant for the angle";


%feature("docstring") OpenMM::AmoebaHarmonicInPlaneAngleForce::getAmoebaGlobalHarmonicInPlaneAngleSextic "Get the global sextic term";


%feature("docstring") OpenMM::AmoebaHarmonicInPlaneAngleForce::addAngle "Add a angle term to the force field.
   Parameters:
    - particle1 the index of the first particle connected by the angle
    - particle2 the index of the second particle connected by the angle
    - particle3 the index of the third particle connected by the angle
    - particle4 the index of the fourth particle connected by the angle
    - length the equilibrium angle, measured in radians
    - quadratic k the quadratic harmonic force constant for the angle measured in kJ/mol/radian^2";


%feature("docstring") OpenMM::AmoebaHarmonicInPlaneAngleForce::getAngleParameters "Get the force field parameters for a angle term.
   Parameters:
    - index the index of the angle for which to get parameters
    - particle1 the index of the first particle connected by the angle
    - particle2 the index of the second particle connected by the angle
    - particle3 the index of the third particle connected by the angle
    - particle4 the index of the fourth particle connected by the angle
    - length the equilibrium angle, measured in radians
    - quadratic k the quadratic harmonic force constant for the angle measured in kJ/mol/radian^2";


%feature("docstring") OpenMM::AmoebaHarmonicInPlaneAngleForce::setAngleParameters "Set the force field parameters for a angle term.
   Parameters:
    - index the index of the angle for which to set parameters
    - particle1 the index of the first particle connected by the angle
    - particle2 the index of the second particle connected by the angle
    - particle3 the index of the third particle connected by the angle
    - particle4 the index of the fourth particle connected by the angle
    - length the equilibrium angle, measured in radians
    - quadratic k the quadratic harmonic force constant for the angle, measured in kJ/mol/radian^2";


%feature("docstring") AmoebaMultipoleForce "This class implements the Amoeba multipole interaction To use it, create a MultipoleForce object then call addMultipole() once for each atom. After a entry has been added, you can modify its force field parameters by calling setMultipoleParameters().";
%feature("docstring") OpenMM::AmoebaMultipoleForce::AmoebaMultipoleForce "Create a Amoeba MultipoleForce.";


%feature("docstring") OpenMM::AmoebaMultipoleForce::getNumMultipoles "Get the number of particles in the potential function";


%feature("docstring") OpenMM::AmoebaMultipoleForce::getNonbondedMethod "Get the method used for handling long-range nonbonded interactions.";


%feature("docstring") OpenMM::AmoebaMultipoleForce::setNonbondedMethod "Set the method used for handling long-range nonbonded interactions.";


%feature("docstring") OpenMM::AmoebaMultipoleForce::getPolarizationType "Get polarization type";


%feature("docstring") OpenMM::AmoebaMultipoleForce::setPolarizationType "Set the polarization type";


%feature("docstring") OpenMM::AmoebaMultipoleForce::getCutoffDistance "Get the cutoff distance (in nm) being used for nonbonded interactions. If the NonbondedMethod in use is NoCutoff, this value will have no effect.";


%feature("docstring") OpenMM::AmoebaMultipoleForce::setCutoffDistance "Set the cutoff distance (in nm) being used for nonbonded interactions. If the NonbondedMethod in use is NoCutoff, this value will have no effect.
   Parameters:
    - distance the cutoff distance, measured in nm";


%feature("docstring") OpenMM::AmoebaMultipoleForce::getAEwald "Get the aEwald parameter";


%feature("docstring") OpenMM::AmoebaMultipoleForce::setAEwald "Set the aEwald parameter
   Parameters:
    - Ewald parameter";


%feature("docstring") OpenMM::AmoebaMultipoleForce::getPmeBSplineOrder "Get the B-spline order parameter";


%feature("docstring") OpenMM::AmoebaMultipoleForce::getPmeGridDimensions "Set the B-spline order parameter
   Parameters:
    - the B-spline order parameter Get the PME grid dimensions";


%feature("docstring") OpenMM::AmoebaMultipoleForce::setPmeGridDimensions "Set the PME grid dimensions
   Parameters:
    - the PME grid dimensions";


%feature("docstring") OpenMM::AmoebaMultipoleForce::addParticle "Add multipole-related info for a particle
   Parameters:
    - charge the particle's charge
    - molecularDipole the particle's molecular dipole (vector of size 3)
    - molecularQuadrupole the particle's molecular quadrupole (vector of size 9)
    - axisType the particle's axis type ( ZThenX, Bisector )
    - multipoleAtomZ index of first atom used in constructing lab<->molecular frames
    - multipoleAtomX index of second atom used in constructing lab<->molecular frames
    - multipoleAtomY index of second atom used in constructing lab<->molecular frames
    - thole Thole parameter
    - dampingFactor dampingFactor parameter
    - polarity polarity parameter";


%feature("docstring") OpenMM::AmoebaMultipoleForce::getMultipoleParameters "Get the multipole parameters for a particle.
   Parameters:
    - index the index of the atom for which to get parameters
    - charge the particle's charge
    - molecularDipole the particle's molecular dipole (vector of size 3)
    - molecularQuadrupole the particle's molecular quadrupole (vector of size 9)
    - axisType the particle's axis type ( ZThenX, Bisector )
    - multipoleAtomZ index of first atom used in constructing lab<->molecular frames
    - multipoleAtomX index of second atom used in constructing lab<->molecular frames
    - multipoleAtomY index of second atom used in constructing lab<->molecular frames
    - thole Thole parameter
    - dampingFactor dampingFactor parameter
    - polarity polarity parameter";


%feature("docstring") OpenMM::AmoebaMultipoleForce::setMultipoleParameters "Set the multipole parameters for a particle.
   Parameters:
    - index the index of the atom for which to set parameters
    - charge the particle's charge
    - molecularDipole the particle's molecular dipole (vector of size 3)
    - molecularQuadrupole the particle's molecular quadrupole (vector of size 9)
    - axisType the particle's axis type ( ZThenX, Bisector )
    - multipoleAtomZ index of first atom used in constructing lab<->molecular frames
    - multipoleAtomX index of second atom used in constructing lab<->molecular frames
    - multipoleAtomY index of second atom used in constructing lab<->molecular frames
    - polarity polarity parameter";


%feature("docstring") OpenMM::AmoebaMultipoleForce::setCovalentMap "Set the CovalentMap for an atom
   Parameters:
    - index the index of the atom for which to set parameters
    - typeId CovalentTypes type
    - covalentAtoms vector of covalent atoms associated w/ the specfied CovalentType";


%feature("docstring") OpenMM::AmoebaMultipoleForce::getCovalentMap "Get the CovalentMap for an atom
   Parameters:
    - index the index of the atom for which to set parameters
    - typeId CovalentTypes type
    - covalentAtoms output vector of covalent atoms associated w/ the specfied CovalentType";


%feature("docstring") OpenMM::AmoebaMultipoleForce::getCovalentMaps "Get the CovalentMap for an atom
   Parameters:
    - index the index of the atom for which to set parameters
    - covalentLists output vector of covalent lists of atoms";


%feature("docstring") OpenMM::AmoebaMultipoleForce::getMutualInducedMaxIterations "Get the iteration method to be used for calculating the mutual induced dipoles
   Parameters:
    - iteration method to be used for calculating the mutual induced dipole Get the max number of iterations to be used in calculating the mutual induced dipoles";


%feature("docstring") OpenMM::AmoebaMultipoleForce::setMutualInducedMaxIterations "Set the max number of iterations to be used in calculating the mutual induced dipoles
   Parameters:
    - max number of iterations";


%feature("docstring") OpenMM::AmoebaMultipoleForce::getMutualInducedTargetEpsilon "Get the target epsilon to be used to test for convergence of iterative method used in calculating the mutual induced dipoles";


%feature("docstring") OpenMM::AmoebaMultipoleForce::setMutualInducedTargetEpsilon "Set the target epsilon to be used to test for convergence of iterative method used in calculating the mutual induced dipoles
   Parameters:
    - target epsilon";


%feature("docstring") OpenMM::AmoebaMultipoleForce::getEwaldErrorTolerance "Get the scaling distance cutoff (nm)
   Parameters:
    - scaling distance cutoff Get the electric constant
    - the electric constant Get the error tolerance for Ewald summation. This corresponds to the fractional error in the forces which is acceptable. This value is used to select the reciprocal space cutoff and separation parameter so that the average error level will be less than the tolerance. There is not a rigorous guarantee that all forces on all atoms will be less than the tolerance, however.";


%feature("docstring") OpenMM::AmoebaMultipoleForce::setEwaldErrorTolerance "Get the error tolerance for Ewald summation. This corresponds to the fractional error in the forces which is acceptable. This value is used to select the reciprocal space cutoff and separation parameter so that the average error level will be less than the tolerance. There is not a rigorous guarantee that all forces on all atoms will be less than the tolerance, however.";


%feature("docstring") AmoebaOutOfPlaneBendForce "This class implements the Amoeba Out-of-plane bend interaction To use it, create a OutOfPlaneBendForce object then call addOutOfPlaneBend() once for each outOfPlaneBend. After a outOfPlaneBend has been added, you can modify its force field parameters by calling setOutOfPlaneBendParameters().";
%feature("docstring") OpenMM::AmoebaOutOfPlaneBendForce::AmoebaOutOfPlaneBendForce "Create a Amoeba OutOfPlaneBendForce.";


%feature("docstring") OpenMM::AmoebaOutOfPlaneBendForce::getNumOutOfPlaneBends "Get the number of outOfPlaneBend terms in the potential function";


%feature("docstring") OpenMM::AmoebaOutOfPlaneBendForce::setAmoebaGlobalOutOfPlaneBendCubic "Set the global cubic term
   Parameters:
    - cubicK the cubic harmonic force constant for the angle";


%feature("docstring") OpenMM::AmoebaOutOfPlaneBendForce::getAmoebaGlobalOutOfPlaneBendCubic "Get the global cubic term";


%feature("docstring") OpenMM::AmoebaOutOfPlaneBendForce::setAmoebaGlobalOutOfPlaneBendQuartic "Set the global cubic term
   Parameters:
    - quarticK the quartic harmonic force constant for the angle";


%feature("docstring") OpenMM::AmoebaOutOfPlaneBendForce::getAmoebaGlobalOutOfPlaneBendQuartic "Get the global quartic term";


%feature("docstring") OpenMM::AmoebaOutOfPlaneBendForce::setAmoebaGlobalOutOfPlaneBendPentic "Set the global pentic term
   Parameters:
    - penticK the pentic harmonic force constant for the angle";


%feature("docstring") OpenMM::AmoebaOutOfPlaneBendForce::getAmoebaGlobalOutOfPlaneBendPentic "Get the global pentic term";


%feature("docstring") OpenMM::AmoebaOutOfPlaneBendForce::setAmoebaGlobalOutOfPlaneBendSextic "Set the global sextic term
   Parameters:
    - sexticK the sextic harmonic force constant for the angle";


%feature("docstring") OpenMM::AmoebaOutOfPlaneBendForce::getAmoebaGlobalOutOfPlaneBendSextic "Get the global sextic term";


%feature("docstring") OpenMM::AmoebaOutOfPlaneBendForce::addOutOfPlaneBend "Add a outOfPlaneBend term to the force field.
   Parameters:
    - particle1 the index of the first particle connected by the outOfPlaneBend
    - particle2 the index of the second particle connected by the outOfPlaneBend
    - particle3 the index of the third particle connected by the outOfPlaneBend
    - particle4 the index of the fourth particle connected by the outOfPlaneBend
    - k the force constant for the outOfPlaneBend";


%feature("docstring") OpenMM::AmoebaOutOfPlaneBendForce::getOutOfPlaneBendParameters "Get the force field parameters for a outOfPlaneBend term.
   Parameters:
    - index the index of the outOfPlaneBend for which to get parameters
    - particle1 the index of the first particle connected by the outOfPlaneBend
    - particle2 the index of the second particle connected by the outOfPlaneBend
    - particle3 the index of the third particle connected by the outOfPlaneBend
    - particle4 the index of the fourth particle connected by the outOfPlaneBend
    - k the force constant for the outOfPlaneBend";


%feature("docstring") OpenMM::AmoebaOutOfPlaneBendForce::setOutOfPlaneBendParameters "Set the force field parameters for a outOfPlaneBend term.
   Parameters:
    - index the index of the outOfPlaneBend for which to set parameters
    - particle1 the index of the first particle connected by the outOfPlaneBend
    - particle2 the index of the second particle connected by the outOfPlaneBend
    - particle3 the index of the third particle connected by the outOfPlaneBend
    - particle4 the index of the fourth particle connected by the outOfPlaneBend
    - k the force constant for the outOfPlaneBend";


%feature("docstring") AmoebaPiTorsionForce "This class implements the Amoeba pi-torsion interaction To use it, create a PiTorsionForce object then call addPiTorsion() once for each torsion. After a torsion has been added, you can modify its force field parameters by calling setPiTorsionParameters().";
%feature("docstring") OpenMM::AmoebaPiTorsionForce::AmoebaPiTorsionForce "Create a Amoeba PiTorsionForce.";


%feature("docstring") OpenMM::AmoebaPiTorsionForce::getNumPiTorsions "Get the number of pi torsion terms in the potential function";


%feature("docstring") OpenMM::AmoebaPiTorsionForce::addPiTorsion "Add a torsion term to the force field.
   Parameters:
    - particle1 the index of the first particle connected by the torsion
    - particle2 the index of the second particle connected by the torsion
    - particle3 the index of the third particle connected by the torsion
    - particle4 the index of the fourth particle connected by the torsion
    - particle5 the index of the fifth particle connected by the torsion
    - particle6 the index of the sixth particle connected by the torsion
    - k the force constant for the torsion";


%feature("docstring") OpenMM::AmoebaPiTorsionForce::getPiTorsionParameters "Get the force field parameters for a torsion term.
   Parameters:
    - index the index of the torsion for which to get parameters
    - particle1 the index of the first particle connected by the torsion
    - particle2 the index of the second particle connected by the torsion
    - particle3 the index of the third particle connected by the torsion
    - particle4 the index of the fourth particle connected by the torsion
    - particle5 the index of the fifth particle connected by the torsion
    - particle6 the index of the sixth particle connected by the torsion
    - k the force constant for the torsion";


%feature("docstring") OpenMM::AmoebaPiTorsionForce::setPiTorsionParameters "Set the force field parameters for a pi torsion term.
   Parameters:
    - index the index of the torsion for which to set parameters
    - particle1 the index of the first particle connected by the torsion
    - particle2 the index of the second particle connected by the torsion
    - particle3 the index of the third particle connected by the torsion
    - particle4 the index of the fourth particle connected by the torsion
    - particle5 the index of the fifth particle connected by the torsion
    - particle6 the index of the sixth particle connected by the torsion
    - k the force constant for the torsion";


%feature("docstring") AmoebaStretchBendForce "This class implements the Amoeba stretch bend interaction To use it, create a StretchBendForce object then call addStretchBend() once for each stretchBend. After a stretchBend has been added, you can modify its force field parameters by calling setStretchBendParameters().";
%feature("docstring") OpenMM::AmoebaStretchBendForce::AmoebaStretchBendForce "Create a Amoeba StretchBendForce.";


%feature("docstring") OpenMM::AmoebaStretchBendForce::getNumStretchBends "Get the number of stretchBend terms in the potential function";


%feature("docstring") OpenMM::AmoebaStretchBendForce::addStretchBend "Add a stretchBend term to the force field.
   Parameters:
    - particle1 the index of the first particle connected by the stretchBend
    - particle2 the index of the second particle connected by the stretchBend
    - particle3 the index of the third particle connected by the stretchBend
    - lengthAB the equilibrium length of the stretchBend in bond ab [particle1, particle2], measured in nm
    - lengthCB the equilibrium length of the stretchBend in bond cb [particle3, particle2], measured in nm
    - angle the equilibrium angle in radians
    - k the force constant for the stretchBend";


%feature("docstring") OpenMM::AmoebaStretchBendForce::getStretchBendParameters "Get the force field parameters for a stretchBend term.
   Parameters:
    - index the index of the stretchBend for which to get parameters
    - particle1 the index of the first particle connected by the stretchBend
    - particle2 the index of the second particle connected by the stretchBend
    - particle3 the index of the third particle connected by the stretchBend
    - lengthAB the equilibrium length of the stretchBend in bond ab [particle1, particle2], measured in nm
    - lengthCB the equilibrium length of the stretchBend in bond cb [particle3, particle2], measured in nm
    - angle the equilibrium angle in radians
    - k the force constant for the stretchBend";


%feature("docstring") OpenMM::AmoebaStretchBendForce::setStretchBendParameters "Set the force field parameters for a stretchBend term.
   Parameters:
    - index the index of the stretchBend for which to set parameters
    - particle1 the index of the first particle connected by the stretchBend
    - particle2 the index of the second particle connected by the stretchBend
    - particle3 the index of the third particle connected by the stretchBend
    - lengthAB the equilibrium length of the stretchBend in bond ab [particle1, particle2], measured in nm
    - lengthCB the equilibrium length of the stretchBend in bond cb [particle3, particle2], measured in nm
    - angle the equilibrium angle in radians
    - k the force constant for the stretchBend";


%feature("docstring") AmoebaTorsionForce "This class implements an torsion interaction among four particles. To use it, create a TorsionForce object then call addTorsion() once for each angle. After a angle has been added, you can modify its force field parameters by calling setTorsionParameters().";
%feature("docstring") OpenMM::AmoebaTorsionForce::AmoebaTorsionForce "Create a Amoeba TorsionForce.";


%feature("docstring") OpenMM::AmoebaTorsionForce::getNumTorsions "Get the number of torsion terms in the potential function";


%feature("docstring") OpenMM::AmoebaTorsionForce::addTorsion "Add a torsion term to the force field.
   Parameters:
    - particle1 the index of the first particle connected by the torsion
    - particle2 the index of the second particle connected by the torsion
    - particle3 the index of the third particle connected by the torsion
    - particle4 the index of the fourth particle connected by the torsion
    - torsion1 the vector of torsion params for first index (amplitude, phase, fold)
    - torsion2 the vector of torsion params for second index (amplitude, phase, fold)
    - torsion3 the vector of torsion params for third index (amplitude, phase, fold)";


%feature("docstring") OpenMM::AmoebaTorsionForce::getTorsionParameters "Get the force field parameters for a torsion term.
   Parameters:
    - index the index of the torsion for which to get parameters
    - particle1 the index of the first particle connected by the torsion
    - particle2 the index of the second particle connected by the torsion
    - particle3 the index of the third particle connected by the torsion
    - particle4 the index of the fourth particle connected by the torsion
    - torsion1 the vector of torsion params for first index (amplitude, phase, fold)
    - torsion2 the vector of torsion params for second index (amplitude, phase, fold)
    - torsion3 the vector of torsion params for third index (amplitude, phase, fold)";


%feature("docstring") OpenMM::AmoebaTorsionForce::setTorsionParameters "Set the force field parameters for a torsion term.
   Parameters:
    - index the index of the torsion for which to set parameters
    - particle1 the index of the first particle connected by the torsion
    - particle2 the index of the second particle connected by the torsion
    - particle3 the index of the third particle connected by the torsion
    - particle4 the index of the fourth particle connected by the torsion
    - torsion1 the vector of torsion params for first index (amplitude, phase, fold)
    - torsion2 the vector of torsion params for second index (amplitude, phase, fold)
    - torsion3 the vector of torsion params for third index (amplitude, phase, fold)";


%feature("docstring") AmoebaTorsionTorsionForce "This class implements the Amoeba torsion-torsion interaction To use it, create a TorsionTorsionForce object then call addTorsionTorsion() once for each torsionTorsion. After a torsionTorsion has been added, you can modify its force field parameters by calling setTorsionTorsionParameters().";
%feature("docstring") OpenMM::AmoebaTorsionTorsionForce::AmoebaTorsionTorsionForce "Create a Amoeba TorsionTorsionForce.";


%feature("docstring") OpenMM::AmoebaTorsionTorsionForce::getNumTorsionTorsions "Get the number of torsionTorsion terms in the potential function";


%feature("docstring") OpenMM::AmoebaTorsionTorsionForce::getNumTorsionTorsionGrids "Get the number of torsionTorsion grids";


%feature("docstring") OpenMM::AmoebaTorsionTorsionForce::addTorsionTorsion "Add a torsionTorsion term to the force field.
   Parameters:
    - particle1 the index of the first particle connected by the torsionTorsion
    - particle2 the index of the second particle connected by the torsionTorsion
    - particle3 the index of the third particle connected by the torsionTorsion
    - particle4 the index of the fourth particle connected by the torsionTorsion
    - particle5 the index of the fifth particle connected by the torsionTorsion
    - chiralCheckAtomIndex the index of the particle connected to particle3, but not particle2 or particle4 to be used in chirality check
    - gridIndex the index to the grid to be used";


%feature("docstring") OpenMM::AmoebaTorsionTorsionForce::getTorsionTorsionParameters "Get the force field parameters for a torsionTorsion term.
   Parameters:
    - index the index of the torsionTorsion for which to get parameters
    - particle1 the index of the first particle connected by the torsionTorsion
    - particle2 the index of the second particle connected by the torsionTorsion
    - particle3 the index of the third particle connected by the torsionTorsion
    - particle4 the index of the fourth particle connected by the torsionTorsion
    - particle5 the index of the fifth particle connected by the torsionTorsion
    - chiralCheckAtomIndex the index of the particle connected to particle3, but not particle2 or particle4 to be used in chirality check
    - gridIndex the grid index";


%feature("docstring") OpenMM::AmoebaTorsionTorsionForce::setTorsionTorsionParameters "Set the force field parameters for a torsionTorsion term.
   Parameters:
    - index the index of the torsionTorsion for which to set parameters
    - particle1 the index of the first particle connected by the torsionTorsion
    - particle2 the index of the second particle connected by the torsionTorsion
    - particle3 the index of the third particle connected by the torsionTorsion
    - particle4 the index of the fourth particle connected by the torsionTorsion
    - particle5 the index of the fifth particle connected by the torsionTorsion
    - chiralCheckAtomIndex the index of the particle connected to particle3, but not particle2 or particle4 to be used in chirality check
    - gridIndex the grid index";


%feature("docstring") OpenMM::AmoebaTorsionTorsionForce::getTorsionTorsionGrid "Get the torsion-torsion grid at the specified index
   Parameters:
    - gridIndex the grid index";


%feature("docstring") OpenMM::AmoebaTorsionTorsionForce::setTorsionTorsionGrid "Set the torsion-torsion grid at the specified index
   Parameters:
    - index the index of the torsionTorsion for which to get parameters
    - grid grid grid[x][y][0] = x value grid[x][y][1] = y value grid[x][y][2] = function value grid[x][y][3] = dfdx value grid[x][y][4] = dfdy value grid[x][y][5] = dfd(xy) value";


%feature("docstring") AmoebaUreyBradleyForce "This class implements an interaction between pairs of particles that varies harmonically with the distance between them. To use it, create a AmoebaUreyBradleyForce object then call addUreyBradley() once for each bond. After a bond has been added, you can modify its force field parameters by calling setUreyBradleyParameters().";
%feature("docstring") OpenMM::AmoebaUreyBradleyForce::AmoebaUreyBradleyForce "Create a Amoeba UreyBradleyForce.";


%feature("docstring") OpenMM::AmoebaUreyBradleyForce::getNumInteractions "Get the number of UB terms in the potential function";


%feature("docstring") OpenMM::AmoebaUreyBradleyForce::setAmoebaGlobalUreyBradleyCubic "Set the global cubic term
   Parameters:
    - cubicK the cubic force constant";


%feature("docstring") OpenMM::AmoebaUreyBradleyForce::getAmoebaGlobalUreyBradleyCubic "Get the global cubic term";


%feature("docstring") OpenMM::AmoebaUreyBradleyForce::setAmoebaGlobalUreyBradleyQuartic "Set the global cubic term
   Parameters:
    - quarticK the quartic force constant";


%feature("docstring") OpenMM::AmoebaUreyBradleyForce::getAmoebaGlobalUreyBradleyQuartic "Get the global quartic term";


%feature("docstring") OpenMM::AmoebaUreyBradleyForce::addUreyBradley "Add a UB term to the force field.
   Parameters:
    - particle1 the index of the first particle
    - particle2 the index of the second particle
    - length the equilibrium length, measured in nm
    - k the quadratic harmonic force constant";


%feature("docstring") OpenMM::AmoebaUreyBradleyForce::getUreyBradleyParameters "Get the force field parameters for a bond term.
   Parameters:
    - index the index of the ixn for which to get parameters
    - particle1 the index of the first particle
    - particle2 the index of the second particle
    - length the equilibrium distance, measured in nm
    - quadratic k the quadratic harmonic force constant";


%feature("docstring") OpenMM::AmoebaUreyBradleyForce::setUreyBradleyParameters "Set the force field parameters for a UB term.
   Parameters:
    - index the index of the ixn for which to set parameters
    - particle1 the index of the first particle
    - particle2 the index of the second particle
    - length the equilibrium distance, measured in nm
    - k the quadratic harmonic force constant for the bond";


%feature("docstring") AmoebaVdwForce "This class implements an interaction between pairs of particles that varies harmonically with the distance between them. To use it, create a VdwForce object then call addAngle() once for each angle. After a angle has been added, you can modify its force field parameters by calling setAngleParameters().";
%feature("docstring") OpenMM::AmoebaVdwForce::AmoebaVdwForce "Create a Amoeba VdwForce.";


%feature("docstring") OpenMM::AmoebaVdwForce::getNumParticles "Get the number of particles";


%feature("docstring") OpenMM::AmoebaVdwForce::setParticleParameters "Set the force field parameters for a vdw particle.
   Parameters:
    - particleIndex the particle index
    - ivIndex the iv index
    - classIndex the class index into the sig-eps table
    - sigma vdw sigma
    - epsilon vdw epsilon
    - reductionFactor the reduction factor";


%feature("docstring") OpenMM::AmoebaVdwForce::getParticleParameters "Get the force field parameters for a vdw particle.
   Parameters:
    - particleIndex the particle index
    - ivIndex the iv index
    - classIndex the class index into the sig-eps table
    - sigma vdw sigma
    - epsilon vdw epsilon
    - reductionFactor the reduction factor";


%feature("docstring") OpenMM::AmoebaVdwForce::addParticle "Set the force field parameters for a vdw particle.
   Parameters:
    - particleIndex the particle index
    - ivIndex the iv index
    - classIndex the class index into the sig-eps table
    - sigma vdw sigma
    - epsilon vdw epsilon
    - reductionFactor the reduction factor";


%feature("docstring") OpenMM::AmoebaVdwForce::setSigmaCombiningRule "Set sigma combining rule
   Parameters:
    - sigmaCombiningRule sigma combining rule: 'ARITHMETIC', 'GEOMETRIC'. 'CUBIC-MEAN'";


%feature("docstring") OpenMM::AmoebaVdwForce::getSigmaCombiningRule "Get sigma combining rule";


%feature("docstring") OpenMM::AmoebaVdwForce::setEpsilonCombiningRule "Set epsilon combining rule
   Parameters:
    - epsilonCombiningRule epsilon combining rule: 'ARITHMETIC', 'GEOMETRIC'. 'HARMONIC', 'HHG'";


%feature("docstring") OpenMM::AmoebaVdwForce::getEpsilonCombiningRule "Get epsilon combining rule";


%feature("docstring") OpenMM::AmoebaVdwForce::setParticleExclusions "Set exclusions for specified particle
   Parameters:
    - particleIndex particle index
    - exclusions output vector of exclusions";


%feature("docstring") OpenMM::AmoebaVdwForce::getParticleExclusions "Get exclusions for specified particle
   Parameters:
    - particleIndex particle index
    - exclusions output vector of exclusions";


%feature("docstring") OpenMM::AmoebaVdwForce::setCutoff "Set cutoff
   Parameters:
    - cutoff cutoff";


%feature("docstring") OpenMM::AmoebaVdwForce::getCutoff "Get cutoff";


%feature("docstring") OpenMM::AmoebaVdwForce::setUseNeighborList "Set flag for using neighbor list for vdw ixn
   Parameters:
    - neighboristFlag neighbor list flag";


%feature("docstring") OpenMM::AmoebaVdwForce::getUseNeighborList "Get neighbor list flag for vdw ixn";


%feature("docstring") OpenMM::AmoebaVdwForce::setPBC "Set flag for employing periodic boundary conditions
   Parameters:
    - pbcFlag if nonozero, use periodic boundary conditions";


%feature("docstring") OpenMM::AmoebaVdwForce::getPBC "Get periodic boundary conditions flag";


%feature("docstring") AmoebaWcaDispersionForce "This class implements an interaction between pairs of particles that varies harmonically with the distance between them. To use it, create a WcaDispersionForce object then call addAngle() once for each angle. After a angle has been added, you can modify its force field parameters by calling setAngleParameters().";
%feature("docstring") OpenMM::AmoebaWcaDispersionForce::AmoebaWcaDispersionForce "Create a Amoeba WcaDispersionForce.";


%feature("docstring") OpenMM::AmoebaWcaDispersionForce::getNumParticles "Get the number of particles";


%feature("docstring") OpenMM::AmoebaWcaDispersionForce::setParticleParameters "Set the force field parameters for a wca dispersion particle.
   Parameters:
    - particleIndex the particle index
    - radius radius
    - epsilon epsilon";


%feature("docstring") OpenMM::AmoebaWcaDispersionForce::getParticleParameters "Get the force field parameters for a wca dispersion particle.
   Parameters:
    - particleIndex the particle index
    - radius radius
    - epsilon epsilon";


%feature("docstring") OpenMM::AmoebaWcaDispersionForce::addParticle "Set the force field parameters for a wca dispersion particle.
   Parameters:
    - radius radius
    - epsilon epsilon";


































%feature("docstring") AndersenThermostat "This class uses the Andersen method to maintain constant temperature.";
%feature("docstring") OpenMM::AndersenThermostat::Temperature "This is the name of the parameter which stores the current temperature of the heat bath (in Kelvin).";


%feature("docstring") OpenMM::AndersenThermostat::CollisionFrequency "This is the name of the parameter which store the current collision frequency (in 1/ps).";


%feature("docstring") OpenMM::AndersenThermostat::AndersenThermostat "Create an AndersenThermostat.
   Parameters:
    - defaultTemperature the default temperature of the heat bath (in Kelvin)
    - defaultCollisionFrequency the default collision frequency (in 1/ps)";


%feature("docstring") OpenMM::AndersenThermostat::getDefaultTemperature "Get the default temperature of the heat bath (in Kelvin).";


%feature("docstring") OpenMM::AndersenThermostat::getDefaultCollisionFrequency "Get the default collision frequency (in 1/ps).";


%feature("docstring") OpenMM::AndersenThermostat::getRandomNumberSeed "Get the random number seed. See setRandomNumberSeed() for details.";


%feature("docstring") OpenMM::AndersenThermostat::setRandomNumberSeed "Set the random number seed. The precise meaning of this parameter is undefined, and is left up to each Platform to interpret in an appropriate way. It is guaranteed that if two simulations are run with different random number seeds, the sequence of collisions will be different. On the other hand, no guarantees are made about the behavior of simulations that use the same seed. In particular, Platforms are permitted to use non-deterministic algorithms which produce different results on successive runs, even if those runs were initialized identically.";


%feature("docstring") Integrator "An Integrator defines a method for simulating a System by integrating the equations of motion. This is an abstract class. Subclasses define particular integration methods.

Each Integrator object is bound to a particular Context which it integrates. This connection is specified by passing the Integrator as an argument to the constructor of the Context.";


%feature("docstring") OpenMM::Integrator::getStepSize "Get the size of each time step, in picoseconds. If this integrator uses variable time steps, the size of the most recent step is returned.";


%feature("docstring") OpenMM::Integrator::setStepSize "Set the size of each time step, in picoseconds. If this integrator uses variable time steps, the effect of calling this method is undefined, and it may simply be ignored.
   Parameters:
    - size the step size, measured in ps";


%feature("docstring") OpenMM::Integrator::getConstraintTolerance "Get the distance tolerance within which constraints are maintained, as a fraction of the constrained distance.";


%feature("docstring") OpenMM::Integrator::setConstraintTolerance "Set the distance tolerance within which constraints are maintained, as a fraction of the constrained distance.";


%feature("docstring") OpenMM::Integrator::step "Advance a simulation through time by taking a series of time steps.
   Parameters:
    - steps the number of time steps to take";


%feature("docstring") BrownianIntegrator "This is an Integrator which simulates a System using Brownian dynamics.";
%feature("docstring") OpenMM::BrownianIntegrator::BrownianIntegrator "Create a BrownianIntegrator.
   Parameters:
    - temperature the temperature of the heat bath (in Kelvin)
    - frictionCoeff the friction coefficient which couples the system to the heat bath, measured in 1/ps
    - stepSize the step size with which to integrator the system (in picoseconds)";


%feature("docstring") OpenMM::BrownianIntegrator::getTemperature "Get the temperature of the heat bath (in Kelvin).";


%feature("docstring") OpenMM::BrownianIntegrator::setTemperature "Set the temperature of the heat bath (in Kelvin).
   Parameters:
    - temp the temperature of the heat bath, measured in Kelvin.";


%feature("docstring") OpenMM::BrownianIntegrator::getFriction "Get the friction coefficient which determines how strongly the system is coupled to the heat bath (in inverse ps).";


%feature("docstring") OpenMM::BrownianIntegrator::setFriction "Set the friction coefficient which determines how strongly the system is coupled to the heat bath (in inverse ps).
   Parameters:
    - coeff the friction coefficient, measured in 1/ps";


%feature("docstring") OpenMM::BrownianIntegrator::getRandomNumberSeed "Get the random number seed. See setRandomNumberSeed() for details.";


%feature("docstring") OpenMM::BrownianIntegrator::setRandomNumberSeed "Set the random number seed. The precise meaning of this parameter is undefined, and is left up to each Platform to interpret in an appropriate way. It is guaranteed that if two simulations are run with different random number seeds, the sequence of random forces will be different. On the other hand, no guarantees are made about the behavior of simulations that use the same seed. In particular, Platforms are permitted to use non-deterministic algorithms which produce different results on successive runs, even if those runs were initialized identically.";


%feature("docstring") OpenMM::BrownianIntegrator::step "Advance a simulation through time by taking a series of time steps.
   Parameters:
    - steps the number of time steps to take";


%feature("docstring") CMAPTorsionForce "This class implements an interaction between pairs of dihedral angles. The interaction energy is defined by an \"energy correction map\" (CMAP), which is simply a set of tabulated energy values on a regular grid of (phi, psi) angles. Natural cubic spline interpolation is used to compute forces and energies at arbitrary values of the two angles.

To use this class, first create one or more energy correction maps by calling addMap(). For each one, you provide an array of energies at uniformly spaced values of the two angles. Next, add interactions by calling addTorsion(). For each one, you specify the sequence of particles used to calculate each of the two dihedral angles, and the index of the map used to calculate their interaction energy.";
%feature("docstring") OpenMM::CMAPTorsionForce::CMAPTorsionForce "Create a CMAPTorsionForce.";


%feature("docstring") OpenMM::CMAPTorsionForce::getNumMaps "Get the number of maps that have been defined.";


%feature("docstring") OpenMM::CMAPTorsionForce::getNumTorsions "Get the number of CMAP torsion terms in the potential function";


%feature("docstring") OpenMM::CMAPTorsionForce::addMap "Create a new map that can be used for torsion pairs.
   Parameters:
    - size the size of the map along each dimension
    - energy the energy values for the map. This must be of length size*size. The element energy[i+size*j] contains the energy when the first torsion angle equals i*2*PI/size and the second torsion angle equals j*2*PI/size.";


%feature("docstring") OpenMM::CMAPTorsionForce::getMapParameters "Get the energy values of a map.
   Parameters:
    - index the index of the map for which to get energy values
    - size the size of the map along each dimension
    - energy the energy values for the map. This must be of length size*size. The element energy[i+size*j] contains the energy when the first torsion angle equals i*2*PI/size and the second torsion angle equals j*2*PI/size.";


%feature("docstring") OpenMM::CMAPTorsionForce::setMapParameters "Set the energy values of a map.
   Parameters:
    - index the index of the map for which to set energy values
    - size the size of the map along each dimension
    - energy the energy values for the map. This must be of length size*size. The element energy[i+size*j] contains the energy when the first torsion angle equals i*2*PI/size and the second torsion angle equals j*2*PI/size.";


%feature("docstring") OpenMM::CMAPTorsionForce::addTorsion "Add a CMAP torsion term to the force field.
   Parameters:
    - map the index of the map to use for this term
    - a1 the index of the first particle forming the first torsion
    - a2 the index of the second particle forming the first torsion
    - a3 the index of the third particle forming the first torsion
    - a4 the index of the fourth particle forming the first torsion
    - b1 the index of the first particle forming the second torsion
    - b2 the index of the second particle forming the second torsion
    - b3 the index of the third particle forming the second torsion
    - b4 the index of the fourth particle forming the second torsion";


%feature("docstring") OpenMM::CMAPTorsionForce::getTorsionParameters "Get the force field parameters for a CMAP torsion term.
   Parameters:
    - index the index of the torsion for which to get parameters
    - map the index of the map to use for this term
    - a1 the index of the first particle forming the first torsion
    - a2 the index of the second particle forming the first torsion
    - a3 the index of the third particle forming the first torsion
    - a4 the index of the fourth particle forming the first torsion
    - b1 the index of the first particle forming the second torsion
    - b2 the index of the second particle forming the second torsion
    - b3 the index of the third particle forming the second torsion
    - b4 the index of the fourth particle forming the second torsion";


%feature("docstring") OpenMM::CMAPTorsionForce::setTorsionParameters "Set the force field parameters for a CMAP torsion term.
   Parameters:
    - index the index of the torsion for which to set parameters
    - map the index of the map to use for this term
    - a1 the index of the first particle forming the first torsion
    - a2 the index of the second particle forming the first torsion
    - a3 the index of the third particle forming the first torsion
    - a4 the index of the fourth particle forming the first torsion
    - b1 the index of the first particle forming the second torsion
    - b2 the index of the second particle forming the second torsion
    - b3 the index of the third particle forming the second torsion
    - b4 the index of the fourth particle forming the second torsion";


%feature("docstring") CMMotionRemover "This class prevents the center of mass of a System from drifting. At each time step, it calculates the center of mass momentum, then adjusts the individual particle velocities to make it zero.";
%feature("docstring") OpenMM::CMMotionRemover::CMMotionRemover "Create a CMMotionRemover.";


%feature("docstring") OpenMM::CMMotionRemover::getFrequency "Get the frequency (in time steps) at which center of mass motion should be removed";


%feature("docstring") OpenMM::CMMotionRemover::setFrequency "Set the frequency (in time steps) at which center of mass motion should be removed";


%feature("docstring") Context "A Context stores the complete state of a simulation. More specifically, it includes:

<ul>
<li>
The current time 

</li>
<li>
The position of each particle 

</li>
<li>
The velocity of each particle 

</li>
<li>
The values of configurable parameters defined by Force objects in the System 

</li>
</ul>


You can retrieve a snapshot of the current state at any time by calling getState(). This allows you to record the state of the simulation at various points, either for analysis or for checkpointing. getState() can also be used to retrieve the current forces on each particle and the current energy of the System.";
%feature("docstring") OpenMM::Context::Context "Construct a new Context in which to run a simulation.
   Parameters:
    - system the System which will be simulated
    - integrator the Integrator which will be used to simulate the System";


%feature("docstring") OpenMM::Context::Context "Construct a new Context in which to run a simulation, explicitly specifying what Platform should be used to perform calculations.
   Parameters:
    - system the System which will be simulated
    - integrator the Integrator which will be used to simulate the System
    - platform the Platform to use for calculations";


%feature("docstring") OpenMM::Context::Context "Construct a new Context in which to run a simulation, explicitly specifying what Platform should be used to perform calculations and the values of platform-specific properties.
   Parameters:
    - system the System which will be simulated
    - integrator the Integrator which will be used to simulate the System
    - platform the Platform to use for calculations
    - properties a set of values for platform-specific properties. Keys are the property names.";




%feature("docstring") OpenMM::Context::getSystem "Get System being simulated in this context.";


%feature("docstring") OpenMM::Context::getSystem "Get System being simulated in this context.";


%feature("docstring") OpenMM::Context::getIntegrator "Get Integrator being used to by this context.";


%feature("docstring") OpenMM::Context::getIntegrator "Get Integrator being used to by this context.";


%feature("docstring") OpenMM::Context::getPlatform "Get the Platform being used for calculations.";


%feature("docstring") OpenMM::Context::getPlatform "Get the Platform being used for calculations.";


%feature("docstring") OpenMM::Context::setTime "Set the current time of the simulation (in picoseconds).";


%feature("docstring") OpenMM::Context::setPositions "Set the positions of all particles in the System (measured in nm). This method simply sets the positions without checking to see whether they satisfy distance constraints. If you want constraints to be enforced, call applyConstraints() after setting the positions.
   Parameters:
    - positions a vector whose length equals the number of particles in the System. The i'th element contains the position of the i'th particle.";


%feature("docstring") OpenMM::Context::setVelocities "Set the velocities of all particles in the System (measured in nm/picosecond).
   Parameters:
    - velocities a vector whose length equals the number of particles in the System. The i'th element contains the velocity of the i'th particle.";


%feature("docstring") OpenMM::Context::getParameter "Get the value of an adjustable parameter defined by a Force object in the System.
   Parameters:
    - name the name of the parameter to get";


%feature("docstring") OpenMM::Context::setParameter "Set the value of an adjustable parameter defined by a Force object in the System.
   Parameters:
    - name the name of the parameter to set
    - value the value of the parameter";


%feature("docstring") OpenMM::Context::setPeriodicBoxVectors "Set the vectors defining the axes of the periodic box (measured in nm). They will affect any Force that uses periodic boundary conditions.

Currently, only rectangular boxes are supported. This means that a, b, and c must be aligned with the x, y, and z axes respectively. Future releases may support arbitrary triclinic boxes.
   Parameters:
    - a the vector defining the first edge of the periodic box
    - b the vector defining the second edge of the periodic box
    - c the vector defining the third edge of the periodic box";


%feature("docstring") OpenMM::Context::applyConstraints "Update the positions of particles so that all distance constraints are satisfied. This also recomputes the locations of all virtual sites.
   Parameters:
    - tol the distance tolerance within which constraints must be satisfied.";


%feature("docstring") OpenMM::Context::computeVirtualSites "Recompute the locations of all virtual sites. There is rarely a reason to call this, since virtual sites are also updated by applyConstraints(). This is only for the rare situations when you want to enforce virtual sites but <i>not</i> constraints.";


%feature("docstring") OpenMM::Context::reinitialize "When a Context is created, it may cache information about the System being simulated and the Force objects contained in it. This means that, if the System or Forces are then modified, the Context might not see all of the changes. Call reinitialize() to force the Context to rebuild its internal representation of the System and pick up any changes that have been made.

This is an expensive operation, so you should try to avoid calling it too frequently.";


%feature("docstring") CustomAngleForce "This class implements interactions between sets of three particles that depend on the angle between them. Unlike HarmonicAngleForce, the functional form of the interaction is completely customizable, and may involve arbitrary algebraic expressions. In addition to the angle formed by the particles, it may depend on arbitrary global and per-angle parameters.

To use this class, create a CustomAngleForce object, passing an algebraic expression to the constructor that defines the interaction energy between each set of particles. The expression may depend on theta, the angle formed by the particles, as well as on any parameters you choose. Then call addPerAngleParameter() to define per-angle parameters, and addGlobalParameter() to define global parameters. The values of per-angle parameters are specified as part of the system definition, while values of global parameters may be modified during a simulation by calling Context::setParameter(). Finally, call addAngle() once for each angle. After an angle has been added, you can modify its parameters by calling setAngleParameters().

As an example, the following code creates a CustomAngleForce that implements a harmonic potential:

<tt>CustomAngleForce* force = new CustomAngleForce(\"0.5*k*(theta-theta0)^2\");</tt>

This force depends on two parameters: the spring constant k and equilibrium angle theta0. The following code defines these parameters:

<tt><pre>
 force->addPerAngleParameter(\"k\");
 force->addPerAngleParameter(\"theta0\");
 </pre></tt>

Expressions may involve the operators + (add), - (subtract), * (multiply), / (divide), and ^ (power), and the following functions: sqrt, exp, log, sin, cos, sec, csc, tan, cot, asin, acos, atan, sinh, cosh, tanh, erf, erfc, min, max, abs, step. All trigonometric functions are defined in radians, and log is the natural logarithm. step(x) = 0 if x is less than 0, 1 otherwise.";
%feature("docstring") OpenMM::CustomAngleForce::CustomAngleForce "Create a CustomAngleForce.
   Parameters:
    - energy an algebraic expression giving the interaction energy between three particles as a function of theta, the angle between them";


%feature("docstring") OpenMM::CustomAngleForce::getNumAngles "Get the number of angles for which force field parameters have been defined.";


%feature("docstring") OpenMM::CustomAngleForce::getNumPerAngleParameters "Get the number of per-angle parameters that the interaction depends on.";


%feature("docstring") OpenMM::CustomAngleForce::getNumGlobalParameters "Get the number of global parameters that the interaction depends on.";


%feature("docstring") OpenMM::CustomAngleForce::getEnergyFunction "Get the algebraic expression that gives the interaction energy for each angle";


%feature("docstring") OpenMM::CustomAngleForce::setEnergyFunction "Set the algebraic expression that gives the interaction energy for each angle";


%feature("docstring") OpenMM::CustomAngleForce::addPerAngleParameter "Add a new per-angle parameter that the interaction may depend on.
   Parameters:
    - name the name of the parameter";


%feature("docstring") OpenMM::CustomAngleForce::getPerAngleParameterName "Get the name of a per-angle parameter.
   Parameters:
    - index the index of the parameter for which to get the name";


%feature("docstring") OpenMM::CustomAngleForce::setPerAngleParameterName "Set the name of a per-angle parameter.
   Parameters:
    - index the index of the parameter for which to set the name
    - name the name of the parameter";


%feature("docstring") OpenMM::CustomAngleForce::addGlobalParameter "Add a new global parameter that the interaction may depend on.
   Parameters:
    - name the name of the parameter
    - defaultValue the default value of the parameter";


%feature("docstring") OpenMM::CustomAngleForce::getGlobalParameterName "Get the name of a global parameter.
   Parameters:
    - index the index of the parameter for which to get the name";


%feature("docstring") OpenMM::CustomAngleForce::setGlobalParameterName "Set the name of a global parameter.
   Parameters:
    - index the index of the parameter for which to set the name
    - name the name of the parameter";


%feature("docstring") OpenMM::CustomAngleForce::getGlobalParameterDefaultValue "Get the default value of a global parameter.
   Parameters:
    - index the index of the parameter for which to get the default value";


%feature("docstring") OpenMM::CustomAngleForce::setGlobalParameterDefaultValue "Set the default value of a global parameter.
   Parameters:
    - index the index of the parameter for which to set the default value
    - name the default value of the parameter";


%feature("docstring") OpenMM::CustomAngleForce::addAngle "Add an angle term to the force field.
   Parameters:
    - particle1 the index of the first particle connected by the angle
    - particle2 the index of the second particle connected by the angle
    - particle3 the index of the third particle connected by the angle
    - parameters the list of parameters for the new angle";


%feature("docstring") OpenMM::CustomAngleForce::getAngleParameters "Get the force field parameters for an angle term.
   Parameters:
    - index the index of the angle for which to get parameters
    - particle1 the index of the first particle connected by the angle
    - particle2 the index of the second particle connected by the angle
    - particle3 the index of the third particle connected by the angle
    - parameters the list of parameters for the angle";


%feature("docstring") OpenMM::CustomAngleForce::setAngleParameters "Set the force field parameters for an angle term.
   Parameters:
    - index the index of the angle for which to set parameters
    - particle1 the index of the first particle connected by the angle
    - particle2 the index of the second particle connected by the angle
    - particle3 the index of the third particle connected by the angle
    - parameters the list of parameters for the angle";


%feature("docstring") CustomBondForce "This class implements bonded interactions between pairs of particles. Unlike HarmonicBondForce, the functional form of the interaction is completely customizable, and may involve arbitrary algebraic expressions. It may depend on the distance between particles, as well as on arbitrary global and per-bond parameters.

To use this class, create a CustomBondForce object, passing an algebraic expression to the constructor that defines the interaction energy between each pair of bonded particles. The expression may depend on r, the distance between the particles, as well as on any parameters you choose. Then call addPerBondParameter() to define per-bond parameters, and addGlobalParameter() to define global parameters. The values of per-bond parameters are specified as part of the system definition, while values of global parameters may be modified during a simulation by calling Context::setParameter(). Finally, call addBond() once for each bond. After a bond has been added, you can modify its parameters by calling setBondParameters().

As an example, the following code creates a CustomBondForce that implements a harmonic potential:

<tt>CustomBondForce* force = new CustomBondForce(\"0.5*k*(r-r0)^2\");</tt>

This force depends on two parameters: the spring constant k and equilibrium distance r0. The following code defines these parameters:

<tt><pre>
 force->addPerBondParameter(\"k\");
 force->addPerBondParameter(\"r0\");
 </pre></tt>

Expressions may involve the operators + (add), - (subtract), * (multiply), / (divide), and ^ (power), and the following functions: sqrt, exp, log, sin, cos, sec, csc, tan, cot, asin, acos, atan, sinh, cosh, tanh, erf, erfc, min, max, abs, step. All trigonometric functions are defined in radians, and log is the natural logarithm. step(x) = 0 if x is less than 0, 1 otherwise.";
%feature("docstring") OpenMM::CustomBondForce::CustomBondForce "Create a CustomBondForce.
   Parameters:
    - energy an algebraic expression giving the interaction energy between two bonded particles as a function of r, the distance between them";


%feature("docstring") OpenMM::CustomBondForce::getNumBonds "Get the number of bonds for which force field parameters have been defined.";


%feature("docstring") OpenMM::CustomBondForce::getNumPerBondParameters "Get the number of per-bond parameters that the interaction depends on.";


%feature("docstring") OpenMM::CustomBondForce::getNumGlobalParameters "Get the number of global parameters that the interaction depends on.";


%feature("docstring") OpenMM::CustomBondForce::getEnergyFunction "Get the algebraic expression that gives the interaction energy for each bond";


%feature("docstring") OpenMM::CustomBondForce::setEnergyFunction "Set the algebraic expression that gives the interaction energy for each bond";


%feature("docstring") OpenMM::CustomBondForce::addPerBondParameter "Add a new per-bond parameter that the interaction may depend on.
   Parameters:
    - name the name of the parameter";


%feature("docstring") OpenMM::CustomBondForce::getPerBondParameterName "Get the name of a per-bond parameter.
   Parameters:
    - index the index of the parameter for which to get the name";


%feature("docstring") OpenMM::CustomBondForce::setPerBondParameterName "Set the name of a per-bond parameter.
   Parameters:
    - index the index of the parameter for which to set the name
    - name the name of the parameter";


%feature("docstring") OpenMM::CustomBondForce::addGlobalParameter "Add a new global parameter that the interaction may depend on.
   Parameters:
    - name the name of the parameter
    - defaultValue the default value of the parameter";


%feature("docstring") OpenMM::CustomBondForce::getGlobalParameterName "Get the name of a global parameter.
   Parameters:
    - index the index of the parameter for which to get the name";


%feature("docstring") OpenMM::CustomBondForce::setGlobalParameterName "Set the name of a global parameter.
   Parameters:
    - index the index of the parameter for which to set the name
    - name the name of the parameter";


%feature("docstring") OpenMM::CustomBondForce::getGlobalParameterDefaultValue "Get the default value of a global parameter.
   Parameters:
    - index the index of the parameter for which to get the default value";


%feature("docstring") OpenMM::CustomBondForce::setGlobalParameterDefaultValue "Set the default value of a global parameter.
   Parameters:
    - index the index of the parameter for which to set the default value
    - name the default value of the parameter";


%feature("docstring") OpenMM::CustomBondForce::addBond "Add a bond term to the force field.
   Parameters:
    - particle1 the index of the first particle connected by the bond
    - particle2 the index of the second particle connected by the bond
    - parameters the list of parameters for the new bond";


%feature("docstring") OpenMM::CustomBondForce::getBondParameters "Get the force field parameters for a bond term.
   Parameters:
    - index the index of the bond for which to get parameters
    - particle1 the index of the first particle connected by the bond
    - particle2 the index of the second particle connected by the bond
    - parameters the list of parameters for the bond";


%feature("docstring") OpenMM::CustomBondForce::setBondParameters "Set the force field parameters for a bond term.
   Parameters:
    - index the index of the bond for which to set parameters
    - particle1 the index of the first particle connected by the bond
    - particle2 the index of the second particle connected by the bond
    - parameters the list of parameters for the bond";


%feature("docstring") CustomExternalForce "This class implements an \"external\" force on particles. The force may be applied to any subset of the particles in the System. The force on each particle is specified by an arbitrary algebraic expression, which may depend on the current position of the particle as well as on arbitrary global and per-particle parameters.

To use this class, create a CustomExternalForce object, passing an algebraic expression to the constructor that defines the potential energy of each affected particle. The expression may depend on the particle's x, y, and z coordinates, as well as on any parameters you choose. Then call addPerParticleParameter() to define per-particle parameters, and addGlobalParameter() to define global parameters. The values of per-particle parameters are specified as part of the system definition, while values of global parameters may be modified during a simulation by calling Context::setParameter(). Finally, call addParticle() once for each particle that should be affected by the force. After a particle has been added, you can modify its parameters by calling setParticleParameters().

As an example, the following code creates a CustomExternalForce that attracts each particle to a target position (x0, y0, z0) via a harmonic potential:

<tt>CustomExternalForce* force = new CustomExternalForce(\"k*((x-x0)^2+(y-y0)^2+(z-z0)^2)\");</tt>

This force depends on four parameters: the spring constant k and equilibrium coordinates x0, y0, and z0. The following code defines these parameters:

<tt><pre>
 force->addGlobalParameter(\"k\");
 force->addPerParticleParameter(\"x0\");
 force->addPerParticleParameter(\"y0\");
 force->addPerParticleParameter(\"z0\");
 </pre></tt>

Expressions may involve the operators + (add), - (subtract), * (multiply), / (divide), and ^ (power), and the following functions: sqrt, exp, log, sin, cos, sec, csc, tan, cot, asin, acos, atan, sinh, cosh, tanh, erf, erfc, min, max, abs, step. All trigonometric functions are defined in radians, and log is the natural logarithm. step(x) = 0 if x is less than 0, 1 otherwise.";
%feature("docstring") OpenMM::CustomExternalForce::CustomExternalForce "Create a CustomExternalForce.
   Parameters:
    - energy an algebraic expression giving the potential energy of each particle as a function of its x, y, and z coordinates";


%feature("docstring") OpenMM::CustomExternalForce::getNumParticles "Get the number of particles for which force field parameters have been defined.";


%feature("docstring") OpenMM::CustomExternalForce::getNumPerParticleParameters "Get the number of per-particle parameters that the force depends on";


%feature("docstring") OpenMM::CustomExternalForce::getNumGlobalParameters "Get the number of global parameters that the force depends on.";


%feature("docstring") OpenMM::CustomExternalForce::getEnergyFunction "Get the algebraic expression that gives the potential energy of each particle";


%feature("docstring") OpenMM::CustomExternalForce::setEnergyFunction "Set the algebraic expression that gives the potential energy of each particle";


%feature("docstring") OpenMM::CustomExternalForce::addPerParticleParameter "Add a new per-particle parameter that the force may depend on.
   Parameters:
    - name the name of the parameter";


%feature("docstring") OpenMM::CustomExternalForce::getPerParticleParameterName "Get the name of a per-particle parameter.
   Parameters:
    - index the index of the parameter for which to get the name";


%feature("docstring") OpenMM::CustomExternalForce::setPerParticleParameterName "Set the name of a per-particle parameter.
   Parameters:
    - index the index of the parameter for which to set the name
    - name the name of the parameter";


%feature("docstring") OpenMM::CustomExternalForce::addGlobalParameter "Add a new global parameter that the force may depend on.
   Parameters:
    - name the name of the parameter
    - defaultValue the default value of the parameter";


%feature("docstring") OpenMM::CustomExternalForce::getGlobalParameterName "Get the name of a global parameter.
   Parameters:
    - index the index of the parameter for which to get the name";


%feature("docstring") OpenMM::CustomExternalForce::setGlobalParameterName "Set the name of a global parameter.
   Parameters:
    - index the index of the parameter for which to set the name
    - name the name of the parameter";


%feature("docstring") OpenMM::CustomExternalForce::getGlobalParameterDefaultValue "Get the default value of a global parameter.
   Parameters:
    - index the index of the parameter for which to get the default value";


%feature("docstring") OpenMM::CustomExternalForce::setGlobalParameterDefaultValue "Set the default value of a global parameter.
   Parameters:
    - index the index of the parameter for which to set the default value
    - name the default value of the parameter";


%feature("docstring") OpenMM::CustomExternalForce::addParticle "Add a particle term to the force field.
   Parameters:
    - particle the index of the particle this term is applied to
    - parameters the list of parameters for the new force term";


%feature("docstring") OpenMM::CustomExternalForce::getParticleParameters "Get the force field parameters for a force field term.
   Parameters:
    - index the index of the particle term for which to get parameters
    - particle the index of the particle this term is applied to
    - parameters the list of parameters for the force field term";


%feature("docstring") OpenMM::CustomExternalForce::setParticleParameters "Set the force field parameters for a force field term.
   Parameters:
    - index the index of the particle term for which to set parameters
    - particle the index of the particle this term is applied to
    - parameters the list of parameters for the force field term";


%feature("docstring") CustomGBForce "This class implements complex, multiple stage nonbonded interactions between particles. It is designed primarily for implementing Generalized Born implicit solvation models, although it is not strictly limited to that purpose. The interaction is specified as a series of computations, each defined by an arbitrary algebraic expression. It also allows tabulated functions to be defined and used with the computations. It optionally supports periodic boundary conditions and cutoffs for long range interactions.

The computation consists of calculating some number of per-particle <i>computed values</i>, followed by one or more <i>energy terms</i>. A computed value is a scalar value that is computed for each particle in the system. It may depend on an arbitrary set of global and per-particle parameters, and well as on other computed values that have been calculated before it. Once all computed values have been calculated, the energy terms and their derivatives are evaluated to determine the system energy and particle forces. The energy terms may depend on global parameters, per-particle parameters, and per-particle computed values.

When specifying a computed value or energy term, you provide an algebraic expression to evaluate and a <i>computation type</i> describing how the expression is to be evaluated. There are two main types of computations:

<ul>
<li>
<b>Single Particle</b>: The expression is evaluated once for each particle in the System. In the case of a computed value, this means the value for a particle depends only on other properties of that particle (its position, parameters, and other computed values). In the case of an energy term, it means each particle makes an independent contribution to the System energy. 

</li>
<li>
<b>Particle Pairs</b>: The expression is evaluated for every pair of particles in the system. In the case of a computed value, the value for a particular particle is calculated by pairing it with every other particle in the system, evaluating the expression for each pair, and summing them. For an energy term, each particle pair makes an independent contribution to the System energy. (Note that energy terms are assumed to be symmetric with respect to the two interacting particles, and therefore are evaluated only once per pair. In contrast, expressions for computed values need not be symmetric and therefore are calculated twice for each pair: once when calculating the value for the first particle, and again when calculating the value for the second particle.) 

</li>
</ul>


Be aware that, although this class is extremely general in the computations it can define, particular Platforms may only support more restricted types of computations. In particular, all currently existing Platforms require that the first computed value <i>must</i> be a particle pair computation, and all computed values after the first <i>must</i> be single particle computations. This is sufficient for most Generalized Born models, but might not permit some other types of calculations to be implemented.

This is a complicated class to use, and an example may help to clarify it. The following code implements the OBC variant of the GB/SA solvation model, using the ACE approximation to estimate surface area:

<tt><pre>
 CustomGBForce* custom = new CustomGBForce();
 custom->addPerParticleParameter(\"q\");
 custom->addPerParticleParameter(\"radius\");
 custom->addPerParticleParameter(\"scale\");
 custom->addGlobalParameter(\"solventDielectric\", obc->getSolventDielectric());
 custom->addGlobalParameter(\"soluteDielectric\", obc->getSoluteDielectric());
 custom->addComputedValue(\"I\", \"step(r+sr2-or1)*0.5*(1/L-1/U+0.25*(1/U^2-1/L^2)*(r-sr2*sr2/r)+0.5*log(L/U)/r+C);\"
                               \"U=r+sr2;\"
                               \"C=2*(1/or1-1/L)*step(sr2-r-or1);\"
                               \"L=max(or1, D);\"
                               \"D=abs(r-sr2);\"
                               \"sr2 = scale2*or2;\"
                               \"or1 = radius1-0.009; or2 = radius2-0.009\", CustomGBForce::ParticlePairNoExclusions);
 custom->addComputedValue(\"B\", \"1/(1/or-tanh(1*psi-0.8*psi^2+4.85*psi^3)/radius);\"
                               \"psi=I*or; or=radius-0.009\", CustomGBForce::SingleParticle);
 custom->addEnergyTerm(\"28.3919551*(radius+0.14)^2*(radius/B)^6-0.5*138.935456*(1/soluteDielectric-1/solventDielectric)*q^2/B\",
                       CustomGBForce::SingleParticle);
 custom->addEnergyTerm(\"-138.935456*(1/soluteDielectric-1/solventDielectric)*q1*q2/f;\"
                       \"f=sqrt(r^2+B1*B2*exp(-r^2/(4*B1*B2)))\", CustomGBForce::ParticlePair);
 </pre></tt>

It begins by defining three per-particle parameters (charge, atomic radius, and scale factor) and two global parameters (the dielectric constants for the solute and solvent). It then defines a computed value \"I\" of type ParticlePair. The expression for evaluating it is a complicated function of the distance between each pair of particles (r), their atomic radii (radius1 and radius2), and their scale factors (scale1 and scale2). Very roughly speaking, it is a measure of the distance between each particle and other nearby particles.

Next a computation is defined for the Born Radius (B). It is computed independently for each particle, and is a function of that particle's atomic radius and the intermediate value I defined above.

Finally, two energy terms are defined. The first one is computed for each particle and represents the surface area term, as well as the self interaction part of the polarization energy. The second term is calculated for each pair of particles, and represents the screening of electrostatic interactions by the solvent.

After defining the force as shown above, you should then call addParticle() once for each particle in the System to set the values of its per-particle parameters (q, radius, and scale). The number of particles for which you set parameters must be exactly equal to the number of particles in the System, or else an exception will be thrown when you try to create a Context. After a particle has been added, you can modify its parameters by calling setParticleParameters().

CustomNonbondedForce also lets you specify \"exclusions\", particular pairs of particles whose interactions should be omitted from calculations. This is most often used for particles that are bonded to each other. Even if you specify exclusions, however, you can use the computation type ParticlePairNoExclusions to indicate that exclusions should not be applied to a particular piece of the computation.

Expressions may involve the operators + (add), - (subtract), * (multiply), / (divide), and ^ (power), and the following functions: sqrt, exp, log, sin, cos, sec, csc, tan, cot, asin, acos, atan, sinh, cosh, tanh, erf, erfc, min, max, abs, step. All trigonometric functions are defined in radians, and log is the natural logarithm. step(x) = 0 if x is less than 0, 1 otherwise. In expressions for particle pair calculations, the names of per-particle parameters and computed values have the suffix \"1\" or \"2\" appended to them to indicate the values for the two interacting particles. As seen in the above example, an expression may also involve intermediate quantities that are defined following the main expression, using \";\" as a separator.

In addition, you can call addFunction() to define a new function based on tabulated values. You specify a vector of values, and a natural spline is created from them. That function can then appear in expressions.";
%feature("docstring") OpenMM::CustomGBForce::CustomGBForce "Create a CustomGBForce.";


%feature("docstring") OpenMM::CustomGBForce::getNumParticles "Get the number of particles for which force field parameters have been defined.";


%feature("docstring") OpenMM::CustomGBForce::getNumExclusions "Get the number of particle pairs whose interactions should be excluded.";


%feature("docstring") OpenMM::CustomGBForce::getNumPerParticleParameters "Get the number of per-particle parameters that the interaction depends on.";


%feature("docstring") OpenMM::CustomGBForce::getNumGlobalParameters "Get the number of global parameters that the interaction depends on.";


%feature("docstring") OpenMM::CustomGBForce::getNumFunctions "Get the number of tabulated functions that have been defined.";


%feature("docstring") OpenMM::CustomGBForce::getNumComputedValues "Get the number of per-particle computed values the interaction depends on.";


%feature("docstring") OpenMM::CustomGBForce::getNumEnergyTerms "Get the number of terms in the energy computation.";


%feature("docstring") OpenMM::CustomGBForce::getNonbondedMethod "Get the method used for handling long range nonbonded interactions.";


%feature("docstring") OpenMM::CustomGBForce::setNonbondedMethod "Set the method used for handling long range nonbonded interactions.";


%feature("docstring") OpenMM::CustomGBForce::getCutoffDistance "Get the cutoff distance (in nm) being used for nonbonded interactions. If the NonbondedMethod in use is NoCutoff, this value will have no effect.";


%feature("docstring") OpenMM::CustomGBForce::setCutoffDistance "Set the cutoff distance (in nm) being used for nonbonded interactions. If the NonbondedMethod in use is NoCutoff, this value will have no effect.
   Parameters:
    - distance the cutoff distance, measured in nm";


%feature("docstring") OpenMM::CustomGBForce::addPerParticleParameter "Add a new per-particle parameter that the interaction may depend on.
   Parameters:
    - name the name of the parameter";


%feature("docstring") OpenMM::CustomGBForce::getPerParticleParameterName "Get the name of a per-particle parameter.
   Parameters:
    - index the index of the parameter for which to get the name";


%feature("docstring") OpenMM::CustomGBForce::setPerParticleParameterName "Set the name of a per-particle parameter.
   Parameters:
    - index the index of the parameter for which to set the name
    - name the name of the parameter";


%feature("docstring") OpenMM::CustomGBForce::addGlobalParameter "Add a new global parameter that the interaction may depend on.
   Parameters:
    - name the name of the parameter
    - defaultValue the default value of the parameter";


%feature("docstring") OpenMM::CustomGBForce::getGlobalParameterName "Get the name of a global parameter.
   Parameters:
    - index the index of the parameter for which to get the name";


%feature("docstring") OpenMM::CustomGBForce::setGlobalParameterName "Set the name of a global parameter.
   Parameters:
    - index the index of the parameter for which to set the name
    - name the name of the parameter";


%feature("docstring") OpenMM::CustomGBForce::getGlobalParameterDefaultValue "Get the default value of a global parameter.
   Parameters:
    - index the index of the parameter for which to get the default value";


%feature("docstring") OpenMM::CustomGBForce::setGlobalParameterDefaultValue "Set the default value of a global parameter.
   Parameters:
    - index the index of the parameter for which to set the default value
    - name the default value of the parameter";


%feature("docstring") OpenMM::CustomGBForce::addParticle "Add the nonbonded force parameters for a particle. This should be called once for each particle in the System. When it is called for the i'th time, it specifies the parameters for the i'th particle.
   Parameters:
    - parameters the list of parameters for the new particle";


%feature("docstring") OpenMM::CustomGBForce::getParticleParameters "Get the nonbonded force parameters for a particle.
   Parameters:
    - index the index of the particle for which to get parameters
    - parameters the list of parameters for the specified particle";


%feature("docstring") OpenMM::CustomGBForce::setParticleParameters "Set the nonbonded force parameters for a particle.
   Parameters:
    - index the index of the particle for which to set parameters
    - parameters the list of parameters for the specified particle";


%feature("docstring") OpenMM::CustomGBForce::addComputedValue "Add a computed value to calculate for each particle.
   Parameters:
    - name the name of the value
    - expression an algebraic expression to evaluate when calculating the computed value. If the ComputationType is SingleParticle, the expression is evaluated independently for each particle, and may depend on its x, y, and z coordinates, as well as the per-particle parameters and previous computed values for that particle. If the ComputationType is ParticlePair or ParticlePairNoExclusions, the expression is evaluated once for every other particle in the system and summed to get the final value. In the latter case, the expression may depend on the distance r between the two particles, and on the per-particle parameters and previous computed values for each of them. Append \"1\" to a variable name to indicate the parameter for the particle whose value is being calculated, and \"2\" to indicate the particle it is interacting with.
    - type the method to use for computing this value";


%feature("docstring") OpenMM::CustomGBForce::getComputedValueParameters "Get the properties of a computed value.
   Parameters:
    - index the index of the computed value for which to get parameters
    - name the name of the value
    - expression an algebraic expression to evaluate when calculating the computed value. If the ComputationType is SingleParticle, the expression is evaluated independently for each particle, and may depend on its x, y, and z coordinates, as well as the per-particle parameters and previous computed values for that particle. If the ComputationType is ParticlePair or ParticlePairNoExclusions, the expression is evaluated once for every other particle in the system and summed to get the final value. In the latter case, the expression may depend on the distance r between the two particles, and on the per-particle parameters and previous computed values for each of them. Append \"1\" to a variable name to indicate the parameter for the particle whose value is being calculated, and \"2\" to indicate the particle it is interacting with.
    - type the method to use for computing this value";


%feature("docstring") OpenMM::CustomGBForce::setComputedValueParameters "Set the properties of a computed value.
   Parameters:
    - index the index of the computed value for which to set parameters
    - name the name of the value
    - expression an algebraic expression to evaluate when calculating the computed value. If the ComputationType is SingleParticle, the expression is evaluated independently for each particle, and may depend on its x, y, and z coordinates, as well as the per-particle parameters and previous computed values for that particle. If the ComputationType is ParticlePair or ParticlePairNoExclusions, the expression is evaluated once for every other particle in the system and summed to get the final value. In the latter case, the expression may depend on the distance r between the two particles, and on the per-particle parameters and previous computed values for each of them. Append \"1\" to a variable name to indicate the parameter for the particle whose value is being calculated, and \"2\" to indicate the particle it is interacting with.
    - type the method to use for computing this value";


%feature("docstring") OpenMM::CustomGBForce::addEnergyTerm "Add a term to the energy computation.
   Parameters:
    - expression an algebraic expression to evaluate when calculating the energy. If the ComputationType is SingleParticle, the expression is evaluated once for each particle, and may depend on its x, y, and z coordinates, as well as the per-particle parameters and computed values for that particle. If the ComputationType is ParticlePair or ParticlePairNoExclusions, the expression is evaluated once for every pair of particles in the system. In the latter case, the expression may depend on the distance r between the two particles, and on the per-particle parameters and computed values for each of them. Append \"1\" to a variable name to indicate the parameter for the first particle in the pair and \"2\" to indicate the second particle in the pair.
    - type the method to use for computing this value";


%feature("docstring") OpenMM::CustomGBForce::getEnergyTermParameters "Get the properties of a term to the energy computation.
   Parameters:
    - index the index of the term for which to get parameters
    - expression an algebraic expression to evaluate when calculating the energy. If the ComputationType is SingleParticle, the expression is evaluated once for each particle, and may depend on its x, y, and z coordinates, as well as the per-particle parameters and computed values for that particle. If the ComputationType is ParticlePair or ParticlePairNoExclusions, the expression is evaluated once for every pair of particles in the system. In the latter case, the expression may depend on the distance r between the two particles, and on the per-particle parameters and computed values for each of them. Append \"1\" to a variable name to indicate the parameter for the first particle in the pair and \"2\" to indicate the second particle in the pair.
    - type the method to use for computing this value";


%feature("docstring") OpenMM::CustomGBForce::setEnergyTermParameters "Set the properties of a term to the energy computation.
   Parameters:
    - index the index of the term for which to set parameters
    - expression an algebraic expression to evaluate when calculating the energy. If the ComputationType is SingleParticle, the expression is evaluated once for each particle, and may depend on its x, y, and z coordinates, as well as the per-particle parameters and computed values for that particle. If the ComputationType is ParticlePair or ParticlePairNoExclusions, the expression is evaluated once for every pair of particles in the system. In the latter case, the expression may depend on the distance r between the two particles, and on the per-particle parameters and computed values for each of them. Append \"1\" to a variable name to indicate the parameter for the first particle in the pair and \"2\" to indicate the second particle in the pair.
    - type the method to use for computing this value";


%feature("docstring") OpenMM::CustomGBForce::addExclusion "Add a particle pair to the list of interactions that should be excluded.
   Parameters:
    - particle1 the index of the first particle in the pair
    - particle2 the index of the second particle in the pair";


%feature("docstring") OpenMM::CustomGBForce::getExclusionParticles "Get the particles in a pair whose interaction should be excluded.
   Parameters:
    - index the index of the exclusion for which to get particle indices
    - particle1 the index of the first particle in the pair
    - particle2 the index of the second particle in the pair";


%feature("docstring") OpenMM::CustomGBForce::setExclusionParticles "Set the particles in a pair whose interaction should be excluded.
   Parameters:
    - index the index of the exclusion for which to set particle indices
    - particle1 the index of the first particle in the pair
    - particle2 the index of the second particle in the pair";


%feature("docstring") OpenMM::CustomGBForce::addFunction "Add a tabulated function that may appear in the energy expression.
   Parameters:
    - name the name of the function as it appears in expressions
    - values the tabulated values of the function f(x) at uniformly spaced values of x between min and max. The function is assumed to be zero for x < min or x > max.
    - min the value of the independent variable corresponding to the first element of values
    - max the value of the independent variable corresponding to the last element of values";


%feature("docstring") OpenMM::CustomGBForce::getFunctionParameters "Get the parameters for a tabulated function that may appear in the energy expression.
   Parameters:
    - index the index of the function for which to get parameters
    - name the name of the function as it appears in expressions
    - values the tabulated values of the function f(x) at uniformly spaced values of x between min and max. The function is assumed to be zero for x < min or x > max.
    - min the value of the independent variable corresponding to the first element of values
    - max the value of the independent variable corresponding to the last element of values";


%feature("docstring") OpenMM::CustomGBForce::setFunctionParameters "Set the parameters for a tabulated function that may appear in algebraic expressions.
   Parameters:
    - index the index of the function for which to set parameters
    - name the name of the function as it appears in expressions
    - values the tabulated values of the function f(x) at uniformly spaced values of x between min and max. The function is assumed to be zero for x < min or x > max.
    - min the value of the independent variable corresponding to the first element of values
    - max the value of the independent variable corresponding to the last element of values";


%feature("docstring") CustomHbondForce "This class supports a wide variety of energy functions used to represent hydrogen bonding. It computes interactions between \"donor\" particle groups and \"acceptor\" particle groups, where each group may include up to three particles. Typically a donor group consists of a hydrogen atom and the atoms it is bonded to, and an acceptor group consists of a negatively charged atom and the atoms it is bonded to.

We refer to the particles in a donor group as d1, d2 and d3, and the particles in an acceptor group as a1, a2, and a3. For each donor and each acceptor, CustomHbondForce evaluates a user supplied algebraic expression to determine the interaction energy. The expression may depend on arbitrary distances, angles, and dihedral angles defined by any of the six particles involved. The function distance(p1, p2) is the distance between the particles p1 and p2 (where \"p1\" and \"p2\" should be replaced by the names of the actual particles to calculate the distance between), angle(p1, p2, p3) is the angle formed by the three specified particles, and dihedral(p1, p2, p3, p4) is the dihedral angle formed by the four specified particles.

The expression also may involve tabulated functions, and may depend on arbitrary global, per-donor, and per-acceptor parameters. It also optionally supports periodic boundary conditions and cutoffs for long range interactions.

To use this class, create a CustomHbondForce object, passing an algebraic expression to the constructor that defines the interaction energy between each donor and acceptor. Then call addPerDonorParameter() to define per-donor parameters, addPerAcceptorParameter() to define per-acceptor parameters, and addGlobalParameter() to define global parameters. The values of per-donor and per-acceptor parameters are specified as part of the system definition, while values of global parameters may be modified during a simulation by calling Context::setParameter().

Next, call addDonor() and addAcceptor() to define donors and acceptors and specify their parameter values. After a donor or acceptor has been added, you can modify its parameters by calling setDonorParameters() or setAcceptorParameters().

CustomHbondForce also lets you specify \"exclusions\", particular combinations of donors and acceptors whose interactions should be omitted from force and energy calculations. This is most often used for particles that are bonded to each other.

As an example, the following code creates a CustomHbondForce that implements a simple harmonic potential to keep the distance between a1 and d1, and the angle formed by a1-d1-d2, near ideal values:

<tt>CustomHbondForce* force = new CustomHbondForce(\"k*(distance(a1,d1)-r0)^2*(angle(a1,d1,d2)-theta0)^2\");</tt>

This force depends on three parameters: k, r0, and theta0. The following code defines these as per-donor parameters:

<tt><pre>
 force->addPerDonorParameter(\"k\");
 force->addPerDonorParameter(\"r0\");
 force->addPerDonorParameter(\"theta0\");
 </pre></tt>

Expressions may involve the operators + (add), - (subtract), * (multiply), / (divide), and ^ (power), and the following functions: sqrt, exp, log, sin, cos, sec, csc, tan, cot, asin, acos, atan, sinh, cosh, tanh, erf, erfc, min, max, abs, step. All trigonometric functions are defined in radians, and log is the natural logarithm. step(x) = 0 if x is less than 0, 1 otherwise.

In addition, you can call addFunction() to define a new function based on tabulated values. You specify a vector of values, and a natural spline is created from them. That function can then appear in the expression.";
%feature("docstring") OpenMM::CustomHbondForce::CustomHbondForce "Create a CustomHbondForce.
   Parameters:
    - energy an algebraic expression giving the interaction energy between a donor as a function of inter-particle distances, angles, and dihedrals, as well as any global, per-donor, and per-acceptor parameters";


%feature("docstring") OpenMM::CustomHbondForce::getNumDonors "Get the number of donors for which force field parameters have been defined.";


%feature("docstring") OpenMM::CustomHbondForce::getNumAcceptors "Get the number of acceptors for which force field parameters have been defined.";


%feature("docstring") OpenMM::CustomHbondForce::getNumExclusions "Get the number of donor-acceptor pairs whose interactions should be excluded.";


%feature("docstring") OpenMM::CustomHbondForce::getNumPerDonorParameters "Get the number of per-donor parameters that the interaction depends on.";


%feature("docstring") OpenMM::CustomHbondForce::getNumPerAcceptorParameters "Get the number of per-acceptor parameters that the interaction depends on.";


%feature("docstring") OpenMM::CustomHbondForce::getNumGlobalParameters "Get the number of global parameters that the interaction depends on.";


%feature("docstring") OpenMM::CustomHbondForce::getNumFunctions "Get the number of tabulated functions that have been defined.";


%feature("docstring") OpenMM::CustomHbondForce::getEnergyFunction "Get the algebraic expression that gives the interaction energy between a donor and an acceptor";


%feature("docstring") OpenMM::CustomHbondForce::setEnergyFunction "Set the algebraic expression that gives the interaction energy between a donor and an acceptor";


%feature("docstring") OpenMM::CustomHbondForce::getNonbondedMethod "Get the method used for handling long range nonbonded interactions.";


%feature("docstring") OpenMM::CustomHbondForce::setNonbondedMethod "Set the method used for handling long range nonbonded interactions.";


%feature("docstring") OpenMM::CustomHbondForce::getCutoffDistance "Get the cutoff distance (in nm) being used. All interactions for which the distance between d1 and a1 is greater than the cutoff will be ignored. If the NonbondedMethod in use is NoCutoff, this value will have no effect.";


%feature("docstring") OpenMM::CustomHbondForce::setCutoffDistance "Set the cutoff distance (in nm) being used. All interactions for which the distance between d1 and a1 is greater than the cutoff will be ignored. If the NonbondedMethod in use is NoCutoff, this value will have no effect.
   Parameters:
    - distance the cutoff distance, measured in nm";


%feature("docstring") OpenMM::CustomHbondForce::addPerDonorParameter "Add a new per-donor parameter that the interaction may depend on.
   Parameters:
    - name the name of the parameter";


%feature("docstring") OpenMM::CustomHbondForce::getPerDonorParameterName "Get the name of a per-donor parameter.
   Parameters:
    - index the index of the parameter for which to get the name";


%feature("docstring") OpenMM::CustomHbondForce::setPerDonorParameterName "Set the name of a per-donor parameter.
   Parameters:
    - index the index of the parameter for which to set the name
    - name the name of the parameter";


%feature("docstring") OpenMM::CustomHbondForce::addPerAcceptorParameter "Add a new per-acceptor parameter that the interaction may depend on.
   Parameters:
    - name the name of the parameter";


%feature("docstring") OpenMM::CustomHbondForce::getPerAcceptorParameterName "Get the name of a per-acceptor parameter.
   Parameters:
    - index the index of the parameter for which to get the name";


%feature("docstring") OpenMM::CustomHbondForce::setPerAcceptorParameterName "Set the name of a per-acceptor parameter.
   Parameters:
    - index the index of the parameter for which to set the name
    - name the name of the parameter";


%feature("docstring") OpenMM::CustomHbondForce::addGlobalParameter "Add a new global parameter that the interaction may depend on.
   Parameters:
    - name the name of the parameter
    - defaultValue the default value of the parameter";


%feature("docstring") OpenMM::CustomHbondForce::getGlobalParameterName "Get the name of a global parameter.
   Parameters:
    - index the index of the parameter for which to get the name";


%feature("docstring") OpenMM::CustomHbondForce::setGlobalParameterName "Set the name of a global parameter.
   Parameters:
    - index the index of the parameter for which to set the name
    - name the name of the parameter";


%feature("docstring") OpenMM::CustomHbondForce::getGlobalParameterDefaultValue "Get the default value of a global parameter.
   Parameters:
    - index the index of the parameter for which to get the default value";


%feature("docstring") OpenMM::CustomHbondForce::setGlobalParameterDefaultValue "Set the default value of a global parameter.
   Parameters:
    - index the index of the parameter for which to set the default value
    - name the default value of the parameter";


%feature("docstring") OpenMM::CustomHbondForce::addDonor "Add a donor group to the force
   Parameters:
    - d1 the index of the first particle for this donor group
    - d2 the index of the second particle for this donor group. If the group only includes one particle, this must be -1.
    - d3 the index of the third particle for this donor group. If the group includes less than three particles, this must be -1.
    - parameters the list of per-donor parameter values for the new donor";


%feature("docstring") OpenMM::CustomHbondForce::getDonorParameters "Get the properties of a donor group.
   Parameters:
    - index the index of the donor group to get
    - d1 the index of the first particle for this donor group
    - d2 the index of the second particle for this donor group. If the group only includes one particle, this will be -1.
    - d3 the index of the third particle for this donor group. If the group includes less than three particles, this will be -1.
    - parameters the list of per-donor parameter values for the new donor";


%feature("docstring") OpenMM::CustomHbondForce::setDonorParameters "Set the properties of a donor group.
   Parameters:
    - index the index of the donor group to set
    - d1 the index of the first particle for this donor group
    - d2 the index of the second particle for this donor group. If the group only includes one particle, this must be -1.
    - d3 the index of the third particle for this donor group. If the group includes less than three particles, this must be -1.
    - parameters the list of per-donor parameter values for the new donor";


%feature("docstring") OpenMM::CustomHbondForce::addAcceptor "Add an acceptor group to the force
   Parameters:
    - a1 the index of the first particle for this acceptor group
    - a2 the index of the second particle for this acceptor group. If the group only includes one particle, this must be -1.
    - a3 the index of the third particle for this acceptor group. If the group includes less than three particles, this must be -1.
    - parameters the list of per-acceptor parameter values for the new acceptor";


%feature("docstring") OpenMM::CustomHbondForce::getAcceptorParameters "Get the properties of an acceptor group.
   Parameters:
    - index the index of the acceptor group to get
    - a1 the index of the first particle for this acceptor group
    - a2 the index of the second particle for this acceptor group. If the group only includes one particle, this will be -1.
    - a3 the index of the third particle for this acceptor group. If the group includes less than three particles, this will be -1.
    - parameters the list of per-acceptor parameter values for the new acceptor";


%feature("docstring") OpenMM::CustomHbondForce::setAcceptorParameters "Set the properties of an acceptor group.
   Parameters:
    - index the index of the acceptor group to set
    - a1 the index of the first particle for this acceptor group
    - a2 the index of the second particle for this acceptor group. If the group only includes one particle, this must be -1.
    - a3 the index of the third particle for this acceptor group. If the group includes less than three particles, this must be -1.
    - parameters the list of per-acceptor parameter values for the new acceptor";


%feature("docstring") OpenMM::CustomHbondForce::addExclusion "Add a donor-acceptor pair to the list of interactions that should be excluded.
   Parameters:
    - donor the index of the donor to exclude
    - acceptor the index of the acceptor to exclude";


%feature("docstring") OpenMM::CustomHbondForce::getExclusionParticles "Get the donor and acceptor in a pair whose interaction should be excluded.
   Parameters:
    - index the index of the exclusion for which to get donor and acceptor indices
    - particle1 the index of the donor
    - particle2 the index of the acceptor";


%feature("docstring") OpenMM::CustomHbondForce::setExclusionParticles "Get the donor and acceptor in a pair whose interaction should be excluded.
   Parameters:
    - index the index of the exclusion for which to get donor and acceptor indices
    - particle1 the index of the donor
    - particle2 the index of the acceptor";


%feature("docstring") OpenMM::CustomHbondForce::addFunction "Add a tabulated function that may appear in the energy expression.
   Parameters:
    - name the name of the function as it appears in expressions
    - values the tabulated values of the function f(x) at uniformly spaced values of x between min and max. The function is assumed to be zero for x < min or x > max.
    - min the value of the independent variable corresponding to the first element of values
    - max the value of the independent variable corresponding to the last element of values";


%feature("docstring") OpenMM::CustomHbondForce::getFunctionParameters "Get the parameters for a tabulated function that may appear in the energy expression.
   Parameters:
    - index the index of the function for which to get parameters
    - name the name of the function as it appears in expressions
    - values the tabulated values of the function f(x) at uniformly spaced values of x between min and max. The function is assumed to be zero for x < min or x > max.
    - min the value of the independent variable corresponding to the first element of values
    - max the value of the independent variable corresponding to the last element of values";


%feature("docstring") OpenMM::CustomHbondForce::setFunctionParameters "Set the parameters for a tabulated function that may appear in algebraic expressions.
   Parameters:
    - index the index of the function for which to set parameters
    - name the name of the function as it appears in expressions
    - values the tabulated values of the function f(x) at uniformly spaced values of x between min and max. The function is assumed to be zero for x < min or x > max.
    - min the value of the independent variable corresponding to the first element of values
    - max the value of the independent variable corresponding to the last element of values";


%feature("docstring") CustomIntegrator "This is an Integrator that can be used to implemented arbitrary, user defined integration algorithms. It is flexible enough to support a wide range of methods including both deterministic and stochastic integrators, Metropolized integrators, and integrators that must integrate additional quantities along with the particle positions and momenta.

To create an integration algorithm, you first define a set of variables the integrator will compute. Variables come in two types: <i>global</i> variables have a single value, while <i>per-DOF</i> variables have a value for every degree of freedom (x, y, or z coordinate of a particle). You can define as many variables as you want of each type. The value of any variable can be computed by the integration algorithm, or set directly by calling a method on the CustomIntegrator. All variables are persistent between integration steps; once a value is set, it keeps that value until it is changed by the user or recomputed in a later integration step.

Next, you define the algorithm as a series of computations. To execute a time step, the integrator performs the list of computations in order. Each computation updates the value of one global or per-DOF value. There are several types of computations that can be done:

<ul>
<li>
Global: You provide a mathematical expression involving only global variables. It is evaluated and stored into a global variable. 

</li>
<li>
Per-DOF: You provide a mathematical expression involving both global and per-DOF variables. It is evaluated once for every degree of freedom, and the values are stored into a per-DOF variable. 

</li>
<li>
Sum: You provide a mathematical expression involving both global and per-DOF variables. It is evaluated once for every degree of freedom. All of those values are then added together, and the sum is stored into a global variable. 

</li>
<li>
Constrain Positions: The particle positions are updated so that all distance constraints are satisfied. 

</li>
<li>
Constrain Velocities: The particle velocities are updated so the net velocity along any constrained distance is 0. 

</li>
</ul>


Like all integrators, CustomIntegrator ignores any particle whose mass is 0. It is skipped when doing per-DOF computations, and is not included when computing sums over degrees of freedom.

In addition to the variables you define by calling addGlobalVariable() and addPerDofVariable(), the integrator provides the following pre-defined variables:

<ul>
<li>
dt: (global) This is the step size being used by the integrator. 

</li>
<li>
energy: (global, read-only) This is the current potential energy of the system. 

</li>
<li>
x: (per-DOF) This is the current value of the degree of freedom (the x, y, or z coordinate of a particle). 

</li>
<li>
v: (per-DOF) This is the current velocity associated with the degree of freedom (the x, y, or z component of a particle's velocity). 

</li>
<li>
f: (per-DOF, read-only) This is the current force acting on the degree of freedom (the x, y, or z component of the force on a particle). 

</li>
<li>
f0, f1, f2, ...: (per-DOF, read-only) This is similar to f, but includes only the contribution from forces in one force group. A single computation step may only depend on a single force variable (f, f0, f1, etc.). 

</li>
<li>
m: (per-DOF, read-only) This is the mass of the particle the degree of freedom is associated with. 

</li>
<li>
uniform: (either global or per-DOF, read-only) This is a uniformly distributed random number between 0 and 1. Every time an expression is evaluated, a different value will be used. When used in a per-DOF expression, a different value will be used for every degree of freedom. Note, however, that if this variable appears multiple times in a single expression, the <i>same</i> value is used everywhere it appears in that expression. 

</li>
<li>
gaussian: (either global or per-DOF, read-only) This is a Gaussian distributed random number with mean 0 and variance 1. Every time an expression is evaluated, a different value will be used. When used in a per-DOF expression, a different value will be used for every degree of freedom. Note, however, that if this variable appears multiple times in a single expression, the <i>same</i> value is used everywhere it appears in that expression. 

</li>
<li>
A global variable is created for every adjustable parameter defined in the integrator's Context. 

</li>
</ul>


The following example uses a CustomIntegrator to implement a velocity Verlet integrator:

<tt><pre>
 CustomIntegrator integrator(0.001);
 integrator.addComputePerDof(\"v\", \"v+0.5*dt*f/m\");
 integrator.addComputePerDof(\"x\", \"x+dt*v\");
 integrator.addComputePerDof(\"v\", \"v+0.5*dt*f/m\");
 </pre></tt>

The first step updates the velocities based on the current forces. The second step updates the positions based on the new velocities, and the third step updates the velocities again. Although the first and third steps look identical, the forces used in them are different. You do not need to tell the integrator that; it will recognize that the positions have changed and know to recompute the forces automatically.

The above example has two problems. First, it does not respect distance constraints. To make the integrator work with constraints, you need to add extra steps to tell it when and how to apply them. Second, it never gives Forces an opportunity to update the context state. This should be done every time step so that, for example, an AndersenThermostat can randomize velocities or a MonteCarloBarostat can scale particle positions. You need to add a step to tell the integrator when to do this. The following example corrects both these problems, using the RATTLE algorithm to apply constraints:

<tt><pre>
 CustomIntegrator integrator(0.001);
 integrator.addPerDofVariable(\"x1\", 0);
 integrator.addUpdateContextState();
 integrator.addComputePerDof(\"v\", \"v+0.5*dt*f/m\");
 integrator.addComputePerDof(\"x\", \"x+dt*v\");
 integrator.addConstrainPositions();
 integrator.addComputePerDof(\"v\", \"v+0.5*dt*f/m+(x-x1)/dt\");
 integrator.addConstrainVelocities();
 </pre></tt>

CustomIntegrator can be used to implement multiple time step integrators. The following example shows an r-RESPA integrator. It assumes the quickly changing forces are in force group 0 and the slowly changing ones are in force group 1. It evaluates the \"fast\" forces four times as often as the \"slow\" forces.

<tt><pre>
 CustomIntegrator integrator(0.004);
 integrator.addComputePerDof(\"v\", \"v+0.5*dt*f1/m\");
 for (int i = 0; i < 4; i++) {
     integrator.addComputePerDof(\"v\", \"v+0.5*(dt/4)*f0/m\");
     integrator.addComputePerDof(\"x\", \"x+(dt/4)*v\");
     integrator.addComputePerDof(\"v\", \"v+0.5*(dt/4)*f0/m\");
 }
 integrator.addComputePerDof(\"v\", \"v+0.5*dt*f1/m\");
 </pre></tt>

Expressions may involve the operators + (add), - (subtract), * (multiply), / (divide), and ^ (power), and the following functions: sqrt, exp, log, sin, cos, sec, csc, tan, cot, asin, acos, atan, sinh, cosh, tanh, erf, erfc, min, max, abs, step. All trigonometric functions are defined in radians, and log is the natural logarithm. step(x) = 0 if x is less than 0, 1 otherwise. An expression may also involve intermediate quantities that are defined following the main expression, using \";\" as a separator.";
%feature("docstring") OpenMM::CustomIntegrator::CustomIntegrator "Create a CustomIntegrator.
   Parameters:
    - stepSize the step size with which to integrate the system (in picoseconds)";


%feature("docstring") OpenMM::CustomIntegrator::getNumGlobalVariables "Get the number of global variables that have been defined.";


%feature("docstring") OpenMM::CustomIntegrator::getNumPerDofVariables "Get the number of per-DOF variables that have been defined.";


%feature("docstring") OpenMM::CustomIntegrator::getNumComputations "Get the number of computation steps that have been added.";


%feature("docstring") OpenMM::CustomIntegrator::addGlobalVariable "Define a new global variable.
   Parameters:
    - name the name of the variable
    - initialValue the variable will initially be set to this value";


%feature("docstring") OpenMM::CustomIntegrator::getGlobalVariableName "Get the name of a global variable.
   Parameters:
    - index the index of the variable to get";


%feature("docstring") OpenMM::CustomIntegrator::addPerDofVariable "Define a new per-DOF variable.
   Parameters:
    - name the name of the variable
    - initialValue the variable will initially be set to this value for all degrees of freedom";


%feature("docstring") OpenMM::CustomIntegrator::getPerDofVariableName "Get the name of a per-DOF variable.
   Parameters:
    - index the index of the variable to get";


%feature("docstring") OpenMM::CustomIntegrator::getGlobalVariable "Get the current value of a global variable.
   Parameters:
    - index the index of the variable to get";


%feature("docstring") OpenMM::CustomIntegrator::setGlobalVariable "Set the value of a global variable.
   Parameters:
    - index the index of the variable to set
    - value the new value of the variable";


%feature("docstring") OpenMM::CustomIntegrator::setGlobalVariableByName "Set the value of a global variable, specified by name.
   Parameters:
    - name the name of the variable to set
    - value the new value of the variable";


%feature("docstring") OpenMM::CustomIntegrator::getPerDofVariable "Get the value of a per-DOF variable.
   Parameters:
    - index the index of the variable to get
    - values the values of the variable for all degrees of freedom are stored into this";


%feature("docstring") OpenMM::CustomIntegrator::setPerDofVariable "Set the value of a per-DOF variable.
   Parameters:
    - index the index of the variable to set
    - values the new values of the variable for all degrees of freedom";


%feature("docstring") OpenMM::CustomIntegrator::setPerDofVariableByName "Set the value of a per-DOF variable, specified by name.
   Parameters:
    - name the name of the variable to set
    - values the new values of the variable for all degrees of freedom";


%feature("docstring") OpenMM::CustomIntegrator::addComputeGlobal "Add a step to the integration algorithm that computes a global value.
   Parameters:
    - variable the global variable to store the computed value into
    - expression a mathematical expression involving only global variables. In each integration step, its value is computed and stored into the specified variable.";


%feature("docstring") OpenMM::CustomIntegrator::addComputePerDof "Add a step to the integration algorithm that computes a per-DOF value.
   Parameters:
    - variable the per-DOF variable to store the computed value into
    - expression a mathematical expression involving both global and per-DOF variables. In each integration step, its value is computed for every degree of freedom and stored into the specified variable.";


%feature("docstring") OpenMM::CustomIntegrator::addComputeSum "Add a step to the integration algorithm that computes a sum over degrees of freedom.
   Parameters:
    - variable the global variable to store the computed value into
    - expression a mathematical expression involving both global and per-DOF variables. In each integration step, its value is computed for every degree of freedom. Those values are then added together, and the sum is stored in the specified variable.";


%feature("docstring") OpenMM::CustomIntegrator::addConstrainPositions "Add a step to the integration algorithm that updates particle positions so all constraints are satisfied.";


%feature("docstring") OpenMM::CustomIntegrator::addConstrainVelocities "Add a step to the integration algorithm that updates particle velocities so the net velocity along all constraints is 0.";


%feature("docstring") OpenMM::CustomIntegrator::addUpdateContextState "Add a step to the integration algorithm that allows Forces to update the context state.";


%feature("docstring") OpenMM::CustomIntegrator::getComputationStep "Get the details of a computation step that has been added to the integration algorithm.
   Parameters:
    - index the index of the computation step to get
    - type on exit, the type of computation this step performs
    - variable on exit, the variable into which this step stores its result. If this step does not store a result in a variable, this will be an empty string.
    - expression on exit, the expression this step evaluates. If this step does not evaluate an expression, this will be an empty string.";


%feature("docstring") OpenMM::CustomIntegrator::getRandomNumberSeed "Get the random number seed. See setRandomNumberSeed() for details.";


%feature("docstring") OpenMM::CustomIntegrator::setRandomNumberSeed "Set the random number seed. The precise meaning of this parameter is undefined, and is left up to each Platform to interpret in an appropriate way. It is guaranteed that if two simulations are run with different random number seeds, the sequence of random numbers will be different. On the other hand, no guarantees are made about the behavior of simulations that use the same seed. In particular, Platforms are permitted to use non-deterministic algorithms which produce different results on successive runs, even if those runs were initialized identically.";


%feature("docstring") OpenMM::CustomIntegrator::step "Advance a simulation through time by taking a series of time steps.
   Parameters:
    - steps the number of time steps to take";


%feature("docstring") CustomNonbondedForce "This class implements nonbonded interactions between particles. Unlike NonbondedForce, the functional form of the interaction is completely customizable, and may involve arbitrary algebraic expressions and tabulated functions. It may depend on the distance between particles, as well as on arbitrary global and per-particle parameters. It also optionally supports periodic boundary conditions and cutoffs for long range interactions.

To use this class, create a CustomNonbondedForce object, passing an algebraic expression to the constructor that defines the interaction energy between each pair of particles. The expression may depend on r, the distance between the particles, as well as on any parameters you choose. Then call addPerParticleParameter() to define per-particle parameters, and addGlobalParameter() to define global parameters. The values of per-particle parameters are specified as part of the system definition, while values of global parameters may be modified during a simulation by calling Context::setParameter().

Next, call addParticle() once for each particle in the System to set the values of its per-particle parameters. The number of particles for which you set parameters must be exactly equal to the number of particles in the System, or else an exception will be thrown when you try to create a Context. After a particle has been added, you can modify its parameters by calling setParticleParameters().

CustomNonbondedForce also lets you specify \"exclusions\", particular pairs of particles whose interactions should be omitted from force and energy calculations. This is most often used for particles that are bonded to each other.

As an example, the following code creates a CustomNonbondedForce that implements a 12-6 Lennard-Jones potential:

<tt>CustomNonbondedForce* force = new CustomNonbondedForce(\"4*epsilon*((sigma/r)^12-(sigma/r)^6); sigma=0.5*(sigma1*sigma2); epsilon=sqrt(epsilon1*epsilon2)\");</tt>

This force depends on two parameters: sigma and epsilon. The following code defines these as per-particle parameters:

<tt><pre>
 force->addPerParticleParameter(\"sigma\");
 force->addPerParticleParameter(\"epsilon\");
 </pre></tt>

Expressions may involve the operators + (add), - (subtract), * (multiply), / (divide), and ^ (power), and the following functions: sqrt, exp, log, sin, cos, sec, csc, tan, cot, asin, acos, atan, sinh, cosh, tanh, erf, erfc, min, max, abs, step. All trigonometric functions are defined in radians, and log is the natural logarithm. step(x) = 0 if x is less than 0, 1 otherwise. The names of per-particle parameters have the suffix \"1\" or \"2\" appended to them to indicate the values for the two interacting particles. As seen in the above example, the expression may also involve intermediate quantities that are defined following the main expression, using \";\" as a separator.

In addition, you can call addFunction() to define a new function based on tabulated values. You specify a vector of values, and a natural spline is created from them. That function can then appear in the expression.";
%feature("docstring") OpenMM::CustomNonbondedForce::CustomNonbondedForce "Create a CustomNonbondedForce.
   Parameters:
    - energy an algebraic expression giving the interaction energy between two particles as a function of r, the distance between them, as well as any global and per-particle parameters";


%feature("docstring") OpenMM::CustomNonbondedForce::getNumParticles "Get the number of particles for which force field parameters have been defined.";


%feature("docstring") OpenMM::CustomNonbondedForce::getNumExclusions "Get the number of particle pairs whose interactions should be excluded.";


%feature("docstring") OpenMM::CustomNonbondedForce::getNumPerParticleParameters "Get the number of per-particle parameters that the interaction depends on.";


%feature("docstring") OpenMM::CustomNonbondedForce::getNumGlobalParameters "Get the number of global parameters that the interaction depends on.";


%feature("docstring") OpenMM::CustomNonbondedForce::getNumFunctions "Get the number of tabulated functions that have been defined.";


%feature("docstring") OpenMM::CustomNonbondedForce::getEnergyFunction "Get the algebraic expression that gives the interaction energy between two particles";


%feature("docstring") OpenMM::CustomNonbondedForce::setEnergyFunction "Set the algebraic expression that gives the interaction energy between two particles";


%feature("docstring") OpenMM::CustomNonbondedForce::getNonbondedMethod "Get the method used for handling long range nonbonded interactions.";


%feature("docstring") OpenMM::CustomNonbondedForce::setNonbondedMethod "Set the method used for handling long range nonbonded interactions.";


%feature("docstring") OpenMM::CustomNonbondedForce::getCutoffDistance "Get the cutoff distance (in nm) being used for nonbonded interactions. If the NonbondedMethod in use is NoCutoff, this value will have no effect.";


%feature("docstring") OpenMM::CustomNonbondedForce::setCutoffDistance "Set the cutoff distance (in nm) being used for nonbonded interactions. If the NonbondedMethod in use is NoCutoff, this value will have no effect.
   Parameters:
    - distance the cutoff distance, measured in nm";


%feature("docstring") OpenMM::CustomNonbondedForce::addPerParticleParameter "Add a new per-particle parameter that the interaction may depend on.
   Parameters:
    - name the name of the parameter";


%feature("docstring") OpenMM::CustomNonbondedForce::getPerParticleParameterName "Get the name of a per-particle parameter.
   Parameters:
    - index the index of the parameter for which to get the name";


%feature("docstring") OpenMM::CustomNonbondedForce::setPerParticleParameterName "Set the name of a per-particle parameter.
   Parameters:
    - index the index of the parameter for which to set the name
    - name the name of the parameter";


%feature("docstring") OpenMM::CustomNonbondedForce::addGlobalParameter "Add a new global parameter that the interaction may depend on.
   Parameters:
    - name the name of the parameter
    - defaultValue the default value of the parameter";


%feature("docstring") OpenMM::CustomNonbondedForce::getGlobalParameterName "Get the name of a global parameter.
   Parameters:
    - index the index of the parameter for which to get the name";


%feature("docstring") OpenMM::CustomNonbondedForce::setGlobalParameterName "Set the name of a global parameter.
   Parameters:
    - index the index of the parameter for which to set the name
    - name the name of the parameter";


%feature("docstring") OpenMM::CustomNonbondedForce::getGlobalParameterDefaultValue "Get the default value of a global parameter.
   Parameters:
    - index the index of the parameter for which to get the default value";


%feature("docstring") OpenMM::CustomNonbondedForce::setGlobalParameterDefaultValue "Set the default value of a global parameter.
   Parameters:
    - index the index of the parameter for which to set the default value
    - name the default value of the parameter";


%feature("docstring") OpenMM::CustomNonbondedForce::addParticle "Add the nonbonded force parameters for a particle. This should be called once for each particle in the System. When it is called for the i'th time, it specifies the parameters for the i'th particle.
   Parameters:
    - parameters the list of parameters for the new particle";


%feature("docstring") OpenMM::CustomNonbondedForce::getParticleParameters "Get the nonbonded force parameters for a particle.
   Parameters:
    - index the index of the particle for which to get parameters
    - parameters the list of parameters for the specified particle";


%feature("docstring") OpenMM::CustomNonbondedForce::setParticleParameters "Set the nonbonded force parameters for a particle.
   Parameters:
    - index the index of the particle for which to set parameters
    - parameters the list of parameters for the specified particle";


%feature("docstring") OpenMM::CustomNonbondedForce::addExclusion "Add a particle pair to the list of interactions that should be excluded.
   Parameters:
    - particle1 the index of the first particle in the pair
    - particle2 the index of the second particle in the pair";


%feature("docstring") OpenMM::CustomNonbondedForce::getExclusionParticles "Get the particles in a pair whose interaction should be excluded.
   Parameters:
    - index the index of the exclusion for which to get particle indices
    - particle1 the index of the first particle in the pair
    - particle2 the index of the second particle in the pair";


%feature("docstring") OpenMM::CustomNonbondedForce::setExclusionParticles "Set the particles in a pair whose interaction should be excluded.
   Parameters:
    - index the index of the exclusion for which to set particle indices
    - particle1 the index of the first particle in the pair
    - particle2 the index of the second particle in the pair";


%feature("docstring") OpenMM::CustomNonbondedForce::addFunction "Add a tabulated function that may appear in the energy expression.
   Parameters:
    - name the name of the function as it appears in expressions
    - values the tabulated values of the function f(x) at uniformly spaced values of x between min and max. The function is assumed to be zero for x < min or x > max.
    - min the value of the independent variable corresponding to the first element of values
    - max the value of the independent variable corresponding to the last element of values";


%feature("docstring") OpenMM::CustomNonbondedForce::getFunctionParameters "Get the parameters for a tabulated function that may appear in the energy expression.
   Parameters:
    - index the index of the function for which to get parameters
    - name the name of the function as it appears in expressions
    - values the tabulated values of the function f(x) at uniformly spaced values of x between min and max. The function is assumed to be zero for x < min or x > max.
    - min the value of the independent variable corresponding to the first element of values
    - max the value of the independent variable corresponding to the last element of values";


%feature("docstring") OpenMM::CustomNonbondedForce::setFunctionParameters "Set the parameters for a tabulated function that may appear in algebraic expressions.
   Parameters:
    - index the index of the function for which to set parameters
    - name the name of the function as it appears in expressions
    - values the tabulated values of the function f(x) at uniformly spaced values of x between min and max. The function is assumed to be zero for x < min or x > max.
    - min the value of the independent variable corresponding to the first element of values
    - max the value of the independent variable corresponding to the last element of values";


%feature("docstring") CustomTorsionForce "This class implements interactions between sets of four particles that depend on the torsion angle between them. Unlike PeriodicTorsionForce, the functional form of the interaction is completely customizable, and may involve arbitrary algebraic expressions. In addition to the angle formed by the particles, it may depend on arbitrary global and per-torsion parameters.

To use this class, create a CustomTorsionForce object, passing an algebraic expression to the constructor that defines the interaction energy between each set of particles. The expression may depend on theta, the torsion angle formed by the particles, as well as on any parameters you choose. Then call addPerTorsionParameter() to define per-torsion parameters, and addGlobalParameter() to define global parameters. The values of per-torsion parameters are specified as part of the system definition, while values of global parameters may be modified during a simulation by calling Context::setParameter(). Finally, call addTorsion() once for each torsion. After an torsion has been added, you can modify its parameters by calling setTorsionParameters().

As an example, the following code creates a CustomTorsionForce that implements a harmonic potential:

<tt>CustomTorsionForce* force = new CustomTorsionForce(\"0.5*k*(theta-theta0)^2\");</tt>

This force depends on two parameters: the spring constant k and equilibrium angle theta0. The following code defines these parameters:

<tt><pre>
 force->addPerTorsionParameter(\"k\");
 force->addPerTorsionParameter(\"theta0\");
 </pre></tt>

Expressions may involve the operators + (add), - (subtract), * (multiply), / (divide), and ^ (power), and the following functions: sqrt, exp, log, sin, cos, sec, csc, tan, cot, asin, acos, atan, sinh, cosh, tanh, erf, erfc, min, max, abs, step. All trigonometric functions are defined in radians, and log is the natural logarithm. step(x) = 0 if x is less than 0, 1 otherwise.";
%feature("docstring") OpenMM::CustomTorsionForce::CustomTorsionForce "Create a CustomTorsionForce.
   Parameters:
    - energy an algebraic expression giving the interaction energy between three particles as a function of theta, the torsion angle between them";


%feature("docstring") OpenMM::CustomTorsionForce::getNumTorsions "Get the number of torsions for which force field parameters have been defined.";


%feature("docstring") OpenMM::CustomTorsionForce::getNumPerTorsionParameters "Get the number of per-torsion parameters that the interaction depends on.";


%feature("docstring") OpenMM::CustomTorsionForce::getNumGlobalParameters "Get the number of global parameters that the interaction depends on.";


%feature("docstring") OpenMM::CustomTorsionForce::getEnergyFunction "Get the algebraic expression that gives the interaction energy for each torsion";


%feature("docstring") OpenMM::CustomTorsionForce::setEnergyFunction "Set the algebraic expression that gives the interaction energy for each torsion";


%feature("docstring") OpenMM::CustomTorsionForce::addPerTorsionParameter "Add a new per-torsion parameter that the interaction may depend on.
   Parameters:
    - name the name of the parameter";


%feature("docstring") OpenMM::CustomTorsionForce::getPerTorsionParameterName "Get the name of a per-torsion parameter.
   Parameters:
    - index the index of the parameter for which to get the name";


%feature("docstring") OpenMM::CustomTorsionForce::setPerTorsionParameterName "Set the name of a per-torsion parameter.
   Parameters:
    - index the index of the parameter for which to set the name
    - name the name of the parameter";


%feature("docstring") OpenMM::CustomTorsionForce::addGlobalParameter "Add a new global parameter that the interaction may depend on.
   Parameters:
    - name the name of the parameter
    - defaultValue the default value of the parameter";


%feature("docstring") OpenMM::CustomTorsionForce::getGlobalParameterName "Get the name of a global parameter.
   Parameters:
    - index the index of the parameter for which to get the name";


%feature("docstring") OpenMM::CustomTorsionForce::setGlobalParameterName "Set the name of a global parameter.
   Parameters:
    - index the index of the parameter for which to set the name
    - name the name of the parameter";


%feature("docstring") OpenMM::CustomTorsionForce::getGlobalParameterDefaultValue "Get the default value of a global parameter.
   Parameters:
    - index the index of the parameter for which to get the default value";


%feature("docstring") OpenMM::CustomTorsionForce::setGlobalParameterDefaultValue "Set the default value of a global parameter.
   Parameters:
    - index the index of the parameter for which to set the default value
    - name the default value of the parameter";


%feature("docstring") OpenMM::CustomTorsionForce::addTorsion "Add a torsion term to the force field.
   Parameters:
    - particle1 the index of the first particle connected by the torsion
    - particle2 the index of the second particle connected by the torsion
    - particle3 the index of the third particle connected by the torsion
    - particle4 the index of the fourth particle connected by the torsion
    - parameters the list of parameters for the new torsion";


%feature("docstring") OpenMM::CustomTorsionForce::getTorsionParameters "Get the force field parameters for a torsion term.
   Parameters:
    - index the index of the torsion for which to get parameters
    - particle1 the index of the first particle connected by the torsion
    - particle2 the index of the second particle connected by the torsion
    - particle3 the index of the third particle connected by the torsion
    - particle4 the index of the fourth particle connected by the torsion
    - parameters the list of parameters for the torsion";


%feature("docstring") OpenMM::CustomTorsionForce::setTorsionParameters "Set the force field parameters for a torsion term.
   Parameters:
    - index the index of the torsion for which to set parameters
    - particle1 the index of the first particle connected by the torsion
    - particle2 the index of the second particle connected by the torsion
    - particle3 the index of the third particle connected by the torsion
    - particle4 the index of the fourth particle connected by the torsion
    - parameters the list of parameters for the torsion";


%feature("docstring") GBSAOBCForce "This class implements an implicit solvation force using the GBSA-OBC model. 

To use this class, create a GBSAOBCForce object, then call addParticle() once for each particle in the System to define its parameters. The number of particles for which you define GBSA parameters must be exactly equal to the number of particles in the System, or else an exception will be thrown when you try to create a Context. After a particle has been added, you can modify its force field parameters by calling setParticleParameters().";


%feature("docstring") OpenMM::GBSAOBCForce::getNumParticles "Get the number of particles in the system.";


%feature("docstring") OpenMM::GBSAOBCForce::addParticle "Add the GBSA parameters for a particle. This should be called once for each particle in the System. When it is called for the i'th time, it specifies the parameters for the i'th particle.
   Parameters:
    - charge the charge of the particle, measured in units of the proton charge
    - radius the GBSA radius of the particle, measured in nm
    - scalingFactor the OBC scaling factor for the particle";


%feature("docstring") OpenMM::GBSAOBCForce::getParticleParameters "Get the force field parameters for a particle.
   Parameters:
    - index the index of the particle for which to get parameters
    - charge the charge of the particle, measured in units of the proton charge
    - radius the GBSA radius of the particle, measured in nm
    - scalingFactor the OBC scaling factor for the particle";


%feature("docstring") OpenMM::GBSAOBCForce::setParticleParameters "Set the force field parameters for a particle.
   Parameters:
    - index the index of the particle for which to set parameters
    - charge the charge of the particle, measured in units of the proton charge
    - radius the GBSA radius of the particle, measured in nm
    - scalingFactor the OBC scaling factor for the particle";


%feature("docstring") OpenMM::GBSAOBCForce::getSolventDielectric "Get the dielectric constant for the solvent.";


%feature("docstring") OpenMM::GBSAOBCForce::setSolventDielectric "Set the dielectric constant for the solvent.";


%feature("docstring") OpenMM::GBSAOBCForce::getSoluteDielectric "Get the dielectric constant for the solute.";


%feature("docstring") OpenMM::GBSAOBCForce::setSoluteDielectric "Set the dielectric constant for the solute.";


%feature("docstring") OpenMM::GBSAOBCForce::getNonbondedMethod "Get the method used for handling long range nonbonded interactions.";


%feature("docstring") OpenMM::GBSAOBCForce::setNonbondedMethod "Set the method used for handling long range nonbonded interactions.";


%feature("docstring") OpenMM::GBSAOBCForce::getCutoffDistance "Get the cutoff distance (in nm) being used for nonbonded interactions. If the NonbondedMethod in use is NoCutoff, this value will have no effect.";


%feature("docstring") OpenMM::GBSAOBCForce::setCutoffDistance "Set the cutoff distance (in nm) being used for nonbonded interactions. If the NonbondedMethod in use is NoCutoff, this value will have no effect.
   Parameters:
    - distance the cutoff distance, measured in nm";


%feature("docstring") GBSAOBCSoftcoreForce "This class implements an implicit solvation force using the GBSA-OBC model. 

To use this class, create a GBSAOBCSoftcoreForce object, then call addParticle() once for each particle in the System to define its parameters. The number of particles for which you define GBSA parameters must be exactly equal to the number of particles in the System, or else an exception will be thrown when you try to create a Context. After a particle has been added, you can modify its force field parameters by calling setParticleParameters(). 

If the System also contains a NonbondedForce, this force will use the cutoffs and periodic boundary conditions specified in it.";


%feature("docstring") OpenMM::GBSAOBCSoftcoreForce::getNumParticles "Get the number of particles in the system.";


%feature("docstring") OpenMM::GBSAOBCSoftcoreForce::addParticle "Add the GBSA parameters for a particle. This should be called once for each particle in the System. When it is called for the i'th time, it specifies the parameters for the i'th particle.
   Parameters:
    - charge the charge of the particle, measured in units of the proton charge
    - radius the GBSA radius of the particle, measured in nm
    - scalingFactor the OBC scaling factor for the particle
    - nonPolarScalingFactor the nonpolar scaling factor for the particle (default: 1.0)";


%feature("docstring") OpenMM::GBSAOBCSoftcoreForce::getParticleParameters "Get the force field parameters for a particle.
   Parameters:
    - index the index of the particle for which to get parameters
    - charge the charge of the particle, measured in units of the proton charge
    - radius the GBSA radius of the particle, measured in nm
    - scalingFactor the OBC scaling factor for the particle
    - nonPolarScalingFactor the nonpolar scaling factor for the particle";


%feature("docstring") OpenMM::GBSAOBCSoftcoreForce::setParticleParameters "Set the force field parameters for a particle.
   Parameters:
    - index the index of the particle for which to set parameters
    - charge the charge of the particle, measured in units of the proton charge
    - radius the GBSA radius of the particle, measured in nm
    - scalingFactor the OBC scaling factor for the particle
    - nonPolarScalingFactor the nonpolar scaling factor for the particle (default: 1.0)";


%feature("docstring") OpenMM::GBSAOBCSoftcoreForce::getSolventDielectric "Get the dielectric constant for the solvent.";


%feature("docstring") OpenMM::GBSAOBCSoftcoreForce::setSolventDielectric "Set the dielectric constant for the solvent.";


%feature("docstring") OpenMM::GBSAOBCSoftcoreForce::getSoluteDielectric "Get the dielectric constant for the solute.";


%feature("docstring") OpenMM::GBSAOBCSoftcoreForce::setSoluteDielectric "Set the dielectric constant for the solute.";


%feature("docstring") OpenMM::GBSAOBCSoftcoreForce::getNonPolarPrefactor "Get the nonPolarPrefactor.";


%feature("docstring") OpenMM::GBSAOBCSoftcoreForce::setNonPolarPrefactor "Set the nonPolarPrefactor; units are kJ/mol/nm^2";


%feature("docstring") OpenMM::GBSAOBCSoftcoreForce::getNonbondedMethod "Get the method used for handling long range nonbonded interactions.";


%feature("docstring") OpenMM::GBSAOBCSoftcoreForce::setNonbondedMethod "Set the method used for handling long range nonbonded interactions.";


%feature("docstring") OpenMM::GBSAOBCSoftcoreForce::getCutoffDistance "Get the cutoff distance (in nm) being used for nonbonded interactions. If the NonbondedMethod in use is NoCutoff, this value will have no effect.";


%feature("docstring") OpenMM::GBSAOBCSoftcoreForce::setCutoffDistance "Set the cutoff distance (in nm) being used for nonbonded interactions. If the NonbondedMethod in use is NoCutoff, this value will have no effect.";


%feature("docstring") GBVIForce "This class implements an implicit solvation force using the GB/VI model. 

To use this class, create a GBVIForce object, then call addParticle() once for each particle in the System to define its parameters. The number of particles for which you define GB/VI parameters must be exactly equal to the number of particles in the System, or else an exception will be thrown when you try to create a Context. After a particle has been added, you can modify its force field parameters by calling setParticleParameters().";


%feature("docstring") OpenMM::GBVIForce::getNumParticles "Get the number of particles in the system.";


%feature("docstring") OpenMM::GBVIForce::addParticle "Add the GB/VI parameters for a particle. This should be called once for each particle in the System. When it is called for the i'th time, it specifies the parameters for the i'th particle.
   Parameters:
    - charge the charge of the particle, measured in units of the proton charge
    - radius the GB/VI radius of the particle, measured in nm
    - gamma the gamma parameter";


%feature("docstring") OpenMM::GBVIForce::getParticleParameters "Get the force field parameters for a particle.
   Parameters:
    - index the index of the particle for which to get parameters
    - charge the charge of the particle, measured in units of the proton charge
    - radius the GBSA radius of the particle, measured in nm
    - gamma the gamma parameter";


%feature("docstring") OpenMM::GBVIForce::setParticleParameters "Set the force field parameters for a particle.
   Parameters:
    - index the index of the particle for which to set parameters
    - charge the charge of the particle, measured in units of the proton charge
    - radius the GB/VI radius of the particle, measured in nm
    - gamma the gamma parameter";


%feature("docstring") OpenMM::GBVIForce::addBond "Add a bond
   Parameters:
    - particle1 the index of the first particle
    - particle2 the index of the second particle
    - distance the distance between the two particles, measured in nm";


%feature("docstring") OpenMM::GBVIForce::getBondParameters "Get the parameters defining a bond
   Parameters:
    - index the index of the bond for which to get parameters
    - particle1 the index of the first particle involved in the bond
    - particle2 the index of the second particle involved in the bond
    - distance the distance between the two particles, measured in nm";


%feature("docstring") OpenMM::GBVIForce::setBondParameters "Set 1-2 bonds
   Parameters:
    - index index of the bond for which to set parameters
    - particle1 index of first atom in bond
    - particle2 index of second atom in bond
    - bondLength bond length, measured in nm";


%feature("docstring") OpenMM::GBVIForce::getNumBonds "Get number of bonds";


%feature("docstring") OpenMM::GBVIForce::getSolventDielectric "Get the dielectric constant for the solvent.";


%feature("docstring") OpenMM::GBVIForce::setSolventDielectric "Set the dielectric constant for the solvent.";


%feature("docstring") OpenMM::GBVIForce::getSoluteDielectric "Get the dielectric constant for the solute.";


%feature("docstring") OpenMM::GBVIForce::setSoluteDielectric "Set the dielectric constant for the solute.";


%feature("docstring") OpenMM::GBVIForce::getNonbondedMethod "Get the method used for handling long range nonbonded interactions.";


%feature("docstring") OpenMM::GBVIForce::setNonbondedMethod "Set the method used for handling long range nonbonded interactions.";


%feature("docstring") OpenMM::GBVIForce::getCutoffDistance "Get the cutoff distance (in nm) being used for nonbonded interactions. If the NonbondedMethod in use is NoCutoff, this value will have no effect.";


%feature("docstring") OpenMM::GBVIForce::setCutoffDistance "Set the cutoff distance (in nm) being used for nonbonded interactions. If the NonbondedMethod in use is NoCutoff, this value will have no effect.
   Parameters:
    - distance the cutoff distance, measured in nm";


%feature("docstring") OpenMM::GBVIForce::getBornRadiusScalingMethod "Get Born radius scaling method";


%feature("docstring") OpenMM::GBVIForce::setBornRadiusScalingMethod "Set Born radius scaling method";


%feature("docstring") OpenMM::GBVIForce::getQuinticLowerLimitFactor "Get the lower limit factor used in the quintic spline scaling method (typically 0.5-0.8)";


%feature("docstring") OpenMM::GBVIForce::setQuinticLowerLimitFactor "Set the lower limit factor used in the quintic spline scaling method (typically 0.5-0.8)";


%feature("docstring") OpenMM::GBVIForce::getQuinticUpperBornRadiusLimit "Get the upper limit used in the quintic spline scaling method, measured in nm (~5.0)";


%feature("docstring") OpenMM::GBVIForce::setQuinticUpperBornRadiusLimit "Set the upper limit used in the quintic spline scaling method, measured in nm (~5.0)";


%feature("docstring") GBVISoftcoreForce "This class implements an implicit solvation force using the GB/VI model. 

To use this class, create a GBVISoftcoreForce object, then call addParticle() once for each particle in the System to define its parameters. The number of particles for which you define GB/VI parameters must be exactly equal to the number of particles in the System, or else an exception will be thrown when you try to create an Context. After a particle has been added, you can modify its force field parameters by calling setParticleParameters(). 

If the System also contains a NonbondedForce, this force will use the cutoffs and periodic boundary conditions specified in it.";


%feature("docstring") OpenMM::GBVISoftcoreForce::getNumParticles "Get the number of particles in the system.";


%feature("docstring") OpenMM::GBVISoftcoreForce::addParticle "Add the GB/VI parameters for a particle. This should be called once for each particle in the System. When it is called for the i'th time, it specifies the parameters for the i'th particle.
   Parameters:
    - charge the charge of the particle, measured in units of the proton charge
    - radius the GB/VI radius of the particle, measured in nm
    - gamma the gamma parameter
    - bornRadiusScaleFactor the Born radius scale factor (used for free energy calculations)";


%feature("docstring") OpenMM::GBVISoftcoreForce::getParticleParameters "Get the force field parameters for a particle.
   Parameters:
    - index the index of the particle for which to get parameters
    - charge the charge of the particle, measured in units of the proton charge
    - radius the GBSA radius of the particle, measured in nm
    - gamma the gamma parameter
    - bornRadiusScaleFactor the Born radius scale factor (used for free energy calculations)";


%feature("docstring") OpenMM::GBVISoftcoreForce::setParticleParameters "Set the force field parameters for a particle.
   Parameters:
    - index the index of the particle for which to set parameters
    - charge the charge of the particle, measured in units of the proton charge
    - radius the GB/VI radius of the particle, measured in nm
    - gamma the gamma parameter
    - bornRadiusScaleFactor the Born radius scale factor (used for free energy calculations)";


%feature("docstring") OpenMM::GBVISoftcoreForce::addBond "Add a bond
   Parameters:
    - particle1 the index of the first particle
    - particle2 the index of the second particle
    - distance the distance between the two particles, measured in nm";


%feature("docstring") OpenMM::GBVISoftcoreForce::getBondParameters "Get the parameters defining a bond
   Parameters:
    - index the index of the bond for which to get parameters
    - particle1 the index of the first particle involved in the bond
    - particle2 the index of the second particle involved in the bond
    - distance the distance between the two particles, measured in nm";


%feature("docstring") OpenMM::GBVISoftcoreForce::setBondParameters "Set 1-2 bonds
   Parameters:
    - index index of the bond for which to set parameters
    - particle1 index of first atom in bond
    - particle2 index of second atom in bond
    - bondLength bond length";


%feature("docstring") OpenMM::GBVISoftcoreForce::getNumBonds "Get number of bonds";


%feature("docstring") OpenMM::GBVISoftcoreForce::getSolventDielectric "Get the dielectric constant for the solvent.";


%feature("docstring") OpenMM::GBVISoftcoreForce::setSolventDielectric "Set the dielectric constant for the solvent.";


%feature("docstring") OpenMM::GBVISoftcoreForce::getSoluteDielectric "Get the dielectric constant for the solute.";


%feature("docstring") OpenMM::GBVISoftcoreForce::setSoluteDielectric "Set the dielectric constant for the solute.";


%feature("docstring") OpenMM::GBVISoftcoreForce::getNonbondedMethod "Get the method used for handling long range nonbonded interactions.";


%feature("docstring") OpenMM::GBVISoftcoreForce::setNonbondedMethod "Set the method used for handling long range nonbonded interactions.";


%feature("docstring") OpenMM::GBVISoftcoreForce::getCutoffDistance "Get the cutoff distance (in nm) being used for nonbonded interactions. If the NonbondedMethod in use is NoCutoff, this value will have no effect.";


%feature("docstring") OpenMM::GBVISoftcoreForce::setCutoffDistance "Set the cutoff distance (in nm) being used for nonbonded interactions. If the NonbondedMethod in use is NoCutoff, this value will have no effect.";


%feature("docstring") OpenMM::GBVISoftcoreForce::getBornRadiusScalingMethod "Get the method used for scaling Born radii.";


%feature("docstring") OpenMM::GBVISoftcoreForce::setBornRadiusScalingMethod "Set the method used for scaling Born radii.";


%feature("docstring") OpenMM::GBVISoftcoreForce::getQuinticLowerLimitFactor "Get the lower limit factor used in the quintic spline scaling method (typically 0.5-0.8)";


%feature("docstring") OpenMM::GBVISoftcoreForce::setQuinticLowerLimitFactor "Set the lower limit factor used in the quintic spline scaling method (typically 0.5-0.8)";


%feature("docstring") OpenMM::GBVISoftcoreForce::getQuinticUpperBornRadiusLimit "Get the upper limit used in the quintic spline scaling method (typically 0.5-0.8)";


%feature("docstring") OpenMM::GBVISoftcoreForce::setQuinticUpperBornRadiusLimit "Set the upper limit used in the quintic spline scaling method (typically 0.008)";


%feature("docstring") HarmonicAngleForce "This class implements an interaction between groups of three particles that varies harmonically with the angle between them. To use it, create a HarmonicAngleForce object then call addAngle() once for each angle. After an angle has been added, you can modify its force field parameters by calling setAngleParameters().";
%feature("docstring") OpenMM::HarmonicAngleForce::HarmonicAngleForce "Create a HarmonicAngleForce.";


%feature("docstring") OpenMM::HarmonicAngleForce::getNumAngles "Get the number of harmonic bond angle terms in the potential function";


%feature("docstring") OpenMM::HarmonicAngleForce::addAngle "Add an angle term to the force field.
   Parameters:
    - particle1 the index of the first particle forming the angle
    - particle2 the index of the second particle forming the angle
    - particle3 the index of the third particle forming the angle
    - angle the equilibrium angle, measured in radians
    - k the harmonic force constant for the angle, measured in kJ/mol/radian^2";


%feature("docstring") OpenMM::HarmonicAngleForce::getAngleParameters "Get the force field parameters for an angle term.
   Parameters:
    - index the index of the angle for which to get parameters
    - particle1 the index of the first particle forming the angle
    - particle2 the index of the second particle forming the angle
    - particle3 the index of the third particle forming the angle
    - angle the equilibrium angle, measured in radians
    - k the harmonic force constant for the angle, measured in kJ/mol/radian^2";


%feature("docstring") OpenMM::HarmonicAngleForce::setAngleParameters "Set the force field parameters for an angle term.
   Parameters:
    - index the index of the angle for which to set parameters
    - particle1 the index of the first particle forming the angle
    - particle2 the index of the second particle forming the angle
    - particle3 the index of the third particle forming the angle
    - angle the equilibrium angle, measured in radians
    - k the harmonic force constant for the angle, measured in kJ/mol/radian^2";


%feature("docstring") HarmonicBondForce "This class implements an interaction between pairs of particles that varies harmonically with the distance between them. To use it, create a HarmonicBondForce object then call addBond() once for each bond. After a bond has been added, you can modify its force field parameters by calling setBondParameters().";
%feature("docstring") OpenMM::HarmonicBondForce::HarmonicBondForce "Create a HarmonicBondForce.";


%feature("docstring") OpenMM::HarmonicBondForce::getNumBonds "Get the number of harmonic bond stretch terms in the potential function";


%feature("docstring") OpenMM::HarmonicBondForce::addBond "Add a bond term to the force field.
   Parameters:
    - particle1 the index of the first particle connected by the bond
    - particle2 the index of the second particle connected by the bond
    - length the equilibrium length of the bond, measured in nm
    - k the harmonic force constant for the bond, measured in kJ/mol/nm^2";


%feature("docstring") OpenMM::HarmonicBondForce::getBondParameters "Get the force field parameters for a bond term.
   Parameters:
    - index the index of the bond for which to get parameters
    - particle1 the index of the first particle connected by the bond
    - particle2 the index of the second particle connected by the bond
    - length the equilibrium length of the bond, measured in nm
    - k the harmonic force constant for the bond, measured in kJ/mol/nm^2";


%feature("docstring") OpenMM::HarmonicBondForce::setBondParameters "Set the force field parameters for a bond term.
   Parameters:
    - index the index of the bond for which to set parameters
    - particle1 the index of the first particle connected by the bond
    - particle2 the index of the second particle connected by the bond
    - length the equilibrium length of the bond, measured in nm
    - k the harmonic force constant for the bond, measured in kJ/mol/nm^2";


%feature("docstring") LangevinIntegrator "This is an Integrator which simulates a System using Langevin dynamics.";
%feature("docstring") OpenMM::LangevinIntegrator::LangevinIntegrator "Create a LangevinIntegrator.
   Parameters:
    - temperature the temperature of the heat bath (in Kelvin)
    - frictionCoeff the friction coefficient which couples the system to the heat bath (in inverse picoseconds)
    - stepSize the step size with which to integrator the system (in picoseconds)";


%feature("docstring") OpenMM::LangevinIntegrator::getTemperature "Get the temperature of the heat bath (in Kelvin).";


%feature("docstring") OpenMM::LangevinIntegrator::setTemperature "Set the temperature of the heat bath (in Kelvin).
   Parameters:
    - temp the temperature of the heat bath, measured in Kelvin";


%feature("docstring") OpenMM::LangevinIntegrator::getFriction "Get the friction coefficient which determines how strongly the system is coupled to the heat bath (in inverse ps).";


%feature("docstring") OpenMM::LangevinIntegrator::setFriction "Set the friction coefficient which determines how strongly the system is coupled to the heat bath (in inverse ps).
   Parameters:
    - coeff the friction coefficient, measured in 1/ps";


%feature("docstring") OpenMM::LangevinIntegrator::getRandomNumberSeed "Get the random number seed. See setRandomNumberSeed() for details.";


%feature("docstring") OpenMM::LangevinIntegrator::setRandomNumberSeed "Set the random number seed. The precise meaning of this parameter is undefined, and is left up to each Platform to interpret in an appropriate way. It is guaranteed that if two simulations are run with different random number seeds, the sequence of random forces will be different. On the other hand, no guarantees are made about the behavior of simulations that use the same seed. In particular, Platforms are permitted to use non-deterministic algorithms which produce different results on successive runs, even if those runs were initialized identically.";


%feature("docstring") OpenMM::LangevinIntegrator::step "Advance a simulation through time by taking a series of time steps.
   Parameters:
    - steps the number of time steps to take";


%feature("docstring") LocalEnergyMinimizer "Given a Context, this class searches for a new set of particle positions that represent a local minimum of the potential energy. The search is performed with the L-BFGS algorithm. Distance constraints are enforced during minimization by adding a harmonic restraining force to the potential function. The strength of the restraining force is steadily increased until the minimum energy configuration satisfies all constraints to within the tolerance specified by the Context's Integrator.";
%feature("docstring") OpenMM::LocalEnergyMinimizer::minimize "Search for a new set of particle positions that represent a local potential energy minimum. On exit, the Context will have been updated with the new positions.
   Parameters:
    - context a Context specifying the System to minimize and the initial particle positions
    - tolerance this specifies how precisely the energy minimum must be located. Minimization will be halted once the root-mean-square value of all force components reaches this tolerance. The default value is 1.
    - maxIterations the maximum number of iterations to perform. If this is 0, minimation is continued until the results converge without regard to how many iterations it takes. The default value is 0.";


%feature("docstring") MonteCarloBarostat "This class uses a Monte Carlo algorithm to adjust the size of the periodic box, simulating the effect of constant pressure.

This class assumes the simulation is also being run at constant temperature, and requires you to specify the system temperature (since it affects the acceptance probability for Monte Carlo moves). It does not actually perform temperature regulation, however. You must use another mechanism along with it to maintain the temperature, such as LangevinIntegrator or AndersenThermostat.";
%feature("docstring") OpenMM::MonteCarloBarostat::Pressure "This is the name of the parameter which stores the current pressure acting on the system (in bar).";


%feature("docstring") OpenMM::MonteCarloBarostat::MonteCarloBarostat "Create a MonteCarloBarostat.
   Parameters:
    - defaultPressure the default pressure acting on the system (in bar)
    - temperature the temperature at which the system is being maintained (in Kelvin)
    - frequency the frequency at which Monte Carlo pressure changes should be attempted (in time steps)";


%feature("docstring") OpenMM::MonteCarloBarostat::getDefaultPressure "Get the default pressure acting on the system (in bar).";


%feature("docstring") OpenMM::MonteCarloBarostat::getFrequency "Get the frequency (in time steps) at which Monte Carlo pressure changes should be attempted. If this is set to 0, the barostat is disabled.";


%feature("docstring") OpenMM::MonteCarloBarostat::setFrequency "Set the frequency (in time steps) at which Monte Carlo pressure changes should be attempted. If this is set to 0, the barostat is disabled.";


%feature("docstring") OpenMM::MonteCarloBarostat::getTemperature "Get the temperature at which the system is being maintained, measured in Kelvin.";


%feature("docstring") OpenMM::MonteCarloBarostat::setTemperature "Set the temperature at which the system is being maintained.
   Parameters:
    - temp the system temperature, measured in Kelvin.";


%feature("docstring") OpenMM::MonteCarloBarostat::getRandomNumberSeed "Get the random number seed. See setRandomNumberSeed() for details.";


%feature("docstring") OpenMM::MonteCarloBarostat::setRandomNumberSeed "Set the random number seed. It is guaranteed that if two simulations are run with different random number seeds, the sequence of Monte Carlo steps will be different. On the other hand, no guarantees are made about the behavior of simulations that use the same seed. In particular, Platforms are permitted to use non-deterministic algorithms which produce different results on successive runs, even if those runs were initialized identically.";


%feature("docstring") NonbondedForce "This class implements nonbonded interactions between particles, including a Coulomb force to represent electrostatics and a Lennard-Jones force to represent van der Waals interactions. It optionally supports periodic boundary conditions and cutoffs for long range interactions. Lennard-Jones interactions are calculated with the Lorentz-Bertelot combining rule: it uses the arithmetic mean of the sigmas and the geometric mean of the epsilons for the two interacting particles.

To use this class, create a NonbondedForce object, then call addParticle() once for each particle in the System to define its parameters. The number of particles for which you define nonbonded parameters must be exactly equal to the number of particles in the System, or else an exception will be thrown when you try to create a Context. After a particle has been added, you can modify its force field parameters by calling setParticleParameters().

NonbondedForce also lets you specify \"exceptions\", particular pairs of particles whose interactions should be computed based on different parameters than those defined for the individual particles. This can be used to completely exclude certain interactions from the force calculation, or to alter how they interact with each other.

Many molecular force fields omit Coulomb and Lennard-Jones interactions between particles separated by one or two bonds, while using modified parameters for those separated by three bonds (known as \"1-4 interactions\"). This class provides a convenience method for this case called createExceptionsFromBonds(). You pass to it a list of bonds and the scale factors to use for 1-4 interactions. It identifies all pairs of particles which are separated by 1, 2, or 3 bonds, then automatically creates exceptions for them.";
%feature("docstring") OpenMM::NonbondedForce::NonbondedForce "Create a NonbondedForce.";


%feature("docstring") OpenMM::NonbondedForce::getNumParticles "Get the number of particles for which force field parameters have been defined.";


%feature("docstring") OpenMM::NonbondedForce::getNumExceptions "Get the number of special interactions that should be calculated differently from other interactions.";


%feature("docstring") OpenMM::NonbondedForce::getNonbondedMethod "Get the method used for handling long range nonbonded interactions.";


%feature("docstring") OpenMM::NonbondedForce::setNonbondedMethod "Set the method used for handling long range nonbonded interactions.";


%feature("docstring") OpenMM::NonbondedForce::getCutoffDistance "Get the cutoff distance (in nm) being used for nonbonded interactions. If the NonbondedMethod in use is NoCutoff, this value will have no effect.";


%feature("docstring") OpenMM::NonbondedForce::setCutoffDistance "Set the cutoff distance (in nm) being used for nonbonded interactions. If the NonbondedMethod in use is NoCutoff, this value will have no effect.
   Parameters:
    - distance the cutoff distance, measured in nm";


%feature("docstring") OpenMM::NonbondedForce::getReactionFieldDielectric "Get the dielectric constant to use for the solvent in the reaction field approximation.";


%feature("docstring") OpenMM::NonbondedForce::setReactionFieldDielectric "Set the dielectric constant to use for the solvent in the reaction field approximation.";


%feature("docstring") OpenMM::NonbondedForce::getEwaldErrorTolerance "Get the error tolerance for Ewald summation. This corresponds to the fractional error in the forces which is acceptable. This value is used to select the reciprocal space cutoff and separation parameter so that the average error level will be less than the tolerance. There is not a rigorous guarantee that all forces on all atoms will be less than the tolerance, however.";


%feature("docstring") OpenMM::NonbondedForce::setEwaldErrorTolerance "Get the error tolerance for Ewald summation. This corresponds to the fractional error in the forces which is acceptable. This value is used to select the reciprocal space cutoff and separation parameter so that the average error level will be less than the tolerance. There is not a rigorous guarantee that all forces on all atoms will be less than the tolerance, however.";


%feature("docstring") OpenMM::NonbondedForce::addParticle "Add the nonbonded force parameters for a particle. This should be called once for each particle in the System. When it is called for the i'th time, it specifies the parameters for the i'th particle. For calculating the Lennard-Jones interaction between two particles, the arithmetic mean of the sigmas and the geometric mean of the epsilons for the two interacting particles is used (the Lorentz-Bertelot combining rule).
   Parameters:
    - charge the charge of the particle, measured in units of the proton charge
    - sigma the sigma parameter of the Lennard-Jones potential (corresponding to the van der Waals radius of the particle), measured in nm
    - epsilon the epsilon parameter of the Lennard-Jones potential (corresponding to the well depth of the van der Waals interaction), measured in kJ/mol";


%feature("docstring") OpenMM::NonbondedForce::getParticleParameters "Get the nonbonded force parameters for a particle.
   Parameters:
    - index the index of the particle for which to get parameters
    - charge the charge of the particle, measured in units of the proton charge
    - sigma the sigma parameter of the Lennard-Jones potential (corresponding to the van der Waals radius of the particle), measured in nm
    - epsilon the epsilon parameter of the Lennard-Jones potential (corresponding to the well depth of the van der Waals interaction), measured in kJ/mol";


%feature("docstring") OpenMM::NonbondedForce::setParticleParameters "Set the nonbonded force parameters for a particle. When calculating the Lennard-Jones interaction between two particles, it uses the arithmetic mean of the sigmas and the geometric mean of the epsilons for the two interacting particles (the Lorentz-Bertelot combining rule).
   Parameters:
    - index the index of the particle for which to set parameters
    - charge the charge of the particle, measured in units of the proton charge
    - sigma the sigma parameter of the Lennard-Jones potential (corresponding to the van der Waals radius of the particle), measured in nm
    - epsilon the epsilon parameter of the Lennard-Jones potential (corresponding to the well depth of the van der Waals interaction), measured in kJ/mol";


%feature("docstring") OpenMM::NonbondedForce::addException "Add an interaction to the list of exceptions that should be calculated differently from other interactions. If chargeProd and epsilon are both equal to 0, this will cause the interaction to be completely omitted from force and energy calculations.

In many cases, you can use createExceptionsFromBonds() rather than adding each exception explicitly.
   Parameters:
    - particle1 the index of the first particle involved in the interaction
    - particle2 the index of the second particle involved in the interaction
    - chargeProd the scaled product of the atomic charges (i.e. the strength of the Coulomb interaction), measured in units of the proton charge squared
    - sigma the sigma parameter of the Lennard-Jones potential (corresponding to the van der Waals radius of the particle), measured in nm
    - epsilon the epsilon parameter of the Lennard-Jones potential (corresponding to the well depth of the van der Waals interaction), measured in kJ/mol
    - replace determines the behavior if there is already an exception for the same two particles. If true, the existing one is replaced. If false, an exception is thrown.";


%feature("docstring") OpenMM::NonbondedForce::getExceptionParameters "Get the force field parameters for an interaction that should be calculated differently from others.
   Parameters:
    - index the index of the interaction for which to get parameters
    - particle1 the index of the first particle involved in the interaction
    - particle2 the index of the second particle involved in the interaction
    - chargeProd the scaled product of the atomic charges (i.e. the strength of the Coulomb interaction), measured in units of the proton charge squared
    - sigma the sigma parameter of the Lennard-Jones potential (corresponding to the van der Waals radius of the particle), measured in nm
    - epsilon the epsilon parameter of the Lennard-Jones potential (corresponding to the well depth of the van der Waals interaction), measured in kJ/mol";


%feature("docstring") OpenMM::NonbondedForce::setExceptionParameters "Set the force field parameters for an interaction that should be calculated differently from others. If chargeProd and epsilon are both equal to 0, this will cause the interaction to be completely omitted from force and energy calculations.
   Parameters:
    - index the index of the interaction for which to get parameters
    - particle1 the index of the first particle involved in the interaction
    - particle2 the index of the second particle involved in the interaction
    - chargeProd the scaled product of the atomic charges (i.e. the strength of the Coulomb interaction), measured in units of the proton charge squared
    - sigma the sigma parameter of the Lennard-Jones potential (corresponding to the van der Waals radius of the particle), measured in nm
    - epsilon the epsilon parameter of the Lennard-Jones potential (corresponding to the well depth of the van der Waals interaction), measured in kJ/mol";


%feature("docstring") OpenMM::NonbondedForce::createExceptionsFromBonds "Identify exceptions based on the molecular topology. Particles which are separated by one or two bonds are set to not interact at all, while pairs of particles separated by three bonds (known as \"1-4 interactions\") have their Coulomb and Lennard-Jones interactions reduced by a fixed factor.
   Parameters:
    - bonds the set of bonds based on which to construct exceptions. Each element specifies the indices of two particles that are bonded to each other.
    - coulomb14Scale pairs of particles separated by three bonds will have the strength of their Coulomb interaction multiplied by this factor
    - lj14Scale pairs of particles separated by three bonds will have the strength of their Lennard-Jones interaction multiplied by this factor";


%feature("docstring") OpenMM::NonbondedForce::getUseDispersionCorrection "Get whether to add a contribution to the energy that approximately represents the effect of Lennard-Jones interactions beyond the cutoff distance. The energy depends on the volume of the periodic box, and is only applicable when periodic boundary conditions are used. When running simulations at constant pressure, adding this contribution can improve the quality of results.";


%feature("docstring") OpenMM::NonbondedForce::setUseDispersionCorrection "Set whether to add a contribution to the energy that approximately represents the effect of Lennard-Jones interactions beyond the cutoff distance. The energy depends on the volume of the periodic box, and is only applicable when periodic boundary conditions are used. When running simulations at constant pressure, adding this contribution can improve the quality of results.";


%feature("docstring") OpenMM::NonbondedForce::getReciprocalSpaceForceGroup "Get the force group that reciprocal space interactions for Ewald or PME are included in. This allows multiple time step integrators to evaluate direct and reciprocal space interactions at different intervals: getForceGroup() specifies the group for direct space, and getReciprocalSpaceForceGroup() specifies the group for reciprocal space. If this is -1 (the default value), the same force group is used for reciprocal space as for direct space.";


%feature("docstring") OpenMM::NonbondedForce::setReciprocalSpaceForceGroup "Set the force group that reciprocal space interactions for Ewald or PME are included in. This allows multiple time step integrators to evaluate direct and reciprocal space interactions at different intervals: setForceGroup() specifies the group for direct space, and setReciprocalSpaceForceGroup() specifies the group for reciprocal space. If this is -1 (the default value), the same force group is used for reciprocal space as for direct space.
   Parameters:
    - group the group index. Legal values are between 0 and 31 (inclusive), or -1 to use the same force group that is specified for direct space.";


%feature("docstring") NonbondedSoftcoreForce "This class implements nonbonded interactions between particles, including a Coulomb force to represent electrostatics and a Lennard-Jones force to represent van der Waals interactions. It optionally supports periodic boundary conditions and cutoffs for long range interactions. Lennard-Jones interactions are calculated with the Lorentz-Bertelot combining rule: it uses the arithmetic mean of the sigmas and the geometric mean of the epsilons for the two interacting particles.

To use this class, create a NonbondedSoftcoreForce object, then call addParticle() once for each particle in the System to define its parameters. The number of particles for which you define nonbonded parameters must be exactly equal to the number of particles in the System, or else an exception will be thrown when you try to create a Context. After a particle has been added, you can modify its force field parameters by calling setParticleParameters().

NonbondedSoftcoreForce also lets you specify \"exceptions\", particular pairs of particles whose interactions should be computed based on different parameters than those defined for the individual particles. This can be used to completely exclude certain interactions from the force calculation, or to alter how they interact with each other.

Many molecular force fields omit Coulomb and Lennard-Jones interactions between particles separated by one or two bonds, while using modified parameters for those separated by three bonds (known as \"1-4 interactions\"). This class provides a convenience method for this case called createExceptionsFromBonds(). You pass to it a list of bonds and the scale factors to use for 1-4 interactions. It identifies all pairs of particles which are separated by 1, 2, or 3 bonds, then automatically creates exceptions for them.";
%feature("docstring") OpenMM::NonbondedSoftcoreForce::NonbondedSoftcoreForce "Create a NonbondedSoftcoreForce.";


%feature("docstring") OpenMM::NonbondedSoftcoreForce::getNumParticles "Get the number of particles for which force field parameters have been defined.";


%feature("docstring") OpenMM::NonbondedSoftcoreForce::getNumExceptions "Get the number of special interactions that should be calculated differently from other interactions.";


%feature("docstring") OpenMM::NonbondedSoftcoreForce::getNonbondedMethod "Get the method used for handling long range nonbonded interactions.";


%feature("docstring") OpenMM::NonbondedSoftcoreForce::setNonbondedMethod "Set the method used for handling long range nonbonded interactions.";


%feature("docstring") OpenMM::NonbondedSoftcoreForce::getCutoffDistance "Get the cutoff distance (in nm) being used for nonbonded interactions. If the NonbondedMethod in use is NoCutoff, this value will have no effect.";


%feature("docstring") OpenMM::NonbondedSoftcoreForce::setCutoffDistance "Set the cutoff distance (in nm) being used for nonbonded interactions. If the NonbondedMethod in use is NoCutoff, this value will have no effect.";


%feature("docstring") OpenMM::NonbondedSoftcoreForce::getReactionFieldDielectric "Get the dielectric constant to use for the solvent in the reaction field approximation.";


%feature("docstring") OpenMM::NonbondedSoftcoreForce::setReactionFieldDielectric "Set the dielectric constant to use for the solvent in the reaction field approximation.";


%feature("docstring") OpenMM::NonbondedSoftcoreForce::addParticle "Add the nonbonded force parameters for a particle. This should be called once for each particle in the System. When it is called for the i'th time, it specifies the parameters for the i'th particle. For calculating the Lennard-Jones interaction between two particles, the arithmetic mean of the sigmas and the geometric mean of the epsilons for the two interacting particles is used (the Lorentz-Bertelot combining rule).
   Parameters:
    - charge the charge of the particle, measured in units of the proton charge
    - sigma the sigma parameter of the Lennard-Jones potential (corresponding to the van der Waals radius of the particle), measured in nm
    - epsilon the epsilon parameter of the Lennard-Jones potential (corresponding to the well depth of the van der Waals interaction), measured in kJ/mol
    - softcoreLJLambda the soft-core LJ parameter (default: 1.0)";


%feature("docstring") OpenMM::NonbondedSoftcoreForce::getParticleParameters "Get the nonbonded force parameters for a particle.
   Parameters:
    - index the index of the particle for which to get parameters
    - charge the charge of the particle, measured in units of the proton charge
    - sigma the sigma parameter of the Lennard-Jones potential (corresponding to the van der Waals radius of the particle), measured in nm
    - epsilon the epsilon parameter of the Lennard-Jones potential (corresponding to the well depth of the van der Waals interaction), measured in kJ/mol
    - softcoreLJLambda the soft-core LJ parameter";


%feature("docstring") OpenMM::NonbondedSoftcoreForce::setParticleParameters "Set the nonbonded force parameters for a particle. When calculating the Lennard-Jones interaction between two particles, it uses the arithmetic mean of the sigmas and the geometric mean of the epsilons for the two interacting particles (the Lorentz-Bertelot combining rule).
   Parameters:
    - index the index of the particle for which to set parameters
    - charge the charge of the particle, measured in units of the proton charge
    - sigma the sigma parameter of the Lennard-Jones potential (corresponding to the van der Waals radius of the particle), measured in nm
    - epsilon the epsilon parameter of the Lennard-Jones potential (corresponding to the well depth of the van der Waals interaction), measured in kJ/mol
    - softcoreLJLambda the soft-core LJ parameter (default: 1.0)";


%feature("docstring") OpenMM::NonbondedSoftcoreForce::addException "Add an interaction to the list of exceptions that should be calculated differently from other interactions. If chargeProd and epsilon are both equal to 0, this will cause the interaction to be completely omitted from force and energy calculations.

In many cases, you can use createExceptionsFromBonds() rather than adding each exception explicitly.
   Parameters:
    - particle1 the index of the first particle involved in the interaction
    - particle2 the index of the second particle involved in the interaction
    - chargeProd the scaled product of the atomic charges (i.e. the strength of the Coulomb interaction), measured in units of the proton charge squared
    - sigma the sigma parameter of the Lennard-Jones potential (corresponding to the van der Waals radius of the particle), measured in nm
    - epsilon the epsilon parameter of the Lennard-Jones potential (corresponding to the well depth of the van der Waals interaction), measured in kJ/mol
    - softcoreLJLambda the soft-core LJ parameter
    - replace determines the behavior if there is already an exception for the same two particles. If true, the existing one is replaced. If false, an exception is thrown.";


%feature("docstring") OpenMM::NonbondedSoftcoreForce::getExceptionParameters "Get the force field parameters for an interaction that should be calculated differently from others.
   Parameters:
    - index the index of the interaction for which to get parameters
    - particle1 the index of the first particle involved in the interaction
    - particle2 the index of the second particle involved in the interaction
    - chargeProd the scaled product of the atomic charges (i.e. the strength of the Coulomb interaction), measured in units of the proton charge squared
    - sigma the sigma parameter of the Lennard-Jones potential (corresponding to the van der Waals radius of the particle), measured in nm
    - epsilon the epsilon parameter of the Lennard-Jones potential (corresponding to the well depth of the van der Waals interaction), measured in kJ/mol
    - softcoreLJLambda the soft-core LJ parameter";


%feature("docstring") OpenMM::NonbondedSoftcoreForce::setExceptionParameters "Set the force field parameters for an interaction that should be calculated differently from others. If chargeProd and epsilon are both equal to 0, this will cause the interaction to be completely omitted from force and energy calculations.
   Parameters:
    - index the index of the interaction for which to get parameters
    - particle1 the index of the first particle involved in the interaction
    - particle2 the index of the second particle involved in the interaction
    - chargeProd the scaled product of the atomic charges (i.e. the strength of the Coulomb interaction), measured in units of the proton charge squared
    - sigma the sigma parameter of the Lennard-Jones potential (corresponding to the van der Waals radius of the particle), measured in nm
    - epsilon the epsilon parameter of the Lennard-Jones potential (corresponding to the well depth of the van der Waals interaction), measured in kJ/mol
    - softcoreLJLambda the soft-core LJ parameter (default: 1.0)";


%feature("docstring") OpenMM::NonbondedSoftcoreForce::createExceptionsFromBonds "Identify exceptions based on the molecular topology. Particles which are separated by one or two bonds are set to not interact at all, while pairs of particles separated by three bonds (known as \"1-4 interactions\") have their Coulomb and Lennard-Jones interactions reduced by a fixed factor.
   Parameters:
    - bonds the set of bonds based on which to construct exceptions. Each element specifies the indices of two particles that are bonded to each other.
    - coulomb14Scale pairs of particles separated by three bonds will have the strength of their Coulomb interaction multiplied by this factor
    - lj14Scale pairs of particles separated by three bonds will have the strength of their Lennard-Jones interaction multiplied by this factor";


%feature("docstring") OpenMMException "This class is used for all exceptions thrown by OpenMM.";






%feature("docstring") VirtualSite "A VirtualSite describes the rules for computing a particle's position based on other particles. This is an abstract class. Subclasses define particular rules. To define a virtual site, create an instance of a VirtualSite subclass and then call setVirtualSite() on the System.";


%feature("docstring") OpenMM::VirtualSite::getNumParticles "Get the number of particles this virtual site depends on.";


%feature("docstring") OpenMM::VirtualSite::getParticle "Get the index of a particle this virtual site depends on.
   Parameters:
    - particle the particle to get (between 0 and getNumParticles())";


%feature("docstring") OutOfPlaneSite "This is a VirtualSite that computes the particle location based on three other particles' locations. If r is the location of particle 1, r is the vector from particle 1 to particle 2, and r is the vector from particle 1 to particle 3, then the virtual site location is given by

r + wr + wr + w(rr)

The three weight factors are user-specified. This allows the virtual site location to be out of the plane of the three particles.";
%feature("docstring") OpenMM::OutOfPlaneSite::OutOfPlaneSite "Create a new OutOfPlaneSite virtual site.
   Parameters:
    - particle1 the index of the first particle
    - particle2 the index of the second particle
    - particle3 the index of the third particle
    - weight12 the weight factor for the vector from particle1 to particle2
    - weight13 the weight factor for the vector from particle1 to particle3
    - weightCross the weight factor for the cross product";


%feature("docstring") OpenMM::OutOfPlaneSite::getWeight12 "Get the weight factor for the vector from particle1 to particle2.";


%feature("docstring") OpenMM::OutOfPlaneSite::getWeight13 "Get the weight factor for the vector from particle1 to particle3.";


%feature("docstring") OpenMM::OutOfPlaneSite::getWeightCross "Get the weight factor for the cross product.";


%feature("docstring") PeriodicTorsionForce "This class implements an interaction between groups of four particles that varies periodically with the torsion angle between them. To use it, create a PeriodicTorsionForce object then call addTorsion() once for each torsion. After a torsion has been added, you can modify its force field parameters by calling setTorsionParameters().";
%feature("docstring") OpenMM::PeriodicTorsionForce::PeriodicTorsionForce "Create a PeriodicTorsionForce.";


%feature("docstring") OpenMM::PeriodicTorsionForce::getNumTorsions "Get the number of periodic torsion terms in the potential function";


%feature("docstring") OpenMM::PeriodicTorsionForce::addTorsion "Add a periodic torsion term to the force field.
   Parameters:
    - particle1 the index of the first particle forming the torsion
    - particle2 the index of the second particle forming the torsion
    - particle3 the index of the third particle forming the torsion
    - particle3 the index of the fourth particle forming the torsion
    - periodicity the periodicity of the torsion
    - phase the phase offset of the torsion, measured in radians
    - k the force constant for the torsion";


%feature("docstring") OpenMM::PeriodicTorsionForce::getTorsionParameters "Get the force field parameters for a periodic torsion term.
   Parameters:
    - index the index of the torsion for which to get parameters
    - particle1 the index of the first particle forming the torsion
    - particle2 the index of the second particle forming the torsion
    - particle3 the index of the third particle forming the torsion
    - particle3 the index of the fourth particle forming the torsion
    - periodicity the periodicity of the torsion
    - phase the phase offset of the torsion, measured in radians
    - k the force constant for the torsion";


%feature("docstring") OpenMM::PeriodicTorsionForce::setTorsionParameters "Set the force field parameters for a periodic torsion term.
   Parameters:
    - index the index of the torsion for which to set parameters
    - particle1 the index of the first particle forming the torsion
    - particle2 the index of the second particle forming the torsion
    - particle3 the index of the third particle forming the torsion
    - particle3 the index of the fourth particle forming the torsion
    - periodicity the periodicity of the torsion
    - phase the phase offset of the torsion, measured in radians
    - k the force constant for the torsion";


%feature("docstring") Platform "A Platform defines an implementation of all the kernels needed to perform some calculation. More precisely, a Platform object acts as a registry for a set of KernelFactory objects which together implement the kernels. The Platform class, in turn, provides a static registry of all available Platform objects.

To get a Platform object, call

<pre>
 Platform& platform Platform::findPlatform(kernelNames);
 </pre>

passing in the names of all kernels that will be required for the calculation you plan to perform. It will return the fastest available Platform which provides implementations of all the specified kernels. You can then call createKernel() to construct particular kernels as needed.";
%feature("docstring") OpenMM::Platform::registerPlatform "Register a new Platform.";


%feature("docstring") OpenMM::Platform::getNumPlatforms "Get the number of Platforms that have been registered.";


%feature("docstring") OpenMM::Platform::getPlatform "Get a registered Platform by index.";


%feature("docstring") OpenMM::Platform::getPlatformByName "Get the registered Platform with a particular name. If no Platform with that name has been registered, this throws an exception.";


%feature("docstring") OpenMM::Platform::findPlatform "Find a Platform which can be used to perform a calculation.
   Parameters:
    - kernelNames the names of all kernels which will be needed for the calculation";


%feature("docstring") OpenMM::Platform::loadPluginLibrary "Load a dynamic library (DLL) which contains an OpenMM plugin. Typically, each Platform is distributed as a separate dynamic library. This method can then be called at runtime to load each available library. Each library should contain an initializer function to register any Platforms and KernelFactories that it contains.

If the file does not exist or cannot be loaded, an exception is thrown.
   Parameters:
    - file the path to the dynamic library file. This is interpreted using the operating system's rules for loading libraries. Typically it may be either an absolute path or relative to a set of standard locations.";


%feature("docstring") OpenMM::Platform::loadPluginsFromDirectory "Load multiple dynamic libraries (DLLs) which contain OpenMM plugins from a single directory. This method loops over every file contained in the specified directory and calls loadPluginLibrary() for each one. If an error occurs while trying to load a particular file, that file is simply ignored.
   Parameters:
    - directory the path to the directory containing libraries to load";


%feature("docstring") OpenMM::Platform::getDefaultPluginsDirectory "Get the default directory from which to load plugins. If the environment variable OPENMM_PLUGIN_DIR is set, this returns its value. Otherwise, it returns a platform specific default location.";


%feature("docstring") OpenMM::Platform::getOpenMMVersion "Get a string containing the version number of the OpenMM library.";




%feature("docstring") OpenMM::Platform::getName "Get the name of this platform. This should be a unique identifier which can be used to recognized it.";


%feature("docstring") OpenMM::Platform::getSpeed "Get an estimate of how fast this Platform class is. This need not be precise. It only is expected to return an order or magnitude estimate of the relative performance of different Platform classes. An unoptimized reference implementation should return 1.0, and all other Platforms should return a larger value that is an estimate of how many times faster they are than the reference implementation.";


%feature("docstring") OpenMM::Platform::supportsDoublePrecision "Get whether this Platform supports double precision arithmetic. If this returns false, the platform is permitted to represent double precision values internally as single precision.";


%feature("docstring") OpenMM::Platform::getPropertyNames "Get the names of all Platform-specific properties this Platform supports.";


%feature("docstring") OpenMM::Platform::getPropertyValue "Get the value of a Platform-specific property for a Context.
   Parameters:
    - context the Context for which to get the property
    - property the name of the property to get";


%feature("docstring") OpenMM::Platform::setPropertyValue "Set the value of a Platform-specific property for a Context.
   Parameters:
    - context the Context for which to set the property
    - property the name of the property to set
    - value the value to set for the property";


%feature("docstring") OpenMM::Platform::getPropertyDefaultValue "Get the default value of a Platform-specific property. This is the value that will be used for newly created Contexts.
   Parameters:
    - property the name of the property to get";


%feature("docstring") OpenMM::Platform::setPropertyDefaultValue "Set the default value of a Platform-specific property. This is the value that will be used for newly created Contexts.
   Parameters:
    - property the name of the property to set
    - value the value to set for the property";


%feature("docstring") OpenMM::Platform::supportsKernels "Determine whether this Platforms provides implementations of a set of kernels.
   Parameters:
    - kernelNames the names of the kernels of interests";


%feature("docstring") RBTorsionForce "This class implements an interaction between groups of four particles that varies with the torsion angle between them according to the Ryckaert-Bellemans potential. To use it, create an RBTorsionForce object then call addTorsion() once for each torsion. After a torsion has been added, you can modify its force field parameters by calling setTorsionParameters().";
%feature("docstring") OpenMM::RBTorsionForce::RBTorsionForce "Create a RBTorsionForce.";


%feature("docstring") OpenMM::RBTorsionForce::getNumTorsions "Get the number of Ryckaert-Bellemans torsion terms in the potential function";


%feature("docstring") OpenMM::RBTorsionForce::addTorsion "Add a Ryckaert-Bellemans torsion term to the force field.
   Parameters:
    - particle1 the index of the first particle forming the torsion
    - particle2 the index of the second particle forming the torsion
    - particle3 the index of the third particle forming the torsion
    - particle3 the index of the fourth particle forming the torsion
    - c0 the coefficient of the constant term, measured in kJ/mol
    - c1 the coefficient of the 1st order term, measured in kJ/mol
    - c2 the coefficient of the 2nd order term, measured in kJ/mol
    - c3 the coefficient of the 3rd order term, measured in kJ/mol
    - c4 the coefficient of the 4th order term, measured in kJ/mol
    - c5 the coefficient of the 5th order term, measured in kJ/mol";


%feature("docstring") OpenMM::RBTorsionForce::getTorsionParameters "Get the force field parameters for a Ryckaert-Bellemans torsion term.
   Parameters:
    - index the index of the torsion for which to get parameters
    - particle1 the index of the first particle forming the torsion
    - particle2 the index of the second particle forming the torsion
    - particle3 the index of the third particle forming the torsion
    - particle3 the index of the fourth particle forming the torsion
    - c0 the coefficient of the constant term, measured in kJ/mol
    - c1 the coefficient of the 1st order term, measured in kJ/mol
    - c2 the coefficient of the 2nd order term, measured in kJ/mol
    - c3 the coefficient of the 3rd order term, measured in kJ/mol
    - c4 the coefficient of the 4th order term, measured in kJ/mol
    - c5 the coefficient of the 5th order term, measured in kJ/mol";


%feature("docstring") OpenMM::RBTorsionForce::setTorsionParameters "Set the force field parameters for a Ryckaert-Bellemans torsion term.
   Parameters:
    - index the index of the torsion for which to set parameters
    - particle1 the index of the first particle forming the torsion
    - particle2 the index of the second particle forming the torsion
    - particle3 the index of the third particle forming the torsion
    - particle3 the index of the fourth particle forming the torsion
    - c0 the coefficient of the constant term, measured in kJ/mol
    - c1 the coefficient of the 1st order term, measured in kJ/mol
    - c2 the coefficient of the 2nd order term, measured in kJ/mol
    - c3 the coefficient of the 3rd order term, measured in kJ/mol
    - c4 the coefficient of the 4th order term, measured in kJ/mol
    - c5 the coefficient of the 5th order term, measured in kJ/mol";


%feature("docstring") RPMDIntegrator "This is an Integrator which simulates a System using ring polymer molecular dynamics (RPMD). It simulates many copies of the System, with successive copies connected by harmonic springs to form a ring. This allows certain quantum mechanical effects to be efficiently simulated.

Because this Integrator simulates many copies of the System at once, it must be used differently from other Integrators. Instead of setting positions and velocities by calling methods of the Context, you should use the corresponding methods of the Integrator to set them for specific copies of the System. Similarly, you should retrieve state information for particular copies by calling getState() on the Integrator. Do not query the Context for state information.";
%feature("docstring") OpenMM::RPMDIntegrator::RPMDIntegrator "Create a RPMDIntegrator.
   Parameters:
    - numCopies the number of copies of the system that should be simulated
    - temperature the temperature of the heat bath (in Kelvin)
    - frictionCoeff the friction coefficient which couples the system to the heat bath (in inverse picoseconds)
    - stepSize the step size with which to integrator the system (in picoseconds)";


%feature("docstring") OpenMM::RPMDIntegrator::getNumCopies "Get the number of copies of the system being simulated.";


%feature("docstring") OpenMM::RPMDIntegrator::getTemperature "Get the temperature of the heat bath (in Kelvin).";


%feature("docstring") OpenMM::RPMDIntegrator::setTemperature "Set the temperature of the heat bath (in Kelvin).
   Parameters:
    - temp the temperature of the heat bath, measured in Kelvin";


%feature("docstring") OpenMM::RPMDIntegrator::getFriction "Get the friction coefficient which determines how strongly the system is coupled to the heat bath (in inverse ps).";


%feature("docstring") OpenMM::RPMDIntegrator::setFriction "Set the friction coefficient which determines how strongly the system is coupled to the heat bath (in inverse ps).
   Parameters:
    - coeff the friction coefficient, measured in 1/ps";


%feature("docstring") OpenMM::RPMDIntegrator::getRandomNumberSeed "Get the random number seed. See setRandomNumberSeed() for details.";


%feature("docstring") OpenMM::RPMDIntegrator::setRandomNumberSeed "Set the random number seed. The precise meaning of this parameter is undefined, and is left up to each Platform to interpret in an appropriate way. It is guaranteed that if two simulations are run with different random number seeds, the sequence of random forces will be different. On the other hand, no guarantees are made about the behavior of simulations that use the same seed. In particular, Platforms are permitted to use non-deterministic algorithms which produce different results on successive runs, even if those runs were initialized identically.";


%feature("docstring") OpenMM::RPMDIntegrator::setPositions "Set the positions of all particles in one copy of the system.
   Parameters:
    - copy the index of the copy for which to set positions
    - positions the positions of all particles in the system";


%feature("docstring") OpenMM::RPMDIntegrator::setVelocities "Get the velocities of all particles in one copy of the system.
   Parameters:
    - copy the index of the copy for which to set velocities
    - velocities the velocities of all particles in the system";


%feature("docstring") OpenMM::RPMDIntegrator::step "Advance a simulation through time by taking a series of time steps.
   Parameters:
    - steps the number of time steps to take";


%feature("docstring") SerializationNode "A SerializationNode stores information about an object during serialization or deserialization.

When an object is serialized, its SerializationProxy is first called to copy information about the object into a SerializationNode. That information can then be written to the output stream in the desired format.

When an object is deserialized, the input stream is read and the information is stored into a SerializationNode. The appropriate SerializationProxy is then called to reconstruct the object.

SerializationNodes are arranged in a tree. There will often be a one-to-one correspondence between objects and SerializationNodes, but that need not always be true. A proxy is free to create whatever child nodes it wants and store information in them using whatever organization is most convenient.

Each SerializationNode can store an arbitrary set of \"properties\", represented as key-value pairs. The key is always a string, while the value may be a string, an int, or a double. If a value is specified using one data type and then accessed as a different data type, the node will attempt to convert the value in an appropriate way. For example, it is always reasonable to call getStringProperty() to access a property as a string. Similarly, you can use setStringProperty() to specify a property and then access it using getIntProperty(). This will produce the expected result if the original value was, in fact, the string representation of an int, but if the original string was non-numeric, the result is undefined.";
%feature("docstring") OpenMM::SerializationNode::getName "Get the name of this SerializationNode.";


%feature("docstring") OpenMM::SerializationNode::setName "Set the name of this SerializationNode.
   Parameters:
    - name the new name of the SerializationNode";


%feature("docstring") OpenMM::SerializationNode::getChildren "Get a reference to this node's child nodes.";


%feature("docstring") OpenMM::SerializationNode::getChildren "Get a reference to this node's child nodes.";


%feature("docstring") OpenMM::SerializationNode::getChildNode "Get a reference to the child node with a particular name. If there is no child with the specified name, this throws an exception.
   Parameters:
    - the name of the child node to get";


%feature("docstring") OpenMM::SerializationNode::getChildNode "Get a reference to the child node with a particular name. If there is no child with the specified name, this throws an exception.
   Parameters:
    - the name of the child node to get";


%feature("docstring") OpenMM::SerializationNode::getProperties "Get a map containing all of this node's properties.";


%feature("docstring") OpenMM::SerializationNode::hasProperty "Determine whether this node has a property with a particular node.
   Parameters:
    - the name of the property to check for";


%feature("docstring") OpenMM::SerializationNode::getStringProperty "Get the property with a particular name, specified as a string. If there is no property with the specified name, an exception is thrown.
   Parameters:
    - name the name of the property to get";


%feature("docstring") OpenMM::SerializationNode::getStringProperty "Get the property with a particular name, specified as a string. If there is no property with the specified name, a default value is returned instead.
   Parameters:
    - name the name of the property to get
    - defaultValue the value to return if the specified property does not exist";


%feature("docstring") OpenMM::SerializationNode::setStringProperty "Set the value of a property, specified as a string.
   Parameters:
    - name the name of the property to set
    - value the value to set for the property";


%feature("docstring") OpenMM::SerializationNode::getIntProperty "Get the property with a particular name, specified as an int. If there is no property with the specified name, an exception is thrown.
   Parameters:
    - name the name of the property to get";


%feature("docstring") OpenMM::SerializationNode::getIntProperty "Get the property with a particular name, specified as an int. If there is no property with the specified name, a default value is returned instead.
   Parameters:
    - name the name of the property to get
    - defaultValue the value to return if the specified property does not exist";


%feature("docstring") OpenMM::SerializationNode::setIntProperty "Set the value of a property, specified as an int.
   Parameters:
    - name the name of the property to set
    - value the value to set for the property";


%feature("docstring") OpenMM::SerializationNode::getDoubleProperty "Get the property with a particular name, specified as a double. If there is no property with the specified name, an exception is thrown.
   Parameters:
    - name the name of the property to get";


%feature("docstring") OpenMM::SerializationNode::getDoubleProperty "Get the property with a particular name, specified as a double. If there is no property with the specified name, a default value is returned instead.
   Parameters:
    - name the name of the property to get
    - defaultValue the value to return if the specified property does not exist";


%feature("docstring") OpenMM::SerializationNode::setDoubleProperty "Set the value of a property, specified as a double.
   Parameters:
    - name the name of the property to set
    - value the value to set for the property";


%feature("docstring") OpenMM::SerializationNode::createChildNode "Create a new child node
   Parameters:
    - name the name of the new node to create";


%feature("docstring") OpenMM::SerializationNode::createChildNode "Create a new child node by serializing an object. A SerializationProxy is automatically selected based on the object's type, then invoked to populate the newly created node.

Note that, while this method is templatized based on the type of object being serialized, the typeid() operator is used to select the proxy. This means the template argument may be a base class, and the correct proxies will still be selected for objects of different subclasses.
   Parameters:
    - name the name of the new node to create
    - object a pointer to the object to serialize";


%feature("docstring") OpenMM::SerializationNode::decodeObject "Reconstruct an object based on the information stored in this node. A SerializationProxy is automatically selected based on the information stored in the node, then it is invoked to create the object.

The template parameter may be either the actual type of the object, or any base class to which it may be cast.";


%feature("docstring") SerializationProxy "A SerializationProxy is an object that knows how to serialize and deserialize objects of a particular type. This is an abstract class. Subclasses implement the logic for serializing particular types of logic.

A global registry maintains the list of what SerializationProxy to use for each type of object. Call registerProxy() to register the proxy for a particular type. This is typically done at application startup or by a dynamic library's initialization code.";
%feature("docstring") OpenMM::SerializationProxy::registerProxy "Register a SerializationProxy to be used for objects of a particular type.
   Parameters:
    - type the type_info for the object type
    - proxy the proxy to use for objects of the specified type";


%feature("docstring") OpenMM::SerializationProxy::getProxy "Get the SerializationProxy to use for objects of a particular type, specified by name.
   Parameters:
    - typeName the name of the object type to get a proxy for";


%feature("docstring") OpenMM::SerializationProxy::getProxy "Get the SerializationProxy to use for objects of a particular type, specified by type_info.
   Parameters:
    - type the type_info of the object type to get a proxy for";


%feature("docstring") OpenMM::SerializationProxy::SerializationProxy "Create a new SerializationProxy.
   Parameters:
    - typeName the name of the object type this proxy knows how to serialize. This name is stored in the output stream during serialization, and is used to select a proxy during deserialization. This typically is the class name, although that is not a requirement.";


%feature("docstring") OpenMM::SerializationProxy::getTypeName "Get the name of the object type this proxy manipulates, as passed to the constructor.";


%feature("docstring") OpenMM::SerializationProxy::serialize "Subclasses implement this method to record information about an object being serialized.
   Parameters:
    - object a pointer to the object being serialized
    - node all data to be serialized should be stored into this node, either directly as properties or indirectly by adding child nodes to it";


%feature("docstring") OpenMM::SerializationProxy::deserialize "Reconstruct an object from its serialized data.
   Parameters:
    - node a SerializationNode containing the object's description";


%feature("docstring") System "This class represents a molecular system. The definition of a System involves four elements:




The particles and constraints are defined directly by the System object, while forces are defined by objects that extend the Force class. After creating a System, call addParticle() once for each particle, addConstraint() for each constraint, and addForce() for each Force.

In addition, particles may be designated as \"virtual sites\". These are particles whose positions are computed automatically based on the positions of other particles. To define a virtual site, call setVirtualSite(), passing in a VirtualSite object that defines the rules for computing its position.";
%feature("docstring") OpenMM::System::System "Create a new System.";




%feature("docstring") OpenMM::System::getNumParticles "Get the number of particles in this System.";


%feature("docstring") OpenMM::System::addParticle "Add a particle to the System. If the mass is 0, Integrators will ignore the particle and not modify its position or velocity. This is most often used for virtual sites, but can also be used as a way to prevent a particle from moving.
   Parameters:
    - mass the mass of the particle (in atomic mass units)";


%feature("docstring") OpenMM::System::getParticleMass "Get the mass (in atomic mass units) of a particle. If the mass is 0, Integrators will ignore the particle and not modify its position or velocity. This is most often used for virtual sites, but can also be used as a way to prevent a particle from moving.
   Parameters:
    - index the index of the particle for which to get the mass";


%feature("docstring") OpenMM::System::setParticleMass "Set the mass (in atomic mass units) of a particle. If the mass is 0, Integrators will ignore the particle and not modify its position or velocity. This is most often used for virtual sites, but can also be used as a way to prevent a particle from moving.
   Parameters:
    - index the index of the particle for which to set the mass
    - mass the mass of the particle";


%feature("docstring") OpenMM::System::setVirtualSite "Set a particle to be a virtual site. The VirtualSite object should have been created on the heap with the \"new\" operator. The System takes over ownership of it, and deletes it when the System itself is deleted.
   Parameters:
    - index the index of the particle that should be treated as a virtual site
    - virtualSite a pointer to the VirtualSite object describing it";


%feature("docstring") OpenMM::System::isVirtualSite "Get whether a particle is a VirtualSite.
   Parameters:
    - index the index of the particle to check";


%feature("docstring") OpenMM::System::getVirtualSite "Get VirtualSite object for a particle. If the particle is not a virtual site, this throws an exception.
   Parameters:
    - index the index of the particle to get";


%feature("docstring") OpenMM::System::getNumConstraints "Get the number of distance constraints in this System.";


%feature("docstring") OpenMM::System::addConstraint "Add a constraint to the System. Particles whose mass is 0 cannot participate in constraints.
   Parameters:
    - particle1 the index of the first particle involved in the constraint
    - particle2 the index of the second particle involved in the constraint
    - distance the required distance between the two particles, measured in nm";


%feature("docstring") OpenMM::System::getConstraintParameters "Get the parameters defining a distance constraint.
   Parameters:
    - index the index of the constraint for which to get parameters
    - particle1 the index of the first particle involved in the constraint
    - particle2 the index of the second particle involved in the constraint
    - distance the required distance between the two particles, measured in nm";


%feature("docstring") OpenMM::System::setConstraintParameters "Set the parameters defining a distance constraint. Particles whose mass is 0 cannot participate in constraints.
   Parameters:
    - index the index of the constraint for which to set parameters
    - particle1 the index of the first particle involved in the constraint
    - particle2 the index of the second particle involved in the constraint
    - distance the required distance between the two particles, measured in nm";


%feature("docstring") OpenMM::System::addForce "Add a Force to the System. The Force should have been created on the heap with the \"new\" operator. The System takes over ownership of it, and deletes the Force when the System itself is deleted.
   Parameters:
    - force a pointer to the Force object to be added";


%feature("docstring") OpenMM::System::getNumForces "Get the number of Force objects that have been added to the System.";


%feature("docstring") OpenMM::System::getForce "Get a const reference to one of the Forces in this System.
   Parameters:
    - index the index of the Force to get";


%feature("docstring") OpenMM::System::getForce "Get a writable reference to one of the Forces in this System.
   Parameters:
    - index the index of the Force to get";


%feature("docstring") OpenMM::System::getDefaultPeriodicBoxVectors "Get the default values of the vectors defining the axes of the periodic box (measured in nm). Any newly created Context will have its box vectors set to these. They will affect any Force added to the System that uses periodic boundary conditions.

Currently, only rectangular boxes are supported. This means that a, b, and c must be aligned with the x, y, and z axes respectively. Future releases may support arbitrary triclinic boxes.
   Parameters:
    - a on exit, this contains the vector defining the first edge of the periodic box
    - b on exit, this contains the vector defining the second edge of the periodic box
    - c on exit, this contains the vector defining the third edge of the periodic box";


%feature("docstring") OpenMM::System::setDefaultPeriodicBoxVectors "Set the default values of the vectors defining the axes of the periodic box (measured in nm). Any newly created Context will have its box vectors set to these. They will affect any Force added to the System that uses periodic boundary conditions.

Currently, only rectangular boxes are supported. This means that a, b, and c must be aligned with the x, y, and z axes respectively. Future releases may support arbitrary triclinic boxes.
   Parameters:
    - a the vector defining the first edge of the periodic box
    - b the vector defining the second edge of the periodic box
    - c the vector defining the third edge of the periodic box";


%feature("docstring") ThreeParticleAverageSite "This is a VirtualSite that computes the particle location as a weighted average of three other particle's locations. Assuming the weights add up to 1, this means the virtual site is in the plane of the three particles.";
%feature("docstring") OpenMM::ThreeParticleAverageSite::ThreeParticleAverageSite "Create a new ThreeParticleAverageSite virtual site. Normally the weights should add up to 1, although this is not strictly required.
   Parameters:
    - particle1 the index of the first particle
    - particle2 the index of the second particle
    - particle3 the index of the third particle
    - weight1 the weight factor (between 0 and 1) for the first particle
    - weight2 the weight factor (between 0 and 1) for the second particle
    - weight2 the weight factor (between 0 and 1) for the third particle";


%feature("docstring") OpenMM::ThreeParticleAverageSite::getWeight "Get the weight factor used for a particle this virtual site depends on.
   Parameters:
    - particle the particle to get (between 0 and getNumParticles())";


%feature("docstring") TwoParticleAverageSite "This is a VirtualSite that computes the particle location as a weighted average of two other particle's locations. Assuming the weights add up to 1, this means the virtual site is on the line passing through the two particles.";
%feature("docstring") OpenMM::TwoParticleAverageSite::TwoParticleAverageSite "Create a new TwoParticleAverageSite virtual site. Normally weight1 and weight2 should add up to 1, although this is not strictly required.
   Parameters:
    - particle1 the index of the first particle
    - particle2 the index of the second particle
    - weight1 the weight factor (between 0 and 1) for the first particle
    - weight2 the weight factor (between 0 and 1) for the second particle";


%feature("docstring") OpenMM::TwoParticleAverageSite::getWeight "Get the weight factor used for a particle this virtual site depends on.
   Parameters:
    - particle the particle to get (between 0 and getNumParticles())";


%feature("docstring") VariableLangevinIntegrator "This is an error contolled, variable time step Integrator that simulates a System using Langevin dynamics. It compares the result of the Langevin integrator to that of an explicit Euler integrator, takes the difference between the two as a measure of the integration error in each time step, and continuously adjusts the step size to keep the error below a specified tolerance. This both improves the stability of the integrator and allows it to take larger steps on average, while still maintaining comparable accuracy to a fixed step size integrator.

It is best not to think of the error tolerance as having any absolute meaning. It is just an adjustable parameter that affects the step size and integration accuracy. You should try different values to find the largest one that produces a trajectory sufficiently accurate for your purposes. 0.001 is often a good starting point.";
%feature("docstring") OpenMM::VariableLangevinIntegrator::VariableLangevinIntegrator "Create a VariableLangevinIntegrator.
   Parameters:
    - temperature the temperature of the heat bath (in Kelvin)
    - frictionCoeff the friction coefficient which couples the system to the heat bath (in inverse picoseconds)
    - errorTol the error tolerance";


%feature("docstring") OpenMM::VariableLangevinIntegrator::getTemperature "Get the temperature of the heat bath (in Kelvin).";


%feature("docstring") OpenMM::VariableLangevinIntegrator::setTemperature "Set the temperature of the heat bath (in Kelvin).
   Parameters:
    - temp the temperature of the heat bath, measured in Kelvin";


%feature("docstring") OpenMM::VariableLangevinIntegrator::getFriction "Get the friction coefficient which determines how strongly the system is coupled to the heat bath (in inverse ps).";


%feature("docstring") OpenMM::VariableLangevinIntegrator::setFriction "Set the friction coefficient which determines how strongly the system is coupled to the heat bath (in inverse ps).
   Parameters:
    - coeff the friction coefficient, measured in 1/ps";


%feature("docstring") OpenMM::VariableLangevinIntegrator::getErrorTolerance "Get the error tolerance.";


%feature("docstring") OpenMM::VariableLangevinIntegrator::setErrorTolerance "Set the error tolerance.";


%feature("docstring") OpenMM::VariableLangevinIntegrator::getRandomNumberSeed "Get the random number seed. See setRandomNumberSeed() for details.";


%feature("docstring") OpenMM::VariableLangevinIntegrator::setRandomNumberSeed "Set the random number seed. The precise meaning of this parameter is undefined, and is left up to each Platform to interpret in an appropriate way. It is guaranteed that if two simulations are run with different random number seeds, the sequence of random forces will be different. On the other hand, no guarantees are made about the behavior of simulations that use the same seed. In particular, Platforms are permitted to use non-deterministic algorithms which produce different results on successive runs, even if those runs were initialized identically.";


%feature("docstring") OpenMM::VariableLangevinIntegrator::step "Advance a simulation through time by taking a series of time steps.
   Parameters:
    - steps the number of time steps to take";


%feature("docstring") OpenMM::VariableLangevinIntegrator::stepTo "Advance a simulation through time by taking a series of steps until a specified time is reached. When this method returns, the simulation time will exactly equal the time which was specified. If you call this method and specify a time that is earlier than the current time, it will return without doing anything.
   Parameters:
    - time the time to which the simulation should be advanced";


%feature("docstring") VariableVerletIntegrator "This is an error contolled, variable time step Integrator that simulates a System using the leap-frog Verlet algorithm. It compares the result of the Verlet integrator to that of an explicit Euler integrator, takes the difference between the two as a measure of the integration error in each time step, and continuously adjusts the step size to keep the error below a specified tolerance. This both improves the stability of the integrator and allows it to take larger steps on average, while still maintaining comparable accuracy to a fixed step size integrator.

It is best not to think of the error tolerance as having any absolute meaning. It is just an adjustable parameter that affects the step size and integration accuracy. You should try different values to find the largest one that produces a trajectory sufficiently accurate for your purposes. 0.001 is often a good starting point.

Unlike a fixed step size Verlet integrator, variable step size Verlet is not symplectic. This means that at a given accuracy level, energy is not as precisely conserved over long time periods. This makes it most appropriate for constant temperate simulations. In constant energy simulations where precise energy conservation over long time periods is important, a fixed step size Verlet integrator may be more appropriate.";
%feature("docstring") OpenMM::VariableVerletIntegrator::VariableVerletIntegrator "Create a VariableVerletIntegrator.
   Parameters:
    - errorTol the error tolerance";


%feature("docstring") OpenMM::VariableVerletIntegrator::getErrorTolerance "Get the error tolerance.";


%feature("docstring") OpenMM::VariableVerletIntegrator::setErrorTolerance "Set the error tolerance.";


%feature("docstring") OpenMM::VariableVerletIntegrator::step "Advance a simulation through time by taking a series of time steps.
   Parameters:
    - steps the number of time steps to take";


%feature("docstring") OpenMM::VariableVerletIntegrator::stepTo "Advance a simulation through time by taking a series of steps until a specified time is reached. When this method returns, the simulation time will exactly equal the time which was specified. If you call this method and specify a time that is earlier than the current time, it will return without doing anything.
   Parameters:
    - time the time to which the simulation should be advanced";


%feature("docstring") VerletIntegrator "This is an Integrator which simulates a System using the leap-frog Verlet algorithm.";
%feature("docstring") OpenMM::VerletIntegrator::VerletIntegrator "Create a VerletIntegrator.
   Parameters:
    - stepSize the step size with which to integrator the system (in picoseconds)";


%feature("docstring") OpenMM::VerletIntegrator::step "Advance a simulation through time by taking a series of time steps.
   Parameters:
    - steps the number of time steps to take";


%feature("docstring") XmlSerializer "XmlSerializer is used for serializing objects as XML, and for reconstructing them again.";
%feature("docstring") OpenMM::XmlSerializer::serialize "Serialize an object as XML.
   Parameters:
    - object the object to serialize
    - rootName the name to use for the root node of the XML document
    - stream an output stream to write the XML to";


%feature("docstring") OpenMM::XmlSerializer::deserialize "Reconstruct an object that has been serialized as XML.
   Parameters:
    - stream an input stream to read the XML from";


