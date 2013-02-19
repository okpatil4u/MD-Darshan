#include <cstdio>
#include <string>
#include <cstdlib>
#include <vector>
#include "OpenMM.h"
#include <fstream>

using OpenMM::Vec3;

struct Minimize;
static Minimize* initiate(std::string& platformName);
static void          myTerminateOpenMM(Minimize*);

int main() {
    try {
        std::string   platformName;
	
        Minimize* minimum = initiate( platformName);
        myTerminateOpenMM(minimum);
        return 0; 
    }
    catch(const std::exception& e) {
        printf("EXCEPTION: %s\n", e.what());
        return 1;
    }
}
struct Minimize {
    Minimize() : system(0), context(0), integrator(0) {}
    ~Minimize() {delete context; delete integrator; delete system;}
    OpenMM::System*         system;
    OpenMM::Integrator*     integrator;
    OpenMM::Context*  context;
};

static Minimize* initiate(std::string& platformName) 
{
   // OpenMM::Platform::loadPluginsFromDirectory(OpenMM::Platform::getDefaultPluginsDirectory());
    // OpenMM::Platform& platform =  OpenMM::Platform::getPlatformByName("Cuda"); 
    Minimize* minimum = new Minimize();
    
    OpenMM::System&                 system      = *(minimum->system = new OpenMM::System());
    OpenMM::NonbondedForce&         nonbond     = *new OpenMM::NonbondedForce();
    OpenMM::HarmonicBondForce&      bondStretch = *new OpenMM::HarmonicBondForce();
    OpenMM::HarmonicAngleForce&     bondBend    = *new OpenMM::HarmonicAngleForce();
    //OpenMM::AndersenThermostat&      thermostat  = *new OpenMM::AndersenThermostat(298, 1);
    // OpenMM::MonteCarloBarostat& barostat = *new OpenMM::MonteCarloBarostat(1, 298, 25);
    OpenMM::PeriodicTorsionForce&    bondInversion =*new OpenMM::PeriodicTorsionForce();
   // OpenMM::CustomAngleForce& bondAngle = *new OpenMM::CustomAngleForce("0.5*k*(cos(theta)-cos(theta0))^2");
   // bondAngle.addPerAngleParameter("k");
   // bondAngle.addPerAngleParameter("theta0");
    OpenMM::CustomTorsionForce&     bondTorsion = *new OpenMM::CustomTorsionForce("0.5*k*(1-cos( n *(theta-theta0)))");
    bondTorsion.addPerTorsionParameter("k");
    bondTorsion.addPerTorsionParameter("n");
    bondTorsion.addPerTorsionParameter("theta0");
    system.addForce(&nonbond);
    //system.addForce(&cforce);
    system.addForce(&bondStretch);
    system.addForce(&bondBend);
    system.addForce(&bondInversion);
    //system.addForce(&bondAngle);
    system.addForce(&bondTorsion);
   // system.addForce(&thermostat);
  //  system.addForce(&barostat);
    FILE *fp, *fp1;
    int noAtoms;
    int noBonds;
    int noAngles;
    int noTorsions;
    int no, b1, b2;
    int a, b, c, d;
    int exclude;
    double energy0, energy;
    double x,y,z, charge, mass, sigma, epsilon, bondEnergy, bondLength, angle, strength;
    double bondStrength, theta, periodicity;
    std::vector<Vec3> initialPosInNm;
    std::vector< std::pair<int,int> > bondPairs;
    std::vector< std::pair<int,int> > bondTorsionPairs;
    fp = fopen("miniMole.mole","r");
    fscanf(fp,"%lf",&energy0);
    fscanf(fp,"%d",&noAtoms);
    for(int i=0; i<noAtoms; i++){
	fscanf(fp,"%d %lf %lf %lf %lf %lf %lf %lf",&no, &mass, &charge, &sigma, &epsilon, &x, &y, &z);
	system.addParticle(mass);
	nonbond.addParticle(charge, sigma * OpenMM::SigmaPerVdwRadius * OpenMM::NmPerAngstrom , epsilon * OpenMM::KJPerKcal);
	const Vec3 pos(x* OpenMM::NmPerAngstrom, y* OpenMM::NmPerAngstrom, z* OpenMM::NmPerAngstrom);
	initialPosInNm.push_back(pos);
    }
    
    fscanf(fp,"%d",&noBonds);
    
    for(int i=0; i<noBonds; i++){
	fscanf(fp,"%d %d %lf %lf",&b1, &b2, &bondLength, &bondEnergy);
	bondStretch.addBond(b1, b2, bondLength * OpenMM::NmPerAngstrom, bondEnergy*  OpenMM::KJPerKcal * OpenMM::AngstromsPerNm * OpenMM::AngstromsPerNm);
	bondPairs.push_back(std::make_pair(b1,b2));
    }
    
    
    fscanf(fp,"%d", &noAngles);
    for(int i=0; i<noAngles;i++){
	//std::vector<double> param;
	fscanf(fp,"%d %d %d %lf %lf", &a, &b, &c, &angle, &strength);
	//param.push_back(100/(sin(angle* OpenMM::RadiansPerDegree)));
	//param.push_back(angle * OpenMM::RadiansPerDegree);
	bondBend.addAngle(b,a,c, angle * OpenMM::RadiansPerDegree, 100 * OpenMM::KJPerKcal);
	//bondAngle.addAngle(b,a,c,param);
	bondPairs.push_back(std::make_pair(b,c));
    }
 
   fscanf(fp,"%d", &noTorsions);
    for(int i=0; i<noTorsions; i++){      
      fscanf(fp, "%d %d %d %d %lf %lf %lf", &a ,&b, &c, &d, &bondStrength, &theta, &periodicity);
      if(bondStrength == 40.0){
	 bondInversion.addTorsion(a, b, c, d, periodicity, theta * OpenMM::RadiansPerDegree,bondStrength * OpenMM::KJPerKcal );
      }
      else{
      std::vector< double >  param;
      param.push_back(bondStrength*  OpenMM::KJPerKcal);
      param.push_back(periodicity);
      param.push_back(theta* OpenMM::RadiansPerDegree);
      bondTorsion.addTorsion(a, b, c, d, param);
      }
      //bondPairs.push_back(std::make_pair(a,d));
    }
      nonbond.createExceptionsFromBonds(bondPairs, 0, 0);
    /*for(int i=0; i<bondPairs.size(); i++){
	cforce.addExclusion(bondPairs[i].first , bondPairs[i].second);
    }*/
    minimum->integrator = new OpenMM::VerletIntegrator(2 * OpenMM::PsPerFs);
    minimum->context    = new OpenMM::Context(*minimum->system, *minimum->integrator);
    minimum->context->setPositions(initialPosInNm);
    int infoMask = OpenMM::State::Positions;
    
    const OpenMM::State state0 = minimum->context->getState(infoMask);
    const std::vector <Vec3>& positionsInNm0 = state0.getPositions();
    
    OpenMM::LocalEnergyMinimizer::minimize(*minimum->context, 1, 1000000);
    
    platformName = minimum->context->getPlatform().getName();
    fp1=fopen("miniMolRes.mole","w");
    int infoMask1 = 0;
    infoMask1 = OpenMM::State::Positions + OpenMM::State::Energy;
   
    
    const OpenMM::State state = minimum->context->getState(infoMask1);
    energy = state.getPotentialEnergy()+state.getKineticEnergy();
    
    const std::vector <Vec3>& positionsInNm = state.getPositions();
     fprintf(fp1,"%d\n",noAtoms);
     if(energy0<energy){
       printf("%lf", energy0);
	for(int i=0;i<noAtoms;i++)
	    fprintf(fp1,"%d %lf %lf %lf\n",i, positionsInNm0[i][0] * 10,positionsInNm0[i][1] * 10,positionsInNm0[i][2] * 10);
     }
     else{
        printf("%lf", energy);
       for(int i=0;i<noAtoms;i++)
	    fprintf(fp1,"%d %lf %lf %lf\n",i, positionsInNm[i][0] * 10,positionsInNm[i][1] * 10,positionsInNm[i][2] * 10);
      }
    fprintf(fp1,"End");
    fclose(fp1);
     fclose(fp);
    return minimum;
}

static void  myTerminateOpenMM(Minimize* minimum) {
    delete minimum;
}

