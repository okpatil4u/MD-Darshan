# This file contains all API version specific info.  Should only need editing
# for major changes in the OpenMM API.

# Add base classes missing from the XML input file
MISSING_BASE_CLASSES = {'OpenMMException':'std::exception'}

# Doc strings to replace some fo the confusing ones generaged by swig
# Indexed by (className, methodName)
DOC_STRINGS = {("Context", "setPositions") :
                "setPositions(self, positions)",
               ("Context", "setVelocities") :
                "setVelocities(self, velocities)"}

# Do not generate wrappers for the following methods.
# Indexed by (className, [methodName [, numParams]])
SKIP_METHODS = [('State',),
                ('Stream',),
                ('Vec3',),
                ('AmoebaGeneralizedKirkwoodForceImpl',),
                ('AmoebaHarmonicAngleForceImpl',),
                ('AmoebaHarmonicBondForceImpl',),
                ('AmoebaHarmonicInPlaneAngleForceImpl',),
                ('AmoebaMultipoleForceImpl',),
                ('AmoebaOutOfPlaneBendForceImpl',),
                ('AmoebaPiTorsionForceImpl',),
                ('AmoebaStretchBendForceImpl',),
                ('AmoebaTorsionForceImpl',),
                ('AmoebaTorsionTorsionForceImpl',),
                ('AmoebaUreyBradleyForceImpl',),
                ('AmoebaVdwForceImpl',),
                ('AmoebaWcaDispersionForceImpl',),
                ('AndersenThermostatImpl',),
                ('AngleInfo',),
                ('ApplyAndersenThermostatKernel',),
                ('ApplyConstraintsKernel',),
                ('ApplyMonteCarloBarostatKernel',),
                ('BondInfo',),
                ('BondParameterInfo',),
                ('CalcAmoebaGeneralizedKirkwoodForceKernel',),
                ('CalcAmoebaHarmonicAngleForceKernel',),
                ('CalcAmoebaHarmonicBondForceKernel',),
                ('CalcAmoebaHarmonicInPlaneAngleForceKernel',),
                ('CalcAmoebaMultipoleForceKernel',),
                ('CalcAmoebaOutOfPlaneBendForceKernel',),
                ('CalcAmoebaPiTorsionForceKernel',),
                ('CalcAmoebaStretchBendForceKernel',),
                ('CalcAmoebaTorsionForceKernel',),
                ('CalcAmoebaTorsionTorsionForceKernel',),
                ('CalcAmoebaUreyBradleyForceKernel',),
                ('CalcAmoebaVdwForceKernel',),
                ('CalcAmoebaWcaDispersionForceKernel',),
                ('CalcCMAPTorsionForceKernel',),
                ('CalcCustomBondForceKernel',),
                ('CalcCustomExternalForceKernel',),
                ('CalcCustomAngleForceKernel',),
                ('CalcCustomGBForceKernel',),
                ('CalcCustomHbondForceKernel',),
                ('CalcCustomNonbondedForceKernel',),
                ('CalcCustomTorsionForceKernel',),
                ('CalcForcesAndEnergyKernel',),
                ('CalcGBSAOBCForceKernel',),
                ('CalcGBSAOBCSoftcoreForceKernel',),
                ('CalcGBVIForceKernel',),
                ('CalcGBVISoftcoreForceKernel',),
                ('CalcHarmonicAngleForceKernel',),
                ('CalcHarmonicBondForceKernel',),
                ('CalcKineticEnergyKernel',),
                ('CalcNonbondedForceKernel',),
                ('CalcNonbondedSoftcoreForceKernel',),
                ('CalcPeriodicTorsionForceKernel',),
                ('CalcRBTorsionForceKernel',),
                ('CMAPTorsionForceImpl',),
                ('CMMotionRemoverImpl',),
                ('ComputationInfo',),
                ('ConstraintInfo',),
                ('ContextImpl',),
                ('CudaKernelFactory',),
                ('CudaStreamFactory',),
                ('CustomAngleForceImpl',),
                ('CustomBondForceImpl',),
                ('CustomExternalForceImpl',),
                ('CustomGBForceImpl',),
                ('CustomHbondForceImpl',),
                ('CustomNonbondedForceImpl',),
                ('CustomTorsionForceImpl',),
                ('ExceptionInfo',),
                ('ExclusionInfo',),
                ('ForceImpl',),
                ('FunctionInfo',),
                ('GBSAOBCForceImpl',),
                ('GBSAOBCSoftcoreForce', 'getParticleParameters', 4),
                ('GBSAOBCSoftcoreForceImpl',),
                ('GBVIForceImpl',),
                ('GBVISoftcoreForce', 'getParticleParameters', 4),
                ('GBVISoftcoreForceImpl',),
                ('GlobalParameterInfo',),
                ('HarmonicAngleForceImpl',),
                ('HarmonicBondForceImpl',),
                ('InitializeForcesKernel',),
                ('IntegrateBrownianStepKernel',),
                ('IntegrateLangevinStepKernel',),
                ('IntegrateVariableLangevinStepKernel',),
                ('IntegrateVariableVerletStepKernel',),
                ('IntegrateVerletStepKernel',),
                ('IntegrateCustomStepKernel',),
                ('Kernel',),
                ('KernelFactory',),
                ('KernelImpl',),
                ('MonteCarloBarostatImpl',),
                ('MultipoleInfo',),
                ('NonbondedForceImpl',),
                ('NonbondedSoftcoreForce', 'getParticleParameters', 4),
                ('NonbondedSoftcoreForce', 'getExceptionParameters', 6),
                ('NonbondedSoftcoreForceImpl',),
                ('OutOfPlaneBendInfo',),
                ('ParameterInfo',),
                ('ParticleInfo',),
                ('PeriodicTorsionForceImpl',),
                ('PeriodicTorsionInfo',),
                ('PerParticleParameterInfo',),
                ('PiTorsionInfo',),
                ('PlatformData',),
                ('RBTorsionForceImpl',),
                ('RBTorsionInfo',),
                ('RemoveCMMotionKernel',),
                ('SplineFitter',),
                ('StreamFactory',),
                ('StreamImpl',),
                ('StretchBendInfo',),
                ('TorsionInfo',),
                ('TorsionTorsionGridInfo',),
                ('TorsionTorsionInfo',),
                ('UpdateStateDataKernel',),
                ('UpdateTimeKernel',),
                ('UreyBradleyInfo',),
                ('VdwInfo',),
                ('WcaDispersionInfo',),
                ('Context',  'getState'),
                ('CudaPlatform',),
                ('Force',    'Force'),
                ('ParticleParameterInfo',),
                ('Platform', 'createStream'),
                ('Platform', 'getDefaultStreamFactory'),
                ('Platform', 'registerStreamFactory'),
                ('Platform', 'contextCreated'),
                ('Platform', 'contextDestroyed'),
                ('Platform', 'createKernel'),
                ('Platform', 'registerKernelFactory'),
                ('IntegrateRPMDStepKernel',),
                ('RPMDIntegrator',  'getState'),
]

