%pythonappend OpenMM::AmoebaGeneralizedKirkwoodForce::getParticleParameters(int index, double & charge, double & radius, double & scalingFactor) const %{
   val[0]=unit.Quantity(val[0], unit.elementary_charge)
   val[1]=unit.Quantity(val[1], unit.nanometer)
   val[2]=unit.Quantity(val[2], unit.dimensionless)
%}

%pythonappend OpenMM::AmoebaGeneralizedKirkwoodForce::getSolventDielectric() const %{
   val=unit.Quantity(val, unit.dimensionless)
%}

%pythonappend OpenMM::AmoebaGeneralizedKirkwoodForce::getSoluteDielectric() const %{
   val=unit.Quantity(val, unit.dimensionless)
%}

%pythonappend OpenMM::AmoebaGeneralizedKirkwoodForce::getProbeRadius() const %{
   val=unit.Quantity(val, unit.nanometer)
%}

%pythonappend OpenMM::AmoebaGeneralizedKirkwoodForce::getSurfaceAreaFactor() const %{
   val=unit.Quantity(val, (unit.nanometer*unit.nanometer)/unit.kilojoule_per_mole)
%}

%pythonappend OpenMM::AmoebaHarmonicAngleForce::getAngleParameters(int index, int & particle1, int & particle2, int & particle3, double & length, double & quadraticK) const %{
   val[3]=unit.Quantity(val[3], unit.radian)
   val[4]=unit.Quantity(val[4], unit.kilojoule_per_mole/(unit.radian*unit.radian))
%}

%pythonappend OpenMM::AmoebaHarmonicBondForce::getBondParameters(int index, int & particle1, int & particle2, double & length, double & quadraticK) const %{
   val[2]=unit.Quantity(val[2], unit.nanometer)
   val[3]=unit.Quantity(val[3], unit.kilojoule_per_mole/(unit.nanometer*unit.nanometer))
%}

%pythonappend OpenMM::AmoebaHarmonicInPlaneAngleForce::getAngleParameters(int index, int & particle1, int & particle2, int & particle3, int & particle4, double & length, double & quadraticK) const %{
   val[4]=unit.Quantity(val[4], unit.radian)
   val[5]=unit.Quantity(val[5], unit.kilojoule_per_mole/(unit.radian*unit.radian))
%}

%pythonappend OpenMM::AmoebaMultipoleForce::getCutoffDistance(void ) const %{
   val=unit.Quantity(val, unit.nanometer)
%}

%pythonappend OpenMM::AmoebaMultipoleForce::getAEwald() const %{
   val=unit.Quantity(val, 1/unit.nanometer)
%}

%pythonappend OpenMM::AmoebaOutOfPlaneBendForce::getOutOfPlaneBendParameters(int index, int & particle1, int & particle2, int & particle3, int & particle4, double & k) const %{
   val[4]=unit.Quantity(val[4], unit.kilojoule_per_mole)
%}

%pythonappend OpenMM::AmoebaPiTorsionForce::getPiTorsionParameters(int index, int & particle1, int & particle2, int & particle3, int & particle4, int & particle5, int & particle6, double & k) const %{
   val[6]=unit.Quantity(val[6], unit.kilojoule_per_mole)
%}

%pythonappend OpenMM::AmoebaStretchBendForce::getStretchBendParameters(int index, int & particle1, int & particle2, int & particle3, double & lengthAB, double & lengthCB, double & angle, double & k) const %{
   val[3]=unit.Quantity(val[3], unit.nanometer)
   val[4]=unit.Quantity(val[4], unit.nanometer)
   val[5]=unit.Quantity(val[5], unit.radian)
   val[6]=unit.Quantity(val[6], unit.kilojoule_per_mole/unit.nanometer)
%}

%pythonappend OpenMM::AmoebaUreyBradleyForce::getUreyBradleyParameters(int index, int & particle1, int & particle2, double & length, double & quadraticK) const %{
   val[2]=unit.Quantity(val[2], unit.nanometer)
   val[3]=unit.Quantity(val[3], unit.kilojoule_per_mole/(unit.nanometer*unit.nanometer))
%}

%pythonappend OpenMM::AmoebaVdwForce::getParticleParameters(int particleIndex, int & ivIndex, int & classIndex, double & sigma, double & epsilon, double & reductionFactor) const %{
   val[2]=unit.Quantity(val[2], unit.nanometer)
   val[3]=unit.Quantity(val[3], unit.kilojoule_per_mole)
%}

