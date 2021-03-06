#ifndef OPENMM_STATE_H_
#define OPENMM_STATE_H_

/* -------------------------------------------------------------------------- *
 *                                   OpenMM                                   *
 * -------------------------------------------------------------------------- *
 * This is part of the OpenMM molecular simulation toolkit originating from   *
 * Simbios, the NIH National Center for Physics-Based Simulation of           *
 * Biological Structures at Stanford, funded under the NIH Roadmap for        *
 * Medical Research, grant U54 GM072970. See https://simtk.org.               *
 *                                                                            *
 * Portions copyright (c) 2008 Stanford University and the Authors.           *
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

#include "Vec3.h"
#include <map>
#include <vector>
#include "internal/windowsExport.h"

namespace OpenMM {

/**
 * A State object records a snapshot of the current state of a simulation at a point in time.
 * You create it by calling getState() on a Context.
 * 
 * When a State is created, you specify what information should be stored in it.  This saves
 * time and memory by only copying in the information that you actually want.  This is especially
 * important for forces and energies, since they may need to be calculated.  If you query a
 * State object for a piece of information which is not available (because it was not requested
 * when the State was created), it will throw an exception.
 */

class OPENMM_EXPORT State {
public:
    /**
     * This is an enumeration of the types of data which may be stored in a State.  When you create
     * a State, use these values to specify which data types it should contain.
     */
    enum DataType {Positions=1, Velocities=2, Forces=4, Energy=8, Parameters=16};
    /**
     * Construct an empty State containing no data.  This exists so State objects can be used in STL containers.
     */
    State();
    /**
     * Get the time for which this State was created.
     */
    double getTime() const;
    /**
     * Get the position of each particle.  If this State does not contain positions, this will throw an exception.
     */
    const std::vector<Vec3>& getPositions() const;
    /**
     * Get the velocity of each particle.  If this State does not contain velocities, this will throw an exception.
     */
    const std::vector<Vec3>& getVelocities() const;
    /**
     * Get the force acting on each particle.  If this State does not contain forces, this will throw an exception.
     */
    const std::vector<Vec3>& getForces() const;
    /**
     * Get the total kinetic energy of the system.  If this State does not contain energies, this will throw an exception.
     */
    double getKineticEnergy() const;
    /**
     * Get the total potential energy of the system.  If this State does not contain energies, this will throw an exception.
     */
    double getPotentialEnergy() const;
    /**
     * Get the vectors defining the axes of the periodic box (measured in nm).
     *
     * @param a      on exit, this contains the vector defining the first edge of the periodic box
     * @param b      on exit, this contains the vector defining the second edge of the periodic box
     * @param c      on exit, this contains the vector defining the third edge of the periodic box
     */
    void getPeriodicBoxVectors(Vec3& a, Vec3& b, Vec3& c) const;
    /**
     * Get a map containing the values of all parameters.  If this State does not contain parameters, this will throw an exception.
     */
    const std::map<std::string, double>& getParameters() const;
private:
    friend class Context;
    State(double time, int numParticles, int types);
    std::vector<Vec3>& updPositions();
    std::vector<Vec3>& updVelocities();
    std::vector<Vec3>& updForces();
    std::map<std::string, double>& updParameters();
    void setEnergy(double ke, double pe);
    void setPeriodicBoxVectors(const Vec3& a, const Vec3& b, const Vec3& c);
    int types;
    double time, ke, pe;
    std::vector<Vec3> positions;
    std::vector<Vec3> velocities;
    std::vector<Vec3> forces;
    Vec3 periodicBoxVectors[3];
    std::map<std::string, double> parameters;
};

} // namespace OpenMM

#endif /*OPENMM_STATE_H_*/
