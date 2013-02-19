
MODULE OpenMM_Types
    implicit none

    ! Global Constants
 
    real*8 OpenMM_KJPerKcal
    real*8 OpenMM_RadiansPerDegree
    real*8 OpenMM_KcalPerKJ
    real*8 OpenMM_PsPerFs
    real*8 OpenMM_AngstromsPerNm
    real*8 OpenMM_FsPerPs
    real*8 OpenMM_SigmaPerVdwRadius
    real*8 OpenMM_NmPerAngstrom
    real*8 OpenMM_VdwRadiusPerSigma
    real*8 OpenMM_DegreesPerRadian
    parameter(OpenMM_KJPerKcal=4.184)
    parameter(OpenMM_RadiansPerDegree=0.017453292519943295)
    parameter(OpenMM_KcalPerKJ=0.2390057361376673)
    parameter(OpenMM_PsPerFs=0.001)
    parameter(OpenMM_AngstromsPerNm=10)
    parameter(OpenMM_FsPerPs=1000)
    parameter(OpenMM_SigmaPerVdwRadius=1.7817974362806785)
    parameter(OpenMM_NmPerAngstrom=0.1)
    parameter(OpenMM_VdwRadiusPerSigma=0.5612310241546865)
    parameter(OpenMM_DegreesPerRadian=57.29577951308232)

    ! Type Declarations
 
    type OpenMM_HarmonicBondForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_BrownianIntegrator
        integer*8 :: handle = 0
    end type
 
    type OpenMM_OpenMMException
        integer*8 :: handle = 0
    end type
 
    type OpenMM_NonbondedForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_TwoParticleAverageSite
        integer*8 :: handle = 0
    end type
 
    type OpenMM_VariableLangevinIntegrator
        integer*8 :: handle = 0
    end type
 
    type OpenMM_CustomExternalForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_GBVIForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_CustomGBForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_MonteCarloBarostat
        integer*8 :: handle = 0
    end type
 
    type OpenMM_Context
        integer*8 :: handle = 0
    end type
 
    type OpenMM_LocalEnergyMinimizer
        integer*8 :: handle = 0
    end type
 
    type OpenMM_GBSAOBCForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_VariableVerletIntegrator
        integer*8 :: handle = 0
    end type
 
    type OpenMM_OutOfPlaneSite
        integer*8 :: handle = 0
    end type
 
    type OpenMM_VerletIntegrator
        integer*8 :: handle = 0
    end type
 
    type OpenMM_CustomHbondForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_ContextImpl
        integer*8 :: handle = 0
    end type
 
    type OpenMM_CMMotionRemover
        integer*8 :: handle = 0
    end type
 
    type OpenMM_RBTorsionForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_CustomIntegrator
        integer*8 :: handle = 0
    end type
 
    type OpenMM_LangevinIntegrator
        integer*8 :: handle = 0
    end type
 
    type OpenMM_Force
        integer*8 :: handle = 0
    end type
 
    type OpenMM_CMAPTorsionForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_HarmonicAngleForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_VirtualSite
        integer*8 :: handle = 0
    end type
 
    type OpenMM_CustomNonbondedForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_AndersenThermostat
        integer*8 :: handle = 0
    end type
 
    type OpenMM_ForceImpl
        integer*8 :: handle = 0
    end type
 
    type OpenMM_CustomTorsionForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_Platform
        integer*8 :: handle = 0
    end type
 
    type OpenMM_State
        integer*8 :: handle = 0
    end type
 
    type OpenMM_PeriodicTorsionForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_Integrator
        integer*8 :: handle = 0
    end type
 
    type OpenMM_CustomBondForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_CustomAngleForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_ThreeParticleAverageSite
        integer*8 :: handle = 0
    end type
 
    type OpenMM_System
        integer*8 :: handle = 0
    end type
 
    type OpenMM_Vec3Array
        integer*8 :: handle = 0
    end type

    type OpenMM_StringArray
        integer*8 :: handle = 0
    end type

    type OpenMM_BondArray
        integer*8 :: handle = 0
    end type

    type OpenMM_ParameterArray
        integer*8 :: handle = 0
    end type

    type OpenMM_PropertyArray
        integer*8 :: handle = 0
    end type

    type OpenMM_DoubleArray
        integer*8 :: handle = 0
    end type

    ! Enumerations

    integer*4 OpenMM_False
    integer*4 OpenMM_True
    parameter(OpenMM_False=0)
    parameter(OpenMM_True=1)
 
    integer*4 OpenMM_NonbondedForce_NoCutoff
    integer*4 OpenMM_NonbondedForce_CutoffNonPeriodic
    integer*4 OpenMM_NonbondedForce_CutoffPeriodic
    integer*4 OpenMM_NonbondedForce_Ewald
    integer*4 OpenMM_NonbondedForce_PME
    parameter(OpenMM_NonbondedForce_NoCutoff=0)
    parameter(OpenMM_NonbondedForce_CutoffNonPeriodic=1)
    parameter(OpenMM_NonbondedForce_CutoffPeriodic=2)
    parameter(OpenMM_NonbondedForce_Ewald=3)
    parameter(OpenMM_NonbondedForce_PME=4)

    integer*4 OpenMM_GBVIForce_NoCutoff
    integer*4 OpenMM_GBVIForce_CutoffNonPeriodic
    integer*4 OpenMM_GBVIForce_CutoffPeriodic
    parameter(OpenMM_GBVIForce_NoCutoff=0)
    parameter(OpenMM_GBVIForce_CutoffNonPeriodic=1)
    parameter(OpenMM_GBVIForce_CutoffPeriodic=2)

    integer*4 OpenMM_GBVIForce_NoScaling
    integer*4 OpenMM_GBVIForce_QuinticSpline
    parameter(OpenMM_GBVIForce_NoScaling=0)
    parameter(OpenMM_GBVIForce_QuinticSpline=1)

    integer*4 OpenMM_CustomGBForce_NoCutoff
    integer*4 OpenMM_CustomGBForce_CutoffNonPeriodic
    integer*4 OpenMM_CustomGBForce_CutoffPeriodic
    parameter(OpenMM_CustomGBForce_NoCutoff=0)
    parameter(OpenMM_CustomGBForce_CutoffNonPeriodic=1)
    parameter(OpenMM_CustomGBForce_CutoffPeriodic=2)

    integer*4 OpenMM_CustomGBForce_SingleParticle
    integer*4 OpenMM_CustomGBForce_ParticlePair
    integer*4 OpenMM_CustomGBForce_ParticlePairNoExclusions
    parameter(OpenMM_CustomGBForce_SingleParticle=0)
    parameter(OpenMM_CustomGBForce_ParticlePair=1)
    parameter(OpenMM_CustomGBForce_ParticlePairNoExclusions=2)

    integer*4 OpenMM_GBSAOBCForce_NoCutoff
    integer*4 OpenMM_GBSAOBCForce_CutoffNonPeriodic
    integer*4 OpenMM_GBSAOBCForce_CutoffPeriodic
    parameter(OpenMM_GBSAOBCForce_NoCutoff=0)
    parameter(OpenMM_GBSAOBCForce_CutoffNonPeriodic=1)
    parameter(OpenMM_GBSAOBCForce_CutoffPeriodic=2)

    integer*4 OpenMM_CustomHbondForce_NoCutoff
    integer*4 OpenMM_CustomHbondForce_CutoffNonPeriodic
    integer*4 OpenMM_CustomHbondForce_CutoffPeriodic
    parameter(OpenMM_CustomHbondForce_NoCutoff=0)
    parameter(OpenMM_CustomHbondForce_CutoffNonPeriodic=1)
    parameter(OpenMM_CustomHbondForce_CutoffPeriodic=2)

    integer*4 OpenMM_CustomIntegrator_ComputeGlobal
    integer*4 OpenMM_CustomIntegrator_ComputePerDof
    integer*4 OpenMM_CustomIntegrator_ComputeSum
    integer*4 OpenMM_CustomIntegrator_ConstrainPositions
    integer*4 OpenMM_CustomIntegrator_ConstrainVelocities
    integer*4 OpenMM_CustomIntegrator_UpdateContextState
    parameter(OpenMM_CustomIntegrator_ComputeGlobal=0)
    parameter(OpenMM_CustomIntegrator_ComputePerDof=1)
    parameter(OpenMM_CustomIntegrator_ComputeSum=2)
    parameter(OpenMM_CustomIntegrator_ConstrainPositions=3)
    parameter(OpenMM_CustomIntegrator_ConstrainVelocities=4)
    parameter(OpenMM_CustomIntegrator_UpdateContextState=5)

    integer*4 OpenMM_CustomNonbondedForce_NoCutoff
    integer*4 OpenMM_CustomNonbondedForce_CutoffNonPeriodic
    integer*4 OpenMM_CustomNonbondedForce_CutoffPeriodic
    parameter(OpenMM_CustomNonbondedForce_NoCutoff=0)
    parameter(OpenMM_CustomNonbondedForce_CutoffNonPeriodic=1)
    parameter(OpenMM_CustomNonbondedForce_CutoffPeriodic=2)

    integer*4 OpenMM_State_Positions
    integer*4 OpenMM_State_Velocities
    integer*4 OpenMM_State_Forces
    integer*4 OpenMM_State_Energy
    integer*4 OpenMM_State_Parameters
    parameter(OpenMM_State_Positions=1)
    parameter(OpenMM_State_Velocities=2)
    parameter(OpenMM_State_Forces=4)
    parameter(OpenMM_State_Energy=8)
    parameter(OpenMM_State_Parameters=16)

END MODULE OpenMM_Types

