#ifndef OPENMM_GBVI_SOFTCORE_FORCE_FIELD_H_
#define OPENMM_GBVI_SOFTCORE_FORCE_FIELD_H_

/* -------------------------------------------------------------------------- *
 *                                   OpenMM                                   *
 * -------------------------------------------------------------------------- *
 * This is part of the OpenMM molecular simulation toolkit originating from   *
 * Simbios, the NIH National Center for Physics-Based Simulation of           *
 * Biological Structures at Stanford, funded under the NIH Roadmap for        *
 * Medical Research, grant U54 GM072970. See https://simtk.org.               *
 *                                                                            *
 * Portions copyright (c) 2008-2009 Stanford University and the Authors.      *
 * Authors: Peter Eastman                                                     *
 * Contributors:                                                              *
 *                                                                            *
 * Permission is hereby granted, free of charge, to any person obtaining a    *
 * copy of this software and associated documentation files (the "Software"), *
 * to deal in the Software without restriction, including without limitation  *
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,   *
 * and/or sell copies of the Software, and to permit persons to whom the      *
 * Software is furnished to do so, subject to the following conditions:       *
 *                                                                            *
 * The above copyright notice and this permission notice shall be included in *
 * all copies or substantial portions of the Software.                        *
 *                                                                            *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR *
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,   *
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL    *
 * THE AUTHORS, CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,    *
 * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR      *
 * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE  *
 * USE OR OTHER DEALINGS IN THE SOFTWARE.                                     *
 * -------------------------------------------------------------------------- */

#include "openmm/Force.h"
#include <vector>
#include "openmm/internal/windowsExport.h"

using std::pair;

namespace OpenMM {

/**
 * This class implements an implicit solvation force using the GB/VI model.
 * <p>
 * To use this class, create a GBVISoftcoreForce object, then call addParticle() once for each particle in the
 * System to define its parameters.  The number of particles for which you define GB/VI parameters must
 * be exactly equal to the number of particles in the System, or else an exception will be thrown when you
 * try to create an Context.  After a particle has been added, you can modify its force field parameters
 * by calling setParticleParameters().
 * <p>
 * If the System also contains a NonbondedForce, this force will use the cutoffs
 * and periodic boundary conditions specified in it.
 */

class OPENMM_EXPORT GBVISoftcoreForce : public Force {
public:
    /** 
     * This is an enumeration of the different methods that may be used for handling long range nonbonded forces.
     */
    enum NonbondedSoftcoreMethod {
        /**
         * No cutoff is applied to nonbonded interactions.  The full set of N^2 interactions is computed exactly.
         * This necessarily means that periodic boundary conditions cannot be used.  This is the default.
         */
        NoCutoff = 0,
        /**
         * Interactions beyond the cutoff distance are ignored.
         */
        CutoffNonPeriodic = 1,
        /**
         * Periodic boundary conditions are used, so that each particle interacts only with the nearest periodic copy of
         * each other particle.  Interactions beyond the cutoff distance are ignored.
         */
        CutoffPeriodic = 2,
    };  
    /** 
     * This is an enumeration of the different methods that may be used for scaling of the Born radii.
     */
    enum BornRadiusScalingSoftcoreMethod {
        /**
         * No scaling method is applied.
         */
        NoScaling          = 0,
        /**
         * Use quintic spline scaling function
         */
        QuinticSpline       = 2 
    };  
    /*
     * Create a GBVISoftcoreForce.
     */
    GBVISoftcoreForce();
    /**
     * Get the number of particles in the system.
     */
    int getNumParticles() const {
        return particles.size();
    }
    /**
     * Add the GB/VI parameters for a particle.  This should be called once for each particle
     * in the System.  When it is called for the i'th time, it specifies the parameters for the i'th particle.
     *
     * @param charge                the charge of the particle, measured in units of the proton charge
     * @param radius                the GB/VI radius of the particle, measured in nm
     * @param gamma                 the gamma parameter
     * @param bornRadiusScaleFactor the Born radius scale factor (used for free energy calculations)
     */
    void addParticle(double charge, double radius, double gamma, double bornRadiusScaleFactor = 1.0 );
    /**
     * Get the force field parameters for a particle.
     * 
     * @param index          the index of the particle for which to get parameters
     * @param charge         the charge of the particle, measured in units of the proton charge
     * @param radius         the GBSA radius of the particle, measured in nm
     * @param gamma          the gamma parameter
     */
    void getParticleParameters(int index, double& charge, double& radius, double& gamma) const;
    /**
     * Get the force field parameters for a particle.
     * 
     * @param index                 the index of the particle for which to get parameters
     * @param charge                the charge of the particle, measured in units of the proton charge
     * @param radius                the GBSA radius of the particle, measured in nm
     * @param gamma                 the gamma parameter
     * @param bornRadiusScaleFactor the Born radius scale factor (used for free energy calculations)
     */
    void getParticleParameters(int index, double& charge, double& radius, double& gamma, double& bornRadiusScaleFactor) const;
    /**
     * Set the force field parameters for a particle.
     * 
     * @param index                 the index of the particle for which to set parameters
     * @param charge                the charge of the particle, measured in units of the proton charge
     * @param radius                the GB/VI radius of the particle, measured in nm
     * @param gamma                 the gamma parameter
     * @param bornRadiusScaleFactor the Born radius scale factor (used for free energy calculations)
     */
    void setParticleParameters(int index, double charge, double radius, double gamma, double bornRadiusScaleFactor = 1.0 );
    /**
     * Add a bond 
     *
     * @param particle1 the index of the first particle 
     * @param particle2 the index of the second particle
     * @param distance  the distance between the two particles, measured in nm
     * @return the index of the bond that was added
     */
    int addBond(int particle1, int particle2, double distance);

