
#ifndef OPENMM_CWRAPPER_H_
#define OPENMM_CWRAPPER_H_

#ifndef OPENMM_EXPORT
#define OPENMM_EXPORT
#endif

/* Global Constants */
 
static const double OpenMM_KJPerKcal = 4.184;
static const double OpenMM_RadiansPerDegree = 0.017453292519943295;
static const double OpenMM_KcalPerKJ = 0.2390057361376673;
static const double OpenMM_PsPerFs = 0.001;
static const double OpenMM_AngstromsPerNm = 10;
static const double OpenMM_FsPerPs = 1000;
static const double OpenMM_SigmaPerVdwRadius = 1.7817974362806785;
static const double OpenMM_NmPerAngstrom = 0.1;
static const double OpenMM_VdwRadiusPerSigma = 0.5612310241546865;
static const double OpenMM_DegreesPerRadian = 57.29577951308232;

/* Type Declarations */
 
typedef struct OpenMM_HarmonicBondForce_struct OpenMM_HarmonicBondForce;
typedef struct OpenMM_BrownianIntegrator_struct OpenMM_BrownianIntegrator;
typedef struct OpenMM_OpenMMException_struct OpenMM_OpenMMException;
typedef struct OpenMM_NonbondedForce_struct OpenMM_NonbondedForce;
typedef struct OpenMM_TwoParticleAverageSite_struct OpenMM_TwoParticleAverageSite;
typedef struct OpenMM_VariableLangevinIntegrator_struct OpenMM_VariableLangevinIntegrator;
typedef struct OpenMM_CustomExternalForce_struct OpenMM_CustomExternalForce;
typedef struct OpenMM_GBVIForce_struct OpenMM_GBVIForce;
typedef struct OpenMM_CustomGBForce_struct OpenMM_CustomGBForce;
typedef struct OpenMM_MonteCarloBarostat_struct OpenMM_MonteCarloBarostat;
typedef struct OpenMM_Context_struct OpenMM_Context;
typedef struct OpenMM_LocalEnergyMinimizer_struct OpenMM_LocalEnergyMinimizer;
typedef struct OpenMM_GBSAOBCForce_struct OpenMM_GBSAOBCForce;
typedef struct OpenMM_VariableVerletIntegrator_struct OpenMM_VariableVerletIntegrator;
typedef struct OpenMM_OutOfPlaneSite_struct OpenMM_OutOfPlaneSite;
typedef struct OpenMM_VerletIntegrator_struct OpenMM_VerletIntegrator;
typedef struct OpenMM_CustomHbondForce_struct OpenMM_CustomHbondForce;
typedef struct OpenMM_ContextImpl_struct OpenMM_ContextImpl;
typedef struct OpenMM_CMMotionRemover_struct OpenMM_CMMotionRemover;
typedef struct OpenMM_RBTorsionForce_struct OpenMM_RBTorsionForce;
typedef struct OpenMM_CustomIntegrator_struct OpenMM_CustomIntegrator;
typedef struct OpenMM_LangevinIntegrator_struct OpenMM_LangevinIntegrator;
typedef struct OpenMM_Force_struct OpenMM_Force;
typedef struct OpenMM_CMAPTorsionForce_struct OpenMM_CMAPTorsionForce;
typedef struct OpenMM_HarmonicAngleForce_struct OpenMM_HarmonicAngleForce;
typedef struct OpenMM_VirtualSite_struct OpenMM_VirtualSite;
typedef struct OpenMM_CustomNonbondedForce_struct OpenMM_CustomNonbondedForce;
typedef struct OpenMM_AndersenThermostat_struct OpenMM_AndersenThermostat;
typedef struct OpenMM_ForceImpl_struct OpenMM_ForceImpl;
typedef struct OpenMM_CustomTorsionForce_struct OpenMM_CustomTorsionForce;
typedef struct OpenMM_Platform_struct OpenMM_Platform;
typedef struct OpenMM_State_struct OpenMM_State;
typedef struct OpenMM_PeriodicTorsionForce_struct OpenMM_PeriodicTorsionForce;
typedef struct OpenMM_Integrator_struct OpenMM_Integrator;
typedef struct OpenMM_CustomBondForce_struct OpenMM_CustomBondForce;
typedef struct OpenMM_CustomAngleForce_struct OpenMM_CustomAngleForce;
typedef struct OpenMM_ThreeParticleAverageSite_struct OpenMM_ThreeParticleAverageSite;
typedef struct OpenMM_System_struct OpenMM_System;
typedef struct OpenMM_Vec3Array_struct OpenMM_Vec3Array;
typedef struct OpenMM_StringArray_struct OpenMM_StringArray;
typedef struct OpenMM_BondArray_struct OpenMM_BondArray;
typedef struct OpenMM_ParameterArray_struct OpenMM_ParameterArray;
typedef struct OpenMM_PropertyArray_struct OpenMM_PropertyArray;
typedef struct OpenMM_DoubleArray_struct OpenMM_DoubleArray;
typedef struct {double x, y, z;} OpenMM_Vec3;

typedef enum {OpenMM_False = 0, OpenMM_True = 1} OpenMM_Boolean;