%pythonappend OpenMM::AmoebaVdwForce::getCutoff(void ) const %{
   val=unit.Quantity(val, unit.nanometer)
%}

%pythonappend OpenMM::AmoebaWcaDispersionForce::getParticleParameters(int particleIndex, double & radius, double & epsilon) const %{
   val[0]=unit.Quantity(val[0], unit.nanometer)
   val[1]=unit.Quantity(val[1], unit.kilojoule_per_mole)
%}

%pythonappend OpenMM::AmoebaWcaDispersionForce::getEpso(void ) const %{
   val=unit.Quantity(val, unit.kilojoule_per_mole)
%}

%pythonappend OpenMM::AmoebaWcaDispersionForce::getEpsh(void ) const %{
   val=unit.Quantity(val, unit.kilojoule_per_mole)
%}

%pythonappend OpenMM::AmoebaWcaDispersionForce::getRmino(void ) const %{
   val=unit.Quantity(val, unit.nanometer)
%}

%pythonappend OpenMM::AmoebaWcaDispersionForce::getRminh(void ) const %{
   val=unit.Quantity(val, unit.nanometer)
%}

%pythonappend OpenMM::AmoebaWcaDispersionForce::getAwater(void ) const %{
   val=unit.Quantity(val, 1/(unit.nanometer*unit.nanometer*unit.nanometer))
%}

%pythonappend OpenMM::AmoebaWcaDispersionForce::getDispoff(void ) const %{
   val=unit.Quantity(val, unit.nanometer)
%}

%pythonappend OpenMM::AndersenThermostat::getDefaultTemperature() const %{
   val=unit.Quantity(val, unit.kelvin)
%}

%pythonappend OpenMM::AndersenThermostat::getDefaultCollisionFrequency() const %{
   val=unit.Quantity(val, 1/unit.picosecond)
%}

%pythonappend OpenMM::Integrator::getStepSize() const %{
   val=unit.Quantity(val, unit.picosecond)
%}

%pythonappend OpenMM::Integrator::getConstraintTolerance() const %{
   val=unit.Quantity(val, unit.dimensionless)
%}

%pythonappend OpenMM::BrownianIntegrator::getTemperature() const %{
   val=unit.Quantity(val, unit.kelvin)
%}

%pythonappend OpenMM::BrownianIntegrator::getFriction() const %{
   val=unit.Quantity(val, 1/unit.picosecond)
%}

%pythonappend OpenMM::CustomGBForce::getCutoffDistance() const %{
   val=unit.Quantity(val, unit.nanometers)
%}

%pythonappend OpenMM::CustomHbondForce::getCutoffDistance() const %{
   val=unit.Quantity(val, unit.nanometers)
%}

%pythonappend OpenMM::CustomNonbondedForce::getCutoffDistance() const %{
   val=unit.Quantity(val, unit.nanometers)
%}

%pythonappend OpenMM::GBSAOBCForce::getParticleParameters(int index, double & charge, double & radius, double & scalingFactor) const %{
   val[0]=unit.Quantity(val[0], unit.elementary_charge)
   val[1]=unit.Quantity(val[1], unit.nanometer)
   val[2]=unit.Quantity(val[2], unit.dimensionless)
%}

%pythonappend OpenMM::GBSAOBCForce::getSolventDielectric() const %{
   val=unit.Quantity(val, unit.dimensionless)
%}

%pythonappend OpenMM::GBSAOBCForce::getSoluteDielectric() const %{
   val=unit.Quantity(val, unit.dimensionless)
%}

%pythonappend OpenMM::GBSAOBCForce::getCutoffDistance() const %{
   val=unit.Quantity(val, unit.nanometers)
%}

%pythonappend OpenMM::GBSAOBCSoftcoreForce::getParticleParameters(int index, double & charge, double & radius, double & scalingFactor, double & nonPolarScalingFactor) const %{
   val[0]=unit.Quantity(val[0], unit.elementary_charge)
   val[1]=unit.Quantity(val[1], unit.nanometer)
   val[2]=unit.Quantity(val[2], unit.dimensionless)
   val[3]=unit.Quantity(val[3], unit.dimensionless)
%}

%pythonappend OpenMM::GBSAOBCSoftcoreForce::getSolventDielectric() const %{
   val=unit.Quantity(val, unit.dimensionless)
%}

