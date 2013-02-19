
MODULE OpenMM_Types
    implicit none

    ! Global Constants
 

    ! Type Declarations
 
    type OpenMM_OpenMMException
        integer*8 :: handle = 0
    end type
 
    type OpenMM_AmoebaHarmonicInPlaneAngleForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_AmoebaMultipoleForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_AmoebaStretchBendForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_AmoebaWcaDispersionForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_AmoebaOutOfPlaneBendForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_AmoebaGeneralizedKirkwoodForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_AmoebaUreyBradleyForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_AmoebaTorsionForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_ContextImpl
        integer*8 :: handle = 0
    end type
 
    type OpenMM_Force
        integer*8 :: handle = 0
    end type
 
    type OpenMM_AmoebaHarmonicBondForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_AmoebaHarmonicAngleForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_ForceImpl
        integer*8 :: handle = 0
    end type
 
    type OpenMM_AmoebaTorsionTorsionForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_AmoebaPiTorsionForce
        integer*8 :: handle = 0
    end type
 
    type OpenMM_AmoebaVdwForce
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

    type OpenMM_3D_DoubleArray
        integer*8 :: handle = 0
    end type

    type OpenMM_IntArray
        integer*8 :: handle = 0
    end type

    ! Enumerations

    integer*4 OpenMM_False
    integer*4 OpenMM_True
    parameter(OpenMM_False=0)
    parameter(OpenMM_True=1)
 
    integer*4 OpenMM_AmoebaMultipoleForce_NoCutoff
    integer*4 OpenMM_AmoebaMultipoleForce_PME
    parameter(OpenMM_AmoebaMultipoleForce_NoCutoff=0)
    parameter(OpenMM_AmoebaMultipoleForce_PME=1)

    integer*4 OpenMM_AmoebaMultipoleForce_Mutual
    integer*4 OpenMM_AmoebaMultipoleForce_Direct
    parameter(OpenMM_AmoebaMultipoleForce_Mutual=0)
    parameter(OpenMM_AmoebaMultipoleForce_Direct=1)

    integer*4 OpenMM_AmoebaMultipoleForce_ZThenX
    integer*4 OpenMM_AmoebaMultipoleForce_Bisector
    integer*4 OpenMM_AmoebaMultipoleForce_ZBisect
    integer*4 OpenMM_AmoebaMultipoleForce_ThreeFold
    integer*4 OpenMM_AmoebaMultipoleForce_ZOnly
    integer*4 OpenMM_AmoebaMultipoleForce_NoAxisType
    integer*4 OpenMM_AmoebaMultipoleForce_LastAxisTypeIndex
    parameter(OpenMM_AmoebaMultipoleForce_ZThenX=0)
    parameter(OpenMM_AmoebaMultipoleForce_Bisector=1)
    parameter(OpenMM_AmoebaMultipoleForce_ZBisect=2)
    parameter(OpenMM_AmoebaMultipoleForce_ThreeFold=3)
    parameter(OpenMM_AmoebaMultipoleForce_ZOnly=4)
    parameter(OpenMM_AmoebaMultipoleForce_NoAxisType=5)
    parameter(OpenMM_AmoebaMultipoleForce_LastAxisTypeIndex=6)

    integer*4 OpenMM_AmoebaMultipoleForce_SOR
    parameter(OpenMM_AmoebaMultipoleForce_SOR=0)

    integer*4 OpenMM_AmoebaMultipoleForce_Covalent12
    integer*4 OpenMM_AmoebaMultipoleForce_Covalent13
    integer*4 OpenMM_AmoebaMultipoleForce_Covalent14
    integer*4 OpenMM_AmoebaMultipoleForce_Covalent15
    integer*4 OpenMM_AmoebaMultipoleForce_PolarizationCovalent11
    integer*4 OpenMM_AmoebaMultipoleForce_PolarizationCovalent12
    integer*4 OpenMM_AmoebaMultipoleForce_PolarizationCovalent13
    integer*4 OpenMM_AmoebaMultipoleForce_PolarizationCovalent14
    integer*4 OpenMM_AmoebaMultipoleForce_CovalentEnd
    parameter(OpenMM_AmoebaMultipoleForce_Covalent12=0)
    parameter(OpenMM_AmoebaMultipoleForce_Covalent13=1)
    parameter(OpenMM_AmoebaMultipoleForce_Covalent14=2)
    parameter(OpenMM_AmoebaMultipoleForce_Covalent15=3)
    parameter(OpenMM_AmoebaMultipoleForce_PolarizationCovalent11=4)
    parameter(OpenMM_AmoebaMultipoleForce_PolarizationCovalent12=5)
    parameter(OpenMM_AmoebaMultipoleForce_PolarizationCovalent13=6)
    parameter(OpenMM_AmoebaMultipoleForce_PolarizationCovalent14=7)
    parameter(OpenMM_AmoebaMultipoleForce_CovalentEnd=8)

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

        ! OpenMM_IntArray
        subroutine OpenMM_IntArray_create(result, size)
            use OpenMM_Types; implicit none
            integer*4 size
            type (OpenMM_IntArray) result
        end
        subroutine OpenMM_IntArray_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_IntArray) destroy
        end
        function OpenMM_IntArray_getSize(target)
            use OpenMM_Types; implicit none
            type (OpenMM_IntArray) target
            integer*4 OpenMM_IntArray_getSize
        end
        subroutine OpenMM_IntArray_resize(target, size)
            use OpenMM_Types; implicit none
            type (OpenMM_IntArray) target
            integer*4 size
        end
        subroutine OpenMM_IntArray_append(target, value)
            use OpenMM_Types; implicit none
            type (OpenMM_IntArray) target
            integer value
        end
        subroutine OpenMM_IntArray_set(target, index, value)
            use OpenMM_Types; implicit none
            type (OpenMM_IntArray) target
            integer*4 index
            integer value
        end
        subroutine OpenMM_IntArray_get(target, index, result)
            use OpenMM_Types; implicit none
            type (OpenMM_IntArray) target
            integer*4 index
            integer result
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

        ! OpenMM::AmoebaHarmonicInPlaneAngleForce
        subroutine OpenMM_AmoebaHarmonicInPlaneAngleForce_create(result)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicInPlaneAngleForce) result
        end
        subroutine OpenMM_AmoebaHarmonicInPlaneAngleForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicInPlaneAngleForce) destroy
        end
        function OpenMM_AmoebaHarmonicInPlaneAngleForce_getNumAngles(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicInPlaneAngleForce) target
            integer*4  OpenMM_AmoebaHarmonicInPlaneAngleForce_getNumAngles
        end
        subroutine OpenMM_AmoebaHarmonicInPlaneAngleForce_setAmoebaGlobalHarmonicInPlaneAngleCubic(target, &
                          cubicK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicInPlaneAngleForce) target
            real*8 cubicK
        end
        function OpenMM_AmoebaHarmonicInPlaneAngleForce_getAmoebaGlobalHarmonicInPlaneAngleCubic(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicInPlaneAngleForce) target
            real*8  OpenMM_AmoebaHarmonicInPlaneAngleForce_getAmoebaGlobalHarmonicInPlaneAngleCubic
        end
        subroutine OpenMM_AmoebaHarmonicInPlaneAngleForce_setAmoebaGlobalHarmonicInPlaneAngleQuartic(target, &
                          quarticK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicInPlaneAngleForce) target
            real*8 quarticK
        end
        function OpenMM_AmoebaHarmonicInPlaneAngleForce_getAmoebaGlobalHarmonicInPlaneAngleQuartic(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicInPlaneAngleForce) target
            real*8  OpenMM_AmoebaHarmonicInPlaneAngleForce_getAmoebaGlobalHarmonicInPlaneAngleQuartic
        end
        subroutine OpenMM_AmoebaHarmonicInPlaneAngleForce_setAmoebaGlobalHarmonicInPlaneAnglePentic(target, &
                          penticK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicInPlaneAngleForce) target
            real*8 penticK
        end
        function OpenMM_AmoebaHarmonicInPlaneAngleForce_getAmoebaGlobalHarmonicInPlaneAnglePentic(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicInPlaneAngleForce) target
            real*8  OpenMM_AmoebaHarmonicInPlaneAngleForce_getAmoebaGlobalHarmonicInPlaneAnglePentic
        end
        subroutine OpenMM_AmoebaHarmonicInPlaneAngleForce_setAmoebaGlobalHarmonicInPlaneAngleSextic(target, &
                          sexticK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicInPlaneAngleForce) target
            real*8 sexticK
        end
        function OpenMM_AmoebaHarmonicInPlaneAngleForce_getAmoebaGlobalHarmonicInPlaneAngleSextic(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicInPlaneAngleForce) target
            real*8  OpenMM_AmoebaHarmonicInPlaneAngleForce_getAmoebaGlobalHarmonicInPlaneAngleSextic
        end
        function OpenMM_AmoebaHarmonicInPlaneAngleForce_addAngle(target, &
                          particle1, &
                          particle2, &
                          particle3, &
                          particle4, &
                          length, &
                          quadraticK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicInPlaneAngleForce) target
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            integer*4 particle4
            real*8 length
            real*8 quadraticK
            integer*4  OpenMM_AmoebaHarmonicInPlaneAngleForce_addAngle
        end
        subroutine OpenMM_AmoebaHarmonicInPlaneAngleForce_getAngleParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          particle3, &
                          particle4, &
                          length, &
                          quadraticK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicInPlaneAngleForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            integer*4 particle4
            real*8 length
            real*8 quadraticK
        end
        subroutine OpenMM_AmoebaHarmonicInPlaneAngleForce_setAngleParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          particle3, &
                          particle4, &
                          length, &
                          quadraticK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicInPlaneAngleForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            integer*4 particle4
            real*8 length
            real*8 quadraticK
        end

        ! OpenMM::AmoebaMultipoleForce
        subroutine OpenMM_AmoebaMultipoleForce_create(result)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) result
        end
        subroutine OpenMM_AmoebaMultipoleForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) destroy
        end
        function OpenMM_AmoebaMultipoleForce_getNumMultipoles(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) target
            integer*4  OpenMM_AmoebaMultipoleForce_getNumMultipoles
        end
        subroutine OpenMM_AmoebaMultipoleForce_getNonbondedMethod(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) target
            integer*4 result
        end
        subroutine OpenMM_AmoebaMultipoleForce_setNonbondedMethod(target, &
                          method)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) target
            integer*4 method
        end
        subroutine OpenMM_AmoebaMultipoleForce_getPolarizationType(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) target
            integer*4 result
        end
        subroutine OpenMM_AmoebaMultipoleForce_setPolarizationType(target, &
                          type)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) target
            integer*4 type
        end
        function OpenMM_AmoebaMultipoleForce_getCutoffDistance(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) target
            real*8  OpenMM_AmoebaMultipoleForce_getCutoffDistance
        end
        subroutine OpenMM_AmoebaMultipoleForce_setCutoffDistance(target, &
                          distance)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) target
            real*8 distance
        end
        function OpenMM_AmoebaMultipoleForce_getAEwald(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) target
            real*8  OpenMM_AmoebaMultipoleForce_getAEwald
        end
        subroutine OpenMM_AmoebaMultipoleForce_setAEwald(target, &
                          aewald)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) target
            real*8 aewald
        end
        function OpenMM_AmoebaMultipoleForce_getPmeBSplineOrder(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) target
            integer*4  OpenMM_AmoebaMultipoleForce_getPmeBSplineOrder
        end
        subroutine OpenMM_AmoebaMultipoleForce_getPmeGridDimensions(target, &
                          gridDimension)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) target
            type (OpenMM_IntArray) gridDimension
        end
        subroutine OpenMM_AmoebaMultipoleForce_setPmeGridDimensions(target, &
                          gridDimension)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) target
            type (OpenMM_IntArray) gridDimension
        end
        function OpenMM_AmoebaMultipoleForce_addParticle(target, &
                          charge, &
                          molecularDipole, &
                          molecularQuadrupole, &
                          axisType, &
                          multipoleAtomZ, &
                          multipoleAtomX, &
                          multipoleAtomY, &
                          thole, &
                          dampingFactor, &
                          polarity)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) target
            real*8 charge
            type (OpenMM_DoubleArray) molecularDipole
            type (OpenMM_DoubleArray) molecularQuadrupole
            integer*4 axisType
            integer*4 multipoleAtomZ
            integer*4 multipoleAtomX
            integer*4 multipoleAtomY
            real*8 thole
            real*8 dampingFactor
            real*8 polarity
            integer*4  OpenMM_AmoebaMultipoleForce_addParticle
        end
        subroutine OpenMM_AmoebaMultipoleForce_getMultipoleParameters(target, &
                          index, &
                          charge, &
                          molecularDipole, &
                          molecularQuadrupole, &
                          axisType, &
                          multipoleAtomZ, &
                          multipoleAtomX, &
                          multipoleAtomY, &
                          thole, &
                          dampingFactor, &
                          polarity)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) target
            integer*4 index
            real*8 charge
            type (OpenMM_DoubleArray) molecularDipole
            type (OpenMM_DoubleArray) molecularQuadrupole
            integer*4 axisType
            integer*4 multipoleAtomZ
            integer*4 multipoleAtomX
            integer*4 multipoleAtomY
            real*8 thole
            real*8 dampingFactor
            real*8 polarity
        end
        subroutine OpenMM_AmoebaMultipoleForce_setMultipoleParameters(target, &
                          index, &
                          charge, &
                          molecularDipole, &
                          molecularQuadrupole, &
                          axisType, &
                          multipoleAtomZ, &
                          multipoleAtomX, &
                          multipoleAtomY, &
                          thole, &
                          dampingFactor, &
                          polarity)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) target
            integer*4 index
            real*8 charge
            type (OpenMM_DoubleArray) molecularDipole
            type (OpenMM_DoubleArray) molecularQuadrupole
            integer*4 axisType
            integer*4 multipoleAtomZ
            integer*4 multipoleAtomX
            integer*4 multipoleAtomY
            real*8 thole
            real*8 dampingFactor
            real*8 polarity
        end
        subroutine OpenMM_AmoebaMultipoleForce_setCovalentMap(target, &
                          index, &
                          typeId, &
                          covalentAtoms)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) target
            integer*4 index
            integer*4 typeId
            type (OpenMM_IntArray) covalentAtoms
        end
        subroutine OpenMM_AmoebaMultipoleForce_getCovalentMap(target, &
                          index, &
                          typeId, &
                          covalentAtoms)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) target
            integer*4 index
            integer*4 typeId
            type (OpenMM_IntArray) covalentAtoms
        end
        subroutine OpenMM_AmoebaMultipoleForce_getCovalentMaps(target, &
                          index, &
                          covalentLists)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) target
            integer*4 index
            
        end
        function OpenMM_AmoebaMultipoleForce_getMutualInducedMaxIterations(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) target
            integer*4  OpenMM_AmoebaMultipoleForce_getMutualInducedMaxIterations
        end
        subroutine OpenMM_AmoebaMultipoleForce_setMutualInducedMaxIterations(target, &
                          inputMutualInducedMaxIterations)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) target
            integer*4 inputMutualInducedMaxIterations
        end
        function OpenMM_AmoebaMultipoleForce_getMutualInducedTargetEpsilon(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) target
            real*8  OpenMM_AmoebaMultipoleForce_getMutualInducedTargetEpsilon
        end
        subroutine OpenMM_AmoebaMultipoleForce_setMutualInducedTargetEpsilon(target, &
                          inputMutualInducedTargetEpsilon)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) target
            real*8 inputMutualInducedTargetEpsilon
        end
        function OpenMM_AmoebaMultipoleForce_getEwaldErrorTolerance(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) target
            real*8  OpenMM_AmoebaMultipoleForce_getEwaldErrorTolerance
        end
        subroutine OpenMM_AmoebaMultipoleForce_setEwaldErrorTolerance(target, &
                          tol)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaMultipoleForce) target
            real*8 tol
        end

        ! OpenMM::AmoebaStretchBendForce
        subroutine OpenMM_AmoebaStretchBendForce_create(result)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaStretchBendForce) result
        end
        subroutine OpenMM_AmoebaStretchBendForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaStretchBendForce) destroy
        end
        function OpenMM_AmoebaStretchBendForce_getNumStretchBends(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaStretchBendForce) target
            integer*4  OpenMM_AmoebaStretchBendForce_getNumStretchBends
        end
        function OpenMM_AmoebaStretchBendForce_addStretchBend(target, &
                          particle1, &
                          particle2, &
                          particle3, &
                          lengthAB, &
                          lengthCB, &
                          angle, &
                          k)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaStretchBendForce) target
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            real*8 lengthAB
            real*8 lengthCB
            real*8 angle
            real*8 k
            integer*4  OpenMM_AmoebaStretchBendForce_addStretchBend
        end
        subroutine OpenMM_AmoebaStretchBendForce_getStretchBendParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          particle3, &
                          lengthAB, &
                          lengthCB, &
                          angle, &
                          k)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaStretchBendForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            real*8 lengthAB
            real*8 lengthCB
            real*8 angle
            real*8 k
        end
        subroutine OpenMM_AmoebaStretchBendForce_setStretchBendParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          particle3, &
                          lengthAB, &
                          lengthCB, &
                          angle, &
                          k)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaStretchBendForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            real*8 lengthAB
            real*8 lengthCB
            real*8 angle
            real*8 k
        end

        ! OpenMM::AmoebaWcaDispersionForce
        subroutine OpenMM_AmoebaWcaDispersionForce_create(result)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaWcaDispersionForce) result
        end
        subroutine OpenMM_AmoebaWcaDispersionForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaWcaDispersionForce) destroy
        end
        function OpenMM_AmoebaWcaDispersionForce_getNumParticles(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaWcaDispersionForce) target
            integer*4  OpenMM_AmoebaWcaDispersionForce_getNumParticles
        end
        subroutine OpenMM_AmoebaWcaDispersionForce_setParticleParameters(target, &
                          particleIndex, &
                          radius, &
                          epsilon)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaWcaDispersionForce) target
            integer*4 particleIndex
            real*8 radius
            real*8 epsilon
        end
        subroutine OpenMM_AmoebaWcaDispersionForce_getParticleParameters(target, &
                          particleIndex, &
                          radius, &
                          epsilon)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaWcaDispersionForce) target
            integer*4 particleIndex
            real*8 radius
            real*8 epsilon
        end
        function OpenMM_AmoebaWcaDispersionForce_addParticle(target, &
                          radius, &
                          epsilon)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaWcaDispersionForce) target
            real*8 radius
            real*8 epsilon
            integer*4  OpenMM_AmoebaWcaDispersionForce_addParticle
        end
        function OpenMM_AmoebaWcaDispersionForce_getEpso(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaWcaDispersionForce) target
            real*8  OpenMM_AmoebaWcaDispersionForce_getEpso
        end
        function OpenMM_AmoebaWcaDispersionForce_getEpsh(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaWcaDispersionForce) target
            real*8  OpenMM_AmoebaWcaDispersionForce_getEpsh
        end
        function OpenMM_AmoebaWcaDispersionForce_getRmino(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaWcaDispersionForce) target
            real*8  OpenMM_AmoebaWcaDispersionForce_getRmino
        end
        function OpenMM_AmoebaWcaDispersionForce_getRminh(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaWcaDispersionForce) target
            real*8  OpenMM_AmoebaWcaDispersionForce_getRminh
        end
        function OpenMM_AmoebaWcaDispersionForce_getAwater(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaWcaDispersionForce) target
            real*8  OpenMM_AmoebaWcaDispersionForce_getAwater
        end
        function OpenMM_AmoebaWcaDispersionForce_getShctd(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaWcaDispersionForce) target
            real*8  OpenMM_AmoebaWcaDispersionForce_getShctd
        end
        function OpenMM_AmoebaWcaDispersionForce_getDispoff(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaWcaDispersionForce) target
            real*8  OpenMM_AmoebaWcaDispersionForce_getDispoff
        end
        function OpenMM_AmoebaWcaDispersionForce_getSlevy(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaWcaDispersionForce) target
            real*8  OpenMM_AmoebaWcaDispersionForce_getSlevy
        end
        subroutine OpenMM_AmoebaWcaDispersionForce_setEpso(target, &
                          inputValue)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaWcaDispersionForce) target
            real*8 inputValue
        end
        subroutine OpenMM_AmoebaWcaDispersionForce_setEpsh(target, &
                          inputValue)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaWcaDispersionForce) target
            real*8 inputValue
        end
        subroutine OpenMM_AmoebaWcaDispersionForce_setRmino(target, &
                          inputValue)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaWcaDispersionForce) target
            real*8 inputValue
        end
        subroutine OpenMM_AmoebaWcaDispersionForce_setRminh(target, &
                          inputValue)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaWcaDispersionForce) target
            real*8 inputValue
        end
        subroutine OpenMM_AmoebaWcaDispersionForce_setAwater(target, &
                          inputValue)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaWcaDispersionForce) target
            real*8 inputValue
        end
        subroutine OpenMM_AmoebaWcaDispersionForce_setShctd(target, &
                          inputValue)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaWcaDispersionForce) target
            real*8 inputValue
        end
        subroutine OpenMM_AmoebaWcaDispersionForce_setDispoff(target, &
                          inputValue)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaWcaDispersionForce) target
            real*8 inputValue
        end
        subroutine OpenMM_AmoebaWcaDispersionForce_setSlevy(target, &
                          inputValue)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaWcaDispersionForce) target
            real*8 inputValue
        end

        ! OpenMM::AmoebaOutOfPlaneBendForce
        subroutine OpenMM_AmoebaOutOfPlaneBendForce_create(result)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaOutOfPlaneBendForce) result
        end
        subroutine OpenMM_AmoebaOutOfPlaneBendForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaOutOfPlaneBendForce) destroy
        end
        function OpenMM_AmoebaOutOfPlaneBendForce_getNumOutOfPlaneBends(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaOutOfPlaneBendForce) target
            integer*4  OpenMM_AmoebaOutOfPlaneBendForce_getNumOutOfPlaneBends
        end
        subroutine OpenMM_AmoebaOutOfPlaneBendForce_setAmoebaGlobalOutOfPlaneBendCubic(target, &
                          cubicK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaOutOfPlaneBendForce) target
            real*8 cubicK
        end
        function OpenMM_AmoebaOutOfPlaneBendForce_getAmoebaGlobalOutOfPlaneBendCubic(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaOutOfPlaneBendForce) target
            real*8  OpenMM_AmoebaOutOfPlaneBendForce_getAmoebaGlobalOutOfPlaneBendCubic
        end
        subroutine OpenMM_AmoebaOutOfPlaneBendForce_setAmoebaGlobalOutOfPlaneBendQuartic(target, &
                          quarticK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaOutOfPlaneBendForce) target
            real*8 quarticK
        end
        function OpenMM_AmoebaOutOfPlaneBendForce_getAmoebaGlobalOutOfPlaneBendQuartic(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaOutOfPlaneBendForce) target
            real*8  OpenMM_AmoebaOutOfPlaneBendForce_getAmoebaGlobalOutOfPlaneBendQuartic
        end
        subroutine OpenMM_AmoebaOutOfPlaneBendForce_setAmoebaGlobalOutOfPlaneBendPentic(target, &
                          penticK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaOutOfPlaneBendForce) target
            real*8 penticK
        end
        function OpenMM_AmoebaOutOfPlaneBendForce_getAmoebaGlobalOutOfPlaneBendPentic(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaOutOfPlaneBendForce) target
            real*8  OpenMM_AmoebaOutOfPlaneBendForce_getAmoebaGlobalOutOfPlaneBendPentic
        end
        subroutine OpenMM_AmoebaOutOfPlaneBendForce_setAmoebaGlobalOutOfPlaneBendSextic(target, &
                          sexticK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaOutOfPlaneBendForce) target
            real*8 sexticK
        end
        function OpenMM_AmoebaOutOfPlaneBendForce_getAmoebaGlobalOutOfPlaneBendSextic(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaOutOfPlaneBendForce) target
            real*8  OpenMM_AmoebaOutOfPlaneBendForce_getAmoebaGlobalOutOfPlaneBendSextic
        end
        function OpenMM_AmoebaOutOfPlaneBendForce_addOutOfPlaneBend(target, &
                          particle1, &
                          particle2, &
                          particle3, &
                          particle4, &
                          k)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaOutOfPlaneBendForce) target
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            integer*4 particle4
            real*8 k
            integer*4  OpenMM_AmoebaOutOfPlaneBendForce_addOutOfPlaneBend
        end
        subroutine OpenMM_AmoebaOutOfPlaneBendForce_getOutOfPlaneBendParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          particle3, &
                          particle4, &
                          k)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaOutOfPlaneBendForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            integer*4 particle4
            real*8 k
        end
        subroutine OpenMM_AmoebaOutOfPlaneBendForce_setOutOfPlaneBendParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          particle3, &
                          particle4, &
                          k)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaOutOfPlaneBendForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            integer*4 particle4
            real*8 k
        end

        ! OpenMM::AmoebaGeneralizedKirkwoodForce
        subroutine OpenMM_AmoebaGeneralizedKirkwoodForce_create(result)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaGeneralizedKirkwoodForce) result
        end
        subroutine OpenMM_AmoebaGeneralizedKirkwoodForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaGeneralizedKirkwoodForce) destroy
        end
        function OpenMM_AmoebaGeneralizedKirkwoodForce_getNumParticles(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaGeneralizedKirkwoodForce) target
            integer*4  OpenMM_AmoebaGeneralizedKirkwoodForce_getNumParticles
        end
        function OpenMM_AmoebaGeneralizedKirkwoodForce_addParticle(target, &
                          charge, &
                          radius, &
                          scalingFactor)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaGeneralizedKirkwoodForce) target
            real*8 charge
            real*8 radius
            real*8 scalingFactor
            integer*4  OpenMM_AmoebaGeneralizedKirkwoodForce_addParticle
        end
        subroutine OpenMM_AmoebaGeneralizedKirkwoodForce_getParticleParameters(target, &
                          index, &
                          charge, &
                          radius, &
                          scalingFactor)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaGeneralizedKirkwoodForce) target
            integer*4 index
            real*8 charge
            real*8 radius
            real*8 scalingFactor
        end
        subroutine OpenMM_AmoebaGeneralizedKirkwoodForce_setParticleParameters(target, &
                          index, &
                          charge, &
                          radius, &
                          scalingFactor)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaGeneralizedKirkwoodForce) target
            integer*4 index
            real*8 charge
            real*8 radius
            real*8 scalingFactor
        end
        function OpenMM_AmoebaGeneralizedKirkwoodForce_getSolventDielectric(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaGeneralizedKirkwoodForce) target
            real*8  OpenMM_AmoebaGeneralizedKirkwoodForce_getSolventDielectric
        end
        subroutine OpenMM_AmoebaGeneralizedKirkwoodForce_setSolventDielectric(target, &
                          dielectric)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaGeneralizedKirkwoodForce) target
            real*8 dielectric
        end
        function OpenMM_AmoebaGeneralizedKirkwoodForce_getSoluteDielectric(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaGeneralizedKirkwoodForce) target
            real*8  OpenMM_AmoebaGeneralizedKirkwoodForce_getSoluteDielectric
        end
        subroutine OpenMM_AmoebaGeneralizedKirkwoodForce_setSoluteDielectric(target, &
                          dielectric)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaGeneralizedKirkwoodForce) target
            real*8 dielectric
        end
        function OpenMM_AmoebaGeneralizedKirkwoodForce_getIncludeCavityTerm(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaGeneralizedKirkwoodForce) target
            integer*4  OpenMM_AmoebaGeneralizedKirkwoodForce_getIncludeCavityTerm
        end
        subroutine OpenMM_AmoebaGeneralizedKirkwoodForce_setIncludeCavityTerm(target, &
                          includeCavityTerm)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaGeneralizedKirkwoodForce) target
            integer*4 includeCavityTerm
        end
        function OpenMM_AmoebaGeneralizedKirkwoodForce_getProbeRadius(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaGeneralizedKirkwoodForce) target
            real*8  OpenMM_AmoebaGeneralizedKirkwoodForce_getProbeRadius
        end
        subroutine OpenMM_AmoebaGeneralizedKirkwoodForce_setProbeRadius(target, &
                          probeRadius)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaGeneralizedKirkwoodForce) target
            real*8 probeRadius
        end
        function OpenMM_AmoebaGeneralizedKirkwoodForce_getSurfaceAreaFactor(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaGeneralizedKirkwoodForce) target
            real*8  OpenMM_AmoebaGeneralizedKirkwoodForce_getSurfaceAreaFactor
        end
        subroutine OpenMM_AmoebaGeneralizedKirkwoodForce_setSurfaceAreaFactor(target, &
                          surfaceAreaFactor)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaGeneralizedKirkwoodForce) target
            real*8 surfaceAreaFactor
        end

        ! OpenMM::AmoebaUreyBradleyForce
        subroutine OpenMM_AmoebaUreyBradleyForce_create(result)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaUreyBradleyForce) result
        end
        subroutine OpenMM_AmoebaUreyBradleyForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaUreyBradleyForce) destroy
        end
        function OpenMM_AmoebaUreyBradleyForce_getNumInteractions(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaUreyBradleyForce) target
            integer*4  OpenMM_AmoebaUreyBradleyForce_getNumInteractions
        end
        subroutine OpenMM_AmoebaUreyBradleyForce_setAmoebaGlobalUreyBradleyCubic(target, &
                          cubicK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaUreyBradleyForce) target
            real*8 cubicK
        end
        function OpenMM_AmoebaUreyBradleyForce_getAmoebaGlobalUreyBradleyCubic(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaUreyBradleyForce) target
            real*8  OpenMM_AmoebaUreyBradleyForce_getAmoebaGlobalUreyBradleyCubic
        end
        subroutine OpenMM_AmoebaUreyBradleyForce_setAmoebaGlobalUreyBradleyQuartic(target, &
                          quarticK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaUreyBradleyForce) target
            real*8 quarticK
        end
        function OpenMM_AmoebaUreyBradleyForce_getAmoebaGlobalUreyBradleyQuartic(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaUreyBradleyForce) target
            real*8  OpenMM_AmoebaUreyBradleyForce_getAmoebaGlobalUreyBradleyQuartic
        end
        function OpenMM_AmoebaUreyBradleyForce_addUreyBradley(target, &
                          particle1, &
                          particle2, &
                          length, &
                          quadraticK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaUreyBradleyForce) target
            integer*4 particle1
            integer*4 particle2
            real*8 length
            real*8 quadraticK
            integer*4  OpenMM_AmoebaUreyBradleyForce_addUreyBradley
        end
        subroutine OpenMM_AmoebaUreyBradleyForce_getUreyBradleyParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          length, &
                          quadraticK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaUreyBradleyForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            real*8 length
            real*8 quadraticK
        end
        subroutine OpenMM_AmoebaUreyBradleyForce_setUreyBradleyParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          length, &
                          quadraticK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaUreyBradleyForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            real*8 length
            real*8 quadraticK
        end

        ! OpenMM::AmoebaTorsionForce
        subroutine OpenMM_AmoebaTorsionForce_create(result)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaTorsionForce) result
        end
        subroutine OpenMM_AmoebaTorsionForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaTorsionForce) destroy
        end
        function OpenMM_AmoebaTorsionForce_getNumTorsions(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaTorsionForce) target
            integer*4  OpenMM_AmoebaTorsionForce_getNumTorsions
        end
        function OpenMM_AmoebaTorsionForce_addTorsion(target, &
                          particle1, &
                          particle2, &
                          particle3, &
                          particle4, &
                          torsion1, &
                          torsion2, &
                          torsion3)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaTorsionForce) target
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            integer*4 particle4
            type (OpenMM_DoubleArray) torsion1
            type (OpenMM_DoubleArray) torsion2
            type (OpenMM_DoubleArray) torsion3
            integer*4  OpenMM_AmoebaTorsionForce_addTorsion
        end
        subroutine OpenMM_AmoebaTorsionForce_getTorsionParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          particle3, &
                          particle4, &
                          torsion1, &
                          torsion2, &
                          torsion3)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaTorsionForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            integer*4 particle4
            type (OpenMM_DoubleArray) torsion1
            type (OpenMM_DoubleArray) torsion2
            type (OpenMM_DoubleArray) torsion3
        end
        subroutine OpenMM_AmoebaTorsionForce_setTorsionParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          particle3, &
                          particle4, &
                          torsion1, &
                          torsion2, &
                          torsion3)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaTorsionForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            integer*4 particle4
            type (OpenMM_DoubleArray) torsion1
            type (OpenMM_DoubleArray) torsion2
            type (OpenMM_DoubleArray) torsion3
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

        ! OpenMM::AmoebaHarmonicBondForce
        subroutine OpenMM_AmoebaHarmonicBondForce_create(result)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicBondForce) result
        end
        subroutine OpenMM_AmoebaHarmonicBondForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicBondForce) destroy
        end
        function OpenMM_AmoebaHarmonicBondForce_getNumBonds(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicBondForce) target
            integer*4  OpenMM_AmoebaHarmonicBondForce_getNumBonds
        end
        subroutine OpenMM_AmoebaHarmonicBondForce_setAmoebaGlobalHarmonicBondCubic(target, &
                          cubicK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicBondForce) target
            real*8 cubicK
        end
        function OpenMM_AmoebaHarmonicBondForce_getAmoebaGlobalHarmonicBondCubic(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicBondForce) target
            real*8  OpenMM_AmoebaHarmonicBondForce_getAmoebaGlobalHarmonicBondCubic
        end
        subroutine OpenMM_AmoebaHarmonicBondForce_setAmoebaGlobalHarmonicBondQuartic(target, &
                          quarticK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicBondForce) target
            real*8 quarticK
        end
        function OpenMM_AmoebaHarmonicBondForce_getAmoebaGlobalHarmonicBondQuartic(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicBondForce) target
            real*8  OpenMM_AmoebaHarmonicBondForce_getAmoebaGlobalHarmonicBondQuartic
        end
        function OpenMM_AmoebaHarmonicBondForce_addBond(target, &
                          particle1, &
                          particle2, &
                          length, &
                          quadraticK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicBondForce) target
            integer*4 particle1
            integer*4 particle2
            real*8 length
            real*8 quadraticK
            integer*4  OpenMM_AmoebaHarmonicBondForce_addBond
        end
        subroutine OpenMM_AmoebaHarmonicBondForce_getBondParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          length, &
                          quadraticK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicBondForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            real*8 length
            real*8 quadraticK
        end
        subroutine OpenMM_AmoebaHarmonicBondForce_setBondParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          length, &
                          quadraticK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicBondForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            real*8 length
            real*8 quadraticK
        end

        ! OpenMM::AmoebaHarmonicAngleForce
        subroutine OpenMM_AmoebaHarmonicAngleForce_create(result)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicAngleForce) result
        end
        subroutine OpenMM_AmoebaHarmonicAngleForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicAngleForce) destroy
        end
        function OpenMM_AmoebaHarmonicAngleForce_getNumAngles(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicAngleForce) target
            integer*4  OpenMM_AmoebaHarmonicAngleForce_getNumAngles
        end
        subroutine OpenMM_AmoebaHarmonicAngleForce_setAmoebaGlobalHarmonicAngleCubic(target, &
                          cubicK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicAngleForce) target
            real*8 cubicK
        end
        function OpenMM_AmoebaHarmonicAngleForce_getAmoebaGlobalHarmonicAngleCubic(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicAngleForce) target
            real*8  OpenMM_AmoebaHarmonicAngleForce_getAmoebaGlobalHarmonicAngleCubic
        end
        subroutine OpenMM_AmoebaHarmonicAngleForce_setAmoebaGlobalHarmonicAngleQuartic(target, &
                          quarticK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicAngleForce) target
            real*8 quarticK
        end
        function OpenMM_AmoebaHarmonicAngleForce_getAmoebaGlobalHarmonicAngleQuartic(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicAngleForce) target
            real*8  OpenMM_AmoebaHarmonicAngleForce_getAmoebaGlobalHarmonicAngleQuartic
        end
        subroutine OpenMM_AmoebaHarmonicAngleForce_setAmoebaGlobalHarmonicAnglePentic(target, &
                          penticK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicAngleForce) target
            real*8 penticK
        end
        function OpenMM_AmoebaHarmonicAngleForce_getAmoebaGlobalHarmonicAnglePentic(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicAngleForce) target
            real*8  OpenMM_AmoebaHarmonicAngleForce_getAmoebaGlobalHarmonicAnglePentic
        end
        subroutine OpenMM_AmoebaHarmonicAngleForce_setAmoebaGlobalHarmonicAngleSextic(target, &
                          sexticK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicAngleForce) target
            real*8 sexticK
        end
        function OpenMM_AmoebaHarmonicAngleForce_getAmoebaGlobalHarmonicAngleSextic(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicAngleForce) target
            real*8  OpenMM_AmoebaHarmonicAngleForce_getAmoebaGlobalHarmonicAngleSextic
        end
        function OpenMM_AmoebaHarmonicAngleForce_addAngle(target, &
                          particle1, &
                          particle2, &
                          particle3, &
                          length, &
                          quadraticK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicAngleForce) target
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            real*8 length
            real*8 quadraticK
            integer*4  OpenMM_AmoebaHarmonicAngleForce_addAngle
        end
        subroutine OpenMM_AmoebaHarmonicAngleForce_getAngleParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          particle3, &
                          length, &
                          quadraticK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicAngleForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            real*8 length
            real*8 quadraticK
        end
        subroutine OpenMM_AmoebaHarmonicAngleForce_setAngleParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          particle3, &
                          length, &
                          quadraticK)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaHarmonicAngleForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            real*8 length
            real*8 quadraticK
        end

        ! OpenMM::AmoebaTorsionTorsionForce
        subroutine OpenMM_AmoebaTorsionTorsionForce_create(result)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaTorsionTorsionForce) result
        end
        subroutine OpenMM_AmoebaTorsionTorsionForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaTorsionTorsionForce) destroy
        end
        function OpenMM_AmoebaTorsionTorsionForce_getNumTorsionTorsions(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaTorsionTorsionForce) target
            integer*4  OpenMM_AmoebaTorsionTorsionForce_getNumTorsionTorsions
        end
        function OpenMM_AmoebaTorsionTorsionForce_getNumTorsionTorsionGrids(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaTorsionTorsionForce) target
            integer*4  OpenMM_AmoebaTorsionTorsionForce_getNumTorsionTorsionGrids
        end
        function OpenMM_AmoebaTorsionTorsionForce_addTorsionTorsion(target, &
                          particle1, &
                          particle2, &
                          particle3, &
                          particle4, &
                          particle5, &
                          chiralCheckAtomIndex, &
                          gridIndex)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaTorsionTorsionForce) target
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            integer*4 particle4
            integer*4 particle5
            integer*4 chiralCheckAtomIndex
            integer*4 gridIndex
            integer*4  OpenMM_AmoebaTorsionTorsionForce_addTorsionTorsion
        end
        subroutine OpenMM_AmoebaTorsionTorsionForce_getTorsionTorsionParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          particle3, &
                          particle4, &
                          particle5, &
                          chiralCheckAtomIndex, &
                          gridIndex)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaTorsionTorsionForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            integer*4 particle4
            integer*4 particle5
            integer*4 chiralCheckAtomIndex
            integer*4 gridIndex
        end
        subroutine OpenMM_AmoebaTorsionTorsionForce_setTorsionTorsionParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          particle3, &
                          particle4, &
                          particle5, &
                          chiralCheckAtomIndex, &
                          gridIndex)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaTorsionTorsionForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            integer*4 particle4
            integer*4 particle5
            integer*4 chiralCheckAtomIndex
            integer*4 gridIndex
        end
        subroutine OpenMM_AmoebaTorsionTorsionForce_getTorsionTorsionGrid(target, &
                          index, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaTorsionTorsionForce) target
            integer*4 index
            
        end
        subroutine OpenMM_AmoebaTorsionTorsionForce_setTorsionTorsionGrid(target, &
                          index, &
                          grid)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaTorsionTorsionForce) target
            integer*4 index
            
        end

        ! OpenMM::AmoebaPiTorsionForce
        subroutine OpenMM_AmoebaPiTorsionForce_create(result)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaPiTorsionForce) result
        end
        subroutine OpenMM_AmoebaPiTorsionForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaPiTorsionForce) destroy
        end
        function OpenMM_AmoebaPiTorsionForce_getNumPiTorsions(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaPiTorsionForce) target
            integer*4  OpenMM_AmoebaPiTorsionForce_getNumPiTorsions
        end
        function OpenMM_AmoebaPiTorsionForce_addPiTorsion(target, &
                          particle1, &
                          particle2, &
                          particle3, &
                          particle4, &
                          particle5, &
                          particle6, &
                          k)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaPiTorsionForce) target
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            integer*4 particle4
            integer*4 particle5
            integer*4 particle6
            real*8 k
            integer*4  OpenMM_AmoebaPiTorsionForce_addPiTorsion
        end
        subroutine OpenMM_AmoebaPiTorsionForce_getPiTorsionParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          particle3, &
                          particle4, &
                          particle5, &
                          particle6, &
                          k)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaPiTorsionForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            integer*4 particle4
            integer*4 particle5
            integer*4 particle6
            real*8 k
        end
        subroutine OpenMM_AmoebaPiTorsionForce_setPiTorsionParameters(target, &
                          index, &
                          particle1, &
                          particle2, &
                          particle3, &
                          particle4, &
                          particle5, &
                          particle6, &
                          k)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaPiTorsionForce) target
            integer*4 index
            integer*4 particle1
            integer*4 particle2
            integer*4 particle3
            integer*4 particle4
            integer*4 particle5
            integer*4 particle6
            real*8 k
        end

        ! OpenMM::AmoebaVdwForce
        subroutine OpenMM_AmoebaVdwForce_create(result)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaVdwForce) result
        end
        subroutine OpenMM_AmoebaVdwForce_destroy(destroy)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaVdwForce) destroy
        end
        function OpenMM_AmoebaVdwForce_getNumParticles(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaVdwForce) target
            integer*4  OpenMM_AmoebaVdwForce_getNumParticles
        end
        subroutine OpenMM_AmoebaVdwForce_setParticleParameters(target, &
                          particleIndex, &
                          ivIndex, &
                          classIndex, &
                          sigma, &
                          epsilon, &
                          reductionFactor)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaVdwForce) target
            integer*4 particleIndex
            integer*4 ivIndex
            integer*4 classIndex
            real*8 sigma
            real*8 epsilon
            real*8 reductionFactor
        end
        subroutine OpenMM_AmoebaVdwForce_getParticleParameters(target, &
                          particleIndex, &
                          ivIndex, &
                          classIndex, &
                          sigma, &
                          epsilon, &
                          reductionFactor)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaVdwForce) target
            integer*4 particleIndex
            integer*4 ivIndex
            integer*4 classIndex
            real*8 sigma
            real*8 epsilon
            real*8 reductionFactor
        end
        function OpenMM_AmoebaVdwForce_addParticle(target, &
                          ivIndex, &
                          classIndex, &
                          sigma, &
                          epsilon, &
                          reductionFactor)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaVdwForce) target
            integer*4 ivIndex
            integer*4 classIndex
            real*8 sigma
            real*8 epsilon
            real*8 reductionFactor
            integer*4  OpenMM_AmoebaVdwForce_addParticle
        end
        subroutine OpenMM_AmoebaVdwForce_setSigmaCombiningRule(target, &
                          sigmaCombiningRule)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaVdwForce) target
            character(*) sigmaCombiningRule
        end
        subroutine OpenMM_AmoebaVdwForce_getSigmaCombiningRule(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaVdwForce) target
            character(*) result
        end
        subroutine OpenMM_AmoebaVdwForce_setEpsilonCombiningRule(target, &
                          epsilonCombiningRule)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaVdwForce) target
            character(*) epsilonCombiningRule
        end
        subroutine OpenMM_AmoebaVdwForce_getEpsilonCombiningRule(target, &
                          result)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaVdwForce) target
            character(*) result
        end
        subroutine OpenMM_AmoebaVdwForce_setParticleExclusions(target, &
                          particleIndex, &
                          exclusions)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaVdwForce) target
            integer*4 particleIndex
            type (OpenMM_IntArray) exclusions
        end
        subroutine OpenMM_AmoebaVdwForce_getParticleExclusions(target, &
                          particleIndex, &
                          exclusions)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaVdwForce) target
            integer*4 particleIndex
            type (OpenMM_IntArray) exclusions
        end
        subroutine OpenMM_AmoebaVdwForce_setCutoff(target, &
                          cutoff)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaVdwForce) target
            real*8 cutoff
        end
        function OpenMM_AmoebaVdwForce_getCutoff(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaVdwForce) target
            real*8  OpenMM_AmoebaVdwForce_getCutoff
        end
        subroutine OpenMM_AmoebaVdwForce_setUseNeighborList(target, &
                          neighborListFlag)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaVdwForce) target
            integer*4 neighborListFlag
        end
        function OpenMM_AmoebaVdwForce_getUseNeighborList(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaVdwForce) target
            integer*4  OpenMM_AmoebaVdwForce_getUseNeighborList
        end
        subroutine OpenMM_AmoebaVdwForce_setPBC(target, &
                          pbcFlag)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaVdwForce) target
            integer*4 pbcFlag
        end
        function OpenMM_AmoebaVdwForce_getPBC(target)
            use OpenMM_Types; implicit none
            type (OpenMM_AmoebaVdwForce) target
            integer*4  OpenMM_AmoebaVdwForce_getPBC
        end
    end interface
END MODULE OpenMM