#if defined(__cplusplus)
extern "C" {
#endif

/* OpenMM_Vec3 */
extern OPENMM_EXPORT OpenMM_Vec3 OpenMM_Vec3_scale(const OpenMM_Vec3 vec, double scale);

/* OpenMM_Vec3Array */
extern OPENMM_EXPORT OpenMM_Vec3Array* OpenMM_Vec3Array_create(int size);
extern OPENMM_EXPORT void OpenMM_Vec3Array_destroy(OpenMM_Vec3Array* array);
extern OPENMM_EXPORT int OpenMM_Vec3Array_getSize(const OpenMM_Vec3Array* array);
extern OPENMM_EXPORT void OpenMM_Vec3Array_resize(OpenMM_Vec3Array* array, int size);
extern OPENMM_EXPORT void OpenMM_Vec3Array_append(OpenMM_Vec3Array* array, const OpenMM_Vec3 vec);
extern OPENMM_EXPORT void OpenMM_Vec3Array_set(OpenMM_Vec3Array* array, int index, const OpenMM_Vec3 vec);
extern OPENMM_EXPORT const OpenMM_Vec3* OpenMM_Vec3Array_get(const OpenMM_Vec3Array* array, int index);

/* OpenMM_StringArray */
extern OPENMM_EXPORT OpenMM_StringArray* OpenMM_StringArray_create(int size);
extern OPENMM_EXPORT void OpenMM_StringArray_destroy(OpenMM_StringArray* array);
extern OPENMM_EXPORT int OpenMM_StringArray_getSize(const OpenMM_StringArray* array);
extern OPENMM_EXPORT void OpenMM_StringArray_resize(OpenMM_StringArray* array, int size);
extern OPENMM_EXPORT void OpenMM_StringArray_append(OpenMM_StringArray* array, const char* string);
extern OPENMM_EXPORT void OpenMM_StringArray_set(OpenMM_StringArray* array, int index, const char* string);
extern OPENMM_EXPORT const char* OpenMM_StringArray_get(const OpenMM_StringArray* array, int index);

/* OpenMM_BondArray */
extern OPENMM_EXPORT OpenMM_BondArray* OpenMM_BondArray_create(int size);
extern OPENMM_EXPORT void OpenMM_BondArray_destroy(OpenMM_BondArray* array);
extern OPENMM_EXPORT int OpenMM_BondArray_getSize(const OpenMM_BondArray* array);
extern OPENMM_EXPORT void OpenMM_BondArray_resize(OpenMM_BondArray* array, int size);
extern OPENMM_EXPORT void OpenMM_BondArray_append(OpenMM_BondArray* array, int particle1, int particle2);
extern OPENMM_EXPORT void OpenMM_BondArray_set(OpenMM_BondArray* array, int index, int particle1, int particle2);
extern OPENMM_EXPORT void OpenMM_BondArray_get(const OpenMM_BondArray* array, int index, int* particle1, int* particle2);

/* OpenMM_ParameterArray */
extern OPENMM_EXPORT int OpenMM_ParameterArray_getSize(const OpenMM_ParameterArray* array);
extern OPENMM_EXPORT double OpenMM_ParameterArray_get(const OpenMM_ParameterArray* array, const char* name);

/* OpenMM_PropertyArray */
extern OPENMM_EXPORT int OpenMM_PropertyArray_getSize(const OpenMM_PropertyArray* array);
extern OPENMM_EXPORT const char* OpenMM_PropertyArray_get(const OpenMM_PropertyArray* array, const char* name);

/* OpenMM_DoubleArray */
extern OPENMM_EXPORT OpenMM_DoubleArray* OpenMM_DoubleArray_create(int size);
extern OPENMM_EXPORT void OpenMM_DoubleArray_destroy(OpenMM_DoubleArray* array);
extern OPENMM_EXPORT int OpenMM_DoubleArray_getSize(const OpenMM_DoubleArray* array);
extern OPENMM_EXPORT void OpenMM_DoubleArray_resize(OpenMM_DoubleArray* array, int size);
extern OPENMM_EXPORT void OpenMM_DoubleArray_append(OpenMM_DoubleArray* array, double value);
extern OPENMM_EXPORT void OpenMM_DoubleArray_set(OpenMM_DoubleArray* array, int index, double value);
extern OPENMM_EXPORT double OpenMM_DoubleArray_get(const OpenMM_DoubleArray* array, int index);


/* These methods need to be handled specially, since their C++ APIs cannot be directly translated to C.
   Unlike the C++ versions, the return value is allocated on the heap, and you must delete it yourself. */
extern OPENMM_EXPORT OpenMM_State* OpenMM_Context_getState(const OpenMM_Context* target, int types, int enforcePeriodicBox);
extern OPENMM_EXPORT OpenMM_StringArray* OpenMM_Platform_loadPluginsFromDirectory(const char* directory);

 
 

/* OpenMM::HarmonicBondForce*/
extern OPENMM_EXPORT OpenMM_HarmonicBondForce* OpenMM_HarmonicBondForce_create();
extern OPENMM_EXPORT void OpenMM_HarmonicBondForce_destroy(OpenMM_HarmonicBondForce* target);
extern OPENMM_EXPORT int OpenMM_HarmonicBondForce_getNumBonds(const OpenMM_HarmonicBondForce* target);
extern OPENMM_EXPORT int OpenMM_HarmonicBondForce_addBond(OpenMM_HarmonicBondForce* target, int particle1, int particle2, double length, double k);
extern OPENMM_EXPORT void OpenMM_HarmonicBondForce_getBondParameters(const OpenMM_HarmonicBondForce* target, int index, int* particle1, int* particle2, double* length, double* k);
extern OPENMM_EXPORT void OpenMM_HarmonicBondForce_setBondParameters(OpenMM_HarmonicBondForce* target, int index, int particle1, int particle2, double length, double k);

/* OpenMM::BrownianIntegrator*/
extern OPENMM_EXPORT OpenMM_BrownianIntegrator* OpenMM_BrownianIntegrator_create(double temperature, double frictionCoeff, double stepSize);
extern OPENMM_EXPORT void OpenMM_BrownianIntegrator_destroy(OpenMM_BrownianIntegrator* target);
extern OPENMM_EXPORT double OpenMM_BrownianIntegrator_getTemperature(const OpenMM_BrownianIntegrator* target);
extern OPENMM_EXPORT void OpenMM_BrownianIntegrator_setTemperature(OpenMM_BrownianIntegrator* target, double temp);
extern OPENMM_EXPORT double OpenMM_BrownianIntegrator_getFriction(const OpenMM_BrownianIntegrator* target);
extern OPENMM_EXPORT void OpenMM_BrownianIntegrator_setFriction(OpenMM_BrownianIntegrator* target, double coeff);
extern OPENMM_EXPORT int OpenMM_BrownianIntegrator_getRandomNumberSeed(const OpenMM_BrownianIntegrator* target);
extern OPENMM_EXPORT void OpenMM_BrownianIntegrator_setRandomNumberSeed(OpenMM_BrownianIntegrator* target, int seed);
extern OPENMM_EXPORT void OpenMM_BrownianIntegrator_step(OpenMM_BrownianIntegrator* target, int steps);

/* OpenMM::OpenMMException*/
extern OPENMM_EXPORT OpenMM_OpenMMException* OpenMM_OpenMMException_create(const char* message);
extern OPENMM_EXPORT void OpenMM_OpenMMException_destroy(OpenMM_OpenMMException* target);
extern OPENMM_EXPORT const char* OpenMM_OpenMMException_what(const OpenMM_OpenMMException* target);

/* OpenMM::NonbondedForce*/
typedef enum {
  OpenMM_NonbondedForce_NoCutoff = 0, OpenMM_NonbondedForce_CutoffNonPeriodic = 1, OpenMM_NonbondedForce_CutoffPeriodic = 2, OpenMM_NonbondedForce_Ewald = 3, OpenMM_NonbondedForce_PME = 4
} OpenMM_NonbondedForce_NonbondedMethod;
extern OPENMM_EXPORT OpenMM_NonbondedForce* OpenMM_NonbondedForce_create();
extern OPENMM_EXPORT void OpenMM_NonbondedForce_destroy(OpenMM_NonbondedForce* target);
extern OPENMM_EXPORT int OpenMM_NonbondedForce_getNumParticles(const OpenMM_NonbondedForce* target);
extern OPENMM_EXPORT int OpenMM_NonbondedForce_getNumExceptions(const OpenMM_NonbondedForce* target);
extern OPENMM_EXPORT OpenMM_NonbondedForce_NonbondedMethod OpenMM_NonbondedForce_getNonbondedMethod(const OpenMM_NonbondedForce* target);
extern OPENMM_EXPORT void OpenMM_NonbondedForce_setNonbondedMethod(OpenMM_NonbondedForce* target, OpenMM_NonbondedForce_NonbondedMethod method);
extern OPENMM_EXPORT double OpenMM_NonbondedForce_getCutoffDistance(const OpenMM_NonbondedForce* target);
extern OPENMM_EXPORT void OpenMM_NonbondedForce_setCutoffDistance(OpenMM_NonbondedForce* target, double distance);
extern OPENMM_EXPORT double OpenMM_NonbondedForce_getReactionFieldDielectric(const OpenMM_NonbondedForce* target);
extern OPENMM_EXPORT void OpenMM_NonbondedForce_setReactionFieldDielectric(OpenMM_NonbondedForce* target, double dielectric);
extern OPENMM_EXPORT double OpenMM_NonbondedForce_getEwaldErrorTolerance(const OpenMM_NonbondedForce* target);
extern OPENMM_EXPORT void OpenMM_NonbondedForce_setEwaldErrorTolerance(OpenMM_NonbondedForce* target, double tol);
extern OPENMM_EXPORT int OpenMM_NonbondedForce_addParticle(OpenMM_NonbondedForce* target, double charge, double sigma, double epsilon);
extern OPENMM_EXPORT void OpenMM_NonbondedForce_getParticleParameters(const OpenMM_NonbondedForce* target, int index, double* charge, double* sigma, double* epsilon);
extern OPENMM_EXPORT void OpenMM_NonbondedForce_setParticleParameters(OpenMM_NonbondedForce* target, int index, double charge, double sigma, double epsilon);
extern OPENMM_EXPORT int OpenMM_NonbondedForce_addException(OpenMM_NonbondedForce* target, int particle1, int particle2, double chargeProd, double sigma, double epsilon, OpenMM_Boolean replace);
extern OPENMM_EXPORT void OpenMM_NonbondedForce_getExceptionParameters(const OpenMM_NonbondedForce* target, int index, int* particle1, int* particle2, double* chargeProd, double* sigma, double* epsilon);
extern OPENMM_EXPORT void OpenMM_NonbondedForce_setExceptionParameters(OpenMM_NonbondedForce* target, int index, int particle1, int particle2, double chargeProd, double sigma, double epsilon);
extern OPENMM_EXPORT void OpenMM_NonbondedForce_createExceptionsFromBonds(OpenMM_NonbondedForce* target, const OpenMM_BondArray* bonds, double coulomb14Scale, double lj14Scale);
extern OPENMM_EXPORT OpenMM_Boolean OpenMM_NonbondedForce_getUseDispersionCorrection(const OpenMM_NonbondedForce* target);
extern OPENMM_EXPORT void OpenMM_NonbondedForce_setUseDispersionCorrection(OpenMM_NonbondedForce* target, OpenMM_Boolean useCorrection);
extern OPENMM_EXPORT int OpenMM_NonbondedForce_getReciprocalSpaceForceGroup(const OpenMM_NonbondedForce* target);
extern OPENMM_EXPORT void OpenMM_NonbondedForce_setReciprocalSpaceForceGroup(OpenMM_NonbondedForce* target, int group);

/* OpenMM::TwoParticleAverageSite*/
extern OPENMM_EXPORT OpenMM_TwoParticleAverageSite* OpenMM_TwoParticleAverageSite_create(int particle1, int particle2, double weight1, double weight2);
extern OPENMM_EXPORT void OpenMM_TwoParticleAverageSite_destroy(OpenMM_TwoParticleAverageSite* target);
extern OPENMM_EXPORT double OpenMM_TwoParticleAverageSite_getWeight(const OpenMM_TwoParticleAverageSite* target, int particle);

/* OpenMM::VariableLangevinIntegrator*/
extern OPENMM_EXPORT OpenMM_VariableLangevinIntegrator* OpenMM_VariableLangevinIntegrator_create(double temperature, double frictionCoeff, double errorTol);
extern OPENMM_EXPORT void OpenMM_VariableLangevinIntegrator_destroy(OpenMM_VariableLangevinIntegrator* target);
extern OPENMM_EXPORT double OpenMM_VariableLangevinIntegrator_getTemperature(const OpenMM_VariableLangevinIntegrator* target);
extern OPENMM_EXPORT void OpenMM_VariableLangevinIntegrator_setTemperature(OpenMM_VariableLangevinIntegrator* target, double temp);
extern OPENMM_EXPORT double OpenMM_VariableLangevinIntegrator_getFriction(const OpenMM_VariableLangevinIntegrator* target);
extern OPENMM_EXPORT void OpenMM_VariableLangevinIntegrator_setFriction(OpenMM_VariableLangevinIntegrator* target, double coeff);
extern OPENMM_EXPORT double OpenMM_VariableLangevinIntegrator_getErrorTolerance(const OpenMM_VariableLangevinIntegrator* target);
extern OPENMM_EXPORT void OpenMM_VariableLangevinIntegrator_setErrorTolerance(OpenMM_VariableLangevinIntegrator* target, double tol);
extern OPENMM_EXPORT int OpenMM_VariableLangevinIntegrator_getRandomNumberSeed(const OpenMM_VariableLangevinIntegrator* target);
extern OPENMM_EXPORT void OpenMM_VariableLangevinIntegrator_setRandomNumberSeed(OpenMM_VariableLangevinIntegrator* target, int seed);
extern OPENMM_EXPORT void OpenMM_VariableLangevinIntegrator_step(OpenMM_VariableLangevinIntegrator* target, int steps);
extern OPENMM_EXPORT void OpenMM_VariableLangevinIntegrator_stepTo(OpenMM_VariableLangevinIntegrator* target, double time);

/* OpenMM::CustomExternalForce*/
extern OPENMM_EXPORT OpenMM_CustomExternalForce* OpenMM_CustomExternalForce_create(const char* energy);
extern OPENMM_EXPORT void OpenMM_CustomExternalForce_destroy(OpenMM_CustomExternalForce* target);
extern OPENMM_EXPORT int OpenMM_CustomExternalForce_getNumParticles(const OpenMM_CustomExternalForce* target);
extern OPENMM_EXPORT int OpenMM_CustomExternalForce_getNumPerParticleParameters(const OpenMM_CustomExternalForce* target);
extern OPENMM_EXPORT int OpenMM_CustomExternalForce_getNumGlobalParameters(const OpenMM_CustomExternalForce* target);
extern OPENMM_EXPORT const char* OpenMM_CustomExternalForce_getEnergyFunction(const OpenMM_CustomExternalForce* target);
extern OPENMM_EXPORT void OpenMM_CustomExternalForce_setEnergyFunction(OpenMM_CustomExternalForce* target, const char* energy);
extern OPENMM_EXPORT int OpenMM_CustomExternalForce_addPerParticleParameter(OpenMM_CustomExternalForce* target, const char* name);
extern OPENMM_EXPORT const char* OpenMM_CustomExternalForce_getPerParticleParameterName(const OpenMM_CustomExternalForce* target, int index);
extern OPENMM_EXPORT void OpenMM_CustomExternalForce_setPerParticleParameterName(OpenMM_CustomExternalForce* target, int index, const char* name);
extern OPENMM_EXPORT int OpenMM_CustomExternalForce_addGlobalParameter(OpenMM_CustomExternalForce* target, const char* name, double defaultValue);
extern OPENMM_EXPORT const char* OpenMM_CustomExternalForce_getGlobalParameterName(const OpenMM_CustomExternalForce* target, int index);
extern OPENMM_EXPORT void OpenMM_CustomExternalForce_setGlobalParameterName(OpenMM_CustomExternalForce* target, int index, const char* name);
extern OPENMM_EXPORT double OpenMM_CustomExternalForce_getGlobalParameterDefaultValue(const OpenMM_CustomExternalForce* target, int index);
extern OPENMM_EXPORT void OpenMM_CustomExternalForce_setGlobalParameterDefaultValue(OpenMM_CustomExternalForce* target, int index, double defaultValue);
extern OPENMM_EXPORT int OpenMM_CustomExternalForce_addParticle(OpenMM_CustomExternalForce* target, int particle, const OpenMM_DoubleArray* parameters);
extern OPENMM_EXPORT void OpenMM_CustomExternalForce_getParticleParameters(const OpenMM_CustomExternalForce* target, int index, int* particle, OpenMM_DoubleArray* parameters);
extern OPENMM_EXPORT void OpenMM_CustomExternalForce_setParticleParameters(OpenMM_CustomExternalForce* target, int index, int particle, const OpenMM_DoubleArray* parameters);

/* OpenMM::GBVIForce*/
typedef enum {
  OpenMM_GBVIForce_NoCutoff = 0, OpenMM_GBVIForce_CutoffNonPeriodic = 1, OpenMM_GBVIForce_CutoffPeriodic = 2
} OpenMM_GBVIForce_NonbondedMethod;
typedef enum {
  OpenMM_GBVIForce_NoScaling = 0, OpenMM_GBVIForce_QuinticSpline = 1
} OpenMM_GBVIForce_BornRadiusScalingMethod;
extern OPENMM_EXPORT OpenMM_GBVIForce* OpenMM_GBVIForce_create();
extern OPENMM_EXPORT void OpenMM_GBVIForce_destroy(OpenMM_GBVIForce* target);
extern OPENMM_EXPORT int OpenMM_GBVIForce_getNumParticles(const OpenMM_GBVIForce* target);
extern OPENMM_EXPORT int OpenMM_GBVIForce_addParticle(OpenMM_GBVIForce* target, double charge, double radius, double gamma);
extern OPENMM_EXPORT void OpenMM_GBVIForce_getParticleParameters(const OpenMM_GBVIForce* target, int index, double* charge, double* radius, double* gamma);
extern OPENMM_EXPORT void OpenMM_GBVIForce_setParticleParameters(OpenMM_GBVIForce* target, int index, double charge, double radius, double gamma);
extern OPENMM_EXPORT int OpenMM_GBVIForce_addBond(OpenMM_GBVIForce* target, int particle1, int particle2, double distance);
extern OPENMM_EXPORT void OpenMM_GBVIForce_getBondParameters(const OpenMM_GBVIForce* target, int index, int* particle1, int* particle2, double* distance);
extern OPENMM_EXPORT void OpenMM_GBVIForce_setBondParameters(OpenMM_GBVIForce* target, int index, int particle1, int particle2, double bondLength);
extern OPENMM_EXPORT int OpenMM_GBVIForce_getNumBonds(const OpenMM_GBVIForce* target);
extern OPENMM_EXPORT double OpenMM_GBVIForce_getSolventDielectric(const OpenMM_GBVIForce* target);
extern OPENMM_EXPORT void OpenMM_GBVIForce_setSolventDielectric(OpenMM_GBVIForce* target, double dielectric);
extern OPENMM_EXPORT double OpenMM_GBVIForce_getSoluteDielectric(const OpenMM_GBVIForce* target);
extern OPENMM_EXPORT void OpenMM_GBVIForce_setSoluteDielectric(OpenMM_GBVIForce* target, double dielectric);
extern OPENMM_EXPORT OpenMM_GBVIForce_NonbondedMethod OpenMM_GBVIForce_getNonbondedMethod(const OpenMM_GBVIForce* target);
extern OPENMM_EXPORT void OpenMM_GBVIForce_setNonbondedMethod(OpenMM_GBVIForce* target, OpenMM_GBVIForce_NonbondedMethod method);
extern OPENMM_EXPORT double OpenMM_GBVIForce_getCutoffDistance(const OpenMM_GBVIForce* target);
extern OPENMM_EXPORT void OpenMM_GBVIForce_setCutoffDistance(OpenMM_GBVIForce* target, double distance);
extern OPENMM_EXPORT OpenMM_GBVIForce_BornRadiusScalingMethod OpenMM_GBVIForce_getBornRadiusScalingMethod(const OpenMM_GBVIForce* target);
extern OPENMM_EXPORT void OpenMM_GBVIForce_setBornRadiusScalingMethod(OpenMM_GBVIForce* target, OpenMM_GBVIForce_BornRadiusScalingMethod method);
extern OPENMM_EXPORT double OpenMM_GBVIForce_getQuinticLowerLimitFactor(const OpenMM_GBVIForce* target);
extern OPENMM_EXPORT void OpenMM_GBVIForce_setQuinticLowerLimitFactor(OpenMM_GBVIForce* target, double quinticLowerLimitFactor);
extern OPENMM_EXPORT double OpenMM_GBVIForce_getQuinticUpperBornRadiusLimit(const OpenMM_GBVIForce* target);
extern OPENMM_EXPORT void OpenMM_GBVIForce_setQuinticUpperBornRadiusLimit(OpenMM_GBVIForce* target, double quinticUpperBornRadiusLimit);

/* OpenMM::CustomGBForce*/
typedef enum {
  OpenMM_CustomGBForce_NoCutoff = 0, OpenMM_CustomGBForce_CutoffNonPeriodic = 1, OpenMM_CustomGBForce_CutoffPeriodic = 2
} OpenMM_CustomGBForce_NonbondedMethod;
typedef enum {
  OpenMM_CustomGBForce_SingleParticle = 0, OpenMM_CustomGBForce_ParticlePair = 1, OpenMM_CustomGBForce_ParticlePairNoExclusions = 2
} OpenMM_CustomGBForce_ComputationType;
extern OPENMM_EXPORT OpenMM_CustomGBForce* OpenMM_CustomGBForce_create();
extern OPENMM_EXPORT void OpenMM_CustomGBForce_destroy(OpenMM_CustomGBForce* target);
extern OPENMM_EXPORT int OpenMM_CustomGBForce_getNumParticles(const OpenMM_CustomGBForce* target);
extern OPENMM_EXPORT int OpenMM_CustomGBForce_getNumExclusions(const OpenMM_CustomGBForce* target);
extern OPENMM_EXPORT int OpenMM_CustomGBForce_getNumPerParticleParameters(const OpenMM_CustomGBForce* target);
extern OPENMM_EXPORT int OpenMM_CustomGBForce_getNumGlobalParameters(const OpenMM_CustomGBForce* target);
extern OPENMM_EXPORT int OpenMM_CustomGBForce_getNumFunctions(const OpenMM_CustomGBForce* target);
extern OPENMM_EXPORT int OpenMM_CustomGBForce_getNumComputedValues(const OpenMM_CustomGBForce* target);
extern OPENMM_EXPORT int OpenMM_CustomGBForce_getNumEnergyTerms(const OpenMM_CustomGBForce* target);
extern OPENMM_EXPORT OpenMM_CustomGBForce_NonbondedMethod OpenMM_CustomGBForce_getNonbondedMethod(const OpenMM_CustomGBForce* target);
extern OPENMM_EXPORT void OpenMM_CustomGBForce_setNonbondedMethod(OpenMM_CustomGBForce* target, OpenMM_CustomGBForce_NonbondedMethod method);
extern OPENMM_EXPORT double OpenMM_CustomGBForce_getCutoffDistance(const OpenMM_CustomGBForce* target);
extern OPENMM_EXPORT void OpenMM_CustomGBForce_setCutoffDistance(OpenMM_CustomGBForce* target, double distance);
extern OPENMM_EXPORT int OpenMM_CustomGBForce_addPerParticleParameter(OpenMM_CustomGBForce* target, const char* name);
extern OPENMM_EXPORT const char* OpenMM_CustomGBForce_getPerParticleParameterName(const OpenMM_CustomGBForce* target, int index);
extern OPENMM_EXPORT void OpenMM_CustomGBForce_setPerParticleParameterName(OpenMM_CustomGBForce* target, int index, const char* name);
extern OPENMM_EXPORT int OpenMM_CustomGBForce_addGlobalParameter(OpenMM_CustomGBForce* target, const char* name, double defaultValue);
extern OPENMM_EXPORT const char* OpenMM_CustomGBForce_getGlobalParameterName(const OpenMM_CustomGBForce* target, int index);
extern OPENMM_EXPORT void OpenMM_CustomGBForce_setGlobalParameterName(OpenMM_CustomGBForce* target, int index, const char* name);
extern OPENMM_EXPORT double OpenMM_CustomGBForce_getGlobalParameterDefaultValue(const OpenMM_CustomGBForce* target, int index);
extern OPENMM_EXPORT void OpenMM_CustomGBForce_setGlobalParameterDefaultValue(OpenMM_CustomGBForce* target, int index, double defaultValue);
extern OPENMM_EXPORT int OpenMM_CustomGBForce_addParticle(OpenMM_CustomGBForce* target, const OpenMM_DoubleArray* parameters);
extern OPENMM_EXPORT void OpenMM_CustomGBForce_getParticleParameters(const OpenMM_CustomGBForce* target, int index, OpenMM_DoubleArray* parameters);
extern OPENMM_EXPORT void OpenMM_CustomGBForce_setParticleParameters(OpenMM_CustomGBForce* target, int index, const OpenMM_DoubleArray* parameters);
extern OPENMM_EXPORT int OpenMM_CustomGBForce_addComputedValue(OpenMM_CustomGBForce* target, const char* name, const char* expression, OpenMM_CustomGBForce_ComputationType type);
extern OPENMM_EXPORT void OpenMM_CustomGBForce_getComputedValueParameters(const OpenMM_CustomGBForce* target, int index, char** name, char** expression, OpenMM_CustomGBForce_ComputationType* type);
extern OPENMM_EXPORT void OpenMM_CustomGBForce_setComputedValueParameters(OpenMM_CustomGBForce* target, int index, const char* name, const char* expression, OpenMM_CustomGBForce_ComputationType type);
extern OPENMM_EXPORT int OpenMM_CustomGBForce_addEnergyTerm(OpenMM_CustomGBForce* target, const char* expression, OpenMM_CustomGBForce_ComputationType type);
extern OPENMM_EXPORT void OpenMM_CustomGBForce_getEnergyTermParameters(const OpenMM_CustomGBForce* target, int index, char** expression, OpenMM_CustomGBForce_ComputationType* type);
extern OPENMM_EXPORT void OpenMM_CustomGBForce_setEnergyTermParameters(OpenMM_CustomGBForce* target, int index, const char* expression, OpenMM_CustomGBForce_ComputationType type);
extern OPENMM_EXPORT int OpenMM_CustomGBForce_addExclusion(OpenMM_CustomGBForce* target, int particle1, int particle2);
extern OPENMM_EXPORT void OpenMM_CustomGBForce_getExclusionParticles(const OpenMM_CustomGBForce* target, int index, int* particle1, int* particle2);
extern OPENMM_EXPORT void OpenMM_CustomGBForce_setExclusionParticles(OpenMM_CustomGBForce* target, int index, int particle1, int particle2);
extern OPENMM_EXPORT int OpenMM_CustomGBForce_addFunction(OpenMM_CustomGBForce* target, const char* name, const OpenMM_DoubleArray* values, double min, double max);
extern OPENMM_EXPORT void OpenMM_CustomGBForce_getFunctionParameters(const OpenMM_CustomGBForce* target, int index, char** name, OpenMM_DoubleArray* values, double* min, double* max);
extern OPENMM_EXPORT void OpenMM_CustomGBForce_setFunctionParameters(OpenMM_CustomGBForce* target, int index, const char* name, const OpenMM_DoubleArray* values, double min, double max);

/* OpenMM::MonteCarloBarostat*/
extern OPENMM_EXPORT OpenMM_MonteCarloBarostat* OpenMM_MonteCarloBarostat_create(double defaultPressure, double temperature, int frequency);
extern OPENMM_EXPORT void OpenMM_MonteCarloBarostat_destroy(OpenMM_MonteCarloBarostat* target);
extern OPENMM_EXPORT const char* OpenMM_MonteCarloBarostat_Pressure();
extern OPENMM_EXPORT double OpenMM_MonteCarloBarostat_getDefaultPressure(const OpenMM_MonteCarloBarostat* target);
extern OPENMM_EXPORT int OpenMM_MonteCarloBarostat_getFrequency(const OpenMM_MonteCarloBarostat* target);
extern OPENMM_EXPORT void OpenMM_MonteCarloBarostat_setFrequency(OpenMM_MonteCarloBarostat* target, int freq);
extern OPENMM_EXPORT double OpenMM_MonteCarloBarostat_getTemperature(const OpenMM_MonteCarloBarostat* target);
extern OPENMM_EXPORT void OpenMM_MonteCarloBarostat_setTemperature(OpenMM_MonteCarloBarostat* target, double temp);
extern OPENMM_EXPORT int OpenMM_MonteCarloBarostat_getRandomNumberSeed(const OpenMM_MonteCarloBarostat* target);
extern OPENMM_EXPORT void OpenMM_MonteCarloBarostat_setRandomNumberSeed(OpenMM_MonteCarloBarostat* target, int seed);

/* OpenMM::Context*/
extern OPENMM_EXPORT OpenMM_Context* OpenMM_Context_create(OpenMM_System* system, OpenMM_Integrator* integrator);
extern OPENMM_EXPORT OpenMM_Context* OpenMM_Context_create_2(OpenMM_System* system, OpenMM_Integrator* integrator, OpenMM_Platform* platform);
extern OPENMM_EXPORT OpenMM_Context* OpenMM_Context_create_3(OpenMM_System* system, OpenMM_Integrator* integrator, OpenMM_Platform* platform, const OpenMM_PropertyArray* properties);
extern OPENMM_EXPORT void OpenMM_Context_destroy(OpenMM_Context* target);
extern OPENMM_EXPORT OpenMM_System* OpenMM_Context_getSystem(OpenMM_Context* target);
extern OPENMM_EXPORT OpenMM_Integrator* OpenMM_Context_getIntegrator(OpenMM_Context* target);
extern OPENMM_EXPORT OpenMM_Platform* OpenMM_Context_getPlatform(OpenMM_Context* target);
extern OPENMM_EXPORT void OpenMM_Context_setTime(OpenMM_Context* target, double time);
extern OPENMM_EXPORT void OpenMM_Context_setPositions(OpenMM_Context* target, const OpenMM_Vec3Array* positions);
extern OPENMM_EXPORT void OpenMM_Context_setVelocities(OpenMM_Context* target, const OpenMM_Vec3Array* velocities);
extern OPENMM_EXPORT double OpenMM_Context_getParameter(OpenMM_Context* target, const char* name);
extern OPENMM_EXPORT void OpenMM_Context_setParameter(OpenMM_Context* target, const char* name, double value);
extern OPENMM_EXPORT void OpenMM_Context_setPeriodicBoxVectors(OpenMM_Context* target, const OpenMM_Vec3* a, const OpenMM_Vec3* b, const OpenMM_Vec3* c);
extern OPENMM_EXPORT void OpenMM_Context_applyConstraints(OpenMM_Context* target, double tol);
extern OPENMM_EXPORT void OpenMM_Context_computeVirtualSites(OpenMM_Context* target);
extern OPENMM_EXPORT void OpenMM_Context_reinitialize(OpenMM_Context* target);

/* OpenMM::LocalEnergyMinimizer*/
extern OPENMM_EXPORT void OpenMM_LocalEnergyMinimizer_destroy(OpenMM_LocalEnergyMinimizer* target);
extern OPENMM_EXPORT void OpenMM_LocalEnergyMinimizer_minimize(OpenMM_Context* context, double tolerance, int maxIterations);

/* OpenMM::GBSAOBCForce*/
typedef enum {
  OpenMM_GBSAOBCForce_NoCutoff = 0, OpenMM_GBSAOBCForce_CutoffNonPeriodic = 1, OpenMM_GBSAOBCForce_CutoffPeriodic = 2
} OpenMM_GBSAOBCForce_NonbondedMethod;
extern OPENMM_EXPORT OpenMM_GBSAOBCForce* OpenMM_GBSAOBCForce_create();
extern OPENMM_EXPORT void OpenMM_GBSAOBCForce_destroy(OpenMM_GBSAOBCForce* target);
extern OPENMM_EXPORT int OpenMM_GBSAOBCForce_getNumParticles(const OpenMM_GBSAOBCForce* target);
extern OPENMM_EXPORT int OpenMM_GBSAOBCForce_addParticle(OpenMM_GBSAOBCForce* target, double charge, double radius, double scalingFactor);
extern OPENMM_EXPORT void OpenMM_GBSAOBCForce_getParticleParameters(const OpenMM_GBSAOBCForce* target, int index, double* charge, double* radius, double* scalingFactor);
extern OPENMM_EXPORT void OpenMM_GBSAOBCForce_setParticleParameters(OpenMM_GBSAOBCForce* target, int index, double charge, double radius, double scalingFactor);
extern OPENMM_EXPORT double OpenMM_GBSAOBCForce_getSolventDielectric(const OpenMM_GBSAOBCForce* target);
extern OPENMM_EXPORT void OpenMM_GBSAOBCForce_setSolventDielectric(OpenMM_GBSAOBCForce* target, double dielectric);
extern OPENMM_EXPORT double OpenMM_GBSAOBCForce_getSoluteDielectric(const OpenMM_GBSAOBCForce* target);
extern OPENMM_EXPORT void OpenMM_GBSAOBCForce_setSoluteDielectric(OpenMM_GBSAOBCForce* target, double dielectric);
extern OPENMM_EXPORT OpenMM_GBSAOBCForce_NonbondedMethod OpenMM_GBSAOBCForce_getNonbondedMethod(const OpenMM_GBSAOBCForce* target);
extern OPENMM_EXPORT void OpenMM_GBSAOBCForce_setNonbondedMethod(OpenMM_GBSAOBCForce* target, OpenMM_GBSAOBCForce_NonbondedMethod method);
extern OPENMM_EXPORT double OpenMM_GBSAOBCForce_getCutoffDistance(const OpenMM_GBSAOBCForce* target);
extern OPENMM_EXPORT void OpenMM_GBSAOBCForce_setCutoffDistance(OpenMM_GBSAOBCForce* target, double distance);

/* OpenMM::VariableVerletIntegrator*/
extern OPENMM_EXPORT OpenMM_VariableVerletIntegrator* OpenMM_VariableVerletIntegrator_create(double errorTol);
extern OPENMM_EXPORT void OpenMM_VariableVerletIntegrator_destroy(OpenMM_VariableVerletIntegrator* target);
extern OPENMM_EXPORT double OpenMM_VariableVerletIntegrator_getErrorTolerance(const OpenMM_VariableVerletIntegrator* target);
extern OPENMM_EXPORT void OpenMM_VariableVerletIntegrator_setErrorTolerance(OpenMM_VariableVerletIntegrator* target, double tol);
extern OPENMM_EXPORT void OpenMM_VariableVerletIntegrator_step(OpenMM_VariableVerletIntegrator* target, int steps);
extern OPENMM_EXPORT void OpenMM_VariableVerletIntegrator_stepTo(OpenMM_VariableVerletIntegrator* target, double time);

/* OpenMM::OutOfPlaneSite*/
extern OPENMM_EXPORT OpenMM_OutOfPlaneSite* OpenMM_OutOfPlaneSite_create(int particle1, int particle2, int particle3, double weight12, double weight13, double weightCross);
extern OPENMM_EXPORT void OpenMM_OutOfPlaneSite_destroy(OpenMM_OutOfPlaneSite* target);
extern OPENMM_EXPORT double OpenMM_OutOfPlaneSite_getWeight12(const OpenMM_OutOfPlaneSite* target);
extern OPENMM_EXPORT double OpenMM_OutOfPlaneSite_getWeight13(const OpenMM_OutOfPlaneSite* target);
extern OPENMM_EXPORT double OpenMM_OutOfPlaneSite_getWeightCross(const OpenMM_OutOfPlaneSite* target);

/* OpenMM::VerletIntegrator*/
extern OPENMM_EXPORT OpenMM_VerletIntegrator* OpenMM_VerletIntegrator_create(double stepSize);
extern OPENMM_EXPORT void OpenMM_VerletIntegrator_destroy(OpenMM_VerletIntegrator* target);
extern OPENMM_EXPORT void OpenMM_VerletIntegrator_step(OpenMM_VerletIntegrator* target, int steps);

/* OpenMM::CustomHbondForce*/
typedef enum {
  OpenMM_CustomHbondForce_NoCutoff = 0, OpenMM_CustomHbondForce_CutoffNonPeriodic = 1, OpenMM_CustomHbondForce_CutoffPeriodic = 2
} OpenMM_CustomHbondForce_NonbondedMethod;
extern OPENMM_EXPORT OpenMM_CustomHbondForce* OpenMM_CustomHbondForce_create(const char* energy);
extern OPENMM_EXPORT void OpenMM_CustomHbondForce_destroy(OpenMM_CustomHbondForce* target);
extern OPENMM_EXPORT int OpenMM_CustomHbondForce_getNumDonors(const OpenMM_CustomHbondForce* target);
extern OPENMM_EXPORT int OpenMM_CustomHbondForce_getNumAcceptors(const OpenMM_CustomHbondForce* target);
extern OPENMM_EXPORT int OpenMM_CustomHbondForce_getNumExclusions(const OpenMM_CustomHbondForce* target);
extern OPENMM_EXPORT int OpenMM_CustomHbondForce_getNumPerDonorParameters(const OpenMM_CustomHbondForce* target);
extern OPENMM_EXPORT int OpenMM_CustomHbondForce_getNumPerAcceptorParameters(const OpenMM_CustomHbondForce* target);
extern OPENMM_EXPORT int OpenMM_CustomHbondForce_getNumGlobalParameters(const OpenMM_CustomHbondForce* target);
extern OPENMM_EXPORT int OpenMM_CustomHbondForce_getNumFunctions(const OpenMM_CustomHbondForce* target);
extern OPENMM_EXPORT const char* OpenMM_CustomHbondForce_getEnergyFunction(const OpenMM_CustomHbondForce* target);
extern OPENMM_EXPORT void OpenMM_CustomHbondForce_setEnergyFunction(OpenMM_CustomHbondForce* target, const char* energy);
extern OPENMM_EXPORT OpenMM_CustomHbondForce_NonbondedMethod OpenMM_CustomHbondForce_getNonbondedMethod(const OpenMM_CustomHbondForce* target);
extern OPENMM_EXPORT void OpenMM_CustomHbondForce_setNonbondedMethod(OpenMM_CustomHbondForce* target, OpenMM_CustomHbondForce_NonbondedMethod method);
extern OPENMM_EXPORT double OpenMM_CustomHbondForce_getCutoffDistance(const OpenMM_CustomHbondForce* target);
extern OPENMM_EXPORT void OpenMM_CustomHbondForce_setCutoffDistance(OpenMM_CustomHbondForce* target, double distance);
extern OPENMM_EXPORT int OpenMM_CustomHbondForce_addPerDonorParameter(OpenMM_CustomHbondForce* target, const char* name);
extern OPENMM_EXPORT const char* OpenMM_CustomHbondForce_getPerDonorParameterName(const OpenMM_CustomHbondForce* target, int index);
extern OPENMM_EXPORT void OpenMM_CustomHbondForce_setPerDonorParameterName(OpenMM_CustomHbondForce* target, int index, const char* name);
extern OPENMM_EXPORT int OpenMM_CustomHbondForce_addPerAcceptorParameter(OpenMM_CustomHbondForce* target, const char* name);
extern OPENMM_EXPORT const char* OpenMM_CustomHbondForce_getPerAcceptorParameterName(const OpenMM_CustomHbondForce* target, int index);
extern OPENMM_EXPORT void OpenMM_CustomHbondForce_setPerAcceptorParameterName(OpenMM_CustomHbondForce* target, int index, const char* name);
extern OPENMM_EXPORT int OpenMM_CustomHbondForce_addGlobalParameter(OpenMM_CustomHbondForce* target, const char* name, double defaultValue);
extern OPENMM_EXPORT const char* OpenMM_CustomHbondForce_getGlobalParameterName(const OpenMM_CustomHbondForce* target, int index);
extern OPENMM_EXPORT void OpenMM_CustomHbondForce_setGlobalParameterName(OpenMM_CustomHbondForce* target, int index, const char* name);
extern OPENMM_EXPORT double OpenMM_CustomHbondForce_getGlobalParameterDefaultValue(const OpenMM_CustomHbondForce* target, int index);
extern OPENMM_EXPORT void OpenMM_CustomHbondForce_setGlobalParameterDefaultValue(OpenMM_CustomHbondForce* target, int index, double defaultValue);
extern OPENMM_EXPORT int OpenMM_CustomHbondForce_addDonor(OpenMM_CustomHbondForce* target, int d1, int d2, int d3, const OpenMM_DoubleArray* parameters);
extern OPENMM_EXPORT void OpenMM_CustomHbondForce_getDonorParameters(const OpenMM_CustomHbondForce* target, int index, int* d1, int* d2, int* d3, OpenMM_DoubleArray* parameters);
extern OPENMM_EXPORT void OpenMM_CustomHbondForce_setDonorParameters(OpenMM_CustomHbondForce* target, int index, int d1, int d2, int d3, const OpenMM_DoubleArray* parameters);
extern OPENMM_EXPORT int OpenMM_CustomHbondForce_addAcceptor(OpenMM_CustomHbondForce* target, int a1, int a2, int a3, const OpenMM_DoubleArray* parameters);
extern OPENMM_EXPORT void OpenMM_CustomHbondForce_getAcceptorParameters(const OpenMM_CustomHbondForce* target, int index, int* a1, int* a2, int* a3, OpenMM_DoubleArray* parameters);
extern OPENMM_EXPORT void OpenMM_CustomHbondForce_setAcceptorParameters(OpenMM_CustomHbondForce* target, int index, int a1, int a2, int a3, const OpenMM_DoubleArray* parameters);
extern OPENMM_EXPORT int OpenMM_CustomHbondForce_addExclusion(OpenMM_CustomHbondForce* target, int donor, int acceptor);
extern OPENMM_EXPORT void OpenMM_CustomHbondForce_getExclusionParticles(const OpenMM_CustomHbondForce* target, int index, int* donor, int* acceptor);
extern OPENMM_EXPORT void OpenMM_CustomHbondForce_setExclusionParticles(OpenMM_CustomHbondForce* target, int index, int donor, int acceptor);
extern OPENMM_EXPORT int OpenMM_CustomHbondForce_addFunction(OpenMM_CustomHbondForce* target, const char* name, const OpenMM_DoubleArray* values, double min, double max);
extern OPENMM_EXPORT void OpenMM_CustomHbondForce_getFunctionParameters(const OpenMM_CustomHbondForce* target, int index, char** name, OpenMM_DoubleArray* values, double* min, double* max);
extern OPENMM_EXPORT void OpenMM_CustomHbondForce_setFunctionParameters(OpenMM_CustomHbondForce* target, int index, const char* name, const OpenMM_DoubleArray* values, double min, double max);

/* OpenMM::CMMotionRemover*/
extern OPENMM_EXPORT OpenMM_CMMotionRemover* OpenMM_CMMotionRemover_create(int frequency);
extern OPENMM_EXPORT void OpenMM_CMMotionRemover_destroy(OpenMM_CMMotionRemover* target);
extern OPENMM_EXPORT int OpenMM_CMMotionRemover_getFrequency(const OpenMM_CMMotionRemover* target);
extern OPENMM_EXPORT void OpenMM_CMMotionRemover_setFrequency(OpenMM_CMMotionRemover* target, int freq);

/* OpenMM::RBTorsionForce*/
extern OPENMM_EXPORT OpenMM_RBTorsionForce* OpenMM_RBTorsionForce_create();
extern OPENMM_EXPORT void OpenMM_RBTorsionForce_destroy(OpenMM_RBTorsionForce* target);
extern OPENMM_EXPORT int OpenMM_RBTorsionForce_getNumTorsions(const OpenMM_RBTorsionForce* target);
extern OPENMM_EXPORT int OpenMM_RBTorsionForce_addTorsion(OpenMM_RBTorsionForce* target, int particle1, int particle2, int particle3, int particle4, double c0, double c1, double c2, double c3, double c4, double c5);
extern OPENMM_EXPORT void OpenMM_RBTorsionForce_getTorsionParameters(const OpenMM_RBTorsionForce* target, int index, int* particle1, int* particle2, int* particle3, int* particle4, double* c0, double* c1, double* c2, double* c3, double* c4, double* c5);
extern OPENMM_EXPORT void OpenMM_RBTorsionForce_setTorsionParameters(OpenMM_RBTorsionForce* target, int index, int particle1, int particle2, int particle3, int particle4, double c0, double c1, double c2, double c3, double c4, double c5);

/* OpenMM::CustomIntegrator*/
typedef enum {
  OpenMM_CustomIntegrator_ComputeGlobal = 0, OpenMM_CustomIntegrator_ComputePerDof = 1, OpenMM_CustomIntegrator_ComputeSum = 2, OpenMM_CustomIntegrator_ConstrainPositions = 3, OpenMM_CustomIntegrator_ConstrainVelocities = 4, OpenMM_CustomIntegrator_UpdateContextState = 5
} OpenMM_CustomIntegrator_ComputationType;
extern OPENMM_EXPORT OpenMM_CustomIntegrator* OpenMM_CustomIntegrator_create(double stepSize);
extern OPENMM_EXPORT void OpenMM_CustomIntegrator_destroy(OpenMM_CustomIntegrator* target);
extern OPENMM_EXPORT int OpenMM_CustomIntegrator_getNumGlobalVariables(const OpenMM_CustomIntegrator* target);
extern OPENMM_EXPORT int OpenMM_CustomIntegrator_getNumPerDofVariables(const OpenMM_CustomIntegrator* target);
extern OPENMM_EXPORT int OpenMM_CustomIntegrator_getNumComputations(const OpenMM_CustomIntegrator* target);
extern OPENMM_EXPORT int OpenMM_CustomIntegrator_addGlobalVariable(OpenMM_CustomIntegrator* target, const char* name, double initialValue);
extern OPENMM_EXPORT const char* OpenMM_CustomIntegrator_getGlobalVariableName(const OpenMM_CustomIntegrator* target, int index);
extern OPENMM_EXPORT int OpenMM_CustomIntegrator_addPerDofVariable(OpenMM_CustomIntegrator* target, const char* name, double initialValue);
extern OPENMM_EXPORT const char* OpenMM_CustomIntegrator_getPerDofVariableName(const OpenMM_CustomIntegrator* target, int index);
extern OPENMM_EXPORT double OpenMM_CustomIntegrator_getGlobalVariable(const OpenMM_CustomIntegrator* target, int index);
extern OPENMM_EXPORT void OpenMM_CustomIntegrator_setGlobalVariable(OpenMM_CustomIntegrator* target, int index, double value);
extern OPENMM_EXPORT void OpenMM_CustomIntegrator_setGlobalVariableByName(OpenMM_CustomIntegrator* target, const char* name, double value);
extern OPENMM_EXPORT void OpenMM_CustomIntegrator_getPerDofVariable(const OpenMM_CustomIntegrator* target, int index, OpenMM_Vec3Array* values);
extern OPENMM_EXPORT void OpenMM_CustomIntegrator_setPerDofVariable(OpenMM_CustomIntegrator* target, int index, const OpenMM_Vec3Array* values);
extern OPENMM_EXPORT void OpenMM_CustomIntegrator_setPerDofVariableByName(OpenMM_CustomIntegrator* target, const char* name, const OpenMM_Vec3Array* values);
extern OPENMM_EXPORT int OpenMM_CustomIntegrator_addComputeGlobal(OpenMM_CustomIntegrator* target, const char* variable, const char* expression);
extern OPENMM_EXPORT int OpenMM_CustomIntegrator_addComputePerDof(OpenMM_CustomIntegrator* target, const char* variable, const char* expression);
extern OPENMM_EXPORT int OpenMM_CustomIntegrator_addComputeSum(OpenMM_CustomIntegrator* target, const char* variable, const char* expression);
extern OPENMM_EXPORT int OpenMM_CustomIntegrator_addConstrainPositions(OpenMM_CustomIntegrator* target);
extern OPENMM_EXPORT int OpenMM_CustomIntegrator_addConstrainVelocities(OpenMM_CustomIntegrator* target);
extern OPENMM_EXPORT int OpenMM_CustomIntegrator_addUpdateContextState(OpenMM_CustomIntegrator* target);
extern OPENMM_EXPORT void OpenMM_CustomIntegrator_getComputationStep(const OpenMM_CustomIntegrator* target, int index, OpenMM_CustomIntegrator_ComputationType* type, char** variable, char** expression);
extern OPENMM_EXPORT int OpenMM_CustomIntegrator_getRandomNumberSeed(const OpenMM_CustomIntegrator* target);
extern OPENMM_EXPORT void OpenMM_CustomIntegrator_setRandomNumberSeed(OpenMM_CustomIntegrator* target, int seed);
extern OPENMM_EXPORT void OpenMM_CustomIntegrator_step(OpenMM_CustomIntegrator* target, int steps);

/* OpenMM::LangevinIntegrator*/
extern OPENMM_EXPORT OpenMM_LangevinIntegrator* OpenMM_LangevinIntegrator_create(double temperature, double frictionCoeff, double stepSize);
extern OPENMM_EXPORT void OpenMM_LangevinIntegrator_destroy(OpenMM_LangevinIntegrator* target);
extern OPENMM_EXPORT double OpenMM_LangevinIntegrator_getTemperature(const OpenMM_LangevinIntegrator* target);
extern OPENMM_EXPORT void OpenMM_LangevinIntegrator_setTemperature(OpenMM_LangevinIntegrator* target, double temp);
extern OPENMM_EXPORT double OpenMM_LangevinIntegrator_getFriction(const OpenMM_LangevinIntegrator* target);
extern OPENMM_EXPORT void OpenMM_LangevinIntegrator_setFriction(OpenMM_LangevinIntegrator* target, double coeff);
extern OPENMM_EXPORT int OpenMM_LangevinIntegrator_getRandomNumberSeed(const OpenMM_LangevinIntegrator* target);
extern OPENMM_EXPORT void OpenMM_LangevinIntegrator_setRandomNumberSeed(OpenMM_LangevinIntegrator* target, int seed);
extern OPENMM_EXPORT void OpenMM_LangevinIntegrator_step(OpenMM_LangevinIntegrator* target, int steps);

/* OpenMM::Force*/
extern OPENMM_EXPORT void OpenMM_Force_destroy(OpenMM_Force* target);
extern OPENMM_EXPORT int OpenMM_Force_getForceGroup(const OpenMM_Force* target);
extern OPENMM_EXPORT void OpenMM_Force_setForceGroup(OpenMM_Force* target, int group);

/* OpenMM::CMAPTorsionForce*/
extern OPENMM_EXPORT OpenMM_CMAPTorsionForce* OpenMM_CMAPTorsionForce_create();
extern OPENMM_EXPORT void OpenMM_CMAPTorsionForce_destroy(OpenMM_CMAPTorsionForce* target);
extern OPENMM_EXPORT int OpenMM_CMAPTorsionForce_getNumMaps(const OpenMM_CMAPTorsionForce* target);
extern OPENMM_EXPORT int OpenMM_CMAPTorsionForce_getNumTorsions(const OpenMM_CMAPTorsionForce* target);
extern OPENMM_EXPORT int OpenMM_CMAPTorsionForce_addMap(OpenMM_CMAPTorsionForce* target, int size, const OpenMM_DoubleArray* energy);
extern OPENMM_EXPORT void OpenMM_CMAPTorsionForce_getMapParameters(const OpenMM_CMAPTorsionForce* target, int index, int* size, OpenMM_DoubleArray* energy);
extern OPENMM_EXPORT void OpenMM_CMAPTorsionForce_setMapParameters(OpenMM_CMAPTorsionForce* target, int index, int size, const OpenMM_DoubleArray* energy);
extern OPENMM_EXPORT int OpenMM_CMAPTorsionForce_addTorsion(OpenMM_CMAPTorsionForce* target, int map, int a1, int a2, int a3, int a4, int b1, int b2, int b3, int b4);
extern OPENMM_EXPORT void OpenMM_CMAPTorsionForce_getTorsionParameters(const OpenMM_CMAPTorsionForce* target, int index, int* map, int* a1, int* a2, int* a3, int* a4, int* b1, int* b2, int* b3, int* b4);
extern OPENMM_EXPORT void OpenMM_CMAPTorsionForce_setTorsionParameters(OpenMM_CMAPTorsionForce* target, int index, int map, int a1, int a2, int a3, int a4, int b1, int b2, int b3, int b4);

/* OpenMM::HarmonicAngleForce*/
extern OPENMM_EXPORT OpenMM_HarmonicAngleForce* OpenMM_HarmonicAngleForce_create();
extern OPENMM_EXPORT void OpenMM_HarmonicAngleForce_destroy(OpenMM_HarmonicAngleForce* target);
extern OPENMM_EXPORT int OpenMM_HarmonicAngleForce_getNumAngles(const OpenMM_HarmonicAngleForce* target);
extern OPENMM_EXPORT int OpenMM_HarmonicAngleForce_addAngle(OpenMM_HarmonicAngleForce* target, int particle1, int particle2, int particle3, double angle, double k);
extern OPENMM_EXPORT void OpenMM_HarmonicAngleForce_getAngleParameters(const OpenMM_HarmonicAngleForce* target, int index, int* particle1, int* particle2, int* particle3, double* angle, double* k);
extern OPENMM_EXPORT void OpenMM_HarmonicAngleForce_setAngleParameters(OpenMM_HarmonicAngleForce* target, int index, int particle1, int particle2, int particle3, double angle, double k);

/* OpenMM::VirtualSite*/
extern OPENMM_EXPORT void OpenMM_VirtualSite_destroy(OpenMM_VirtualSite* target);
extern OPENMM_EXPORT int OpenMM_VirtualSite_getNumParticles(const OpenMM_VirtualSite* target);
extern OPENMM_EXPORT int OpenMM_VirtualSite_getParticle(const OpenMM_VirtualSite* target, int particle);

/* OpenMM::CustomNonbondedForce*/
typedef enum {
  OpenMM_CustomNonbondedForce_NoCutoff = 0, OpenMM_CustomNonbondedForce_CutoffNonPeriodic = 1, OpenMM_CustomNonbondedForce_CutoffPeriodic = 2
} OpenMM_CustomNonbondedForce_NonbondedMethod;
extern OPENMM_EXPORT OpenMM_CustomNonbondedForce* OpenMM_CustomNonbondedForce_create(const char* energy);
extern OPENMM_EXPORT void OpenMM_CustomNonbondedForce_destroy(OpenMM_CustomNonbondedForce* target);
extern OPENMM_EXPORT int OpenMM_CustomNonbondedForce_getNumParticles(const OpenMM_CustomNonbondedForce* target);
extern OPENMM_EXPORT int OpenMM_CustomNonbondedForce_getNumExclusions(const OpenMM_CustomNonbondedForce* target);
extern OPENMM_EXPORT int OpenMM_CustomNonbondedForce_getNumPerParticleParameters(const OpenMM_CustomNonbondedForce* target);
extern OPENMM_EXPORT int OpenMM_CustomNonbondedForce_getNumGlobalParameters(const OpenMM_CustomNonbondedForce* target);
extern OPENMM_EXPORT int OpenMM_CustomNonbondedForce_getNumFunctions(const OpenMM_CustomNonbondedForce* target);
extern OPENMM_EXPORT const char* OpenMM_CustomNonbondedForce_getEnergyFunction(const OpenMM_CustomNonbondedForce* target);
extern OPENMM_EXPORT void OpenMM_CustomNonbondedForce_setEnergyFunction(OpenMM_CustomNonbondedForce* target, const char* energy);
extern OPENMM_EXPORT OpenMM_CustomNonbondedForce_NonbondedMethod OpenMM_CustomNonbondedForce_getNonbondedMethod(const OpenMM_CustomNonbondedForce* target);
extern OPENMM_EXPORT void OpenMM_CustomNonbondedForce_setNonbondedMethod(OpenMM_CustomNonbondedForce* target, OpenMM_CustomNonbondedForce_NonbondedMethod method);
extern OPENMM_EXPORT double OpenMM_CustomNonbondedForce_getCutoffDistance(const OpenMM_CustomNonbondedForce* target);
extern OPENMM_EXPORT void OpenMM_CustomNonbondedForce_setCutoffDistance(OpenMM_CustomNonbondedForce* target, double distance);
extern OPENMM_EXPORT int OpenMM_CustomNonbondedForce_addPerParticleParameter(OpenMM_CustomNonbondedForce* target, const char* name);
extern OPENMM_EXPORT const char* OpenMM_CustomNonbondedForce_getPerParticleParameterName(const OpenMM_CustomNonbondedForce* target, int index);
extern OPENMM_EXPORT void OpenMM_CustomNonbondedForce_setPerParticleParameterName(OpenMM_CustomNonbondedForce* target, int index, const char* name);
extern OPENMM_EXPORT int OpenMM_CustomNonbondedForce_addGlobalParameter(OpenMM_CustomNonbondedForce* target, const char* name, double defaultValue);
extern OPENMM_EXPORT const char* OpenMM_CustomNonbondedForce_getGlobalParameterName(const OpenMM_CustomNonbondedForce* target, int index);
extern OPENMM_EXPORT void OpenMM_CustomNonbondedForce_setGlobalParameterName(OpenMM_CustomNonbondedForce* target, int index, const char* name);
extern OPENMM_EXPORT double OpenMM_CustomNonbondedForce_getGlobalParameterDefaultValue(const OpenMM_CustomNonbondedForce* target, int index);
extern OPENMM_EXPORT void OpenMM_CustomNonbondedForce_setGlobalParameterDefaultValue(OpenMM_CustomNonbondedForce* target, int index, double defaultValue);
extern OPENMM_EXPORT int OpenMM_CustomNonbondedForce_addParticle(OpenMM_CustomNonbondedForce* target, const OpenMM_DoubleArray* parameters);
extern OPENMM_EXPORT void OpenMM_CustomNonbondedForce_getParticleParameters(const OpenMM_CustomNonbondedForce* target, int index, OpenMM_DoubleArray* parameters);
extern OPENMM_EXPORT void OpenMM_CustomNonbondedForce_setParticleParameters(OpenMM_CustomNonbondedForce* target, int index, const OpenMM_DoubleArray* parameters);
extern OPENMM_EXPORT int OpenMM_CustomNonbondedForce_addExclusion(OpenMM_CustomNonbondedForce* target, int particle1, int particle2);
extern OPENMM_EXPORT void OpenMM_CustomNonbondedForce_getExclusionParticles(const OpenMM_CustomNonbondedForce* target, int index, int* particle1, int* particle2);
extern OPENMM_EXPORT void OpenMM_CustomNonbondedForce_setExclusionParticles(OpenMM_CustomNonbondedForce* target, int index, int particle1, int particle2);
extern OPENMM_EXPORT int OpenMM_CustomNonbondedForce_addFunction(OpenMM_CustomNonbondedForce* target, const char* name, const OpenMM_DoubleArray* values, double min, double max);
extern OPENMM_EXPORT void OpenMM_CustomNonbondedForce_getFunctionParameters(const OpenMM_CustomNonbondedForce* target, int index, char** name, OpenMM_DoubleArray* values, double* min, double* max);
extern OPENMM_EXPORT void OpenMM_CustomNonbondedForce_setFunctionParameters(OpenMM_CustomNonbondedForce* target, int index, const char* name, const OpenMM_DoubleArray* values, double min, double max);

/* OpenMM::AndersenThermostat*/
extern OPENMM_EXPORT OpenMM_AndersenThermostat* OpenMM_AndersenThermostat_create(double defaultTemperature, double defaultCollisionFrequency);
extern OPENMM_EXPORT void OpenMM_AndersenThermostat_destroy(OpenMM_AndersenThermostat* target);
extern OPENMM_EXPORT const char* OpenMM_AndersenThermostat_Temperature();
extern OPENMM_EXPORT const char* OpenMM_AndersenThermostat_CollisionFrequency();
extern OPENMM_EXPORT double OpenMM_AndersenThermostat_getDefaultTemperature(const OpenMM_AndersenThermostat* target);
extern OPENMM_EXPORT double OpenMM_AndersenThermostat_getDefaultCollisionFrequency(const OpenMM_AndersenThermostat* target);
extern OPENMM_EXPORT int OpenMM_AndersenThermostat_getRandomNumberSeed(const OpenMM_AndersenThermostat* target);
extern OPENMM_EXPORT void OpenMM_AndersenThermostat_setRandomNumberSeed(OpenMM_AndersenThermostat* target, int seed);

/* OpenMM::CustomTorsionForce*/
extern OPENMM_EXPORT OpenMM_CustomTorsionForce* OpenMM_CustomTorsionForce_create(const char* energy);
extern OPENMM_EXPORT void OpenMM_CustomTorsionForce_destroy(OpenMM_CustomTorsionForce* target);
extern OPENMM_EXPORT int OpenMM_CustomTorsionForce_getNumTorsions(const OpenMM_CustomTorsionForce* target);
extern OPENMM_EXPORT int OpenMM_CustomTorsionForce_getNumPerTorsionParameters(const OpenMM_CustomTorsionForce* target);
extern OPENMM_EXPORT int OpenMM_CustomTorsionForce_getNumGlobalParameters(const OpenMM_CustomTorsionForce* target);
extern OPENMM_EXPORT const char* OpenMM_CustomTorsionForce_getEnergyFunction(const OpenMM_CustomTorsionForce* target);
extern OPENMM_EXPORT void OpenMM_CustomTorsionForce_setEnergyFunction(OpenMM_CustomTorsionForce* target, const char* energy);
extern OPENMM_EXPORT int OpenMM_CustomTorsionForce_addPerTorsionParameter(OpenMM_CustomTorsionForce* target, const char* name);
extern OPENMM_EXPORT const char* OpenMM_CustomTorsionForce_getPerTorsionParameterName(const OpenMM_CustomTorsionForce* target, int index);
extern OPENMM_EXPORT void OpenMM_CustomTorsionForce_setPerTorsionParameterName(OpenMM_CustomTorsionForce* target, int index, const char* name);
extern OPENMM_EXPORT int OpenMM_CustomTorsionForce_addGlobalParameter(OpenMM_CustomTorsionForce* target, const char* name, double defaultValue);
extern OPENMM_EXPORT const char* OpenMM_CustomTorsionForce_getGlobalParameterName(const OpenMM_CustomTorsionForce* target, int index);
extern OPENMM_EXPORT void OpenMM_CustomTorsionForce_setGlobalParameterName(OpenMM_CustomTorsionForce* target, int index, const char* name);
extern OPENMM_EXPORT double OpenMM_CustomTorsionForce_getGlobalParameterDefaultValue(const OpenMM_CustomTorsionForce* target, int index);
extern OPENMM_EXPORT void OpenMM_CustomTorsionForce_setGlobalParameterDefaultValue(OpenMM_CustomTorsionForce* target, int index, double defaultValue);
extern OPENMM_EXPORT int OpenMM_CustomTorsionForce_addTorsion(OpenMM_CustomTorsionForce* target, int particle1, int particle2, int particle3, int particle4, const OpenMM_DoubleArray* parameters);
extern OPENMM_EXPORT void OpenMM_CustomTorsionForce_getTorsionParameters(const OpenMM_CustomTorsionForce* target, int index, int* particle1, int* particle2, int* particle3, int* particle4, OpenMM_DoubleArray* parameters);
extern OPENMM_EXPORT void OpenMM_CustomTorsionForce_setTorsionParameters(OpenMM_CustomTorsionForce* target, int index, int particle1, int particle2, int particle3, int particle4, const OpenMM_DoubleArray* parameters);

/* OpenMM::Platform*/
extern OPENMM_EXPORT void OpenMM_Platform_destroy(OpenMM_Platform* target);
extern OPENMM_EXPORT const char* OpenMM_Platform_getName(const OpenMM_Platform* target);
extern OPENMM_EXPORT double OpenMM_Platform_getSpeed(const OpenMM_Platform* target);
extern OPENMM_EXPORT OpenMM_Boolean OpenMM_Platform_supportsDoublePrecision(const OpenMM_Platform* target);
extern OPENMM_EXPORT const OpenMM_StringArray* OpenMM_Platform_getPropertyNames(OpenMM_Platform* target);
extern OPENMM_EXPORT const char* OpenMM_Platform_getPropertyValue(const OpenMM_Platform* target, const OpenMM_Context* context, const char* property);
extern OPENMM_EXPORT void OpenMM_Platform_setPropertyValue(const OpenMM_Platform* target, OpenMM_Context* context, const char* property, const char* value);
extern OPENMM_EXPORT const char* OpenMM_Platform_getPropertyDefaultValue(const OpenMM_Platform* target, const char* property);
extern OPENMM_EXPORT void OpenMM_Platform_setPropertyDefaultValue(OpenMM_Platform* target, const char* property, const char* value);
extern OPENMM_EXPORT OpenMM_Boolean OpenMM_Platform_supportsKernels(const OpenMM_Platform* target, const OpenMM_StringArray* kernelNames);
extern OPENMM_EXPORT void OpenMM_Platform_registerPlatform(OpenMM_Platform* platform);
extern OPENMM_EXPORT int OpenMM_Platform_getNumPlatforms();
extern OPENMM_EXPORT OpenMM_Platform* OpenMM_Platform_getPlatform(int index);
extern OPENMM_EXPORT OpenMM_Platform* OpenMM_Platform_getPlatformByName(const char* name);
extern OPENMM_EXPORT OpenMM_Platform* OpenMM_Platform_findPlatform(const OpenMM_StringArray* kernelNames);
extern OPENMM_EXPORT void OpenMM_Platform_loadPluginLibrary(const char* file);
extern OPENMM_EXPORT const char* OpenMM_Platform_getDefaultPluginsDirectory();
extern OPENMM_EXPORT const char* OpenMM_Platform_getOpenMMVersion();

/* OpenMM::State*/
typedef enum {
  OpenMM_State_Positions = 1, OpenMM_State_Velocities = 2, OpenMM_State_Forces = 4, OpenMM_State_Energy = 8, OpenMM_State_Parameters = 16
} OpenMM_State_DataType;
extern OPENMM_EXPORT OpenMM_State* OpenMM_State_create();
extern OPENMM_EXPORT void OpenMM_State_destroy(OpenMM_State* target);
extern OPENMM_EXPORT double OpenMM_State_getTime(const OpenMM_State* target);
extern OPENMM_EXPORT const OpenMM_Vec3Array* OpenMM_State_getPositions(const OpenMM_State* target);
extern OPENMM_EXPORT const OpenMM_Vec3Array* OpenMM_State_getVelocities(const OpenMM_State* target);
extern OPENMM_EXPORT const OpenMM_Vec3Array* OpenMM_State_getForces(const OpenMM_State* target);
extern OPENMM_EXPORT double OpenMM_State_getKineticEnergy(const OpenMM_State* target);
extern OPENMM_EXPORT double OpenMM_State_getPotentialEnergy(const OpenMM_State* target);
extern OPENMM_EXPORT void OpenMM_State_getPeriodicBoxVectors(const OpenMM_State* target, OpenMM_Vec3* a, OpenMM_Vec3* b, OpenMM_Vec3* c);
extern OPENMM_EXPORT const OpenMM_ParameterArray* OpenMM_State_getParameters(const OpenMM_State* target);

/* OpenMM::PeriodicTorsionForce*/
extern OPENMM_EXPORT OpenMM_PeriodicTorsionForce* OpenMM_PeriodicTorsionForce_create();
extern OPENMM_EXPORT void OpenMM_PeriodicTorsionForce_destroy(OpenMM_PeriodicTorsionForce* target);
extern OPENMM_EXPORT int OpenMM_PeriodicTorsionForce_getNumTorsions(const OpenMM_PeriodicTorsionForce* target);
extern OPENMM_EXPORT int OpenMM_PeriodicTorsionForce_addTorsion(OpenMM_PeriodicTorsionForce* target, int particle1, int particle2, int particle3, int particle4, int periodicity, double phase, double k);
extern OPENMM_EXPORT void OpenMM_PeriodicTorsionForce_getTorsionParameters(const OpenMM_PeriodicTorsionForce* target, int index, int* particle1, int* particle2, int* particle3, int* particle4, int* periodicity, double* phase, double* k);
extern OPENMM_EXPORT void OpenMM_PeriodicTorsionForce_setTorsionParameters(OpenMM_PeriodicTorsionForce* target, int index, int particle1, int particle2, int particle3, int particle4, int periodicity, double phase, double k);

/* OpenMM::Integrator*/
extern OPENMM_EXPORT void OpenMM_Integrator_destroy(OpenMM_Integrator* target);
extern OPENMM_EXPORT double OpenMM_Integrator_getStepSize(const OpenMM_Integrator* target);
extern OPENMM_EXPORT void OpenMM_Integrator_setStepSize(OpenMM_Integrator* target, double size);
extern OPENMM_EXPORT double OpenMM_Integrator_getConstraintTolerance(const OpenMM_Integrator* target);
extern OPENMM_EXPORT void OpenMM_Integrator_setConstraintTolerance(OpenMM_Integrator* target, double tol);
extern OPENMM_EXPORT void OpenMM_Integrator_step(OpenMM_Integrator* target, int steps);

/* OpenMM::CustomBondForce*/
extern OPENMM_EXPORT OpenMM_CustomBondForce* OpenMM_CustomBondForce_create(const char* energy);
extern OPENMM_EXPORT void OpenMM_CustomBondForce_destroy(OpenMM_CustomBondForce* target);
extern OPENMM_EXPORT int OpenMM_CustomBondForce_getNumBonds(const OpenMM_CustomBondForce* target);
extern OPENMM_EXPORT int OpenMM_CustomBondForce_getNumPerBondParameters(const OpenMM_CustomBondForce* target);
extern OPENMM_EXPORT int OpenMM_CustomBondForce_getNumGlobalParameters(const OpenMM_CustomBondForce* target);
extern OPENMM_EXPORT const char* OpenMM_CustomBondForce_getEnergyFunction(const OpenMM_CustomBondForce* target);
extern OPENMM_EXPORT void OpenMM_CustomBondForce_setEnergyFunction(OpenMM_CustomBondForce* target, const char* energy);
extern OPENMM_EXPORT int OpenMM_CustomBondForce_addPerBondParameter(OpenMM_CustomBondForce* target, const char* name);
extern OPENMM_EXPORT const char* OpenMM_CustomBondForce_getPerBondParameterName(const OpenMM_CustomBondForce* target, int index);
extern OPENMM_EXPORT void OpenMM_CustomBondForce_setPerBondParameterName(OpenMM_CustomBondForce* target, int index, const char* name);
extern OPENMM_EXPORT int OpenMM_CustomBondForce_addGlobalParameter(OpenMM_CustomBondForce* target, const char* name, double defaultValue);
extern OPENMM_EXPORT const char* OpenMM_CustomBondForce_getGlobalParameterName(const OpenMM_CustomBondForce* target, int index);
extern OPENMM_EXPORT void OpenMM_CustomBondForce_setGlobalParameterName(OpenMM_CustomBondForce* target, int index, const char* name);
extern OPENMM_EXPORT double OpenMM_CustomBondForce_getGlobalParameterDefaultValue(const OpenMM_CustomBondForce* target, int index);
extern OPENMM_EXPORT void OpenMM_CustomBondForce_setGlobalParameterDefaultValue(OpenMM_CustomBondForce* target, int index, double defaultValue);
extern OPENMM_EXPORT int OpenMM_CustomBondForce_addBond(OpenMM_CustomBondForce* target, int particle1, int particle2, const OpenMM_DoubleArray* parameters);
extern OPENMM_EXPORT void OpenMM_CustomBondForce_getBondParameters(const OpenMM_CustomBondForce* target, int index, int* particle1, int* particle2, OpenMM_DoubleArray* parameters);
extern OPENMM_EXPORT void OpenMM_CustomBondForce_setBondParameters(OpenMM_CustomBondForce* target, int index, int particle1, int particle2, const OpenMM_DoubleArray* parameters);

/* OpenMM::CustomAngleForce*/
extern OPENMM_EXPORT OpenMM_CustomAngleForce* OpenMM_CustomAngleForce_create(const char* energy);
extern OPENMM_EXPORT void OpenMM_CustomAngleForce_destroy(OpenMM_CustomAngleForce* target);
extern OPENMM_EXPORT int OpenMM_CustomAngleForce_getNumAngles(const OpenMM_CustomAngleForce* target);
extern OPENMM_EXPORT int OpenMM_CustomAngleForce_getNumPerAngleParameters(const OpenMM_CustomAngleForce* target);
extern OPENMM_EXPORT int OpenMM_CustomAngleForce_getNumGlobalParameters(const OpenMM_CustomAngleForce* target);
extern OPENMM_EXPORT const char* OpenMM_CustomAngleForce_getEnergyFunction(const OpenMM_CustomAngleForce* target);
extern OPENMM_EXPORT void OpenMM_CustomAngleForce_setEnergyFunction(OpenMM_CustomAngleForce* target, const char* energy);
extern OPENMM_EXPORT int OpenMM_CustomAngleForce_addPerAngleParameter(OpenMM_CustomAngleForce* target, const char* name);
extern OPENMM_EXPORT const char* OpenMM_CustomAngleForce_getPerAngleParameterName(const OpenMM_CustomAngleForce* target, int index);
extern OPENMM_EXPORT void OpenMM_CustomAngleForce_setPerAngleParameterName(OpenMM_CustomAngleForce* target, int index, const char* name);
extern OPENMM_EXPORT int OpenMM_CustomAngleForce_addGlobalParameter(OpenMM_CustomAngleForce* target, const char* name, double defaultValue);
extern OPENMM_EXPORT const char* OpenMM_CustomAngleForce_getGlobalParameterName(const OpenMM_CustomAngleForce* target, int index);
extern OPENMM_EXPORT void OpenMM_CustomAngleForce_setGlobalParameterName(OpenMM_CustomAngleForce* target, int index, const char* name);
extern OPENMM_EXPORT double OpenMM_CustomAngleForce_getGlobalParameterDefaultValue(const OpenMM_CustomAngleForce* target, int index);
extern OPENMM_EXPORT void OpenMM_CustomAngleForce_setGlobalParameterDefaultValue(OpenMM_CustomAngleForce* target, int index, double defaultValue);
extern OPENMM_EXPORT int OpenMM_CustomAngleForce_addAngle(OpenMM_CustomAngleForce* target, int particle1, int particle2, int particle3, const OpenMM_DoubleArray* parameters);
extern OPENMM_EXPORT void OpenMM_CustomAngleForce_getAngleParameters(const OpenMM_CustomAngleForce* target, int index, int* particle1, int* particle2, int* particle3, OpenMM_DoubleArray* parameters);
extern OPENMM_EXPORT void OpenMM_CustomAngleForce_setAngleParameters(OpenMM_CustomAngleForce* target, int index, int particle1, int particle2, int particle3, const OpenMM_DoubleArray* parameters);

/* OpenMM::ThreeParticleAverageSite*/
extern OPENMM_EXPORT OpenMM_ThreeParticleAverageSite* OpenMM_ThreeParticleAverageSite_create(int particle1, int particle2, int particle3, double weight1, double weight2, double weight3);
extern OPENMM_EXPORT void OpenMM_ThreeParticleAverageSite_destroy(OpenMM_ThreeParticleAverageSite* target);
extern OPENMM_EXPORT double OpenMM_ThreeParticleAverageSite_getWeight(const OpenMM_ThreeParticleAverageSite* target, int particle);

/* OpenMM::System*/
extern OPENMM_EXPORT OpenMM_System* OpenMM_System_create();
extern OPENMM_EXPORT void OpenMM_System_destroy(OpenMM_System* target);
extern OPENMM_EXPORT int OpenMM_System_getNumParticles(const OpenMM_System* target);
extern OPENMM_EXPORT int OpenMM_System_addParticle(OpenMM_System* target, double mass);
extern OPENMM_EXPORT double OpenMM_System_getParticleMass(const OpenMM_System* target, int index);
extern OPENMM_EXPORT void OpenMM_System_setParticleMass(OpenMM_System* target, int index, double mass);
extern OPENMM_EXPORT void OpenMM_System_setVirtualSite(OpenMM_System* target, int index, OpenMM_VirtualSite* virtualSite);
extern OPENMM_EXPORT OpenMM_Boolean OpenMM_System_isVirtualSite(const OpenMM_System* target, int index);
extern OPENMM_EXPORT const OpenMM_VirtualSite* OpenMM_System_getVirtualSite(const OpenMM_System* target, int index);
extern OPENMM_EXPORT int OpenMM_System_getNumConstraints(const OpenMM_System* target);
extern OPENMM_EXPORT int OpenMM_System_addConstraint(OpenMM_System* target, int particle1, int particle2, double distance);
extern OPENMM_EXPORT void OpenMM_System_getConstraintParameters(const OpenMM_System* target, int index, int* particle1, int* particle2, double* distance);
extern OPENMM_EXPORT void OpenMM_System_setConstraintParameters(OpenMM_System* target, int index, int particle1, int particle2, double distance);
extern OPENMM_EXPORT int OpenMM_System_addForce(OpenMM_System* target, OpenMM_Force* force);
extern OPENMM_EXPORT int OpenMM_System_getNumForces(const OpenMM_System* target);
extern OPENMM_EXPORT OpenMM_Force* OpenMM_System_getForce(OpenMM_System* target, int index);
extern OPENMM_EXPORT void OpenMM_System_getDefaultPeriodicBoxVectors(const OpenMM_System* target, OpenMM_Vec3* a, OpenMM_Vec3* b, OpenMM_Vec3* c);
extern OPENMM_EXPORT void OpenMM_System_setDefaultPeriodicBoxVectors(OpenMM_System* target, const OpenMM_Vec3* a, const OpenMM_Vec3* b, const OpenMM_Vec3* c);

#if defined(__cplusplus)
}
#endif

#endif /*OPENMM_CWRAPPER_H_*/