    /** 
     * Get the parameters defining a bond
     * 
     * @param index     the index of the bond for which to get parameters
     * @param particle1 the index of the first particle involved in the bond
     * @param particle2 the index of the second particle involved in the bond
     * @param distance  the distance between the two particles, measured in nm
     */
    void getBondParameters(int index, int& particle1, int& particle2, double& distance) const;
    /**
     * Set 1-2 bonds
     * 
     * @param index          index of the bond for which to set parameters
     * @param particle1      index of first atom in bond
     * @param particle2      index of second atom in bond
     * @param bondLength     bond length
     */
    void setBondParameters( int index, int particle1, int particle2, double bondLength);
    /** 
     * Get number of bonds
     * 
     * @return number of bonds
     */
    int getNumBonds( void ) const;
    /**
     * Get the dielectric constant for the solvent.
     */
    double getSolventDielectric() const {
        return solventDielectric;
    }
    /**
     * Set the dielectric constant for the solvent.
     */
    void setSolventDielectric(double dielectric) {
        solventDielectric = dielectric;
    }
    /**
     * Get the dielectric constant for the solute.
     */
    double getSoluteDielectric() const {
        return soluteDielectric;
    }
    /**
     * Set the dielectric constant for the solute.
     */
    void setSoluteDielectric(double dielectric) {
        soluteDielectric = dielectric;
    }
    /** 
     * Get the method used for handling long range nonbonded interactions.
     */
    NonbondedSoftcoreMethod getNonbondedMethod() const;
    /** 
     * Set the method used for handling long range nonbonded interactions.
     */
    void setNonbondedMethod(NonbondedSoftcoreMethod method);
    /** 
     * Get the cutoff distance (in nm) being used for nonbonded interactions.  If the NonbondedMethod in use
     * is NoCutoff, this value will have no effect.
     */
    double getCutoffDistance() const;
    /** 
     * Set the cutoff distance (in nm) being used for nonbonded interactions.  If the NonbondedMethod in use
     * is NoCutoff, this value will have no effect.
     */
    void setCutoffDistance(double distance);
    /** 
     * Get the method used for scaling Born radii.
     */
    BornRadiusScalingSoftcoreMethod getBornRadiusScalingMethod() const;
    /** 
     * Set the method used for scaling Born radii.
     */
    void setBornRadiusScalingMethod(BornRadiusScalingSoftcoreMethod method);
    /** 
     * Get the lower limit factor used in the quintic spline scaling method (typically 0.5-0.8)
     */
    double getQuinticLowerLimitFactor( void ) const;
    /** 
     * Set the lower limit factor used in the quintic spline scaling method (typically 0.5-0.8)
     */
    void setQuinticLowerLimitFactor(double quinticLowerLimitFactor );
    /** 
     * Get the upper limit  used in the quintic spline scaling method (typically 0.5-0.8)
     */
    double getQuinticUpperBornRadiusLimit( void ) const;
    /** 
     * Set the upper limit used in the quintic spline scaling method (typically 0.008)
     */
    void setQuinticUpperBornRadiusLimit(double quinticUpperBornRadiusLimit);
protected:
    ForceImpl* createImpl();
private:
    class ParticleInfo;

    NonbondedSoftcoreMethod nonbondedMethod;
    double cutoffDistance, solventDielectric, soluteDielectric;

    BornRadiusScalingSoftcoreMethod scalingMethod;
    double alpha, beta, gamma;
    double quinticLowerLimitFactor, quinticUpperBornRadiusLimit;

    class BondInfo;

// Retarded visual studio compiler complains about being unable to 
// export private stl class members.
// This stanza explains that it should temporarily shut up.
#if defined(_MSC_VER)
#pragma warning(push)
#pragma warning(disable:4251)
#endif

    std::vector<ParticleInfo> particles;
    std::vector<BondInfo> bonds;

#if defined(_MSC_VER)
#pragma warning(pop)
#endif

};

class GBVISoftcoreForce::ParticleInfo {
public:
    double charge, radius, gamma, bornRadiusScaleFactor;
    ParticleInfo() {
        charge = radius = gamma = 0.0;
        bornRadiusScaleFactor = 1.0;
    }
    ParticleInfo(double charge, double radius, double gamma, double bornRadiusScaleFactor) :
        charge(charge), radius(radius), gamma(gamma), bornRadiusScaleFactor(bornRadiusScaleFactor) {
    }
};

class GBVISoftcoreForce::BondInfo {
public:
    int particle1, particle2;
    double bondLength;
    BondInfo() {
        bondLength     = 0.0;
        particle1      = -1;
        particle2      = -1;
    }
    BondInfo(int atomIndex1, int atomIndex2, double bondLength) :
             particle1(atomIndex1), particle2(atomIndex2), bondLength(bondLength) {
    }
};

} // namespace OpenMM

#endif /*OPENMM_GBVI_SOFTCORE_FORCEFIELD_H_*/