%pythonappend OpenMM::GBSAOBCSoftcoreForce::getSoluteDielectric() const %{
   val=unit.Quantity(val, unit.dimensionless)
%}

%pythonappend OpenMM::GBSAOBCSoftcoreForce::getNonPolarPrefactor() const %{
   val=unit.Quantity(val, unit.kilojoule_per_mole/(unit.nanometer*unit.nanometer))
%}

%pythonappend OpenMM::GBSAOBCSoftcoreForce::getCutoffDistance() const %{
   val=unit.Quantity(val, unit.nanometers)
%}

%pythonappend OpenMM::GBVIForce::getParticleParameters(int index, double & charge, double & radius, double & gamma) const %{
   val[0]=unit.Quantity(val[0], unit.elementary_charge)
   val[1]=unit.Quantity(val[1], unit.nanometer)
   val[2]=unit.Quantity(val[2], unit.kilojoule_per_mole)
%}

%pythonappend OpenMM::GBVIForce::getBondParameters(int index, int & particle1, int & particle2, double & distance) const %{
   val[2]=unit.Quantity(val[2], unit.nanometer)
%}

%pythonappend OpenMM::GBVIForce::getSolventDielectric() const %{
   val=unit.Quantity(val, unit.dimensionless)
%}

%pythonappend OpenMM::GBVIForce::getSoluteDielectric() const %{
   val=unit.Quantity(val, unit.dimensionless)
%}

%pythonappend OpenMM::GBVIForce::getCutoffDistance() const %{
   val=unit.Quantity(val, unit.nanometers)
%}

%pythonappend OpenMM::GBVIForce::getQuinticUpperBornRadiusLimit(void ) const %{
   val=unit.Quantity(val, unit.nanometer)
%}

%pythonappend OpenMM::GBVISoftcoreForce::getParticleParameters(int index, double & charge, double & radius, double & gamma, double & bornRadiusScaleFactor) const %{
   val[0]=unit.Quantity(val[0], unit.elementary_charge)
   val[1]=unit.Quantity(val[1], unit.nanometer)
   val[2]=unit.Quantity(val[2], unit.kilojoule_per_mole)
   val[3]=unit.Quantity(val[3], unit.dimensionless)
%}

%pythonappend OpenMM::GBVISoftcoreForce::getBondParameters(int index, int & particle1, int & particle2, double & distance) const %{
   val[2]=unit.Quantity(val[2], unit.nanometer)
%}

%pythonappend OpenMM::GBVISoftcoreForce::getSolventDielectric() const %{
   val=unit.Quantity(val, unit.dimensionless)
%}

%pythonappend OpenMM::GBVISoftcoreForce::getSoluteDielectric() const %{
   val=unit.Quantity(val, unit.dimensionless)
%}

%pythonappend OpenMM::GBVISoftcoreForce::getCutoffDistance() const %{
   val=unit.Quantity(val, unit.nanometers)
%}

%pythonappend OpenMM::GBVISoftcoreForce::getQuinticUpperBornRadiusLimit(void ) const %{
   val=unit.Quantity(val, unit.nanometer)
%}

%pythonappend OpenMM::HarmonicAngleForce::getAngleParameters(int index, int & particle1, int & particle2, int & particle3, double & angle, double & k) const %{
   val[3]=unit.Quantity(val[3], unit.radian)
   val[4]=unit.Quantity(val[4], unit.kilojoule_per_mole/(unit.radian*unit.radian))
%}

%pythonappend OpenMM::HarmonicBondForce::getBondParameters(int index, int & particle1, int & particle2, double & length, double & k) const %{
   val[2]=unit.Quantity(val[2], unit.nanometer)
   val[3]=unit.Quantity(val[3], unit.kilojoule_per_mole/(unit.nanometer*unit.nanometer))
%}

%pythonappend OpenMM::LangevinIntegrator::getTemperature() const %{
   val=unit.Quantity(val, unit.kelvin)
%}

%pythonappend OpenMM::LangevinIntegrator::getFriction() const %{
   val=unit.Quantity(val, 1/unit.picosecond)
%}

%pythonappend OpenMM::MonteCarloBarostat::getDefaultPressure() const %{
   val=unit.Quantity(val, unit.bar)
%}

%pythonappend OpenMM::MonteCarloBarostat::getTemperature() const %{
   val=unit.Quantity(val, unit.kelvin)
%}