# The build script assumes method args that are non-const references are
# used to output values. This list gives excpetions to this rule.
NO_OUTPUT_ARGS = [('LocalEnergyMinimizer', 'minimize', 'context'),
                  ('System', 'getDefaultPeriodicBoxVectors', 'a'),
                  ('System', 'getDefaultPeriodicBoxVectors', 'b'),
                  ('System', 'getDefaultPeriodicBoxVectors', 'c'),
                  ('Platform', 'setPropertyValue', 'context'),
                  ('AmoebaTorsionForce', 'addTorsion', 'torsion1'),
                  ('AmoebaTorsionForce', 'addTorsion', 'torsion2'),
                  ('AmoebaTorsionForce', 'addTorsion', 'torsion3'),
                  ('AmoebaTorsionTorsionForce', 'setTorsionTorsionGrid', 'grid'),
                  ('AmoebaVdwForce', 'setParticleExclusions', 'exclusions'),
                  ('AmoebaMultipoleForce', 'addParticle', 'molecularDipole'),
                  ('AmoebaMultipoleForce', 'addParticle', 'molecularQuadrupole'),
                  ('AmoebaMultipoleForce', 'setCovalentMap', 'covalentAtoms'),
]

# SWIG assumes the target language shadow class owns the C++ class
# so by default, when the  shadow class is deleted, the C++ class is also.
# However, if a class is passed to another class, it may be appropriate to
# change this.  The following dict lists the (Class,Methods) for which the
# shadow class should *lose* ownership of the C++ class.
# The list is the argument position(s).
STEAL_OWNERSHIP = {("Platform", "registerPlatform") : [0],
                   ("System", "addForce") : [0],
                   ("System", "setVirtualSite") : [1],
}

