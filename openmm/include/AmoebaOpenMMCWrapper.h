
#ifndef AMOEBA_OPENMM_CWRAPPER_H_
#define AMOEBA_OPENMM_CWRAPPER_H_

#ifndef OPENMM_EXPORT
#define OPENMM_EXPORT
#endif

/* Global Constants */
 

/* Type Declarations */
 
typedef struct OpenMM_AmoebaHarmonicInPlaneAngleForce_struct OpenMM_AmoebaHarmonicInPlaneAngleForce;
typedef struct OpenMM_AmoebaMultipoleForce_struct OpenMM_AmoebaMultipoleForce;
typedef struct OpenMM_AmoebaStretchBendForce_struct OpenMM_AmoebaStretchBendForce;
typedef struct OpenMM_AmoebaWcaDispersionForce_struct OpenMM_AmoebaWcaDispersionForce;
typedef struct OpenMM_AmoebaOutOfPlaneBendForce_struct OpenMM_AmoebaOutOfPlaneBendForce;
typedef struct OpenMM_AmoebaGeneralizedKirkwoodForce_struct OpenMM_AmoebaGeneralizedKirkwoodForce;
typedef struct OpenMM_AmoebaUreyBradleyForce_struct OpenMM_AmoebaUreyBradleyForce;
typedef struct OpenMM_AmoebaTorsionForce_struct OpenMM_AmoebaTorsionForce;
typedef struct OpenMM_AmoebaHarmonicBondForce_struct OpenMM_AmoebaHarmonicBondForce;
typedef struct OpenMM_AmoebaHarmonicAngleForce_struct OpenMM_AmoebaHarmonicAngleForce;
typedef struct OpenMM_AmoebaTorsionTorsionForce_struct OpenMM_AmoebaTorsionTorsionForce;
typedef struct OpenMM_AmoebaPiTorsionForce_struct OpenMM_AmoebaPiTorsionForce;
typedef struct OpenMM_AmoebaVdwForce_struct OpenMM_AmoebaVdwForce;

typedef struct OpenMM_IntArray_struct OpenMM_IntArray;
typedef struct OpenMM_2D_IntArray_struct OpenMM_2D_IntArray;
typedef struct OpenMM_3D_DoubleArray_struct OpenMM_3D_DoubleArray;