%pythonappend OpenMM::NonbondedForce::getCutoffDistance() const %{
   val=unit.Quantity(val, unit.nanometers)
%}

%pythonappend OpenMM::NonbondedForce::getReactionFieldDielectric() const %{
   val=unit.Quantity(val, unit.dimensionless)
%}

%pythonappend OpenMM::NonbondedForce::getParticleParameters(int index, double & charge, double & sigma, double & epsilon) const %{
   val[0]=unit.Quantity(val[0], unit.elementary_charge)
   val[1]=unit.Quantity(val[1], unit.nanometer)
   val[2]=unit.Quantity(val[2], unit.kilojoule_per_mole)
%}

%pythonappend OpenMM::NonbondedForce::getExceptionParameters(int index, int & particle1, int & particle2, double & chargeProd, double & sigma, double & epsilon) const %{
   val[2]=unit.Quantity(val[2], unit.elementary_charge*unit.elementary_charge)
   val[3]=unit.Quantity(val[3], unit.nanometer)
   val[4]=unit.Quantity(val[4], unit.kilojoule_per_mole)
%}

%pythonappend OpenMM::NonbondedSoftcoreForce::getCutoffDistance() const %{
   val=unit.Quantity(val, unit.nanometers)
%}

%pythonappend OpenMM::NonbondedSoftcoreForce::getReactionFieldDielectric() const %{
   val=unit.Quantity(val, unit.dimensionless)
%}

%pythonappend OpenMM::NonbondedSoftcoreForce::getParticleParameters(int index, double & charge, double & sigma, double & epsilon, double & softcoreLJLambda) const %{
   val[0]=unit.Quantity(val[0], unit.elementary_charge)
   val[1]=unit.Quantity(val[1], unit.nanometer)
   val[2]=unit.Quantity(val[2], unit.kilojoule_per_mole)
   val[3]=unit.Quantity(val[3], unit.dimensionless)
%}

%pythonappend OpenMM::NonbondedSoftcoreForce::getExceptionParameters(int index, int & particle1, int & particle2, double & chargeProd, double & sigma, double & epsilon, double & softcoreLJLambda) const %{
   val[2]=unit.Quantity(val[2], unit.elementary_charge*unit.elementary_charge)
   val[3]=unit.Quantity(val[3], unit.nanometer)
   val[4]=unit.Quantity(val[4], unit.kilojoule_per_mole)
   val[5]=unit.Quantity(val[5], unit.dimensionless)
%}

%pythonappend OpenMM::PeriodicTorsionForce::getTorsionParameters(int index, int & particle1, int & particle2, int & particle3, int & particle4, int & periodicity, double & phase, double & k) const %{
   val[5]=unit.Quantity(val[5], unit.radian)
   val[6]=unit.Quantity(val[6], unit.kilojoule_per_mole)
%}

%pythonappend OpenMM::Platform::registerPlatform(Platform * platform) %{
   args[0].thisown=0
%}

%pythonappend OpenMM::RPMDIntegrator::getTemperature() const %{
   val=unit.Quantity(val, unit.kelvin)
%}

%pythonappend OpenMM::RPMDIntegrator::getFriction() const %{
   val=unit.Quantity(val, 1/unit.picosecond)
%}

%pythonappend OpenMM::System::getParticleMass(int index) const %{
   val=unit.Quantity(val, unit.amu)
%}

%pythonappend OpenMM::System::setVirtualSite(int index, VirtualSite * virtualSite) %{
   args[1].thisown=0
%}

%pythonappend OpenMM::System::getConstraintParameters(int index, int & particle1, int & particle2, double & distance) const %{
   val[2]=unit.Quantity(val[2], unit.nanometer)
%}

%pythonappend OpenMM::System::addForce(Force * force) %{
   args[0].thisown=0
%}

%pythonappend OpenMM::System::getDefaultPeriodicBoxVectors(Vec3 & a, Vec3 & b, Vec3 & c) const %{
   val[0]=unit.Quantity(val[0], unit.nanometer)
   val[1]=unit.Quantity(val[1], unit.nanometer)
   val[2]=unit.Quantity(val[2], unit.nanometer)
%}

%pythonappend OpenMM::VariableLangevinIntegrator::getTemperature() const %{
   val=unit.Quantity(val, unit.kelvin)
%}

%pythonappend OpenMM::VariableLangevinIntegrator::getFriction() const %{
   val=unit.Quantity(val, 1/unit.picosecond)
%}