# This is a list of units to attach to return values and method args.
# Indexed by (ClassName, MethodsName)
UNITS = {
("*", "getConstraintTolerance") : ("unit.dimensionless", ()),
("*", "getCutoffDistance") : ("unit.nanometers", ()),
("*", "getDefaultCollisionFrequency") : ("1/unit.picosecond", ()),
("*", "getDefaultPeriodicBoxVectors")
 : (None, ('unit.nanometer', 'unit.nanometer', 'unit.nanometer')),
("*", "getDefaultPressure") : ("unit.bar", ()),
("*", "getDefaultTemperature") : ("unit.kelvin", ()),
("*", "getErrorTolerance") : (None, ()),
("*", "getEwaldErrorTolerance") : (None, ()),
("*", "getFriction") : ("1/unit.picosecond", ()),
("*", "getGlobalVariable") : (None, ()),
("*", "getIntegrator") : (None, ()),
("*", "getMapParameters") : (None, ()),
("*", "getName") : (None, ()),
("*", "getNumAngles") : (None, ()),
("*", "getNumBonds") : (None, ()),
("*", "getNumPiTorsions") : (None, ()),
("*", "getNumConstraints") : (None, ()),
("*", "getNumExceptions") : (None, ()),
("*", "getNumForces") : (None, ()),
("*", "getNumMaps") : (None, ()),
("*", "getNumParticles") : (None, ()),
("*", "getNumPlatforms") : (None, ()),
("*", "getNumTorsions") : (None, ()),
("*", "getOpenMMVersion") : (None, ()),
("*", "getParticleMass") : ("unit.amu", ()),
("*", "getPlatform") : (None, ()),
("*", "getPlatformByName") : (None, ()),
("*", "getRandomNumberSeed") : (None, ()),
("*", "getReactionFieldDielectric") : ("unit.dimensionless", ()),
("*", "getSoluteDielectric") : ("unit.dimensionless", ()),
("*", "getSolventDielectric") : ("unit.dimensionless", ()),
("*", "getStepSize") : ("unit.picosecond", ()),
("*", "getSystem") : (None, ()),
("*", "getUseDispersionCorrection") : (None, ()),
("*", "getTemperature") : ("unit.kelvin", ()),
("*", "getUseDispersionCorrection") : (None, ()),
("*", "getWeight") : (None, ()),
("*", "getWeight12") : (None, ()),
("*", "getWeight13") : (None, ()),
("*", "getWeightCross") : (None, ()),
("SerializationNode", "getChildren") : (None, ()),
("SerializationNode", "getChildNode") : (None, ()),
("SerializationNode", "getProperties") : (None, ()),
("SerializationNode", "getStringProperty") : (None, ()),
("SerializationNode", "getIntProperty") : (None, ()),
("SerializationNode", "getDoubleProperty") : (None, ()),
("SerializationProxy", "getProxy") : (None, ()),
("SerializationProxy", "getTypeName") : (None, ()),

# check getSurfaceAreaFactor
("AmoebaGeneralizedKirkwoodForce",       "getParticleParameters")                         :  (None, ('unit.elementary_charge', 'unit.nanometer', 'unit.dimensionless')),
("AmoebaGeneralizedKirkwoodForce",       "getDielectricOffset")                           :  ( 'unit.nanometer', ()),
("AmoebaGeneralizedKirkwoodForce",       "getIncludeCavityTerm")                          :  ( None,()),
("AmoebaGeneralizedKirkwoodForce",       "getProbeRadius")                                :  ( 'unit.nanometer', ()),
("AmoebaGeneralizedKirkwoodForce",       "getSurfaceAreaFactor")                          :  ( '(unit.nanometer*unit.nanometer)/unit.kilojoule_per_mole',()),

("AmoebaHarmonicAngleForce",             "getAmoebaGlobalHarmonicAngleCubic")             :  ( None,()),
("AmoebaHarmonicAngleForce",             "getAmoebaGlobalHarmonicAngleQuartic")           :  ( None,()),
("AmoebaHarmonicAngleForce",             "getAmoebaGlobalHarmonicAnglePentic")            :  ( None,()),
("AmoebaHarmonicAngleForce",             "getAmoebaGlobalHarmonicAngleSextic")            :  ( None,()),
("AmoebaHarmonicAngleForce",             "getAngleParameters")                            :  ( None, (None, None, None, 'unit.radian', 'unit.kilojoule_per_mole/(unit.radian*unit.radian)')),

("AmoebaHarmonicBondForce",              "getAmoebaGlobalHarmonicBondCubic")              :  ( None,()),
("AmoebaHarmonicBondForce",              "getAmoebaGlobalHarmonicBondQuartic")            :  ( None,()),
("AmoebaHarmonicBondForce",              "getBondParameters")                             :  ( None, (None, None, 'unit.nanometer', 'unit.kilojoule_per_mole/(unit.nanometer*unit.nanometer)')),

("AmoebaHarmonicInPlaneAngleForce",      "getAmoebaGlobalHarmonicInPlaneAngleCubic")      :  ( None,()),
("AmoebaHarmonicInPlaneAngleForce",      "getAmoebaGlobalHarmonicInPlaneAngleQuartic")    :  ( None,()),
("AmoebaHarmonicInPlaneAngleForce",      "getAmoebaGlobalHarmonicInPlaneAnglePentic")     :  ( None,()),
("AmoebaHarmonicInPlaneAngleForce",      "getAmoebaGlobalHarmonicInPlaneAngleSextic")     :  ( None,()),
("AmoebaHarmonicInPlaneAngleForce",      "getAngleParameters")                            :  ( None, (None, None, None, None, 'unit.radian', 'unit.kilojoule_per_mole/(unit.radian*unit.radian)')),

("AmoebaMultipoleForce",                 "getNumMultipoles")                              :  ( None,()),
("AmoebaMultipoleForce",                 "getNonbondedMethod")                            :  ( None,()),
("AmoebaMultipoleForce",                 "getPolarizationType")                           :  ( None,()),
("AmoebaMultipoleForce",                 "getCutoffDistance")                             :  (  'unit.nanometer',()),
("AmoebaMultipoleForce",                 "getAEwald")                                     :  (  '1/unit.nanometer',()),
("AmoebaMultipoleForce",                 "getPmeBSplineOrder")                            :  ( None,()),
("AmoebaMultipoleForce",                 "getMutualInducedIterationMethod")               :  ( None, ()),
("AmoebaMultipoleForce",                 "getMutualInducedMaxIterations")                 :  ( None, ()),
("AmoebaMultipoleForce",                 "getMutualInducedTargetEpsilon")                 :  ( None, ()),
("AmoebaMultipoleForce",                 "getEwaldErrorTolerance")                        :  ( None, ()),
("AmoebaMultipoleForce",                 "getPmeGridDimensions")                          :  ( None,()),

# AmoebaMultipoleForce methods starting w/ getMultipoleParameters need work

# dipoleConversion        = AngstromToNm;
# quadrupoleConversion    = AngstromToNm*AngstromToNm;
# polarityConversion      = AngstromToNm*AngstromToNm*AngstromToNm;
# dampingFactorConversion = sqrt( AngstromToNm );

#    void getMultipoleParameters(int index, double& charge, std::vector<double>& molecularDipole, std::vector<double>& molecularQuadrupole,
#                                int& axisType, int& multipoleAtomZ, int& multipoleAtomX, int& multipoleAtomY, double& thole, double& dampingFactor, double& polarity ) const;
#    void getCovalentMap(int index, CovalentType typeId, std::vector<int>& covalentAtoms )
#    void getCovalentMaps(int index, std::vector < std::vector<int> >& covalentLists )

("AmoebaMultipoleForce",                 "getMultipoleParameters")                        :  ( None, ()),
("AmoebaMultipoleForce",                 "getCovalentMap")                                :  ( None, ()),
("AmoebaMultipoleForce",                 "getCovalentMaps")                               :  ( None, ()),
("AmoebaMultipoleForce",                 "getScalingDistanceCutoff")                      :  ( 'unit.nanometer', ()),
#("AmoebaMultipoleForce",                 "getElectricConstant")                           :  ( '1/(unit.nanometer*unit.kilojoule_per_mole)', ()),
("AmoebaMultipoleForce",                 "getElectricConstant")                           :  ( None, ()),

("AmoebaOutOfPlaneBendForce",            "getNumOutOfPlaneBends")                         :  ( None, ()),
("AmoebaOutOfPlaneBendForce",            "getAmoebaGlobalOutOfPlaneBendCubic")            :  ( None,()),
("AmoebaOutOfPlaneBendForce",            "getAmoebaGlobalOutOfPlaneBendQuartic")          :  ( None,()),
("AmoebaOutOfPlaneBendForce",            "getAmoebaGlobalOutOfPlaneBendPentic")           :  ( None,()),
("AmoebaOutOfPlaneBendForce",            "getAmoebaGlobalOutOfPlaneBendSextic")           :  ( None,()),
("AmoebaOutOfPlaneBendForce",            "getOutOfPlaneBendParameters")                   :  ( None, (None, None, None, None, 'unit.kilojoule_per_mole')),

("AmoebaPiTorsionForce",                  "getNumPiTorsions")                              :  ( None, ()),
("AmoebaPiTorsionForce",                  "getPiTorsionParameters")                        :  ( None, (None, None, None, None, None,  None, 'unit.kilojoule_per_mole')),

("AmoebaStretchBendForce",                "getNumStretchBends")                            :  ( None, ()),
("AmoebaStretchBendForce",                "getStretchBendParameters")                      :  ( None, (None, None, None, 'unit.nanometer', 'unit.nanometer', 'unit.radian', 'unit.kilojoule_per_mole/unit.nanometer')),

("AmoebaTorsionForce",                    "getNumTorsions")                                :  ( None, ()),
("AmoebaTorsionForce",                    "getTorsionParameters")                          :  ( None, ()),

("AmoebaTorsionTorsionForce",             "getNumTorsionTorsions")                         :  ( None, ()),
("AmoebaTorsionTorsionForce",             "getNumTorsionTorsionGrids")                     :  ( None, ()),
("AmoebaTorsionTorsionForce",             "getTorsionTorsionParameters")                   :  ( None, ()),
("AmoebaTorsionTorsionForce",             "getTorsionTorsionGrid")                         :  ( None, ()),

("AmoebaUreyBradleyForce",                "getNumInteractions")                            :  ( None, ()),
("AmoebaUreyBradleyForce",                "getAmoebaGlobalUreyBradleyCubic")               :  ( None, ()),
("AmoebaUreyBradleyForce",                "getAmoebaGlobalUreyBradleyQuartic")             :  ( None, ()),
("AmoebaUreyBradleyForce",                "getUreyBradleyParameters")                      :  ( None, (None, None, 'unit.nanometer', 'unit.kilojoule_per_mole/(unit.nanometer*unit.nanometer)')),

("AmoebaVdwForce",                        "getParticleParameters")                         :  ( None, ('unit.dimensionless', 'unit.dimensionless', 'unit.dimensionless', 'unit.nanometer', 'unit.kilojoule_per_mole', 'unit.dimensionless')),
("AmoebaVdwForce",                        "getSigmaCombiningRule")                         :  ( None, ()),
("AmoebaVdwForce",                        "getEpsilonCombiningRule")                       :  ( None, ()),
("AmoebaVdwForce",                        "getParticleExclusions")                         :  ( None, ()),
("AmoebaVdwForce",                        "getCutoff")                                     :  ( 'unit.nanometer', ()),
("AmoebaVdwForce",                        "getUseNeighborList")                            :  ( None, ()),
("AmoebaVdwForce",                        "getPBC")                                        :  ( None, ()),
("AmoebaVdwForce",                        "getParticleParameters")                         :  ( None, (None, None, 'unit.nanometer', 'unit.kilojoule_per_mole', None)),

("AmoebaWcaDispersionForce",              "getParticleParameters")                         :  ( None, ('unit.nanometer', 'unit.kilojoule_per_mole')),
("AmoebaWcaDispersionForce",              "getAwater")                                     :  ( '1/(unit.nanometer*unit.nanometer*unit.nanometer)',()),
("AmoebaWcaDispersionForce",              "getDispoff")                                    :  ( 'unit.nanometer',()),
("AmoebaWcaDispersionForce",              "getRmino")                                      :  ( 'unit.nanometer',()),
("AmoebaWcaDispersionForce",              "getRminh")                                      :  ( 'unit.nanometer',()),
("AmoebaWcaDispersionForce",              "getEpso")                                       :  ( 'unit.kilojoule_per_mole',()),
("AmoebaWcaDispersionForce",              "getEpsh")                                       :  ( 'unit.kilojoule_per_mole',()),
("AmoebaWcaDispersionForce",              "getSlevy")                                      :  ( None, ()),
("AmoebaWcaDispersionForce",              "getShctd")                                      :  ( None, ()),

("Context", "getParameter") : (None, ()),
("CMAPTorsionForce", "getMapParameters") : (None, ()),
("CMAPTorsionForce", "getTorsionParameters") : (None, ()),
("CMMotionRemover", "getFrequency") : (None, ()),
("CustomAngleForce", "getNumPerAngleParameters") : (None, ()),
("CustomAngleForce", "getNumGlobalParameters") : (None, ()),
("CustomAngleForce", "getEnergyFunction") : (None, ()),
("CustomAngleForce", "getPerAngleParameterName") : (None, ()),
("CustomAngleForce", "getGlobalParameterName") : (None, ()),
("CustomAngleForce", "getGlobalParameterDefaultValue") : (None, ()),
("CustomAngleForce", "getAngleParameters") : (None, ()),
("CustomBondForce", "getNumPerBondParameters") : (None, ()),
("CustomBondForce", "getNumGlobalParameters") : (None, ()),
("CustomBondForce", "getEnergyFunction") : (None, ()),
("CustomBondForce", "getPerBondParameterName") : (None, ()),
("CustomBondForce", "getGlobalParameterName") : (None, ()),
("CustomBondForce", "getGlobalParameterDefaultValue") : (None, ()),
("CustomBondForce", "getBondParameters") : (None, ()),
("CustomExternalForce", "getNumPerParticleParameters") : (None, ()),
("CustomExternalForce", "getNumGlobalParameters") : (None, ()),
("CustomExternalForce", "getEnergyFunction") : (None, ()),
("CustomExternalForce", "getPerParticleParameterName") : (None, ()),
("CustomExternalForce", "getGlobalParameterName") : (None, ()),
("CustomExternalForce", "getGlobalParameterDefaultValue") : (None, ()),
("CustomExternalForce", "getParticleParameters") : (None, ()),
("CustomGBForce", "getNumExclusions") : (None, ()),
("CustomGBForce", "getNumPerParticleParameters") : (None, ()),
("CustomGBForce", "getNumGlobalParameters") : (None, ()),
("CustomGBForce", "getNumFunctions") : (None, ()),
("CustomGBForce", "getNumComputedValues") : (None, ()),
("CustomGBForce", "getNumEnergyTerms") : (None, ()),
("CustomGBForce", "getNonbondedMethod") : (None, ()),
("CustomGBForce", "getPerParticleParameterName") : (None, ()),
("CustomGBForce", "getGlobalParameterName") : (None, ()),
("CustomGBForce", "getGlobalParameterDefaultValue") : (None, ()),
("CustomGBForce", "getParticleParameters") : (None, ()),
("CustomGBForce", "getComputedValueParameters") : (None, ()),
("CustomGBForce", "getEnergyTermParameters") : (None, ()),
("CustomGBForce", "getExclusionParticles") : (None, ()),
("CustomGBForce", "getFunctionParameters") : (None, ()),
("CustomHbondForce", "getAcceptorParameters") : (None, ()),
("CustomHbondForce", "getDonorParameters") : (None, ()),
("CustomHbondForce", "getEnergyFunction") : (None, ()),
("CustomHbondForce", "getExclusionParticles") : (None, ()),
("CustomHbondForce", "getFunctionParameters") : (None, ()),
("CustomHbondForce", "getNonbondedMethod") : (None, ()),
("CustomHbondForce", "getNumAcceptors") : (None, ()),
("CustomHbondForce", "getNumDonors") : (None, ()),
("CustomHbondForce", "getNumExclusions") : (None, ()),
("CustomHbondForce", "getNumFunctions") : (None, ()),
("CustomHbondForce", "getNumGlobalParameters") : (None, ()),
("CustomHbondForce", "getNumPerAcceptorParameters") : (None, ()),
("CustomHbondForce", "getNumPerDonorParameters") : (None, ()),
("CustomHbondForce", "getGlobalParameterDefaultValue") : (None, ()),
("CustomHbondForce", "getGlobalParameterName") : (None, ()),
("CustomHbondForce", "getPerAcceptorParameterName") : (None, ()),
("CustomHbondForce", "getPerDonorParameterName") : (None, ()),
("CustomNonbondedForce", "getEnergyFunction") : (None, ()),
("CustomNonbondedForce", "getExceptionParameters") : (None, ()),
("CustomNonbondedForce", "getExclusionParticles") : (None, ()),
("CustomNonbondedForce", "getFunctionParameters") : (None, ()),
("CustomNonbondedForce", "getGlobalParameterDefaultValue") : (None, ()),
("CustomNonbondedForce", "getGlobalParameterName") : (None, ()),
("CustomNonbondedForce", "getNonbondedMethod") : (None, ()),
("CustomNonbondedForce", "getNumExclusions") : (None, ()),
("CustomNonbondedForce", "getNumFunctions") : (None, ()),
("CustomNonbondedForce", "getNumPerParticleParameters") : (None, ()),
("CustomNonbondedForce", "getNumParameters") : (None, ()),
("CustomNonbondedForce", "getNumGlobalParameters") : (None, ()),
("CustomNonbondedForce", "getParameterCombiningRule") : (None, ()),
("CustomNonbondedForce", "getParameterName") : (None, ()),
("CustomNonbondedForce", "getParticleParameters") : (None, ()),
("CustomNonbondedForce", "getPerParticleParameterName") : (None, ()),
("CustomTorsionForce", "getNumPerTorsionParameters") : (None, ()),
("CustomTorsionForce", "getNumGlobalParameters") : (None, ()),
("CustomTorsionForce", "getEnergyFunction") : (None, ()),
("CustomTorsionForce", "getPerTorsionParameterName") : (None, ()),
("CustomTorsionForce", "getGlobalParameterName") : (None, ()),
("CustomTorsionForce", "getGlobalParameterDefaultValue") : (None, ()),
("CustomTorsionForce", "getTorsionParameters") : (None, ()),
("GBSAOBCForce", "getNonbondedMethod") : (None, ()),
("GBSAOBCForce", "getParticleParameters")
 : (None, ('unit.elementary_charge',
           'unit.nanometer', 'unit.dimensionless')),
("GBVIForce", "getNonbondedMethod") : (None, ()),
("GBVIForce", "getBornRadiusScalingMethod") : (None, ()),
("GBVIForce", "getQuinticLowerLimitFactor") : (None, ()),
("GBVIForce", "getQuinticUpperBornRadiusLimit") : ('unit.nanometer', ()),
("GBVIForce", "getBondParameters")
 : (None, (None, None, 'unit.nanometer')),
("GBVIForce", "getParticleParameters")
 : (None, ('unit.elementary_charge',
           'unit.nanometer', 'unit.kilojoule_per_mole')),
("GBSAOBCSoftcoreForce", "getNonbondedMethod") : (None, ()),
("GBSAOBCSoftcoreForce", "getParticleParameters")
 : (None, ('unit.elementary_charge', 'unit.nanometer',
           'unit.dimensionless', 'unit.dimensionless')),
("GBSAOBCSoftcoreForce", "getNonPolarPrefactor")
 : ('unit.kilojoule_per_mole/(unit.nanometer*unit.nanometer)', ()),
("GBVISoftcoreForce", "getParticleParameters")
 : (None, ('unit.elementary_charge', 'unit.nanometer',
           'unit.kilojoule_per_mole', 'unit.dimensionless')),
("GBVISoftcoreForce", "getBondParameters")
 : (None, (None, None, 'unit.nanometer')),
("GBVISoftcoreForce", "getNonbondedMethod") : (None, ()),
("GBVISoftcoreForce", "getBornRadiusScalingMethod") : (None, ()),
("GBVISoftcoreForce", "getQuinticLowerLimitFactor") : (None, ()),
("GBVISoftcoreForce", "getQuinticUpperBornRadiusLimit") : ('unit.nanometer',()),
("HarmonicAngleForce", "getAngleParameters")
 : (None, (None, None, None, 'unit.radian',
           'unit.kilojoule_per_mole/(unit.radian*unit.radian)')),
("HarmonicBondForce", "getBondParameters")
 : (None, (None, None, 'unit.nanometer',
           'unit.kilojoule_per_mole/(unit.nanometer*unit.nanometer)')),
("MonteCarloBarostat", "getFrequency") : (None, ()),
("NonbondedForce", "getExceptionParameters")
 : (None, (None, None,
           'unit.elementary_charge*unit.elementary_charge',
           'unit.nanometer', 'unit.kilojoule_per_mole')),
("NonbondedForce", "getNonbondedMethod") : (None, ()),
("NonbondedForce", "getParticleParameters")
 : (None, ('unit.elementary_charge',
           'unit.nanometer', 'unit.kilojoule_per_mole')),
("NonbondedSoftcoreForce", "getNonbondedMethod") : (None, ()),
("NonbondedSoftcoreForce", "getParticleParameters")
 : (None, ('unit.elementary_charge', 'unit.nanometer',
           'unit.kilojoule_per_mole', 'unit.dimensionless')),
("NonbondedSoftcoreForce", "getExceptionParameters")
 : (None, (None, None,
           'unit.elementary_charge*unit.elementary_charge',
           'unit.nanometer', 'unit.kilojoule_per_mole',
           'unit.dimensionless')),
("PeriodicTorsionForce", "getTorsionParameters")
 : (None, (None, None, None, None,
           None, 'unit.radian', 'unit.kilojoule_per_mole')),
("Platform", "getDefaultPluginsDirectory") : (None, ()),
("Platform", "getPropertyDefaultValue") : (None, ()),
("Platform", "getPropertyNames") : (None, ()),
("Platform", "getPropertyValue") : (None, ()),
("Platform", "getSpeed") : (None, ()),
("RBTorsionForce", "getTorsionParameters")
 : (None, (None, None, None, None,
           None, None, None, None, None, None)),
("System", "getConstraintParameters") : (None, (None, None, 'unit.nanometer')),
("System", "getForce") : (None, ()),
("System", "getVirtualSite") : (None, ()),
}