#if defined(__cplusplus)
extern "C" {
#endif

/* OpenMM_3D_DoubleArray */
OPENMM_EXPORT OpenMM_3D_DoubleArray* OpenMM_3D_DoubleArray_create(int size1, int size2, int size3);
OPENMM_EXPORT void OpenMM_3D_DoubleArray_set(OpenMM_3D_DoubleArray* array, int index1, int index2, OpenMM_DoubleArray* values);
OPENMM_EXPORT void OpenMM_3D_DoubleArray_destroy( OpenMM_3D_DoubleArray* array);


/* OpenMM_IntArray */
extern OPENMM_EXPORT OpenMM_IntArray* OpenMM_IntArray_create(int size);
extern OPENMM_EXPORT void OpenMM_IntArray_destroy(OpenMM_IntArray* array);
extern OPENMM_EXPORT int OpenMM_IntArray_getSize(const OpenMM_IntArray* array);
extern OPENMM_EXPORT void OpenMM_IntArray_resize(OpenMM_IntArray* array, int size);
extern OPENMM_EXPORT void OpenMM_IntArray_append(OpenMM_IntArray* array, int value);
extern OPENMM_EXPORT void OpenMM_IntArray_set(OpenMM_IntArray* array, int index, int value);
extern OPENMM_EXPORT int OpenMM_IntArray_get(const OpenMM_IntArray* array, int index);


/* OpenMM::AmoebaHarmonicInPlaneAngleForce*/
extern OPENMM_EXPORT OpenMM_AmoebaHarmonicInPlaneAngleForce* OpenMM_AmoebaHarmonicInPlaneAngleForce_create();
extern OPENMM_EXPORT void OpenMM_AmoebaHarmonicInPlaneAngleForce_destroy(OpenMM_AmoebaHarmonicInPlaneAngleForce* target);
extern OPENMM_EXPORT int OpenMM_AmoebaHarmonicInPlaneAngleForce_getNumAngles(const OpenMM_AmoebaHarmonicInPlaneAngleForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaHarmonicInPlaneAngleForce_setAmoebaGlobalHarmonicInPlaneAngleCubic(OpenMM_AmoebaHarmonicInPlaneAngleForce* target, double cubicK);
extern OPENMM_EXPORT double OpenMM_AmoebaHarmonicInPlaneAngleForce_getAmoebaGlobalHarmonicInPlaneAngleCubic(const OpenMM_AmoebaHarmonicInPlaneAngleForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaHarmonicInPlaneAngleForce_setAmoebaGlobalHarmonicInPlaneAngleQuartic(OpenMM_AmoebaHarmonicInPlaneAngleForce* target, double quarticK);
extern OPENMM_EXPORT double OpenMM_AmoebaHarmonicInPlaneAngleForce_getAmoebaGlobalHarmonicInPlaneAngleQuartic(const OpenMM_AmoebaHarmonicInPlaneAngleForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaHarmonicInPlaneAngleForce_setAmoebaGlobalHarmonicInPlaneAnglePentic(OpenMM_AmoebaHarmonicInPlaneAngleForce* target, double penticK);
extern OPENMM_EXPORT double OpenMM_AmoebaHarmonicInPlaneAngleForce_getAmoebaGlobalHarmonicInPlaneAnglePentic(const OpenMM_AmoebaHarmonicInPlaneAngleForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaHarmonicInPlaneAngleForce_setAmoebaGlobalHarmonicInPlaneAngleSextic(OpenMM_AmoebaHarmonicInPlaneAngleForce* target, double sexticK);
extern OPENMM_EXPORT double OpenMM_AmoebaHarmonicInPlaneAngleForce_getAmoebaGlobalHarmonicInPlaneAngleSextic(const OpenMM_AmoebaHarmonicInPlaneAngleForce* target);
extern OPENMM_EXPORT int OpenMM_AmoebaHarmonicInPlaneAngleForce_addAngle(OpenMM_AmoebaHarmonicInPlaneAngleForce* target, int particle1, int particle2, int particle3, int particle4, double length, double quadraticK);
extern OPENMM_EXPORT void OpenMM_AmoebaHarmonicInPlaneAngleForce_getAngleParameters(const OpenMM_AmoebaHarmonicInPlaneAngleForce* target, int index, int* particle1, int* particle2, int* particle3, int* particle4, double* length, double* quadraticK);
extern OPENMM_EXPORT void OpenMM_AmoebaHarmonicInPlaneAngleForce_setAngleParameters(OpenMM_AmoebaHarmonicInPlaneAngleForce* target, int index, int particle1, int particle2, int particle3, int particle4, double length, double quadraticK);

/* OpenMM::AmoebaMultipoleForce*/
typedef enum {
  OpenMM_AmoebaMultipoleForce_NoCutoff = 0, OpenMM_AmoebaMultipoleForce_PME = 1
} OpenMM_AmoebaMultipoleForce_AmoebaNonbondedMethod;
typedef enum {
  OpenMM_AmoebaMultipoleForce_Mutual = 0, OpenMM_AmoebaMultipoleForce_Direct = 1
} OpenMM_AmoebaMultipoleForce_AmoebaPolarizationType;
typedef enum {
  OpenMM_AmoebaMultipoleForce_ZThenX = 0, OpenMM_AmoebaMultipoleForce_Bisector = 1, OpenMM_AmoebaMultipoleForce_ZBisect = 2, OpenMM_AmoebaMultipoleForce_ThreeFold = 3, OpenMM_AmoebaMultipoleForce_ZOnly = 4, OpenMM_AmoebaMultipoleForce_NoAxisType = 5, OpenMM_AmoebaMultipoleForce_LastAxisTypeIndex = 6
} OpenMM_AmoebaMultipoleForce_MultipoleAxisTypes;
typedef enum {
  OpenMM_AmoebaMultipoleForce_SOR = 0
} OpenMM_AmoebaMultipoleForce_MutualInducedIterationMethod;
typedef enum {
  OpenMM_AmoebaMultipoleForce_Covalent12 = 0, OpenMM_AmoebaMultipoleForce_Covalent13 = 1, OpenMM_AmoebaMultipoleForce_Covalent14 = 2, OpenMM_AmoebaMultipoleForce_Covalent15 = 3, OpenMM_AmoebaMultipoleForce_PolarizationCovalent11 = 4, OpenMM_AmoebaMultipoleForce_PolarizationCovalent12 = 5, OpenMM_AmoebaMultipoleForce_PolarizationCovalent13 = 6, OpenMM_AmoebaMultipoleForce_PolarizationCovalent14 = 7, OpenMM_AmoebaMultipoleForce_CovalentEnd = 8
} OpenMM_AmoebaMultipoleForce_CovalentType;
extern OPENMM_EXPORT OpenMM_AmoebaMultipoleForce* OpenMM_AmoebaMultipoleForce_create();
extern OPENMM_EXPORT void OpenMM_AmoebaMultipoleForce_destroy(OpenMM_AmoebaMultipoleForce* target);
extern OPENMM_EXPORT int OpenMM_AmoebaMultipoleForce_getNumMultipoles(const OpenMM_AmoebaMultipoleForce* target);
extern OPENMM_EXPORT OpenMM_AmoebaMultipoleForce_AmoebaNonbondedMethod OpenMM_AmoebaMultipoleForce_getNonbondedMethod(const OpenMM_AmoebaMultipoleForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaMultipoleForce_setNonbondedMethod(OpenMM_AmoebaMultipoleForce* target, OpenMM_AmoebaMultipoleForce_AmoebaNonbondedMethod method);
extern OPENMM_EXPORT OpenMM_AmoebaMultipoleForce_AmoebaPolarizationType OpenMM_AmoebaMultipoleForce_getPolarizationType(const OpenMM_AmoebaMultipoleForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaMultipoleForce_setPolarizationType(OpenMM_AmoebaMultipoleForce* target, OpenMM_AmoebaMultipoleForce_AmoebaPolarizationType type);
extern OPENMM_EXPORT double OpenMM_AmoebaMultipoleForce_getCutoffDistance(const OpenMM_AmoebaMultipoleForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaMultipoleForce_setCutoffDistance(OpenMM_AmoebaMultipoleForce* target, double distance);
extern OPENMM_EXPORT double OpenMM_AmoebaMultipoleForce_getAEwald(const OpenMM_AmoebaMultipoleForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaMultipoleForce_setAEwald(OpenMM_AmoebaMultipoleForce* target, double aewald);
extern OPENMM_EXPORT int OpenMM_AmoebaMultipoleForce_getPmeBSplineOrder(const OpenMM_AmoebaMultipoleForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaMultipoleForce_getPmeGridDimensions(const OpenMM_AmoebaMultipoleForce* target, OpenMM_IntArray* gridDimension);
extern OPENMM_EXPORT void OpenMM_AmoebaMultipoleForce_setPmeGridDimensions(OpenMM_AmoebaMultipoleForce* target, const OpenMM_IntArray* gridDimension);
extern OPENMM_EXPORT int OpenMM_AmoebaMultipoleForce_addParticle(OpenMM_AmoebaMultipoleForce* target, double charge, const OpenMM_DoubleArray* molecularDipole, const OpenMM_DoubleArray* molecularQuadrupole, int axisType, int multipoleAtomZ, int multipoleAtomX, int multipoleAtomY, double thole, double dampingFactor, double polarity);
extern OPENMM_EXPORT void OpenMM_AmoebaMultipoleForce_getMultipoleParameters(const OpenMM_AmoebaMultipoleForce* target, int index, double* charge, OpenMM_DoubleArray* molecularDipole, OpenMM_DoubleArray* molecularQuadrupole, int* axisType, int* multipoleAtomZ, int* multipoleAtomX, int* multipoleAtomY, double* thole, double* dampingFactor, double* polarity);
extern OPENMM_EXPORT void OpenMM_AmoebaMultipoleForce_setMultipoleParameters(OpenMM_AmoebaMultipoleForce* target, int index, double charge, const OpenMM_DoubleArray* molecularDipole, const OpenMM_DoubleArray* molecularQuadrupole, int axisType, int multipoleAtomZ, int multipoleAtomX, int multipoleAtomY, double thole, double dampingFactor, double polarity);
extern OPENMM_EXPORT void OpenMM_AmoebaMultipoleForce_setCovalentMap(OpenMM_AmoebaMultipoleForce* target, int index, OpenMM_AmoebaMultipoleForce_CovalentType typeId, const OpenMM_IntArray* covalentAtoms);
extern OPENMM_EXPORT void OpenMM_AmoebaMultipoleForce_getCovalentMap(const OpenMM_AmoebaMultipoleForce* target, int index, OpenMM_AmoebaMultipoleForce_CovalentType typeId, OpenMM_IntArray* covalentAtoms);
extern OPENMM_EXPORT void OpenMM_AmoebaMultipoleForce_getCovalentMaps(const OpenMM_AmoebaMultipoleForce* target, int index, OpenMM_2D_IntArray* covalentLists);
extern OPENMM_EXPORT int OpenMM_AmoebaMultipoleForce_getMutualInducedMaxIterations(const OpenMM_AmoebaMultipoleForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaMultipoleForce_setMutualInducedMaxIterations(OpenMM_AmoebaMultipoleForce* target, int inputMutualInducedMaxIterations);
extern OPENMM_EXPORT double OpenMM_AmoebaMultipoleForce_getMutualInducedTargetEpsilon(const OpenMM_AmoebaMultipoleForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaMultipoleForce_setMutualInducedTargetEpsilon(OpenMM_AmoebaMultipoleForce* target, double inputMutualInducedTargetEpsilon);
extern OPENMM_EXPORT double OpenMM_AmoebaMultipoleForce_getEwaldErrorTolerance(const OpenMM_AmoebaMultipoleForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaMultipoleForce_setEwaldErrorTolerance(OpenMM_AmoebaMultipoleForce* target, double tol);

/* OpenMM::AmoebaStretchBendForce*/
extern OPENMM_EXPORT OpenMM_AmoebaStretchBendForce* OpenMM_AmoebaStretchBendForce_create();
extern OPENMM_EXPORT void OpenMM_AmoebaStretchBendForce_destroy(OpenMM_AmoebaStretchBendForce* target);
extern OPENMM_EXPORT int OpenMM_AmoebaStretchBendForce_getNumStretchBends(const OpenMM_AmoebaStretchBendForce* target);
extern OPENMM_EXPORT int OpenMM_AmoebaStretchBendForce_addStretchBend(OpenMM_AmoebaStretchBendForce* target, int particle1, int particle2, int particle3, double lengthAB, double lengthCB, double angle, double k);
extern OPENMM_EXPORT void OpenMM_AmoebaStretchBendForce_getStretchBendParameters(const OpenMM_AmoebaStretchBendForce* target, int index, int* particle1, int* particle2, int* particle3, double* lengthAB, double* lengthCB, double* angle, double* k);
extern OPENMM_EXPORT void OpenMM_AmoebaStretchBendForce_setStretchBendParameters(OpenMM_AmoebaStretchBendForce* target, int index, int particle1, int particle2, int particle3, double lengthAB, double lengthCB, double angle, double k);

/* OpenMM::AmoebaWcaDispersionForce*/
extern OPENMM_EXPORT OpenMM_AmoebaWcaDispersionForce* OpenMM_AmoebaWcaDispersionForce_create();
extern OPENMM_EXPORT void OpenMM_AmoebaWcaDispersionForce_destroy(OpenMM_AmoebaWcaDispersionForce* target);
extern OPENMM_EXPORT int OpenMM_AmoebaWcaDispersionForce_getNumParticles(const OpenMM_AmoebaWcaDispersionForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaWcaDispersionForce_setParticleParameters(OpenMM_AmoebaWcaDispersionForce* target, int particleIndex, double radius, double epsilon);
extern OPENMM_EXPORT void OpenMM_AmoebaWcaDispersionForce_getParticleParameters(const OpenMM_AmoebaWcaDispersionForce* target, int particleIndex, double* radius, double* epsilon);
extern OPENMM_EXPORT int OpenMM_AmoebaWcaDispersionForce_addParticle(OpenMM_AmoebaWcaDispersionForce* target, double radius, double epsilon);
extern OPENMM_EXPORT double OpenMM_AmoebaWcaDispersionForce_getEpso(const OpenMM_AmoebaWcaDispersionForce* target);
extern OPENMM_EXPORT double OpenMM_AmoebaWcaDispersionForce_getEpsh(const OpenMM_AmoebaWcaDispersionForce* target);
extern OPENMM_EXPORT double OpenMM_AmoebaWcaDispersionForce_getRmino(const OpenMM_AmoebaWcaDispersionForce* target);
extern OPENMM_EXPORT double OpenMM_AmoebaWcaDispersionForce_getRminh(const OpenMM_AmoebaWcaDispersionForce* target);
extern OPENMM_EXPORT double OpenMM_AmoebaWcaDispersionForce_getAwater(const OpenMM_AmoebaWcaDispersionForce* target);
extern OPENMM_EXPORT double OpenMM_AmoebaWcaDispersionForce_getShctd(const OpenMM_AmoebaWcaDispersionForce* target);
extern OPENMM_EXPORT double OpenMM_AmoebaWcaDispersionForce_getDispoff(const OpenMM_AmoebaWcaDispersionForce* target);
extern OPENMM_EXPORT double OpenMM_AmoebaWcaDispersionForce_getSlevy(const OpenMM_AmoebaWcaDispersionForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaWcaDispersionForce_setEpso(OpenMM_AmoebaWcaDispersionForce* target, double inputValue);
extern OPENMM_EXPORT void OpenMM_AmoebaWcaDispersionForce_setEpsh(OpenMM_AmoebaWcaDispersionForce* target, double inputValue);
extern OPENMM_EXPORT void OpenMM_AmoebaWcaDispersionForce_setRmino(OpenMM_AmoebaWcaDispersionForce* target, double inputValue);
extern OPENMM_EXPORT void OpenMM_AmoebaWcaDispersionForce_setRminh(OpenMM_AmoebaWcaDispersionForce* target, double inputValue);
extern OPENMM_EXPORT void OpenMM_AmoebaWcaDispersionForce_setAwater(OpenMM_AmoebaWcaDispersionForce* target, double inputValue);
extern OPENMM_EXPORT void OpenMM_AmoebaWcaDispersionForce_setShctd(OpenMM_AmoebaWcaDispersionForce* target, double inputValue);
extern OPENMM_EXPORT void OpenMM_AmoebaWcaDispersionForce_setDispoff(OpenMM_AmoebaWcaDispersionForce* target, double inputValue);
extern OPENMM_EXPORT void OpenMM_AmoebaWcaDispersionForce_setSlevy(OpenMM_AmoebaWcaDispersionForce* target, double inputValue);

/* OpenMM::AmoebaOutOfPlaneBendForce*/
extern OPENMM_EXPORT OpenMM_AmoebaOutOfPlaneBendForce* OpenMM_AmoebaOutOfPlaneBendForce_create();
extern OPENMM_EXPORT void OpenMM_AmoebaOutOfPlaneBendForce_destroy(OpenMM_AmoebaOutOfPlaneBendForce* target);
extern OPENMM_EXPORT int OpenMM_AmoebaOutOfPlaneBendForce_getNumOutOfPlaneBends(const OpenMM_AmoebaOutOfPlaneBendForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaOutOfPlaneBendForce_setAmoebaGlobalOutOfPlaneBendCubic(OpenMM_AmoebaOutOfPlaneBendForce* target, double cubicK);
extern OPENMM_EXPORT double OpenMM_AmoebaOutOfPlaneBendForce_getAmoebaGlobalOutOfPlaneBendCubic(const OpenMM_AmoebaOutOfPlaneBendForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaOutOfPlaneBendForce_setAmoebaGlobalOutOfPlaneBendQuartic(OpenMM_AmoebaOutOfPlaneBendForce* target, double quarticK);
extern OPENMM_EXPORT double OpenMM_AmoebaOutOfPlaneBendForce_getAmoebaGlobalOutOfPlaneBendQuartic(const OpenMM_AmoebaOutOfPlaneBendForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaOutOfPlaneBendForce_setAmoebaGlobalOutOfPlaneBendPentic(OpenMM_AmoebaOutOfPlaneBendForce* target, double penticK);
extern OPENMM_EXPORT double OpenMM_AmoebaOutOfPlaneBendForce_getAmoebaGlobalOutOfPlaneBendPentic(const OpenMM_AmoebaOutOfPlaneBendForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaOutOfPlaneBendForce_setAmoebaGlobalOutOfPlaneBendSextic(OpenMM_AmoebaOutOfPlaneBendForce* target, double sexticK);
extern OPENMM_EXPORT double OpenMM_AmoebaOutOfPlaneBendForce_getAmoebaGlobalOutOfPlaneBendSextic(const OpenMM_AmoebaOutOfPlaneBendForce* target);
extern OPENMM_EXPORT int OpenMM_AmoebaOutOfPlaneBendForce_addOutOfPlaneBend(OpenMM_AmoebaOutOfPlaneBendForce* target, int particle1, int particle2, int particle3, int particle4, double k);
extern OPENMM_EXPORT void OpenMM_AmoebaOutOfPlaneBendForce_getOutOfPlaneBendParameters(const OpenMM_AmoebaOutOfPlaneBendForce* target, int index, int* particle1, int* particle2, int* particle3, int* particle4, double* k);
extern OPENMM_EXPORT void OpenMM_AmoebaOutOfPlaneBendForce_setOutOfPlaneBendParameters(OpenMM_AmoebaOutOfPlaneBendForce* target, int index, int particle1, int particle2, int particle3, int particle4, double k);

/* OpenMM::AmoebaGeneralizedKirkwoodForce*/
extern OPENMM_EXPORT OpenMM_AmoebaGeneralizedKirkwoodForce* OpenMM_AmoebaGeneralizedKirkwoodForce_create();
extern OPENMM_EXPORT void OpenMM_AmoebaGeneralizedKirkwoodForce_destroy(OpenMM_AmoebaGeneralizedKirkwoodForce* target);
extern OPENMM_EXPORT int OpenMM_AmoebaGeneralizedKirkwoodForce_getNumParticles(const OpenMM_AmoebaGeneralizedKirkwoodForce* target);
extern OPENMM_EXPORT int OpenMM_AmoebaGeneralizedKirkwoodForce_addParticle(OpenMM_AmoebaGeneralizedKirkwoodForce* target, double charge, double radius, double scalingFactor);
extern OPENMM_EXPORT void OpenMM_AmoebaGeneralizedKirkwoodForce_getParticleParameters(const OpenMM_AmoebaGeneralizedKirkwoodForce* target, int index, double* charge, double* radius, double* scalingFactor);
extern OPENMM_EXPORT void OpenMM_AmoebaGeneralizedKirkwoodForce_setParticleParameters(OpenMM_AmoebaGeneralizedKirkwoodForce* target, int index, double charge, double radius, double scalingFactor);
extern OPENMM_EXPORT double OpenMM_AmoebaGeneralizedKirkwoodForce_getSolventDielectric(const OpenMM_AmoebaGeneralizedKirkwoodForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaGeneralizedKirkwoodForce_setSolventDielectric(OpenMM_AmoebaGeneralizedKirkwoodForce* target, double dielectric);
extern OPENMM_EXPORT double OpenMM_AmoebaGeneralizedKirkwoodForce_getSoluteDielectric(const OpenMM_AmoebaGeneralizedKirkwoodForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaGeneralizedKirkwoodForce_setSoluteDielectric(OpenMM_AmoebaGeneralizedKirkwoodForce* target, double dielectric);
extern OPENMM_EXPORT int OpenMM_AmoebaGeneralizedKirkwoodForce_getIncludeCavityTerm(const OpenMM_AmoebaGeneralizedKirkwoodForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaGeneralizedKirkwoodForce_setIncludeCavityTerm(OpenMM_AmoebaGeneralizedKirkwoodForce* target, int includeCavityTerm);
extern OPENMM_EXPORT double OpenMM_AmoebaGeneralizedKirkwoodForce_getProbeRadius(const OpenMM_AmoebaGeneralizedKirkwoodForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaGeneralizedKirkwoodForce_setProbeRadius(OpenMM_AmoebaGeneralizedKirkwoodForce* target, double probeRadius);
extern OPENMM_EXPORT double OpenMM_AmoebaGeneralizedKirkwoodForce_getSurfaceAreaFactor(const OpenMM_AmoebaGeneralizedKirkwoodForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaGeneralizedKirkwoodForce_setSurfaceAreaFactor(OpenMM_AmoebaGeneralizedKirkwoodForce* target, double surfaceAreaFactor);

/* OpenMM::AmoebaUreyBradleyForce*/
extern OPENMM_EXPORT OpenMM_AmoebaUreyBradleyForce* OpenMM_AmoebaUreyBradleyForce_create();
extern OPENMM_EXPORT void OpenMM_AmoebaUreyBradleyForce_destroy(OpenMM_AmoebaUreyBradleyForce* target);
extern OPENMM_EXPORT int OpenMM_AmoebaUreyBradleyForce_getNumInteractions(const OpenMM_AmoebaUreyBradleyForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaUreyBradleyForce_setAmoebaGlobalUreyBradleyCubic(OpenMM_AmoebaUreyBradleyForce* target, double cubicK);
extern OPENMM_EXPORT double OpenMM_AmoebaUreyBradleyForce_getAmoebaGlobalUreyBradleyCubic(const OpenMM_AmoebaUreyBradleyForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaUreyBradleyForce_setAmoebaGlobalUreyBradleyQuartic(OpenMM_AmoebaUreyBradleyForce* target, double quarticK);
extern OPENMM_EXPORT double OpenMM_AmoebaUreyBradleyForce_getAmoebaGlobalUreyBradleyQuartic(const OpenMM_AmoebaUreyBradleyForce* target);
extern OPENMM_EXPORT int OpenMM_AmoebaUreyBradleyForce_addUreyBradley(OpenMM_AmoebaUreyBradleyForce* target, int particle1, int particle2, double length, double quadraticK);
extern OPENMM_EXPORT void OpenMM_AmoebaUreyBradleyForce_getUreyBradleyParameters(const OpenMM_AmoebaUreyBradleyForce* target, int index, int* particle1, int* particle2, double* length, double* quadraticK);
extern OPENMM_EXPORT void OpenMM_AmoebaUreyBradleyForce_setUreyBradleyParameters(OpenMM_AmoebaUreyBradleyForce* target, int index, int particle1, int particle2, double length, double quadraticK);

/* OpenMM::AmoebaTorsionForce*/
extern OPENMM_EXPORT OpenMM_AmoebaTorsionForce* OpenMM_AmoebaTorsionForce_create();
extern OPENMM_EXPORT void OpenMM_AmoebaTorsionForce_destroy(OpenMM_AmoebaTorsionForce* target);
extern OPENMM_EXPORT int OpenMM_AmoebaTorsionForce_getNumTorsions(const OpenMM_AmoebaTorsionForce* target);
extern OPENMM_EXPORT int OpenMM_AmoebaTorsionForce_addTorsion(OpenMM_AmoebaTorsionForce* target, int particle1, int particle2, int particle3, int particle4, const OpenMM_DoubleArray* torsion1, const OpenMM_DoubleArray* torsion2, const OpenMM_DoubleArray* torsion3);
extern OPENMM_EXPORT void OpenMM_AmoebaTorsionForce_getTorsionParameters(const OpenMM_AmoebaTorsionForce* target, int index, int* particle1, int* particle2, int* particle3, int* particle4, OpenMM_DoubleArray* torsion1, OpenMM_DoubleArray* torsion2, OpenMM_DoubleArray* torsion3);
extern OPENMM_EXPORT void OpenMM_AmoebaTorsionForce_setTorsionParameters(OpenMM_AmoebaTorsionForce* target, int index, int particle1, int particle2, int particle3, int particle4, const OpenMM_DoubleArray* torsion1, const OpenMM_DoubleArray* torsion2, const OpenMM_DoubleArray* torsion3);

/* OpenMM::AmoebaHarmonicBondForce*/
extern OPENMM_EXPORT OpenMM_AmoebaHarmonicBondForce* OpenMM_AmoebaHarmonicBondForce_create();
extern OPENMM_EXPORT void OpenMM_AmoebaHarmonicBondForce_destroy(OpenMM_AmoebaHarmonicBondForce* target);
extern OPENMM_EXPORT int OpenMM_AmoebaHarmonicBondForce_getNumBonds(const OpenMM_AmoebaHarmonicBondForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaHarmonicBondForce_setAmoebaGlobalHarmonicBondCubic(OpenMM_AmoebaHarmonicBondForce* target, double cubicK);
extern OPENMM_EXPORT double OpenMM_AmoebaHarmonicBondForce_getAmoebaGlobalHarmonicBondCubic(const OpenMM_AmoebaHarmonicBondForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaHarmonicBondForce_setAmoebaGlobalHarmonicBondQuartic(OpenMM_AmoebaHarmonicBondForce* target, double quarticK);
extern OPENMM_EXPORT double OpenMM_AmoebaHarmonicBondForce_getAmoebaGlobalHarmonicBondQuartic(const OpenMM_AmoebaHarmonicBondForce* target);
extern OPENMM_EXPORT int OpenMM_AmoebaHarmonicBondForce_addBond(OpenMM_AmoebaHarmonicBondForce* target, int particle1, int particle2, double length, double quadraticK);
extern OPENMM_EXPORT void OpenMM_AmoebaHarmonicBondForce_getBondParameters(const OpenMM_AmoebaHarmonicBondForce* target, int index, int* particle1, int* particle2, double* length, double* quadraticK);
extern OPENMM_EXPORT void OpenMM_AmoebaHarmonicBondForce_setBondParameters(OpenMM_AmoebaHarmonicBondForce* target, int index, int particle1, int particle2, double length, double quadraticK);

/* OpenMM::AmoebaHarmonicAngleForce*/
extern OPENMM_EXPORT OpenMM_AmoebaHarmonicAngleForce* OpenMM_AmoebaHarmonicAngleForce_create();
extern OPENMM_EXPORT void OpenMM_AmoebaHarmonicAngleForce_destroy(OpenMM_AmoebaHarmonicAngleForce* target);
extern OPENMM_EXPORT int OpenMM_AmoebaHarmonicAngleForce_getNumAngles(const OpenMM_AmoebaHarmonicAngleForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaHarmonicAngleForce_setAmoebaGlobalHarmonicAngleCubic(OpenMM_AmoebaHarmonicAngleForce* target, double cubicK);
extern OPENMM_EXPORT double OpenMM_AmoebaHarmonicAngleForce_getAmoebaGlobalHarmonicAngleCubic(const OpenMM_AmoebaHarmonicAngleForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaHarmonicAngleForce_setAmoebaGlobalHarmonicAngleQuartic(OpenMM_AmoebaHarmonicAngleForce* target, double quarticK);
extern OPENMM_EXPORT double OpenMM_AmoebaHarmonicAngleForce_getAmoebaGlobalHarmonicAngleQuartic(const OpenMM_AmoebaHarmonicAngleForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaHarmonicAngleForce_setAmoebaGlobalHarmonicAnglePentic(OpenMM_AmoebaHarmonicAngleForce* target, double penticK);
extern OPENMM_EXPORT double OpenMM_AmoebaHarmonicAngleForce_getAmoebaGlobalHarmonicAnglePentic(const OpenMM_AmoebaHarmonicAngleForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaHarmonicAngleForce_setAmoebaGlobalHarmonicAngleSextic(OpenMM_AmoebaHarmonicAngleForce* target, double sexticK);
extern OPENMM_EXPORT double OpenMM_AmoebaHarmonicAngleForce_getAmoebaGlobalHarmonicAngleSextic(const OpenMM_AmoebaHarmonicAngleForce* target);
extern OPENMM_EXPORT int OpenMM_AmoebaHarmonicAngleForce_addAngle(OpenMM_AmoebaHarmonicAngleForce* target, int particle1, int particle2, int particle3, double length, double quadraticK);
extern OPENMM_EXPORT void OpenMM_AmoebaHarmonicAngleForce_getAngleParameters(const OpenMM_AmoebaHarmonicAngleForce* target, int index, int* particle1, int* particle2, int* particle3, double* length, double* quadraticK);
extern OPENMM_EXPORT void OpenMM_AmoebaHarmonicAngleForce_setAngleParameters(OpenMM_AmoebaHarmonicAngleForce* target, int index, int particle1, int particle2, int particle3, double length, double quadraticK);

/* OpenMM::AmoebaTorsionTorsionForce*/
extern OPENMM_EXPORT OpenMM_AmoebaTorsionTorsionForce* OpenMM_AmoebaTorsionTorsionForce_create();
extern OPENMM_EXPORT void OpenMM_AmoebaTorsionTorsionForce_destroy(OpenMM_AmoebaTorsionTorsionForce* target);
extern OPENMM_EXPORT int OpenMM_AmoebaTorsionTorsionForce_getNumTorsionTorsions(const OpenMM_AmoebaTorsionTorsionForce* target);
extern OPENMM_EXPORT int OpenMM_AmoebaTorsionTorsionForce_getNumTorsionTorsionGrids(const OpenMM_AmoebaTorsionTorsionForce* target);
extern OPENMM_EXPORT int OpenMM_AmoebaTorsionTorsionForce_addTorsionTorsion(OpenMM_AmoebaTorsionTorsionForce* target, int particle1, int particle2, int particle3, int particle4, int particle5, int chiralCheckAtomIndex, int gridIndex);
extern OPENMM_EXPORT void OpenMM_AmoebaTorsionTorsionForce_getTorsionTorsionParameters(const OpenMM_AmoebaTorsionTorsionForce* target, int index, int* particle1, int* particle2, int* particle3, int* particle4, int* particle5, int* chiralCheckAtomIndex, int* gridIndex);
extern OPENMM_EXPORT void OpenMM_AmoebaTorsionTorsionForce_setTorsionTorsionParameters(OpenMM_AmoebaTorsionTorsionForce* target, int index, int particle1, int particle2, int particle3, int particle4, int particle5, int chiralCheckAtomIndex, int gridIndex);
extern OPENMM_EXPORT const OpenMM_3D_DoubleArray* OpenMM_AmoebaTorsionTorsionForce_getTorsionTorsionGrid(const OpenMM_AmoebaTorsionTorsionForce* target, int index);
extern OPENMM_EXPORT void OpenMM_AmoebaTorsionTorsionForce_setTorsionTorsionGrid(OpenMM_AmoebaTorsionTorsionForce* target, int index, const OpenMM_3D_DoubleArray* grid);

/* OpenMM::AmoebaPiTorsionForce*/
extern OPENMM_EXPORT OpenMM_AmoebaPiTorsionForce* OpenMM_AmoebaPiTorsionForce_create();
extern OPENMM_EXPORT void OpenMM_AmoebaPiTorsionForce_destroy(OpenMM_AmoebaPiTorsionForce* target);
extern OPENMM_EXPORT int OpenMM_AmoebaPiTorsionForce_getNumPiTorsions(const OpenMM_AmoebaPiTorsionForce* target);
extern OPENMM_EXPORT int OpenMM_AmoebaPiTorsionForce_addPiTorsion(OpenMM_AmoebaPiTorsionForce* target, int particle1, int particle2, int particle3, int particle4, int particle5, int particle6, double k);
extern OPENMM_EXPORT void OpenMM_AmoebaPiTorsionForce_getPiTorsionParameters(const OpenMM_AmoebaPiTorsionForce* target, int index, int* particle1, int* particle2, int* particle3, int* particle4, int* particle5, int* particle6, double* k);
extern OPENMM_EXPORT void OpenMM_AmoebaPiTorsionForce_setPiTorsionParameters(OpenMM_AmoebaPiTorsionForce* target, int index, int particle1, int particle2, int particle3, int particle4, int particle5, int particle6, double k);

/* OpenMM::AmoebaVdwForce*/
extern OPENMM_EXPORT OpenMM_AmoebaVdwForce* OpenMM_AmoebaVdwForce_create();
extern OPENMM_EXPORT void OpenMM_AmoebaVdwForce_destroy(OpenMM_AmoebaVdwForce* target);
extern OPENMM_EXPORT int OpenMM_AmoebaVdwForce_getNumParticles(const OpenMM_AmoebaVdwForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaVdwForce_setParticleParameters(OpenMM_AmoebaVdwForce* target, int particleIndex, int ivIndex, int classIndex, double sigma, double epsilon, double reductionFactor);
extern OPENMM_EXPORT void OpenMM_AmoebaVdwForce_getParticleParameters(const OpenMM_AmoebaVdwForce* target, int particleIndex, int* ivIndex, int* classIndex, double* sigma, double* epsilon, double* reductionFactor);
extern OPENMM_EXPORT int OpenMM_AmoebaVdwForce_addParticle(OpenMM_AmoebaVdwForce* target, int ivIndex, int classIndex, double sigma, double epsilon, double reductionFactor);
extern OPENMM_EXPORT void OpenMM_AmoebaVdwForce_setSigmaCombiningRule(OpenMM_AmoebaVdwForce* target, const char* sigmaCombiningRule);
extern OPENMM_EXPORT const char* OpenMM_AmoebaVdwForce_getSigmaCombiningRule(const OpenMM_AmoebaVdwForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaVdwForce_setEpsilonCombiningRule(OpenMM_AmoebaVdwForce* target, const char* epsilonCombiningRule);
extern OPENMM_EXPORT const char* OpenMM_AmoebaVdwForce_getEpsilonCombiningRule(const OpenMM_AmoebaVdwForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaVdwForce_setParticleExclusions(OpenMM_AmoebaVdwForce* target, int particleIndex, const OpenMM_IntArray* exclusions);
extern OPENMM_EXPORT void OpenMM_AmoebaVdwForce_getParticleExclusions(const OpenMM_AmoebaVdwForce* target, int particleIndex, OpenMM_IntArray* exclusions);
extern OPENMM_EXPORT void OpenMM_AmoebaVdwForce_setCutoff(OpenMM_AmoebaVdwForce* target, double cutoff);
extern OPENMM_EXPORT double OpenMM_AmoebaVdwForce_getCutoff(const OpenMM_AmoebaVdwForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaVdwForce_setUseNeighborList(OpenMM_AmoebaVdwForce* target, int neighborListFlag);
extern OPENMM_EXPORT int OpenMM_AmoebaVdwForce_getUseNeighborList(const OpenMM_AmoebaVdwForce* target);
extern OPENMM_EXPORT void OpenMM_AmoebaVdwForce_setPBC(OpenMM_AmoebaVdwForce* target, int pbcFlag);
extern OPENMM_EXPORT int OpenMM_AmoebaVdwForce_getPBC(const OpenMM_AmoebaVdwForce* target);

#if defined(__cplusplus)
}
#endif

#endif /*AMOEBA_OPENMM_CWRAPPER_H_*/