MODULE OpenMM
    use OpenMM_Types; implicit none
    interface

        ! OpenMM_Vec3
        subroutine OpenMM_Vec3_scale(vec, scale, result)
            use OpenMM_Types; implicit none
            real*8 vec(3)
            real*8 scale
            real*8 result(3)
        end

        ! OpenMM_Vec3Array
        subroutine OpenMM_Vec3Array_create(result, size)
            use OpenMM_Types; implicit none
            integer*4 size
            type (OpenMM_Vec3Array) result
        end
        subroutine OpenMM_Vec3Array_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_Vec3Array) destroy
        end
        function OpenMM_Vec3Array_getSize(target)
            use OpenMM_Types; implicit none
            type (OpenMM_Vec3Array) target
            integer*4 OpenMM_Vec3Array_getSize
        end
        subroutine OpenMM_Vec3Array_resize(target, size)
            use OpenMM_Types; implicit none
            type (OpenMM_Vec3Array) target
            integer*4 size
        end
        subroutine OpenMM_Vec3Array_append(target, vec)
            use OpenMM_Types; implicit none
            type (OpenMM_Vec3Array) target
            real*8 vec(3)
        end
        subroutine OpenMM_Vec3Array_set(target, index, vec)
            use OpenMM_Types; implicit none
            type (OpenMM_Vec3Array) target
            integer*4 index
            real*8 vec(3)
        end
        subroutine OpenMM_Vec3Array_get(target, index, result)
            use OpenMM_Types; implicit none
            type (OpenMM_Vec3Array) target
            integer*4 index
            real*8 result(3)
        end

        ! OpenMM_StringArray
        subroutine OpenMM_StringArray_create(result, size)
            use OpenMM_Types; implicit none
            integer*4 size
            type (OpenMM_StringArray) result
        end
        subroutine OpenMM_StringArray_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_StringArray) destroy
        end
        function OpenMM_StringArray_getSize(target)
            use OpenMM_Types; implicit none
            type (OpenMM_StringArray) target
            integer*4 OpenMM_StringArray_getSize
        end
        subroutine OpenMM_StringArray_resize(target, size)
            use OpenMM_Types; implicit none
            type (OpenMM_StringArray) target
            integer*4 size
        end
        subroutine OpenMM_StringArray_append(target, str)
            use OpenMM_Types; implicit none
            type (OpenMM_StringArray) target
            character(*) str
        end
        subroutine OpenMM_StringArray_set(target, index, str)
            use OpenMM_Types; implicit none
            type (OpenMM_StringArray) target
            integer*4 index
            character(*) str
        end
        subroutine OpenMM_StringArray_get(target, index, result)
            use OpenMM_Types; implicit none
            type (OpenMM_StringArray) target
            integer*4 index
            character(*) result
        end

        ! OpenMM_BondArray
        subroutine OpenMM_BondArray_create(result, size)
            use OpenMM_Types; implicit none
            integer*4 size
            type (OpenMM_BondArray) result
        end
        subroutine OpenMM_BondArray_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_BondArray) destroy
        end
        function OpenMM_BondArray_getSize(target)
            use OpenMM_Types; implicit none
            type (OpenMM_BondArray) target
            integer*4 OpenMM_BondArray_getSize
        end
        subroutine OpenMM_BondArray_resize(target, size)
            use OpenMM_Types; implicit none
            type (OpenMM_BondArray) target
            integer*4 size
        end
        subroutine OpenMM_BondArray_append(target, particle1, particle2)
            use OpenMM_Types; implicit none
            type (OpenMM_BondArray) target
            integer*4 particle1
            integer*4 particle2
        end
        subroutine OpenMM_BondArray_set(target, index, particle1, particle2)
            use OpenMM_Types; implicit none
            type (OpenMM_BondArray) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
        end
        subroutine OpenMM_BondArray_get(target, index, particle1, particle2)
            use OpenMM_Types; implicit none
            type (OpenMM_BondArray) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
        end

        ! OpenMM_ParameterArray
        function OpenMM_ParameterArray_getSize(target)
            use OpenMM_Types; implicit none
            type (OpenMM_ParameterArray) target
            integer*4 OpenMM_ParameterArray_getSize
        end
        subroutine OpenMM_ParameterArray_get(target, name, result)
            use OpenMM_Types; implicit none
            type (OpenMM_ParameterArray) target
            character(*) name
            character(*) result
        end

        ! OpenMM_PropertyArray
        function OpenMM_PropertyArray_getSize(target)
            use OpenMM_Types; implicit none
            type (OpenMM_ParameterArray) target
            integer*4 OpenMM_PropertyArray_getSize
        end
        subroutine OpenMM_PropertyArray_get(target, name, result)
            use OpenMM_Types; implicit none
            type (OpenMM_PropertyArray) target
            character(*) name
            character(*) result
        end

        ! OpenMM_DoubleArray
        subroutine OpenMM_DoubleArray_create(result, size)
            use OpenMM_Types; implicit none
            integer*4 size
            type (OpenMM_DoubleArray) result
        end
        subroutine OpenMM_DoubleArray_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_DoubleArray) destroy
        end
        function OpenMM_DoubleArray_getSize(target)
            use OpenMM_Types; implicit none
            type (OpenMM_DoubleArray) target
            integer*4 OpenMM_DoubleArray_getSize
        end
        subroutine OpenMM_DoubleArray_resize(target, size)
            use OpenMM_Types; implicit none
            type (OpenMM_DoubleArray) target
            integer*4 size
        end
        subroutine OpenMM_DoubleArray_append(target, value)
            use OpenMM_Types; implicit none
            type (OpenMM_DoubleArray) target
            real*8 value
        end
        subroutine OpenMM_DoubleArray_set(target, index, value)
            use OpenMM_Types; implicit none
            type (OpenMM_DoubleArray) target
            integer*4 index
            real*8 value
        end
        subroutine OpenMM_DoubleArray_get(target, index, result)
            use OpenMM_Types; implicit none
            type (OpenMM_DoubleArray) target
            integer*4 index
            real*8 result
        end


        ! These methods need to be handled specially, since their C++ APIs cannot be directly translated to Fortran.
        ! Unlike the C++ versions, the return value is allocated on the heap, and you must delete it yourself.
        subroutine OpenMM_Context_getState(target, types, enforcePeriodicBox, result)
            use OpenMM_Types; implicit none
            type (OpenMM_Context) target
            integer*4 types
            integer*4 enforcePeriodicBox
            type (OpenMM_State) result
        end

        subroutine OpenMM_Platform_loadPluginsFromDirectory(directory, result)
            use OpenMM_Types; implicit none
            character(*) directory
            type (OpenMM_StringArray) result
        end

 
 

        ! OpenMM::HarmonicBondForce
        subroutine OpenMM_HarmonicBondForce_create(result)
            use OpenMM_Types; implicit none
            type (OpenMM_HarmonicBondForce) result
        end
        subroutine OpenMM_HarmonicBondForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_HarmonicBondForce) destroy
        end
        function OpenMM_HarmonicBondForce_getNumBonds(target)
            use OpenMM_Types; implicit none
            type (OpenMM_HarmonicBondForce) target
            integer*4  OpenMM_HarmonicBondForce_getNumBonds
        end
        function OpenMM_HarmonicBondForce_addBond(target, &
                          particle1, &
                          particle2, &
                          length, &
                          k)
            use OpenMM_Types; implicit none
            type (OpenMM_HarmonicBondForce) target
            integer*4 particle1
            integer*4 particle2
            real*8 length
            real*8 k
            integer*4  OpenMM_HarmonicBondForce_addBond
        end
        subroutine OpenMM_HarmonicBondForce_getBondParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          length, &
                          k)
            use OpenMM_Types; implicit none
            type (OpenMM_HarmonicBondForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            real*8 length
            real*8 k
        end
        subroutine OpenMM_HarmonicBondForce_setBondParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          length, &
                          k)
            use OpenMM_Types; implicit none
            type (OpenMM_HarmonicBondForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            real*8 length
            real*8 k
        end

        ! OpenMM::BrownianIntegrator
        subroutine OpenMM_BrownianIntegrator_create(result, temperature, frictionCoeff, stepSize)
            use OpenMM_Types; implicit none
            type (OpenMM_BrownianIntegrator) result
            real*8 temperature
            real*8 frictionCoeff
            real*8 stepSize
        end
        subroutine OpenMM_BrownianIntegrator_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_BrownianIntegrator) destroy
        end
        function OpenMM_BrownianIntegrator_getTemperature(target)
            use OpenMM_Types; implicit none
            type (OpenMM_BrownianIntegrator) target
            real*8  OpenMM_BrownianIntegrator_getTemperature
        end
        subroutine OpenMM_BrownianIntegrator_setTemperature(target, &
                          temp)
            use OpenMM_Types; implicit none
            type (OpenMM_BrownianIntegrator) target
            real*8 temp
        end
        function OpenMM_BrownianIntegrator_getFriction(target)
            use OpenMM_Types; implicit none
            type (OpenMM_BrownianIntegrator) target
            real*8  OpenMM_BrownianIntegrator_getFriction
        end
        subroutine OpenMM_BrownianIntegrator_setFriction(target, &
                          coeff)
            use OpenMM_Types; implicit none
            type (OpenMM_BrownianIntegrator) target
            real*8 coeff
        end
        function OpenMM_BrownianIntegrator_getRandomNumberSeed(target)
            use OpenMM_Types; implicit none
            type (OpenMM_BrownianIntegrator) target
            integer*4  OpenMM_BrownianIntegrator_getRandomNumberSeed
        end
        subroutine OpenMM_BrownianIntegrator_setRandomNumberSeed(target, &
                          seed)
            use OpenMM_Types; implicit none
            type (OpenMM_BrownianIntegrator) target
            integer*4 seed
        end
        subroutine OpenMM_BrownianIntegrator_step(target, &
                          steps)
            use OpenMM_Types; implicit none
            type (OpenMM_BrownianIntegrator) target
            integer*4 steps
        end

        ! OpenMM::OpenMMException
        subroutine OpenMM_OpenMMException_create(result, message)
            use OpenMM_Types; implicit none
            type (OpenMM_OpenMMException) result
            character(*) message
        end
        subroutine OpenMM_OpenMMException_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_OpenMMException) destroy
        end
        subroutine OpenMM_OpenMMException_what(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_OpenMMException) target
            character(*) result
        end

        ! OpenMM::NonbondedForce
        subroutine OpenMM_NonbondedForce_create(result)
            use OpenMM_Types; implicit none
            type (OpenMM_NonbondedForce) result
        end
        subroutine OpenMM_NonbondedForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_NonbondedForce) destroy
        end
        function OpenMM_NonbondedForce_getNumParticles(target)
            use OpenMM_Types; implicit none
            type (OpenMM_NonbondedForce) target
            integer*4  OpenMM_NonbondedForce_getNumParticles
        end
        function OpenMM_NonbondedForce_getNumExceptions(target)
            use OpenMM_Types; implicit none
            type (OpenMM_NonbondedForce) target
            integer*4  OpenMM_NonbondedForce_getNumExceptions
        end
        subroutine OpenMM_NonbondedForce_getNonbondedMethod(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_NonbondedForce) target
            integer*4 result
        end
        subroutine OpenMM_NonbondedForce_setNonbondedMethod(target, &
                          method)
            use OpenMM_Types; implicit none
            type (OpenMM_NonbondedForce) target
            integer*4 method
        end
        function OpenMM_NonbondedForce_getCutoffDistance(target)
            use OpenMM_Types; implicit none
            type (OpenMM_NonbondedForce) target
            real*8  OpenMM_NonbondedForce_getCutoffDistance
        end
        subroutine OpenMM_NonbondedForce_setCutoffDistance(target, &
                          distance)
            use OpenMM_Types; implicit none
            type (OpenMM_NonbondedForce) target
            real*8 distance
        end
        function OpenMM_NonbondedForce_getReactionFieldDielectric(target)
            use OpenMM_Types; implicit none
            type (OpenMM_NonbondedForce) target
            real*8  OpenMM_NonbondedForce_getReactionFieldDielectric
        end
        subroutine OpenMM_NonbondedForce_setReactionFieldDielectric(target, &
                          dielectric)
            use OpenMM_Types; implicit none
            type (OpenMM_NonbondedForce) target
            real*8 dielectric
        end
        function OpenMM_NonbondedForce_getEwaldErrorTolerance(target)
            use OpenMM_Types; implicit none
            type (OpenMM_NonbondedForce) target
            real*8  OpenMM_NonbondedForce_getEwaldErrorTolerance
        end
        subroutine OpenMM_NonbondedForce_setEwaldErrorTolerance(target, &
                          tol)
            use OpenMM_Types; implicit none
            type (OpenMM_NonbondedForce) target
            real*8 tol
        end
        function OpenMM_NonbondedForce_addParticle(target, &
                          charge, &
                          sigma, &
                          epsilon)
            use OpenMM_Types; implicit none
            type (OpenMM_NonbondedForce) target
            real*8 charge
            real*8 sigma
            real*8 epsilon
            integer*4  OpenMM_NonbondedForce_addParticle
        end
        subroutine OpenMM_NonbondedForce_getParticleParameters(target, &
                          index, &
                          charge, &
                          sigma, &
                          epsilon)
            use OpenMM_Types; implicit none
            type (OpenMM_NonbondedForce) target
            integer*4 index
            real*8 charge
            real*8 sigma
            real*8 epsilon
        end
        subroutine OpenMM_NonbondedForce_setParticleParameters(target, &
                          index, &
                          charge, &
                          sigma, &
                          epsilon)
            use OpenMM_Types; implicit none
            type (OpenMM_NonbondedForce) target
            integer*4 index
            real*8 charge
            real*8 sigma
            real*8 epsilon
        end
        function OpenMM_NonbondedForce_addException(target, &
                          particle1, &
                          particle2, &
                          chargeProd, &
                          sigma, &
                          epsilon, &
                          replace)
            use OpenMM_Types; implicit none
            type (OpenMM_NonbondedForce) target
            integer*4 particle1
            integer*4 particle2
            real*8 chargeProd
            real*8 sigma
            real*8 epsilon
            integer*4 replace
            integer*4  OpenMM_NonbondedForce_addException
        end
        subroutine OpenMM_NonbondedForce_getExceptionParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          chargeProd, &
                          sigma, &
                          epsilon)
            use OpenMM_Types; implicit none
            type (OpenMM_NonbondedForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            real*8 chargeProd
            real*8 sigma
            real*8 epsilon
        end
        subroutine OpenMM_NonbondedForce_setExceptionParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          chargeProd, &
                          sigma, &
                          epsilon)
            use OpenMM_Types; implicit none
            type (OpenMM_NonbondedForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            real*8 chargeProd
            real*8 sigma
            real*8 epsilon
        end
        subroutine OpenMM_NonbondedForce_createExceptionsFromBonds(target, &
                          bonds, &
                          coulomb14Scale, &
                          lj14Scale)
            use OpenMM_Types; implicit none
            type (OpenMM_NonbondedForce) target
            type (OpenMM_BondArray) bonds
            real*8 coulomb14Scale
            real*8 lj14Scale
        end
        subroutine OpenMM_NonbondedForce_getUseDispersionCorrection(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_NonbondedForce) target
            integer*4 result
        end
        subroutine OpenMM_NonbondedForce_setUseDispersionCorrection(target, &
                          useCorrection)
            use OpenMM_Types; implicit none
            type (OpenMM_NonbondedForce) target
            integer*4 useCorrection
        end
        function OpenMM_NonbondedForce_getReciprocalSpaceForceGroup(target)
            use OpenMM_Types; implicit none
            type (OpenMM_NonbondedForce) target
            integer*4  OpenMM_NonbondedForce_getReciprocalSpaceForceGroup
        end
        subroutine OpenMM_NonbondedForce_setReciprocalSpaceForceGroup(target, &
                          group)
            use OpenMM_Types; implicit none
            type (OpenMM_NonbondedForce) target
            integer*4 group
        end

        ! OpenMM::TwoParticleAverageSite
        subroutine OpenMM_TwoParticleAverageSite_create(result, particle1, particle2, weight1, weight2)
            use OpenMM_Types; implicit none
            type (OpenMM_TwoParticleAverageSite) result
            integer*4 particle1
            integer*4 particle2
            real*8 weight1
            real*8 weight2
        end
        subroutine OpenMM_TwoParticleAverageSite_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_TwoParticleAverageSite) destroy
        end
        function OpenMM_TwoParticleAverageSite_getWeight(target, &
                          particle)
            use OpenMM_Types; implicit none
            type (OpenMM_TwoParticleAverageSite) target
            integer*4 particle
            real*8  OpenMM_TwoParticleAverageSite_getWeight
        end

        ! OpenMM::VariableLangevinIntegrator
        subroutine OpenMM_VariableLangevinIntegrator_create(result, temperature, frictionCoeff, errorTol)
            use OpenMM_Types; implicit none
            type (OpenMM_VariableLangevinIntegrator) result
            real*8 temperature
            real*8 frictionCoeff
            real*8 errorTol
        end
        subroutine OpenMM_VariableLangevinIntegrator_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_VariableLangevinIntegrator) destroy
        end
        function OpenMM_VariableLangevinIntegrator_getTemperature(target)
            use OpenMM_Types; implicit none
            type (OpenMM_VariableLangevinIntegrator) target
            real*8  OpenMM_VariableLangevinIntegrator_getTemperature
        end
        subroutine OpenMM_VariableLangevinIntegrator_setTemperature(target, &
                          temp)
            use OpenMM_Types; implicit none
            type (OpenMM_VariableLangevinIntegrator) target
            real*8 temp
        end
        function OpenMM_VariableLangevinIntegrator_getFriction(target)
            use OpenMM_Types; implicit none
            type (OpenMM_VariableLangevinIntegrator) target
            real*8  OpenMM_VariableLangevinIntegrator_getFriction
        end
        subroutine OpenMM_VariableLangevinIntegrator_setFriction(target, &
                          coeff)
            use OpenMM_Types; implicit none
            type (OpenMM_VariableLangevinIntegrator) target
            real*8 coeff
        end
        function OpenMM_VariableLangevinIntegrator_getErrorTolerance(target)
            use OpenMM_Types; implicit none
            type (OpenMM_VariableLangevinIntegrator) target
            real*8  OpenMM_VariableLangevinIntegrator_getErrorTolerance
        end
        subroutine OpenMM_VariableLangevinIntegrator_setErrorTolerance(target, &
                          tol)
            use OpenMM_Types; implicit none
            type (OpenMM_VariableLangevinIntegrator) target
            real*8 tol
        end
        function OpenMM_VariableLangevinIntegrator_getRandomNumberSeed(target)
            use OpenMM_Types; implicit none
            type (OpenMM_VariableLangevinIntegrator) target
            integer*4  OpenMM_VariableLangevinIntegrator_getRandomNumberSeed
        end
        subroutine OpenMM_VariableLangevinIntegrator_setRandomNumberSeed(target, &
                          seed)
            use OpenMM_Types; implicit none
            type (OpenMM_VariableLangevinIntegrator) target
            integer*4 seed
        end
        subroutine OpenMM_VariableLangevinIntegrator_step(target, &
                          steps)
            use OpenMM_Types; implicit none
            type (OpenMM_VariableLangevinIntegrator) target
            integer*4 steps
        end
        subroutine OpenMM_VariableLangevinIntegrator_stepTo(target, &
                          time)
            use OpenMM_Types; implicit none
            type (OpenMM_VariableLangevinIntegrator) target
            real*8 time
        end

        ! OpenMM::CustomExternalForce
        subroutine OpenMM_CustomExternalForce_create(result, energy)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomExternalForce) result
            character(*) energy
        end
        subroutine OpenMM_CustomExternalForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomExternalForce) destroy
        end
        function OpenMM_CustomExternalForce_getNumParticles(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomExternalForce) target
            integer*4  OpenMM_CustomExternalForce_getNumParticles
        end
        function OpenMM_CustomExternalForce_getNumPerParticleParameters(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomExternalForce) target
            integer*4  OpenMM_CustomExternalForce_getNumPerParticleParameters
        end
        function OpenMM_CustomExternalForce_getNumGlobalParameters(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomExternalForce) target
            integer*4  OpenMM_CustomExternalForce_getNumGlobalParameters
        end
        subroutine OpenMM_CustomExternalForce_getEnergyFunction(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomExternalForce) target
            character(*) result
        end
        subroutine OpenMM_CustomExternalForce_setEnergyFunction(target, &
                          energy)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomExternalForce) target
            character(*) energy
        end
        function OpenMM_CustomExternalForce_addPerParticleParameter(target, &
                          name)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomExternalForce) target
            character(*) name
            integer*4  OpenMM_CustomExternalForce_addPerParticleParameter
        end
        subroutine OpenMM_CustomExternalForce_getPerParticleParameterName(target, &
                          index, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomExternalForce) target
            integer*4 index
            character(*) result
        end
        subroutine OpenMM_CustomExternalForce_setPerParticleParameterName(target, &
                          index, &
                          name)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomExternalForce) target
            integer*4 index
            character(*) name
        end
        function OpenMM_CustomExternalForce_addGlobalParameter(target, &
                          name, &
                          defaultValue)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomExternalForce) target
            character(*) name
            real*8 defaultValue
            integer*4  OpenMM_CustomExternalForce_addGlobalParameter
        end
        subroutine OpenMM_CustomExternalForce_getGlobalParameterName(target, &
                          index, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomExternalForce) target
            integer*4 index
            character(*) result
        end
        subroutine OpenMM_CustomExternalForce_setGlobalParameterName(target, &
                          index, &
                          name)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomExternalForce) target
            integer*4 index
            character(*) name
        end
        function OpenMM_CustomExternalForce_getGlobalParameterDefaultValue(target, &
                          index)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomExternalForce) target
            integer*4 index
            real*8  OpenMM_CustomExternalForce_getGlobalParameterDefaultValue
        end
        subroutine OpenMM_CustomExternalForce_setGlobalParameterDefaultValue(target, &
                          index, &
                          defaultValue)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomExternalForce) target
            integer*4 index
            real*8 defaultValue
        end
        function OpenMM_CustomExternalForce_addParticle(target, &
                          particle, &
                          parameters)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomExternalForce) target
            integer*4 particle
            type (OpenMM_DoubleArray) parameters
            integer*4  OpenMM_CustomExternalForce_addParticle
        end
        subroutine OpenMM_CustomExternalForce_getParticleParameters(target, &
                          index, &
                          particle, &
                          parameters)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomExternalForce) target
            integer*4 index
            integer*4 particle
            type (OpenMM_DoubleArray) parameters
        end
        subroutine OpenMM_CustomExternalForce_setParticleParameters(target, &
                          index, &
                          particle, &
                          parameters)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomExternalForce) target
            integer*4 index
            integer*4 particle
            type (OpenMM_DoubleArray) parameters
        end

        ! OpenMM::GBVIForce
        subroutine OpenMM_GBVIForce_create(result)
            use OpenMM_Types; implicit none
            type (OpenMM_GBVIForce) result
        end
        subroutine OpenMM_GBVIForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_GBVIForce) destroy
        end
        function OpenMM_GBVIForce_getNumParticles(target)
            use OpenMM_Types; implicit none
            type (OpenMM_GBVIForce) target
            integer*4  OpenMM_GBVIForce_getNumParticles
        end
        function OpenMM_GBVIForce_addParticle(target, &
                          charge, &
                          radius, &
                          gamma)
            use OpenMM_Types; implicit none
            type (OpenMM_GBVIForce) target
            real*8 charge
            real*8 radius
            real*8 gamma
            integer*4  OpenMM_GBVIForce_addParticle
        end
        subroutine OpenMM_GBVIForce_getParticleParameters(target, &
                          index, &
                          charge, &
                          radius, &
                          gamma)
            use OpenMM_Types; implicit none
            type (OpenMM_GBVIForce) target
            integer*4 index
            real*8 charge
            real*8 radius
            real*8 gamma
        end
        subroutine OpenMM_GBVIForce_setParticleParameters(target, &
                          index, &
                          charge, &
                          radius, &
                          gamma)
            use OpenMM_Types; implicit none
            type (OpenMM_GBVIForce) target
            integer*4 index
            real*8 charge
            real*8 radius
            real*8 gamma
        end
        function OpenMM_GBVIForce_addBond(target, &
                          particle1, &
                          particle2, &
                          distance)
            use OpenMM_Types; implicit none
            type (OpenMM_GBVIForce) target
            integer*4 particle1
            integer*4 particle2
            real*8 distance
            integer*4  OpenMM_GBVIForce_addBond
        end
        subroutine OpenMM_GBVIForce_getBondParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          distance)
            use OpenMM_Types; implicit none
            type (OpenMM_GBVIForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            real*8 distance
        end
        subroutine OpenMM_GBVIForce_setBondParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          bondLength)
            use OpenMM_Types; implicit none
            type (OpenMM_GBVIForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            real*8 bondLength
        end
        function OpenMM_GBVIForce_getNumBonds(target)
            use OpenMM_Types; implicit none
            type (OpenMM_GBVIForce) target
            integer*4  OpenMM_GBVIForce_getNumBonds
        end
        function OpenMM_GBVIForce_getSolventDielectric(target)
            use OpenMM_Types; implicit none
            type (OpenMM_GBVIForce) target
            real*8  OpenMM_GBVIForce_getSolventDielectric
        end
        subroutine OpenMM_GBVIForce_setSolventDielectric(target, &
                          dielectric)
            use OpenMM_Types; implicit none
            type (OpenMM_GBVIForce) target
            real*8 dielectric
        end
        function OpenMM_GBVIForce_getSoluteDielectric(target)
            use OpenMM_Types; implicit none
            type (OpenMM_GBVIForce) target
            real*8  OpenMM_GBVIForce_getSoluteDielectric
        end
        subroutine OpenMM_GBVIForce_setSoluteDielectric(target, &
                          dielectric)
            use OpenMM_Types; implicit none
            type (OpenMM_GBVIForce) target
            real*8 dielectric
        end
        subroutine OpenMM_GBVIForce_getNonbondedMethod(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_GBVIForce) target
            integer*4 result
        end
        subroutine OpenMM_GBVIForce_setNonbondedMethod(target, &
                          method)
            use OpenMM_Types; implicit none
            type (OpenMM_GBVIForce) target
            integer*4 method
        end
        function OpenMM_GBVIForce_getCutoffDistance(target)
            use OpenMM_Types; implicit none
            type (OpenMM_GBVIForce) target
            real*8  OpenMM_GBVIForce_getCutoffDistance
        end
        subroutine OpenMM_GBVIForce_setCutoffDistance(target, &
                          distance)
            use OpenMM_Types; implicit none
            type (OpenMM_GBVIForce) target
            real*8 distance
        end
        subroutine OpenMM_GBVIForce_getBornRadiusScalingMethod(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_GBVIForce) target
            integer*4 result
        end
        subroutine OpenMM_GBVIForce_setBornRadiusScalingMethod(target, &
                          method)
            use OpenMM_Types; implicit none
            type (OpenMM_GBVIForce) target
            integer*4 method
        end
        function OpenMM_GBVIForce_getQuinticLowerLimitFactor(target)
            use OpenMM_Types; implicit none
            type (OpenMM_GBVIForce) target
            real*8  OpenMM_GBVIForce_getQuinticLowerLimitFactor
        end
        subroutine OpenMM_GBVIForce_setQuinticLowerLimitFactor(target, &
                          quinticLowerLimitFactor)
            use OpenMM_Types; implicit none
            type (OpenMM_GBVIForce) target
            real*8 quinticLowerLimitFactor
        end
        function OpenMM_GBVIForce_getQuinticUpperBornRadiusLimit(target)
            use OpenMM_Types; implicit none
            type (OpenMM_GBVIForce) target
            real*8  OpenMM_GBVIForce_getQuinticUpperBornRadiusLimit
        end
        subroutine OpenMM_GBVIForce_setQuinticUpperBornRadiusLimit(target, &
                          quinticUpperBornRadiusLimit)
            use OpenMM_Types; implicit none
            type (OpenMM_GBVIForce) target
            real*8 quinticUpperBornRadiusLimit
        end

        ! OpenMM::CustomGBForce
        subroutine OpenMM_CustomGBForce_create(result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) result
        end
        subroutine OpenMM_CustomGBForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) destroy
        end
        function OpenMM_CustomGBForce_getNumParticles(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4  OpenMM_CustomGBForce_getNumParticles
        end
        function OpenMM_CustomGBForce_getNumExclusions(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4  OpenMM_CustomGBForce_getNumExclusions
        end
        function OpenMM_CustomGBForce_getNumPerParticleParameters(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4  OpenMM_CustomGBForce_getNumPerParticleParameters
        end
        function OpenMM_CustomGBForce_getNumGlobalParameters(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4  OpenMM_CustomGBForce_getNumGlobalParameters
        end
        function OpenMM_CustomGBForce_getNumFunctions(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4  OpenMM_CustomGBForce_getNumFunctions
        end
        function OpenMM_CustomGBForce_getNumComputedValues(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4  OpenMM_CustomGBForce_getNumComputedValues
        end
        function OpenMM_CustomGBForce_getNumEnergyTerms(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4  OpenMM_CustomGBForce_getNumEnergyTerms
        end
        subroutine OpenMM_CustomGBForce_getNonbondedMethod(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4 result
        end
        subroutine OpenMM_CustomGBForce_setNonbondedMethod(target, &
                          method)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4 method
        end
        function OpenMM_CustomGBForce_getCutoffDistance(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            real*8  OpenMM_CustomGBForce_getCutoffDistance
        end
        subroutine OpenMM_CustomGBForce_setCutoffDistance(target, &
                          distance)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            real*8 distance
        end
        function OpenMM_CustomGBForce_addPerParticleParameter(target, &
                          name)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            character(*) name
            integer*4  OpenMM_CustomGBForce_addPerParticleParameter
        end
        subroutine OpenMM_CustomGBForce_getPerParticleParameterName(target, &
                          index, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4 index
            character(*) result
        end
        subroutine OpenMM_CustomGBForce_setPerParticleParameterName(target, &
                          index, &
                          name)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4 index
            character(*) name
        end
        function OpenMM_CustomGBForce_addGlobalParameter(target, &
                          name, &
                          defaultValue)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            character(*) name
            real*8 defaultValue
            integer*4  OpenMM_CustomGBForce_addGlobalParameter
        end
        subroutine OpenMM_CustomGBForce_getGlobalParameterName(target, &
                          index, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4 index
            character(*) result
        end
        subroutine OpenMM_CustomGBForce_setGlobalParameterName(target, &
                          index, &
                          name)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4 index
            character(*) name
        end
        function OpenMM_CustomGBForce_getGlobalParameterDefaultValue(target, &
                          index)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4 index
            real*8  OpenMM_CustomGBForce_getGlobalParameterDefaultValue
        end
        subroutine OpenMM_CustomGBForce_setGlobalParameterDefaultValue(target, &
                          index, &
                          defaultValue)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4 index
            real*8 defaultValue
        end
        function OpenMM_CustomGBForce_addParticle(target, &
                          parameters)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            type (OpenMM_DoubleArray) parameters
            integer*4  OpenMM_CustomGBForce_addParticle
        end
        subroutine OpenMM_CustomGBForce_getParticleParameters(target, &
                          index, &
                          parameters)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4 index
            type (OpenMM_DoubleArray) parameters
        end
        subroutine OpenMM_CustomGBForce_setParticleParameters(target, &
                          index, &
                          parameters)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4 index
            type (OpenMM_DoubleArray) parameters
        end
        function OpenMM_CustomGBForce_addComputedValue(target, &
                          name, &
                          expression, &
                          type)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            character(*) name
            character(*) expression
            integer*4 type
            integer*4  OpenMM_CustomGBForce_addComputedValue
        end
        subroutine OpenMM_CustomGBForce_getComputedValueParameters(target, &
                          index, &
                          name, &
                          expression, &
                          type)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4 index
            character(*) name
            character(*) expression
            integer*4 type
        end
        subroutine OpenMM_CustomGBForce_setComputedValueParameters(target, &
                          index, &
                          name, &
                          expression, &
                          type)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4 index
            character(*) name
            character(*) expression
            integer*4 type
        end
        function OpenMM_CustomGBForce_addEnergyTerm(target, &
                          expression, &
                          type)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            character(*) expression
            integer*4 type
            integer*4  OpenMM_CustomGBForce_addEnergyTerm
        end
        subroutine OpenMM_CustomGBForce_getEnergyTermParameters(target, &
                          index, &
                          expression, &
                          type)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4 index
            character(*) expression
            integer*4 type
        end
        subroutine OpenMM_CustomGBForce_setEnergyTermParameters(target, &
                          index, &
                          expression, &
                          type)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4 index
            character(*) expression
            integer*4 type
        end
        function OpenMM_CustomGBForce_addExclusion(target, &
                          particle1, &
                          particle2)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4 particle1
            integer*4 particle2
            integer*4  OpenMM_CustomGBForce_addExclusion
        end
        subroutine OpenMM_CustomGBForce_getExclusionParticles(target, &
                          index, &
                          particle1, &
                          particle2)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
        end
        subroutine OpenMM_CustomGBForce_setExclusionParticles(target, &
                          index, &
                          particle1, &
                          particle2)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
        end
        function OpenMM_CustomGBForce_addFunction(target, &
                          name, &
                          values, &
                          min, &
                          max)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            character(*) name
            type (OpenMM_DoubleArray) values
            real*8 min
            real*8 max
            integer*4  OpenMM_CustomGBForce_addFunction
        end
        subroutine OpenMM_CustomGBForce_getFunctionParameters(target, &
                          index, &
                          name, &
                          values, &
                          min, &
                          max)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4 index
            character(*) name
            type (OpenMM_DoubleArray) values
            real*8 min
            real*8 max
        end
        subroutine OpenMM_CustomGBForce_setFunctionParameters(target, &
                          index, &
                          name, &
                          values, &
                          min, &
                          max)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomGBForce) target
            integer*4 index
            character(*) name
            type (OpenMM_DoubleArray) values
            real*8 min
            real*8 max
        end

        ! OpenMM::MonteCarloBarostat
        subroutine OpenMM_MonteCarloBarostat_create(result, defaultPressure, temperature, frequency)
            use OpenMM_Types; implicit none
            type (OpenMM_MonteCarloBarostat) result
            real*8 defaultPressure
            real*8 temperature
            integer*4 frequency
        end
        subroutine OpenMM_MonteCarloBarostat_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_MonteCarloBarostat) destroy
        end
        subroutine OpenMM_MonteCarloBarostat_Pressure(result)
            use OpenMM_Types; implicit none
            character(*) result
        end
        function OpenMM_MonteCarloBarostat_getDefaultPressure(target)
            use OpenMM_Types; implicit none
            type (OpenMM_MonteCarloBarostat) target
            real*8  OpenMM_MonteCarloBarostat_getDefaultPressure
        end
        function OpenMM_MonteCarloBarostat_getFrequency(target)
            use OpenMM_Types; implicit none
            type (OpenMM_MonteCarloBarostat) target
            integer*4  OpenMM_MonteCarloBarostat_getFrequency
        end
        subroutine OpenMM_MonteCarloBarostat_setFrequency(target, &
                          freq)
            use OpenMM_Types; implicit none
            type (OpenMM_MonteCarloBarostat) target
            integer*4 freq
        end
        function OpenMM_MonteCarloBarostat_getTemperature(target)
            use OpenMM_Types; implicit none
            type (OpenMM_MonteCarloBarostat) target
            real*8  OpenMM_MonteCarloBarostat_getTemperature
        end
        subroutine OpenMM_MonteCarloBarostat_setTemperature(target, &
                          temp)
            use OpenMM_Types; implicit none
            type (OpenMM_MonteCarloBarostat) target
            real*8 temp
        end
        function OpenMM_MonteCarloBarostat_getRandomNumberSeed(target)
            use OpenMM_Types; implicit none
            type (OpenMM_MonteCarloBarostat) target
            integer*4  OpenMM_MonteCarloBarostat_getRandomNumberSeed
        end
        subroutine OpenMM_MonteCarloBarostat_setRandomNumberSeed(target, &
                          seed)
            use OpenMM_Types; implicit none
            type (OpenMM_MonteCarloBarostat) target
            integer*4 seed
        end

        ! OpenMM::Context
        subroutine OpenMM_Context_create(result, system, integrator)
            use OpenMM_Types; implicit none
            type (OpenMM_Context) result
            type (OpenMM_System) system
            type (OpenMM_Integrator) integrator
        end
        subroutine OpenMM_Context_create_2(result, system, integrator, platform)
            use OpenMM_Types; implicit none
            type (OpenMM_Context) result
            type (OpenMM_System) system
            type (OpenMM_Integrator) integrator
            type (OpenMM_Platform) platform
        end
        subroutine OpenMM_Context_create_3(result, system, integrator, platform, properties)
            use OpenMM_Types; implicit none
            type (OpenMM_Context) result
            type (OpenMM_System) system
            type (OpenMM_Integrator) integrator
            type (OpenMM_Platform) platform
            type (OpenMM_PropertyArray) properties
        end
        subroutine OpenMM_Context_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_Context) destroy
        end
        subroutine OpenMM_Context_getSystem(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_Context) target
            type (OpenMM_System) result
        end
        subroutine OpenMM_Context_getIntegrator(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_Context) target
            type (OpenMM_Integrator) result
        end
        subroutine OpenMM_Context_getPlatform(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_Context) target
            type (OpenMM_Platform) result
        end
        subroutine OpenMM_Context_setTime(target, &
                          time)
            use OpenMM_Types; implicit none
            type (OpenMM_Context) target
            real*8 time
        end
        subroutine OpenMM_Context_setPositions(target, &
                          positions)
            use OpenMM_Types; implicit none
            type (OpenMM_Context) target
            type (OpenMM_Vec3Array) positions
        end
        subroutine OpenMM_Context_setVelocities(target, &
                          velocities)
            use OpenMM_Types; implicit none
            type (OpenMM_Context) target
            type (OpenMM_Vec3Array) velocities
        end
        function OpenMM_Context_getParameter(target, &
                          name)
            use OpenMM_Types; implicit none
            type (OpenMM_Context) target
            character(*) name
            real*8  OpenMM_Context_getParameter
        end
        subroutine OpenMM_Context_setParameter(target, &
                          name, &
                          value)
            use OpenMM_Types; implicit none
            type (OpenMM_Context) target
            character(*) name
            real*8 value
        end
        subroutine OpenMM_Context_setPeriodicBoxVectors(target, &
                          a, &
                          b, &
                          c)
            use OpenMM_Types; implicit none
            type (OpenMM_Context) target
            real*8 a(3)
            real*8 b(3)
            real*8 c(3)
        end
        subroutine OpenMM_Context_applyConstraints(target, &
                          tol)
            use OpenMM_Types; implicit none
            type (OpenMM_Context) target
            real*8 tol
        end
        subroutine OpenMM_Context_computeVirtualSites(target)
            use OpenMM_Types; implicit none
            type (OpenMM_Context) target
        end
        subroutine OpenMM_Context_reinitialize(target)
            use OpenMM_Types; implicit none
            type (OpenMM_Context) target
        end

        ! OpenMM::LocalEnergyMinimizer
        subroutine OpenMM_LocalEnergyMinimizer_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_LocalEnergyMinimizer) destroy
        end
        subroutine OpenMM_LocalEnergyMinimizer_minimize(context, &
                          tolerance, &
                          maxIterations)
            use OpenMM_Types; implicit none
            type (OpenMM_Context) context
            real*8 tolerance
            integer*4 maxIterations
        end

        ! OpenMM::GBSAOBCForce
        subroutine OpenMM_GBSAOBCForce_create(result)
            use OpenMM_Types; implicit none
            type (OpenMM_GBSAOBCForce) result
        end
        subroutine OpenMM_GBSAOBCForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_GBSAOBCForce) destroy
        end
        function OpenMM_GBSAOBCForce_getNumParticles(target)
            use OpenMM_Types; implicit none
            type (OpenMM_GBSAOBCForce) target
            integer*4  OpenMM_GBSAOBCForce_getNumParticles
        end
        function OpenMM_GBSAOBCForce_addParticle(target, &
                          charge, &
                          radius, &
                          scalingFactor)
            use OpenMM_Types; implicit none
            type (OpenMM_GBSAOBCForce) target
            real*8 charge
            real*8 radius
            real*8 scalingFactor
            integer*4  OpenMM_GBSAOBCForce_addParticle
        end
        subroutine OpenMM_GBSAOBCForce_getParticleParameters(target, &
                          index, &
                          charge, &
                          radius, &
                          scalingFactor)
            use OpenMM_Types; implicit none
            type (OpenMM_GBSAOBCForce) target
            integer*4 index
            real*8 charge
            real*8 radius
            real*8 scalingFactor
        end
        subroutine OpenMM_GBSAOBCForce_setParticleParameters(target, &
                          index, &
                          charge, &
                          radius, &
                          scalingFactor)
            use OpenMM_Types; implicit none
            type (OpenMM_GBSAOBCForce) target
            integer*4 index
            real*8 charge
            real*8 radius
            real*8 scalingFactor
        end
        function OpenMM_GBSAOBCForce_getSolventDielectric(target)
            use OpenMM_Types; implicit none
            type (OpenMM_GBSAOBCForce) target
            real*8  OpenMM_GBSAOBCForce_getSolventDielectric
        end
        subroutine OpenMM_GBSAOBCForce_setSolventDielectric(target, &
                          dielectric)
            use OpenMM_Types; implicit none
            type (OpenMM_GBSAOBCForce) target
            real*8 dielectric
        end
        function OpenMM_GBSAOBCForce_getSoluteDielectric(target)
            use OpenMM_Types; implicit none
            type (OpenMM_GBSAOBCForce) target
            real*8  OpenMM_GBSAOBCForce_getSoluteDielectric
        end
        subroutine OpenMM_GBSAOBCForce_setSoluteDielectric(target, &
                          dielectric)
            use OpenMM_Types; implicit none
            type (OpenMM_GBSAOBCForce) target
            real*8 dielectric
        end
        subroutine OpenMM_GBSAOBCForce_getNonbondedMethod(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_GBSAOBCForce) target
            integer*4 result
        end
        subroutine OpenMM_GBSAOBCForce_setNonbondedMethod(target, &
                          method)
            use OpenMM_Types; implicit none
            type (OpenMM_GBSAOBCForce) target
            integer*4 method
        end
        function OpenMM_GBSAOBCForce_getCutoffDistance(target)
            use OpenMM_Types; implicit none
            type (OpenMM_GBSAOBCForce) target
            real*8  OpenMM_GBSAOBCForce_getCutoffDistance
        end
        subroutine OpenMM_GBSAOBCForce_setCutoffDistance(target, &
                          distance)
            use OpenMM_Types; implicit none
            type (OpenMM_GBSAOBCForce) target
            real*8 distance
        end

        ! OpenMM::VariableVerletIntegrator
        subroutine OpenMM_VariableVerletIntegrator_create(result, errorTol)
            use OpenMM_Types; implicit none
            type (OpenMM_VariableVerletIntegrator) result
            real*8 errorTol
        end
        subroutine OpenMM_VariableVerletIntegrator_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_VariableVerletIntegrator) destroy
        end
        function OpenMM_VariableVerletIntegrator_getErrorTolerance(target)
            use OpenMM_Types; implicit none
            type (OpenMM_VariableVerletIntegrator) target
            real*8  OpenMM_VariableVerletIntegrator_getErrorTolerance
        end
        subroutine OpenMM_VariableVerletIntegrator_setErrorTolerance(target, &
                          tol)
            use OpenMM_Types; implicit none
            type (OpenMM_VariableVerletIntegrator) target
            real*8 tol
        end
        subroutine OpenMM_VariableVerletIntegrator_step(target, &
                          steps)
            use OpenMM_Types; implicit none
            type (OpenMM_VariableVerletIntegrator) target
            integer*4 steps
        end
        subroutine OpenMM_VariableVerletIntegrator_stepTo(target, &
                          time)
            use OpenMM_Types; implicit none
            type (OpenMM_VariableVerletIntegrator) target
            real*8 time
        end

        ! OpenMM::OutOfPlaneSite
        subroutine OpenMM_OutOfPlaneSite_create(result, particle1, particle2, particle3, weight12, weight13, weightCross)
            use OpenMM_Types; implicit none
            type (OpenMM_OutOfPlaneSite) result
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            real*8 weight12
            real*8 weight13
            real*8 weightCross
        end
        subroutine OpenMM_OutOfPlaneSite_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_OutOfPlaneSite) destroy
        end
        function OpenMM_OutOfPlaneSite_getWeight12(target)
            use OpenMM_Types; implicit none
            type (OpenMM_OutOfPlaneSite) target
            real*8  OpenMM_OutOfPlaneSite_getWeight12
        end
        function OpenMM_OutOfPlaneSite_getWeight13(target)
            use OpenMM_Types; implicit none
            type (OpenMM_OutOfPlaneSite) target
            real*8  OpenMM_OutOfPlaneSite_getWeight13
        end
        function OpenMM_OutOfPlaneSite_getWeightCross(target)
            use OpenMM_Types; implicit none
            type (OpenMM_OutOfPlaneSite) target
            real*8  OpenMM_OutOfPlaneSite_getWeightCross
        end

        ! OpenMM::VerletIntegrator
        subroutine OpenMM_VerletIntegrator_create(result, stepSize)
            use OpenMM_Types; implicit none
            type (OpenMM_VerletIntegrator) result
            real*8 stepSize
        end
        subroutine OpenMM_VerletIntegrator_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_VerletIntegrator) destroy
        end
        subroutine OpenMM_VerletIntegrator_step(target, &
                          steps)
            use OpenMM_Types; implicit none
            type (OpenMM_VerletIntegrator) target
            integer*4 steps
        end

        ! OpenMM::CustomHbondForce
        subroutine OpenMM_CustomHbondForce_create(result, energy)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) result
            character(*) energy
        end
        subroutine OpenMM_CustomHbondForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) destroy
        end
        function OpenMM_CustomHbondForce_getNumDonors(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4  OpenMM_CustomHbondForce_getNumDonors
        end
        function OpenMM_CustomHbondForce_getNumAcceptors(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4  OpenMM_CustomHbondForce_getNumAcceptors
        end
        function OpenMM_CustomHbondForce_getNumExclusions(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4  OpenMM_CustomHbondForce_getNumExclusions
        end
        function OpenMM_CustomHbondForce_getNumPerDonorParameters(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4  OpenMM_CustomHbondForce_getNumPerDonorParameters
        end
        function OpenMM_CustomHbondForce_getNumPerAcceptorParameters(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4  OpenMM_CustomHbondForce_getNumPerAcceptorParameters
        end
        function OpenMM_CustomHbondForce_getNumGlobalParameters(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4  OpenMM_CustomHbondForce_getNumGlobalParameters
        end
        function OpenMM_CustomHbondForce_getNumFunctions(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4  OpenMM_CustomHbondForce_getNumFunctions
        end
        subroutine OpenMM_CustomHbondForce_getEnergyFunction(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            character(*) result
        end
        subroutine OpenMM_CustomHbondForce_setEnergyFunction(target, &
                          energy)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            character(*) energy
        end
        subroutine OpenMM_CustomHbondForce_getNonbondedMethod(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4 result
        end
        subroutine OpenMM_CustomHbondForce_setNonbondedMethod(target, &
                          method)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4 method
        end
        function OpenMM_CustomHbondForce_getCutoffDistance(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            real*8  OpenMM_CustomHbondForce_getCutoffDistance
        end
        subroutine OpenMM_CustomHbondForce_setCutoffDistance(target, &
                          distance)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            real*8 distance
        end
        function OpenMM_CustomHbondForce_addPerDonorParameter(target, &
                          name)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            character(*) name
            integer*4  OpenMM_CustomHbondForce_addPerDonorParameter
        end
        subroutine OpenMM_CustomHbondForce_getPerDonorParameterName(target, &
                          index, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4 index
            character(*) result
        end
        subroutine OpenMM_CustomHbondForce_setPerDonorParameterName(target, &
                          index, &
                          name)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4 index
            character(*) name
        end
        function OpenMM_CustomHbondForce_addPerAcceptorParameter(target, &
                          name)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            character(*) name
            integer*4  OpenMM_CustomHbondForce_addPerAcceptorParameter
        end
        subroutine OpenMM_CustomHbondForce_getPerAcceptorParameterName(target, &
                          index, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4 index
            character(*) result
        end
        subroutine OpenMM_CustomHbondForce_setPerAcceptorParameterName(target, &
                          index, &
                          name)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4 index
            character(*) name
        end
        function OpenMM_CustomHbondForce_addGlobalParameter(target, &
                          name, &
                          defaultValue)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            character(*) name
            real*8 defaultValue
            integer*4  OpenMM_CustomHbondForce_addGlobalParameter
        end
        subroutine OpenMM_CustomHbondForce_getGlobalParameterName(target, &
                          index, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4 index
            character(*) result
        end
        subroutine OpenMM_CustomHbondForce_setGlobalParameterName(target, &
                          index, &
                          name)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4 index
            character(*) name
        end
        function OpenMM_CustomHbondForce_getGlobalParameterDefaultValue(target, &
                          index)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4 index
            real*8  OpenMM_CustomHbondForce_getGlobalParameterDefaultValue
        end
        subroutine OpenMM_CustomHbondForce_setGlobalParameterDefaultValue(target, &
                          index, &
                          defaultValue)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4 index
            real*8 defaultValue
        end
        function OpenMM_CustomHbondForce_addDonor(target, &
                          d1, &
                          d2, &
                          d3, &
                          parameters)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4 d1
            integer*4 d2
            integer*4 d3
            type (OpenMM_DoubleArray) parameters
            integer*4  OpenMM_CustomHbondForce_addDonor
        end
        subroutine OpenMM_CustomHbondForce_getDonorParameters(target, &
                          index, &
                          d1, &
                          d2, &
                          d3, &
                          parameters)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4 index
            integer*4 d1
            integer*4 d2
            integer*4 d3
            type (OpenMM_DoubleArray) parameters
        end
        subroutine OpenMM_CustomHbondForce_setDonorParameters(target, &
                          index, &
                          d1, &
                          d2, &
                          d3, &
                          parameters)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4 index
            integer*4 d1
            integer*4 d2
            integer*4 d3
            type (OpenMM_DoubleArray) parameters
        end
        function OpenMM_CustomHbondForce_addAcceptor(target, &
                          a1, &
                          a2, &
                          a3, &
                          parameters)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4 a1
            integer*4 a2
            integer*4 a3
            type (OpenMM_DoubleArray) parameters
            integer*4  OpenMM_CustomHbondForce_addAcceptor
        end
        subroutine OpenMM_CustomHbondForce_getAcceptorParameters(target, &
                          index, &
                          a1, &
                          a2, &
                          a3, &
                          parameters)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4 index
            integer*4 a1
            integer*4 a2
            integer*4 a3
            type (OpenMM_DoubleArray) parameters
        end
        subroutine OpenMM_CustomHbondForce_setAcceptorParameters(target, &
                          index, &
                          a1, &
                          a2, &
                          a3, &
                          parameters)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4 index
            integer*4 a1
            integer*4 a2
            integer*4 a3
            type (OpenMM_DoubleArray) parameters
        end
        function OpenMM_CustomHbondForce_addExclusion(target, &
                          donor, &
                          acceptor)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4 donor
            integer*4 acceptor
            integer*4  OpenMM_CustomHbondForce_addExclusion
        end
        subroutine OpenMM_CustomHbondForce_getExclusionParticles(target, &
                          index, &
                          donor, &
                          acceptor)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4 index
            integer*4 donor
            integer*4 acceptor
        end
        subroutine OpenMM_CustomHbondForce_setExclusionParticles(target, &
                          index, &
                          donor, &
                          acceptor)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4 index
            integer*4 donor
            integer*4 acceptor
        end
        function OpenMM_CustomHbondForce_addFunction(target, &
                          name, &
                          values, &
                          min, &
                          max)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            character(*) name
            type (OpenMM_DoubleArray) values
            real*8 min
            real*8 max
            integer*4  OpenMM_CustomHbondForce_addFunction
        end
        subroutine OpenMM_CustomHbondForce_getFunctionParameters(target, &
                          index, &
                          name, &
                          values, &
                          min, &
                          max)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4 index
            character(*) name
            type (OpenMM_DoubleArray) values
            real*8 min
            real*8 max
        end
        subroutine OpenMM_CustomHbondForce_setFunctionParameters(target, &
                          index, &
                          name, &
                          values, &
                          min, &
                          max)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomHbondForce) target
            integer*4 index
            character(*) name
            type (OpenMM_DoubleArray) values
            real*8 min
            real*8 max
        end

        ! OpenMM::CMMotionRemover
        subroutine OpenMM_CMMotionRemover_create(result, frequency)
            use OpenMM_Types; implicit none
            type (OpenMM_CMMotionRemover) result
            integer*4 frequency
        end
        subroutine OpenMM_CMMotionRemover_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_CMMotionRemover) destroy
        end
        function OpenMM_CMMotionRemover_getFrequency(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CMMotionRemover) target
            integer*4  OpenMM_CMMotionRemover_getFrequency
        end
        subroutine OpenMM_CMMotionRemover_setFrequency(target, &
                          freq)
            use OpenMM_Types; implicit none
            type (OpenMM_CMMotionRemover) target
            integer*4 freq
        end

        ! OpenMM::RBTorsionForce
        subroutine OpenMM_RBTorsionForce_create(result)
            use OpenMM_Types; implicit none
            type (OpenMM_RBTorsionForce) result
        end
        subroutine OpenMM_RBTorsionForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_RBTorsionForce) destroy
        end
        function OpenMM_RBTorsionForce_getNumTorsions(target)
            use OpenMM_Types; implicit none
            type (OpenMM_RBTorsionForce) target
            integer*4  OpenMM_RBTorsionForce_getNumTorsions
        end
        function OpenMM_RBTorsionForce_addTorsion(target, &
                          particle1, &
                          particle2, &
                          particle3, &
                          particle4, &
                          c0, &
                          c1, &
                          c2, &
                          c3, &
                          c4, &
                          c5)
            use OpenMM_Types; implicit none
            type (OpenMM_RBTorsionForce) target
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            integer*4 particle4
            real*8 c0
            real*8 c1
            real*8 c2
            real*8 c3
            real*8 c4
            real*8 c5
            integer*4  OpenMM_RBTorsionForce_addTorsion
        end
        subroutine OpenMM_RBTorsionForce_getTorsionParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          particle3, &
                          particle4, &
                          c0, &
                          c1, &
                          c2, &
                          c3, &
                          c4, &
                          c5)
            use OpenMM_Types; implicit none
            type (OpenMM_RBTorsionForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            integer*4 particle4
            real*8 c0
            real*8 c1
            real*8 c2
            real*8 c3
            real*8 c4
            real*8 c5
        end
        subroutine OpenMM_RBTorsionForce_setTorsionParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          particle3, &
                          particle4, &
                          c0, &
                          c1, &
                          c2, &
                          c3, &
                          c4, &
                          c5)
            use OpenMM_Types; implicit none
            type (OpenMM_RBTorsionForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            integer*4 particle4
            real*8 c0
            real*8 c1
            real*8 c2
            real*8 c3
            real*8 c4
            real*8 c5
        end

        ! OpenMM::CustomIntegrator
        subroutine OpenMM_CustomIntegrator_create(result, stepSize)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomIntegrator) result
            real*8 stepSize
        end
        subroutine OpenMM_CustomIntegrator_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomIntegrator) destroy
        end
        function OpenMM_CustomIntegrator_getNumGlobalVariables(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomIntegrator) target
            integer*4  OpenMM_CustomIntegrator_getNumGlobalVariables
        end
        function OpenMM_CustomIntegrator_getNumPerDofVariables(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomIntegrator) target
            integer*4  OpenMM_CustomIntegrator_getNumPerDofVariables
        end
        function OpenMM_CustomIntegrator_getNumComputations(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomIntegrator) target
            integer*4  OpenMM_CustomIntegrator_getNumComputations
        end
        function OpenMM_CustomIntegrator_addGlobalVariable(target, &
                          name, &
                          initialValue)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomIntegrator) target
            character(*) name
            real*8 initialValue
            integer*4  OpenMM_CustomIntegrator_addGlobalVariable
        end
        subroutine OpenMM_CustomIntegrator_getGlobalVariableName(target, &
                          index, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomIntegrator) target
            integer*4 index
            character(*) result
        end
        function OpenMM_CustomIntegrator_addPerDofVariable(target, &
                          name, &
                          initialValue)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomIntegrator) target
            character(*) name
            real*8 initialValue
            integer*4  OpenMM_CustomIntegrator_addPerDofVariable
        end
        subroutine OpenMM_CustomIntegrator_getPerDofVariableName(target, &
                          index, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomIntegrator) target
            integer*4 index
            character(*) result
        end
        function OpenMM_CustomIntegrator_getGlobalVariable(target, &
                          index)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomIntegrator) target
            integer*4 index
            real*8  OpenMM_CustomIntegrator_getGlobalVariable
        end
        subroutine OpenMM_CustomIntegrator_setGlobalVariable(target, &
                          index, &
                          value)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomIntegrator) target
            integer*4 index
            real*8 value
        end
        subroutine OpenMM_CustomIntegrator_setGlobalVariableByName(target, &
                          name, &
                          value)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomIntegrator) target
            character(*) name
            real*8 value
        end
        subroutine OpenMM_CustomIntegrator_getPerDofVariable(target, &
                          index, &
                          values)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomIntegrator) target
            integer*4 index
            type (OpenMM_Vec3Array) values
        end
        subroutine OpenMM_CustomIntegrator_setPerDofVariable(target, &
                          index, &
                          values)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomIntegrator) target
            integer*4 index
            type (OpenMM_Vec3Array) values
        end
        subroutine OpenMM_CustomIntegrator_setPerDofVariableByName(target, &
                          name, &
                          values)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomIntegrator) target
            character(*) name
            type (OpenMM_Vec3Array) values
        end
        function OpenMM_CustomIntegrator_addComputeGlobal(target, &
                          variable, &
                          expression)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomIntegrator) target
            character(*) variable
            character(*) expression
            integer*4  OpenMM_CustomIntegrator_addComputeGlobal
        end
        function OpenMM_CustomIntegrator_addComputePerDof(target, &
                          variable, &
                          expression)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomIntegrator) target
            character(*) variable
            character(*) expression
            integer*4  OpenMM_CustomIntegrator_addComputePerDof
        end
        function OpenMM_CustomIntegrator_addComputeSum(target, &
                          variable, &
                          expression)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomIntegrator) target
            character(*) variable
            character(*) expression
            integer*4  OpenMM_CustomIntegrator_addComputeSum
        end
        function OpenMM_CustomIntegrator_addConstrainPositions(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomIntegrator) target
            integer*4  OpenMM_CustomIntegrator_addConstrainPositions
        end
        function OpenMM_CustomIntegrator_addConstrainVelocities(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomIntegrator) target
            integer*4  OpenMM_CustomIntegrator_addConstrainVelocities
        end
        function OpenMM_CustomIntegrator_addUpdateContextState(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomIntegrator) target
            integer*4  OpenMM_CustomIntegrator_addUpdateContextState
        end
        subroutine OpenMM_CustomIntegrator_getComputationStep(target, &
                          index, &
                          type, &
                          variable, &
                          expression)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomIntegrator) target
            integer*4 index
            integer*4 type
            character(*) variable
            character(*) expression
        end
        function OpenMM_CustomIntegrator_getRandomNumberSeed(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomIntegrator) target
            integer*4  OpenMM_CustomIntegrator_getRandomNumberSeed
        end
        subroutine OpenMM_CustomIntegrator_setRandomNumberSeed(target, &
                          seed)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomIntegrator) target
            integer*4 seed
        end
        subroutine OpenMM_CustomIntegrator_step(target, &
                          steps)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomIntegrator) target
            integer*4 steps
        end

        ! OpenMM::LangevinIntegrator
        subroutine OpenMM_LangevinIntegrator_create(result, temperature, frictionCoeff, stepSize)
            use OpenMM_Types; implicit none
            type (OpenMM_LangevinIntegrator) result
            real*8 temperature
            real*8 frictionCoeff
            real*8 stepSize
        end
        subroutine OpenMM_LangevinIntegrator_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_LangevinIntegrator) destroy
        end
        function OpenMM_LangevinIntegrator_getTemperature(target)
            use OpenMM_Types; implicit none
            type (OpenMM_LangevinIntegrator) target
            real*8  OpenMM_LangevinIntegrator_getTemperature
        end
        subroutine OpenMM_LangevinIntegrator_setTemperature(target, &
                          temp)
            use OpenMM_Types; implicit none
            type (OpenMM_LangevinIntegrator) target
            real*8 temp
        end
        function OpenMM_LangevinIntegrator_getFriction(target)
            use OpenMM_Types; implicit none
            type (OpenMM_LangevinIntegrator) target
            real*8  OpenMM_LangevinIntegrator_getFriction
        end
        subroutine OpenMM_LangevinIntegrator_setFriction(target, &
                          coeff)
            use OpenMM_Types; implicit none
            type (OpenMM_LangevinIntegrator) target
            real*8 coeff
        end
        function OpenMM_LangevinIntegrator_getRandomNumberSeed(target)
            use OpenMM_Types; implicit none
            type (OpenMM_LangevinIntegrator) target
            integer*4  OpenMM_LangevinIntegrator_getRandomNumberSeed
        end
        subroutine OpenMM_LangevinIntegrator_setRandomNumberSeed(target, &
                          seed)
            use OpenMM_Types; implicit none
            type (OpenMM_LangevinIntegrator) target
            integer*4 seed
        end
        subroutine OpenMM_LangevinIntegrator_step(target, &
                          steps)
            use OpenMM_Types; implicit none
            type (OpenMM_LangevinIntegrator) target
            integer*4 steps
        end

        ! OpenMM::Force
        function OpenMM_Force_getForceGroup(target)
            use OpenMM_Types; implicit none
            type (OpenMM_Force) target
            integer*4  OpenMM_Force_getForceGroup
        end
        subroutine OpenMM_Force_setForceGroup(target, &
                          group)
            use OpenMM_Types; implicit none
            type (OpenMM_Force) target
            integer*4 group
        end

        ! OpenMM::CMAPTorsionForce
        subroutine OpenMM_CMAPTorsionForce_create(result)
            use OpenMM_Types; implicit none
            type (OpenMM_CMAPTorsionForce) result
        end
        subroutine OpenMM_CMAPTorsionForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_CMAPTorsionForce) destroy
        end
        function OpenMM_CMAPTorsionForce_getNumMaps(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CMAPTorsionForce) target
            integer*4  OpenMM_CMAPTorsionForce_getNumMaps
        end
        function OpenMM_CMAPTorsionForce_getNumTorsions(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CMAPTorsionForce) target
            integer*4  OpenMM_CMAPTorsionForce_getNumTorsions
        end
        function OpenMM_CMAPTorsionForce_addMap(target, &
                          size, &
                          energy)
            use OpenMM_Types; implicit none
            type (OpenMM_CMAPTorsionForce) target
            integer*4 size
            type (OpenMM_DoubleArray) energy
            integer*4  OpenMM_CMAPTorsionForce_addMap
        end
        subroutine OpenMM_CMAPTorsionForce_getMapParameters(target, &
                          index, &
                          size, &
                          energy)
            use OpenMM_Types; implicit none
            type (OpenMM_CMAPTorsionForce) target
            integer*4 index
            integer*4 size
            type (OpenMM_DoubleArray) energy
        end
        subroutine OpenMM_CMAPTorsionForce_setMapParameters(target, &
                          index, &
                          size, &
                          energy)
            use OpenMM_Types; implicit none
            type (OpenMM_CMAPTorsionForce) target
            integer*4 index
            integer*4 size
            type (OpenMM_DoubleArray) energy
        end
        function OpenMM_CMAPTorsionForce_addTorsion(target, &
                          map, &
                          a1, &
                          a2, &
                          a3, &
                          a4, &
                          b1, &
                          b2, &
                          b3, &
                          b4)
            use OpenMM_Types; implicit none
            type (OpenMM_CMAPTorsionForce) target
            integer*4 map
            integer*4 a1
            integer*4 a2
            integer*4 a3
            integer*4 a4
            integer*4 b1
            integer*4 b2
            integer*4 b3
            integer*4 b4
            integer*4  OpenMM_CMAPTorsionForce_addTorsion
        end
        subroutine OpenMM_CMAPTorsionForce_getTorsionParameters(target, &
                          index, &
                          map, &
                          a1, &
                          a2, &
                          a3, &
                          a4, &
                          b1, &
                          b2, &
                          b3, &
                          b4)
            use OpenMM_Types; implicit none
            type (OpenMM_CMAPTorsionForce) target
            integer*4 index
            integer*4 map
            integer*4 a1
            integer*4 a2
            integer*4 a3
            integer*4 a4
            integer*4 b1
            integer*4 b2
            integer*4 b3
            integer*4 b4
        end
        subroutine OpenMM_CMAPTorsionForce_setTorsionParameters(target, &
                          index, &
                          map, &
                          a1, &
                          a2, &
                          a3, &
                          a4, &
                          b1, &
                          b2, &
                          b3, &
                          b4)
            use OpenMM_Types; implicit none
            type (OpenMM_CMAPTorsionForce) target
            integer*4 index
            integer*4 map
            integer*4 a1
            integer*4 a2
            integer*4 a3
            integer*4 a4
            integer*4 b1
            integer*4 b2
            integer*4 b3
            integer*4 b4
        end

        ! OpenMM::HarmonicAngleForce
        subroutine OpenMM_HarmonicAngleForce_create(result)
            use OpenMM_Types; implicit none
            type (OpenMM_HarmonicAngleForce) result
        end
        subroutine OpenMM_HarmonicAngleForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_HarmonicAngleForce) destroy
        end
        function OpenMM_HarmonicAngleForce_getNumAngles(target)
            use OpenMM_Types; implicit none
            type (OpenMM_HarmonicAngleForce) target
            integer*4  OpenMM_HarmonicAngleForce_getNumAngles
        end
        function OpenMM_HarmonicAngleForce_addAngle(target, &
                          particle1, &
                          particle2, &
                          particle3, &
                          angle, &
                          k)
            use OpenMM_Types; implicit none
            type (OpenMM_HarmonicAngleForce) target
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            real*8 angle
            real*8 k
            integer*4  OpenMM_HarmonicAngleForce_addAngle
        end
        subroutine OpenMM_HarmonicAngleForce_getAngleParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          particle3, &
                          angle, &
                          k)
            use OpenMM_Types; implicit none
            type (OpenMM_HarmonicAngleForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            real*8 angle
            real*8 k
        end
        subroutine OpenMM_HarmonicAngleForce_setAngleParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          particle3, &
                          angle, &
                          k)
            use OpenMM_Types; implicit none
            type (OpenMM_HarmonicAngleForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            real*8 angle
            real*8 k
        end

        ! OpenMM::VirtualSite
        subroutine OpenMM_VirtualSite_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_VirtualSite) destroy
        end
        function OpenMM_VirtualSite_getNumParticles(target)
            use OpenMM_Types; implicit none
            type (OpenMM_VirtualSite) target
            integer*4  OpenMM_VirtualSite_getNumParticles
        end
        function OpenMM_VirtualSite_getParticle(target, &
                          particle)
            use OpenMM_Types; implicit none
            type (OpenMM_VirtualSite) target
            integer*4 particle
            integer*4  OpenMM_VirtualSite_getParticle
        end

        ! OpenMM::CustomNonbondedForce
        subroutine OpenMM_CustomNonbondedForce_create(result, energy)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) result
            character(*) energy
        end
        subroutine OpenMM_CustomNonbondedForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) destroy
        end
        function OpenMM_CustomNonbondedForce_getNumParticles(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            integer*4  OpenMM_CustomNonbondedForce_getNumParticles
        end
        function OpenMM_CustomNonbondedForce_getNumExclusions(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            integer*4  OpenMM_CustomNonbondedForce_getNumExclusions
        end
        function OpenMM_CustomNonbondedForce_getNumPerParticleParameters(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            integer*4  OpenMM_CustomNonbondedForce_getNumPerParticleParameters
        end
        function OpenMM_CustomNonbondedForce_getNumGlobalParameters(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            integer*4  OpenMM_CustomNonbondedForce_getNumGlobalParameters
        end
        function OpenMM_CustomNonbondedForce_getNumFunctions(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            integer*4  OpenMM_CustomNonbondedForce_getNumFunctions
        end
        subroutine OpenMM_CustomNonbondedForce_getEnergyFunction(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            character(*) result
        end
        subroutine OpenMM_CustomNonbondedForce_setEnergyFunction(target, &
                          energy)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            character(*) energy
        end
        subroutine OpenMM_CustomNonbondedForce_getNonbondedMethod(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            integer*4 result
        end
        subroutine OpenMM_CustomNonbondedForce_setNonbondedMethod(target, &
                          method)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            integer*4 method
        end
        function OpenMM_CustomNonbondedForce_getCutoffDistance(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            real*8  OpenMM_CustomNonbondedForce_getCutoffDistance
        end
        subroutine OpenMM_CustomNonbondedForce_setCutoffDistance(target, &
                          distance)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            real*8 distance
        end
        function OpenMM_CustomNonbondedForce_addPerParticleParameter(target, &
                          name)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            character(*) name
            integer*4  OpenMM_CustomNonbondedForce_addPerParticleParameter
        end
        subroutine OpenMM_CustomNonbondedForce_getPerParticleParameterName(target, &
                          index, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            integer*4 index
            character(*) result
        end
        subroutine OpenMM_CustomNonbondedForce_setPerParticleParameterName(target, &
                          index, &
                          name)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            integer*4 index
            character(*) name
        end
        function OpenMM_CustomNonbondedForce_addGlobalParameter(target, &
                          name, &
                          defaultValue)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            character(*) name
            real*8 defaultValue
            integer*4  OpenMM_CustomNonbondedForce_addGlobalParameter
        end
        subroutine OpenMM_CustomNonbondedForce_getGlobalParameterName(target, &
                          index, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            integer*4 index
            character(*) result
        end
        subroutine OpenMM_CustomNonbondedForce_setGlobalParameterName(target, &
                          index, &
                          name)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            integer*4 index
            character(*) name
        end
        function OpenMM_CustomNonbondedForce_getGlobalParameterDefaultValue(target, &
                          index)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            integer*4 index
            real*8  OpenMM_CustomNonbondedForce_getGlobalParameterDefaultValue
        end
        subroutine OpenMM_CustomNonbondedForce_setGlobalParameterDefaultValue(target, &
                          index, &
                          defaultValue)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            integer*4 index
            real*8 defaultValue
        end
        function OpenMM_CustomNonbondedForce_addParticle(target, &
                          parameters)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            type (OpenMM_DoubleArray) parameters
            integer*4  OpenMM_CustomNonbondedForce_addParticle
        end
        subroutine OpenMM_CustomNonbondedForce_getParticleParameters(target, &
                          index, &
                          parameters)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            integer*4 index
            type (OpenMM_DoubleArray) parameters
        end
        subroutine OpenMM_CustomNonbondedForce_setParticleParameters(target, &
                          index, &
                          parameters)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            integer*4 index
            type (OpenMM_DoubleArray) parameters
        end
        function OpenMM_CustomNonbondedForce_addExclusion(target, &
                          particle1, &
                          particle2)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            integer*4 particle1
            integer*4 particle2
            integer*4  OpenMM_CustomNonbondedForce_addExclusion
        end
        subroutine OpenMM_CustomNonbondedForce_getExclusionParticles(target, &
                          index, &
                          particle1, &
                          particle2)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
        end
        subroutine OpenMM_CustomNonbondedForce_setExclusionParticles(target, &
                          index, &
                          particle1, &
                          particle2)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
        end
        function OpenMM_CustomNonbondedForce_addFunction(target, &
                          name, &
                          values, &
                          min, &
                          max)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            character(*) name
            type (OpenMM_DoubleArray) values
            real*8 min
            real*8 max
            integer*4  OpenMM_CustomNonbondedForce_addFunction
        end
        subroutine OpenMM_CustomNonbondedForce_getFunctionParameters(target, &
                          index, &
                          name, &
                          values, &
                          min, &
                          max)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            integer*4 index
            character(*) name
            type (OpenMM_DoubleArray) values
            real*8 min
            real*8 max
        end
        subroutine OpenMM_CustomNonbondedForce_setFunctionParameters(target, &
                          index, &
                          name, &
                          values, &
                          min, &
                          max)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomNonbondedForce) target
            integer*4 index
            character(*) name
            type (OpenMM_DoubleArray) values
            real*8 min
            real*8 max
        end

        ! OpenMM::AndersenThermostat
        subroutine OpenMM_AndersenThermostat_create(result, defaultTemperature, defaultCollisionFrequency)
            use OpenMM_Types; implicit none
            type (OpenMM_AndersenThermostat) result
            real*8 defaultTemperature
            real*8 defaultCollisionFrequency
        end
        subroutine OpenMM_AndersenThermostat_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_AndersenThermostat) destroy
        end
        subroutine OpenMM_AndersenThermostat_Temperature(result)
            use OpenMM_Types; implicit none
            character(*) result
        end
        subroutine OpenMM_AndersenThermostat_CollisionFrequency(result)
            use OpenMM_Types; implicit none
            character(*) result
        end
        function OpenMM_AndersenThermostat_getDefaultTemperature(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AndersenThermostat) target
            real*8  OpenMM_AndersenThermostat_getDefaultTemperature
        end
        function OpenMM_AndersenThermostat_getDefaultCollisionFrequency(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AndersenThermostat) target
            real*8  OpenMM_AndersenThermostat_getDefaultCollisionFrequency
        end
        function OpenMM_AndersenThermostat_getRandomNumberSeed(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AndersenThermostat) target
            integer*4  OpenMM_AndersenThermostat_getRandomNumberSeed
        end
        subroutine OpenMM_AndersenThermostat_setRandomNumberSeed(target, &
                          seed)
            use OpenMM_Types; implicit none
            type (OpenMM_AndersenThermostat) target
            integer*4 seed
        end

        ! OpenMM::CustomTorsionForce
        subroutine OpenMM_CustomTorsionForce_create(result, energy)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomTorsionForce) result
            character(*) energy
        end
        subroutine OpenMM_CustomTorsionForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomTorsionForce) destroy
        end
        function OpenMM_CustomTorsionForce_getNumTorsions(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomTorsionForce) target
            integer*4  OpenMM_CustomTorsionForce_getNumTorsions
        end
        function OpenMM_CustomTorsionForce_getNumPerTorsionParameters(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomTorsionForce) target
            integer*4  OpenMM_CustomTorsionForce_getNumPerTorsionParameters
        end
        function OpenMM_CustomTorsionForce_getNumGlobalParameters(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomTorsionForce) target
            integer*4  OpenMM_CustomTorsionForce_getNumGlobalParameters
        end
        subroutine OpenMM_CustomTorsionForce_getEnergyFunction(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomTorsionForce) target
            character(*) result
        end
        subroutine OpenMM_CustomTorsionForce_setEnergyFunction(target, &
                          energy)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomTorsionForce) target
            character(*) energy
        end
        function OpenMM_CustomTorsionForce_addPerTorsionParameter(target, &
                          name)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomTorsionForce) target
            character(*) name
            integer*4  OpenMM_CustomTorsionForce_addPerTorsionParameter
        end
        subroutine OpenMM_CustomTorsionForce_getPerTorsionParameterName(target, &
                          index, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomTorsionForce) target
            integer*4 index
            character(*) result
        end
        subroutine OpenMM_CustomTorsionForce_setPerTorsionParameterName(target, &
                          index, &
                          name)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomTorsionForce) target
            integer*4 index
            character(*) name
        end
        function OpenMM_CustomTorsionForce_addGlobalParameter(target, &
                          name, &
                          defaultValue)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomTorsionForce) target
            character(*) name
            real*8 defaultValue
            integer*4  OpenMM_CustomTorsionForce_addGlobalParameter
        end
        subroutine OpenMM_CustomTorsionForce_getGlobalParameterName(target, &
                          index, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomTorsionForce) target
            integer*4 index
            character(*) result
        end
        subroutine OpenMM_CustomTorsionForce_setGlobalParameterName(target, &
                          index, &
                          name)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomTorsionForce) target
            integer*4 index
            character(*) name
        end
        function OpenMM_CustomTorsionForce_getGlobalParameterDefaultValue(target, &
                          index)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomTorsionForce) target
            integer*4 index
            real*8  OpenMM_CustomTorsionForce_getGlobalParameterDefaultValue
        end
        subroutine OpenMM_CustomTorsionForce_setGlobalParameterDefaultValue(target, &
                          index, &
                          defaultValue)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomTorsionForce) target
            integer*4 index
            real*8 defaultValue
        end
        function OpenMM_CustomTorsionForce_addTorsion(target, &
                          particle1, &
                          particle2, &
                          particle3, &
                          particle4, &
                          parameters)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomTorsionForce) target
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            integer*4 particle4
            type (OpenMM_DoubleArray) parameters
            integer*4  OpenMM_CustomTorsionForce_addTorsion
        end
        subroutine OpenMM_CustomTorsionForce_getTorsionParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          particle3, &
                          particle4, &
                          parameters)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomTorsionForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            integer*4 particle4
            type (OpenMM_DoubleArray) parameters
        end
        subroutine OpenMM_CustomTorsionForce_setTorsionParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          particle3, &
                          particle4, &
                          parameters)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomTorsionForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            integer*4 particle4
            type (OpenMM_DoubleArray) parameters
        end

        ! OpenMM::Platform
        subroutine OpenMM_Platform_getName(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_Platform) target
            character(*) result
        end
        function OpenMM_Platform_getSpeed(target)
            use OpenMM_Types; implicit none
            type (OpenMM_Platform) target
            real*8  OpenMM_Platform_getSpeed
        end
        subroutine OpenMM_Platform_supportsDoublePrecision(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_Platform) target
            integer*4 result
        end
        subroutine OpenMM_Platform_getPropertyNames(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_Platform) target
            type (OpenMM_StringArray) result
        end
        subroutine OpenMM_Platform_getPropertyValue(target, &
                          context, &
                          property, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_Platform) target
            type (OpenMM_Context) context
            character(*) property
            character(*) result
        end
        subroutine OpenMM_Platform_setPropertyValue(target, &
                          context, &
                          property, &
                          value)
            use OpenMM_Types; implicit none
            type (OpenMM_Platform) target
            type (OpenMM_Context) context
            character(*) property
            character(*) value
        end
        subroutine OpenMM_Platform_getPropertyDefaultValue(target, &
                          property, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_Platform) target
            character(*) property
            character(*) result
        end
        subroutine OpenMM_Platform_setPropertyDefaultValue(target, &
                          property, &
                          value)
            use OpenMM_Types; implicit none
            type (OpenMM_Platform) target
            character(*) property
            character(*) value
        end
        subroutine OpenMM_Platform_supportsKernels(target, &
                          kernelNames, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_Platform) target
            type (OpenMM_StringArray) kernelNames
            integer*4 result
        end
        subroutine OpenMM_Platform_registerPlatform(platform)
            use OpenMM_Types; implicit none
            type (OpenMM_Platform) platform
        end
        function OpenMM_Platform_getNumPlatforms()
            use OpenMM_Types; implicit none
            integer*4  OpenMM_Platform_getNumPlatforms
        end
        subroutine OpenMM_Platform_getPlatform(index, &
                          result)
            use OpenMM_Types; implicit none
            integer*4 index
            type (OpenMM_Platform) result
        end
        subroutine OpenMM_Platform_getPlatformByName(name, &
                          result)
            use OpenMM_Types; implicit none
            character(*) name
            type (OpenMM_Platform) result
        end
        subroutine OpenMM_Platform_findPlatform(kernelNames, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_StringArray) kernelNames
            type (OpenMM_Platform) result
        end
        subroutine OpenMM_Platform_loadPluginLibrary(file)
            use OpenMM_Types; implicit none
            character(*) file
        end
        subroutine OpenMM_Platform_getDefaultPluginsDirectory(result)
            use OpenMM_Types; implicit none
            character(*) result
        end
        subroutine OpenMM_Platform_getOpenMMVersion(result)
            use OpenMM_Types; implicit none
            character(*) result
        end

        ! OpenMM::State
        subroutine OpenMM_State_create(result)
            use OpenMM_Types; implicit none
            type (OpenMM_State) result
        end
        subroutine OpenMM_State_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_State) destroy
        end
        function OpenMM_State_getTime(target)
            use OpenMM_Types; implicit none
            type (OpenMM_State) target
            real*8  OpenMM_State_getTime
        end
        subroutine OpenMM_State_getPositions(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_State) target
            type (OpenMM_Vec3Array) result
        end
        subroutine OpenMM_State_getVelocities(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_State) target
            type (OpenMM_Vec3Array) result
        end
        subroutine OpenMM_State_getForces(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_State) target
            type (OpenMM_Vec3Array) result
        end
        function OpenMM_State_getKineticEnergy(target)
            use OpenMM_Types; implicit none
            type (OpenMM_State) target
            real*8  OpenMM_State_getKineticEnergy
        end
        function OpenMM_State_getPotentialEnergy(target)
            use OpenMM_Types; implicit none
            type (OpenMM_State) target
            real*8  OpenMM_State_getPotentialEnergy
        end
        subroutine OpenMM_State_getPeriodicBoxVectors(target, &
                          a, &
                          b, &
                          c)
            use OpenMM_Types; implicit none
            type (OpenMM_State) target
            real*8 a(3)
            real*8 b(3)
            real*8 c(3)
        end
        subroutine OpenMM_State_getParameters(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_State) target
            type (OpenMM_ParameterArray) result
        end

        ! OpenMM::PeriodicTorsionForce
        subroutine OpenMM_PeriodicTorsionForce_create(result)
            use OpenMM_Types; implicit none
            type (OpenMM_PeriodicTorsionForce) result
        end
        subroutine OpenMM_PeriodicTorsionForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_PeriodicTorsionForce) destroy
        end
        function OpenMM_PeriodicTorsionForce_getNumTorsions(target)
            use OpenMM_Types; implicit none
            type (OpenMM_PeriodicTorsionForce) target
            integer*4  OpenMM_PeriodicTorsionForce_getNumTorsions
        end
        function OpenMM_PeriodicTorsionForce_addTorsion(target, &
                          particle1, &
                          particle2, &
                          particle3, &
                          particle4, &
                          periodicity, &
                          phase, &
                          k)
            use OpenMM_Types; implicit none
            type (OpenMM_PeriodicTorsionForce) target
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            integer*4 particle4
            integer*4 periodicity
            real*8 phase
            real*8 k
            integer*4  OpenMM_PeriodicTorsionForce_addTorsion
        end
        subroutine OpenMM_PeriodicTorsionForce_getTorsionParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          particle3, &
                          particle4, &
                          periodicity, &
                          phase, &
                          k)
            use OpenMM_Types; implicit none
            type (OpenMM_PeriodicTorsionForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            integer*4 particle4
            integer*4 periodicity
            real*8 phase
            real*8 k
        end
        subroutine OpenMM_PeriodicTorsionForce_setTorsionParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          particle3, &
                          particle4, &
                          periodicity, &
                          phase, &
                          k)
            use OpenMM_Types; implicit none
            type (OpenMM_PeriodicTorsionForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            integer*4 particle4
            integer*4 periodicity
            real*8 phase
            real*8 k
        end

        ! OpenMM::Integrator
        function OpenMM_Integrator_getStepSize(target)
            use OpenMM_Types; implicit none
            type (OpenMM_Integrator) target
            real*8  OpenMM_Integrator_getStepSize
        end
        subroutine OpenMM_Integrator_setStepSize(target, &
                          size)
            use OpenMM_Types; implicit none
            type (OpenMM_Integrator) target
            real*8 size
        end
        function OpenMM_Integrator_getConstraintTolerance(target)
            use OpenMM_Types; implicit none
            type (OpenMM_Integrator) target
            real*8  OpenMM_Integrator_getConstraintTolerance
        end
        subroutine OpenMM_Integrator_setConstraintTolerance(target, &
                          tol)
            use OpenMM_Types; implicit none
            type (OpenMM_Integrator) target
            real*8 tol
        end
        subroutine OpenMM_Integrator_step(target, &
                          steps)
            use OpenMM_Types; implicit none
            type (OpenMM_Integrator) target
            integer*4 steps
        end

        ! OpenMM::CustomBondForce
        subroutine OpenMM_CustomBondForce_create(result, energy)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomBondForce) result
            character(*) energy
        end
        subroutine OpenMM_CustomBondForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomBondForce) destroy
        end
        function OpenMM_CustomBondForce_getNumBonds(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomBondForce) target
            integer*4  OpenMM_CustomBondForce_getNumBonds
        end
        function OpenMM_CustomBondForce_getNumPerBondParameters(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomBondForce) target
            integer*4  OpenMM_CustomBondForce_getNumPerBondParameters
        end
        function OpenMM_CustomBondForce_getNumGlobalParameters(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomBondForce) target
            integer*4  OpenMM_CustomBondForce_getNumGlobalParameters
        end
        subroutine OpenMM_CustomBondForce_getEnergyFunction(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomBondForce) target
            character(*) result
        end
        subroutine OpenMM_CustomBondForce_setEnergyFunction(target, &
                          energy)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomBondForce) target
            character(*) energy
        end
        function OpenMM_CustomBondForce_addPerBondParameter(target, &
                          name)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomBondForce) target
            character(*) name
            integer*4  OpenMM_CustomBondForce_addPerBondParameter
        end
        subroutine OpenMM_CustomBondForce_getPerBondParameterName(target, &
                          index, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomBondForce) target
            integer*4 index
            character(*) result
        end
        subroutine OpenMM_CustomBondForce_setPerBondParameterName(target, &
                          index, &
                          name)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomBondForce) target
            integer*4 index
            character(*) name
        end
        function OpenMM_CustomBondForce_addGlobalParameter(target, &
                          name, &
                          defaultValue)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomBondForce) target
            character(*) name
            real*8 defaultValue
            integer*4  OpenMM_CustomBondForce_addGlobalParameter
        end
        subroutine OpenMM_CustomBondForce_getGlobalParameterName(target, &
                          index, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomBondForce) target
            integer*4 index
            character(*) result
        end
        subroutine OpenMM_CustomBondForce_setGlobalParameterName(target, &
                          index, &
                          name)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomBondForce) target
            integer*4 index
            character(*) name
        end
        function OpenMM_CustomBondForce_getGlobalParameterDefaultValue(target, &
                          index)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomBondForce) target
            integer*4 index
            real*8  OpenMM_CustomBondForce_getGlobalParameterDefaultValue
        end
        subroutine OpenMM_CustomBondForce_setGlobalParameterDefaultValue(target, &
                          index, &
                          defaultValue)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomBondForce) target
            integer*4 index
            real*8 defaultValue
        end
        function OpenMM_CustomBondForce_addBond(target, &
                          particle1, &
                          particle2, &
                          parameters)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomBondForce) target
            integer*4 particle1
            integer*4 particle2
            type (OpenMM_DoubleArray) parameters
            integer*4  OpenMM_CustomBondForce_addBond
        end
        subroutine OpenMM_CustomBondForce_getBondParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          parameters)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomBondForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            type (OpenMM_DoubleArray) parameters
        end
        subroutine OpenMM_CustomBondForce_setBondParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          parameters)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomBondForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            type (OpenMM_DoubleArray) parameters
        end

        ! OpenMM::CustomAngleForce
        subroutine OpenMM_CustomAngleForce_create(result, energy)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomAngleForce) result
            character(*) energy
        end
        subroutine OpenMM_CustomAngleForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomAngleForce) destroy
        end
        function OpenMM_CustomAngleForce_getNumAngles(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomAngleForce) target
            integer*4  OpenMM_CustomAngleForce_getNumAngles
        end
        function OpenMM_CustomAngleForce_getNumPerAngleParameters(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomAngleForce) target
            integer*4  OpenMM_CustomAngleForce_getNumPerAngleParameters
        end
        function OpenMM_CustomAngleForce_getNumGlobalParameters(target)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomAngleForce) target
            integer*4  OpenMM_CustomAngleForce_getNumGlobalParameters
        end
        subroutine OpenMM_CustomAngleForce_getEnergyFunction(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomAngleForce) target
            character(*) result
        end
        subroutine OpenMM_CustomAngleForce_setEnergyFunction(target, &
                          energy)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomAngleForce) target
            character(*) energy
        end
        function OpenMM_CustomAngleForce_addPerAngleParameter(target, &
                          name)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomAngleForce) target
            character(*) name
            integer*4  OpenMM_CustomAngleForce_addPerAngleParameter
        end
        subroutine OpenMM_CustomAngleForce_getPerAngleParameterName(target, &
                          index, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomAngleForce) target
            integer*4 index
            character(*) result
        end
        subroutine OpenMM_CustomAngleForce_setPerAngleParameterName(target, &
                          index, &
                          name)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomAngleForce) target
            integer*4 index
            character(*) name
        end
        function OpenMM_CustomAngleForce_addGlobalParameter(target, &
                          name, &
                          defaultValue)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomAngleForce) target
            character(*) name
            real*8 defaultValue
            integer*4  OpenMM_CustomAngleForce_addGlobalParameter
        end
        subroutine OpenMM_CustomAngleForce_getGlobalParameterName(target, &
                          index, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomAngleForce) target
            integer*4 index
            character(*) result
        end
        subroutine OpenMM_CustomAngleForce_setGlobalParameterName(target, &
                          index, &
                          name)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomAngleForce) target
            integer*4 index
            character(*) name
        end
        function OpenMM_CustomAngleForce_getGlobalParameterDefaultValue(target, &
                          index)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomAngleForce) target
            integer*4 index
            real*8  OpenMM_CustomAngleForce_getGlobalParameterDefaultValue
        end
        subroutine OpenMM_CustomAngleForce_setGlobalParameterDefaultValue(target, &
                          index, &
                          defaultValue)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomAngleForce) target
            integer*4 index
            real*8 defaultValue
        end
        function OpenMM_CustomAngleForce_addAngle(target, &
                          particle1, &
                          particle2, &
                          particle3, &
                          parameters)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomAngleForce) target
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            type (OpenMM_DoubleArray) parameters
            integer*4  OpenMM_CustomAngleForce_addAngle
        end
        subroutine OpenMM_CustomAngleForce_getAngleParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          particle3, &
                          parameters)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomAngleForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            type (OpenMM_DoubleArray) parameters
        end
        subroutine OpenMM_CustomAngleForce_setAngleParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          particle3, &
                          parameters)
            use OpenMM_Types; implicit none
            type (OpenMM_CustomAngleForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            type (OpenMM_DoubleArray) parameters
        end

        ! OpenMM::ThreeParticleAverageSite
        subroutine OpenMM_ThreeParticleAverageSite_create(result, particle1, particle2, particle3, weight1, weight2, weight3)
            use OpenMM_Types; implicit none
            type (OpenMM_ThreeParticleAverageSite) result
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            real*8 weight1
            real*8 weight2
            real*8 weight3
        end
        subroutine OpenMM_ThreeParticleAverageSite_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_ThreeParticleAverageSite) destroy
        end
        function OpenMM_ThreeParticleAverageSite_getWeight(target, &
                          particle)
            use OpenMM_Types; implicit none
            type (OpenMM_ThreeParticleAverageSite) target
            integer*4 particle
            real*8  OpenMM_ThreeParticleAverageSite_getWeight
        end

        ! OpenMM::System
        subroutine OpenMM_System_create(result)
            use OpenMM_Types; implicit none
            type (OpenMM_System) result
        end
        subroutine OpenMM_System_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_System) destroy
        end
        function OpenMM_System_getNumParticles(target)
            use OpenMM_Types; implicit none
            type (OpenMM_System) target
            integer*4  OpenMM_System_getNumParticles
        end
        function OpenMM_System_addParticle(target, &
                          mass)
            use OpenMM_Types; implicit none
            type (OpenMM_System) target
            real*8 mass
            integer*4  OpenMM_System_addParticle
        end
        function OpenMM_System_getParticleMass(target, &
                          index)
            use OpenMM_Types; implicit none
            type (OpenMM_System) target
            integer*4 index
            real*8  OpenMM_System_getParticleMass
        end
        subroutine OpenMM_System_setParticleMass(target, &
                          index, &
                          mass)
            use OpenMM_Types; implicit none
            type (OpenMM_System) target
            integer*4 index
            real*8 mass
        end
        subroutine OpenMM_System_setVirtualSite(target, &
                          index, &
                          virtualSite)
            use OpenMM_Types; implicit none
            type (OpenMM_System) target
            integer*4 index
            type (OpenMM_VirtualSite) virtualSite
        end
        subroutine OpenMM_System_isVirtualSite(target, &
                          index, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_System) target
            integer*4 index
            integer*4 result
        end
        subroutine OpenMM_System_getVirtualSite(target, &
                          index, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_System) target
            integer*4 index
            type (OpenMM_VirtualSite) result
        end
        function OpenMM_System_getNumConstraints(target)
            use OpenMM_Types; implicit none
            type (OpenMM_System) target
            integer*4  OpenMM_System_getNumConstraints
        end
        function OpenMM_System_addConstraint(target, &
                          particle1, &
                          particle2, &
                          distance)
            use OpenMM_Types; implicit none
            type (OpenMM_System) target
            integer*4 particle1
            integer*4 particle2
            real*8 distance
            integer*4  OpenMM_System_addConstraint
        end
        subroutine OpenMM_System_getConstraintParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          distance)
            use OpenMM_Types; implicit none
            type (OpenMM_System) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            real*8 distance
        end
        subroutine OpenMM_System_setConstraintParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          distance)
            use OpenMM_Types; implicit none
            type (OpenMM_System) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            real*8 distance
        end
        function OpenMM_System_addForce(target, &
                          force)
            use OpenMM_Types; implicit none
            type (OpenMM_System) target
            type (OpenMM_Force) force
            integer*4  OpenMM_System_addForce
        end
        function OpenMM_System_getNumForces(target)
            use OpenMM_Types; implicit none
            type (OpenMM_System) target
            integer*4  OpenMM_System_getNumForces
        end
        subroutine OpenMM_System_getForce(target, &
                          index, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_System) target
            integer*4 index
            type (OpenMM_Force) result
        end
        subroutine OpenMM_System_getDefaultPeriodicBoxVectors(target, &
                          a, &
                          b, &
                          c)
            use OpenMM_Types; implicit none
            type (OpenMM_System) target
            real*8 a(3)
            real*8 b(3)
            real*8 c(3)
        end
        subroutine OpenMM_System_setDefaultPeriodicBoxVectors(target, &
                          a, &
                          b, &
                          c)
            use OpenMM_Types; implicit none
            type (OpenMM_System) target
            real*8 a(3)
            real*8 b(3)
            real*8 c(3)
        end
    end interface
END MODULE OpenMM
