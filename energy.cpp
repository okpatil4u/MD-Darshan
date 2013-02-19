#include <cstdio>
#include <string>
#include <cstdlib>
#include <vector>
#include "OpenMM.h"
#include <fstream>
#include <time.h>
#include<iostream>
#include<ctime>

using OpenMM::Vec3;

const double Coulomb14Scale      = 0.0;
const double LennardJones14Scale = 0.0;
const double  frictionInPerPs = 91;

  int noMoles;
  int noC, *display;
  int type, behavior;
  
  double temperature, pressure, cutOff, sigmaWall, epsilonWall;
  double sizeX,sizeY,sizeZ;
  double x,y,z, charge, mass, sigma, epsilon, bondEnergy, bondLength, angle;
  double torsionStrength, theta, periodicity;
  
  
  double angleX =0.0f, angleY = 0.0f,angleZ = 0.0f, xOrigin=0, xNew, zoom=-20.0f, X=0, Y=0, Z=0, yOrigin =0, yNew, R=0.5, G=0.5, B=0.5, zoomOrigin=0, zoomNew, angleXX;
  double Xneg=0, Yneg=0, Zneg =0, Xl = 4, Yl = 4, Zl = 4, CL=0;
  int LMB =0, RMB =0, play = 0, MMB = 0;
  
  double equilibriumTime, simulationTime, stepSize, reportingInterval;
  int saveInterval;
  char path[100];
  
  std::vector<Vec3> positions, velocities;
  std::vector<int> instances;
  std::vector<int> noOfAtoms;
  std::vector<int> noOfBonds;
  std::vector<int> noOfAngles;
  std::vector<int> noOfTorsions;
  std::vector <Vec3> newPos, newVel;
class atoms{
  public:
  int rfid;
  double mass;
  double sigma, epsilon, charge;
  double x, y, z;

  void initiate(int rf, double m, double c, double s, double e, double x1, double y1, double z1){
    rfid = rf;
    mass = m;
    sigma = s; 
    epsilon = e;
    charge = c;
    x = x1;
    y = y1;
    z = z1;    
  }
};
class bonds{
    public:
  double length;
  int index[2];
  double forceConstant;
  
  void initiate(int a, int b, double l, double f){
    index[0]=a;
    index[1]=b;
    length = l;
    forceConstant = f;
  }
};
class angles{
  public:
  int index[3];
  double angle;
  double forceConstant;
  void initiate(int a, int b, int c, double ang, double f){
    index[0] = a;
    index[1] = b;
    index[2] = c;
    angle = ang;
    forceConstant = f;
  }
};
class torsions{
public:
  int index[4];
  double forceConstant, angle, phase;
  void initiate(int a, int b, int c, int d, double f, double ang, double p){
    index[0] = a;
    index[1] = b;
    index[2] = c;
    index[3] = d;
    angle = ang;
    forceConstant = f;
    phase = p;
  }
};
class molecule{
public:
  int atomNo, bondNo, angleNo, torsionNo;
  std::vector<atoms> atom;
  std::vector<bonds> bond;
  std::vector<angles> angle;
  std::vector<torsions> torsion;
  void newMolecule(int ano, int bno, int angno, int torno, std::vector<atoms> a,  std::vector<bonds> b, std::vector<angles> c,  std::vector<torsions> d){
    atomNo = ano;
    bondNo = bno;
    angleNo = angno;
    torsionNo = torno;
    atom = a;
    bond = b;
    angle = c;
    torsion = d;
  }
};
class Expression{
public:
  int number;
  std::string formula;
  std::vector<std::string> constant;
  std::vector<float> values;
  void addExpression(){
    
  }
};
std::vector<Expression> express;
std::vector<molecule> mainMolecule;
void loadMolecules(FILE *fp);
void loadSystemData(FILE *fp);
void specifySystem();
void loadPositions();
void setSystem();
void loadParameters(FILE *fp);

int main(int argc, char **argv) {
    try {
	int temp[noC];
	display = temp;
	FILE *fp;
	fp = fopen("Arguments.txt","r");
    
	loadSystemData(fp);
	loadMolecules(fp);
	fclose(fp);
	loadPositions();
	setSystem();
	
	return 0; 
    }
    catch(const std::exception& e) {
        printf("EXCEPTION: %s\n", e.what());
        return 1;
    }
}
void loadSystemData(FILE *fp){
  fscanf(fp,"%d",&noC);
  //printf("%d\n",noC);
    fscanf(fp,"%lf",&temperature);
   // printf("%lf\n",temperature);
      fscanf(fp,"%lf",&sizeX);
    //  printf("%lf\n", sizeX);
      fscanf(fp,"%lf",&sizeY);
   //   printf("%lf\n", sizeY);
      fscanf(fp,"%lf",&sizeZ);
   //   printf("%lf\n", sizeZ);
    //Periodic 0
    //Periodic-ewald 1
    //Confined 2
    //NonPeriodic
    fscanf(fp,"%d\n",&behavior);
    if(behavior == 0 || behavior == 1){
      fscanf(fp,"%lf",&cutOff);
     
    }
}
void loadMolecules(FILE *fp){
  
    //Number of instances of each molecule
    molecule mol[noC];
    for(int i =0; i<noC; i++){
      int copies;
      int noAtoms;
      fscanf(fp, "%d", &copies);
     // printf("%d", copies);
      fscanf(fp, "%d", &noAtoms);
     //  printf("%d", noAtoms);
      instances.push_back(copies);
      noOfAtoms.push_back(noAtoms);
      
      std::vector<atoms> atom;
      int n;
      for(int j =0; j<noAtoms; j++){
	atoms a ;
	int n;
	double mass, charge, sigma, epsilon, x, y, z;
	fscanf(fp,"%d %lf %lf %lf %lf %lf %lf %lf", &n, &mass, &charge, &sigma, &epsilon, &x, &y, &z);
	//printf("\n%d %lf %lf %lf %lf %lf %lf %lf", n, mass, charge, sigma, epsilon, x, y, z);
	a.initiate(n,mass, charge, sigma, epsilon, x, y, z);
	atom.push_back(a);
      }
      
      int noBonds;
      fscanf(fp,"%d", &noBonds);
      //printf("%d",noBonds);
      noOfBonds.push_back(noBonds);
      std::vector<bonds> bond;
      for(int j =0; j<noBonds; j++){
	bonds b;
	int index0, index1;
	double length, forceConstant;
	fscanf(fp,"%d %d %lf %lf", &index0, &index1, &length, &forceConstant);
	//printf("\n%d %d %lf %lf", index0, index1, length, forceConstant);
	b.initiate(index0, index1, length, forceConstant);
	bond.push_back(b);
      }
      
      int noAngles;
      fscanf(fp, "%d", &noAngles);
     // printf("%d", noAngles);
      noOfAngles.push_back(noAngles);
      std::vector<angles> angle;
      for(int j =0; j<noAngles; j++){
	angles an;
	int index0, index1, index2;
	double ang, force;
	fscanf(fp,"%d %d %d %lf %lf", &index0, &index1, &index2, &ang, &force);
	//printf("\n%d %d %d %lf %lf", index0, index1, index2, ang, force);
	an.initiate(index0, index1, index2, ang, force);
	angle.push_back(an);
      }
      
      int noTorsions;
      fscanf(fp,"%d", &noTorsions);
      //printf("%d", noTorsions);
      noOfTorsions.push_back(noTorsions);
      std::vector<torsions> torsion;
      for(int j =0; j<noTorsions; j++){
	torsions tor;
	int index0, index1, index2, index3;
	double angle, force, phase;
	fscanf(fp,"%d %d %d %d %lf %lf %lf", &index0, &index1, &index2, &index3, &force, &angle, &phase);
	//printf("\n%d %d %d %d %lf %lf %lf", index0, index1, index2, index3, force, angle, phase);
	tor.initiate(index0, index1, index2, index3, force, angle, phase);
	torsion.push_back(tor);
      }
      mol[i].newMolecule(noAtoms, noBonds, noAngles, noTorsions, atom, bond, angle, torsion);
      mainMolecule.push_back(mol[i]);
    }
    
}

void loadPositions(){
	int size=0;
	FILE *fp1;
	fp1 = fopen("coordinates.txt","r");
	fscanf(fp1,"%d\n", &size);
	for(int i=0; i< size; i++){
	    Vec3 onePos;
	    int check;
	    fscanf(fp1, "%d\t%lf\t%lf\t%lf\n", &check, &onePos[0], &onePos[1], &onePos[2]);
	    if(check != i+1)
	      break;
	    else
	      positions.push_back(onePos);
	}
	for(int i=0; i<size; i++){
	    Vec3 oneVel;
	    int check;
	    fscanf(fp1, "%d\t%lf\t%lf\t%lf\n", &check, &oneVel[0], &oneVel[1], &oneVel[2]);
	    if(check != i+1)
	      break;
	    else
	      velocities.push_back(oneVel);
	}
	fclose(fp1);
}

void setSystem(){
	   // OpenMM::Platform::loadPluginsFromDirectory(
	//	OpenMM::Platform::getDefaultPluginsDirectory());
	    OpenMM::System*                  system      =new  OpenMM::System();
	    OpenMM::NonbondedForce          nonbond     =  OpenMM::NonbondedForce();
	    OpenMM::HarmonicBondForce       bondStretch =  OpenMM::HarmonicBondForce();
	    OpenMM::HarmonicAngleForce      bondBend    =  OpenMM::HarmonicAngleForce();
	    OpenMM::PeriodicTorsionForce    bondInversion =  OpenMM::PeriodicTorsionForce();;
	    OpenMM::AndersenThermostat      thermostat  =  OpenMM::AndersenThermostat(temperature, 1);
	    OpenMM::CustomTorsionForce      bondTorsion =  OpenMM::CustomTorsionForce("0.5*k*(1-cos( n *(theta-theta0)))");
	    bondTorsion.addPerTorsionParameter("k");
	    bondTorsion.addPerTorsionParameter("n");
	    bondTorsion.addPerTorsionParameter("theta0");
	    system->addForce(&nonbond);
	    system->addForce(&bondStretch);
	    system->addForce(&bondBend);
	    system->addForce(&bondTorsion);
	    system->addForce(&thermostat);
	    system->addForce(&bondInversion);
	    
	    std::vector<Vec3> pos, vel;
	    std::vector< std::pair<int,int> > bondPairs;
	    std::vector<std::vector<Vec3> > addinPos;
	    
	      system->setDefaultPeriodicBoxVectors(Vec3(sizeX * OpenMM::NmPerAngstrom,0,0),
                                 Vec3(0,sizeY * OpenMM::NmPerAngstrom,0), 
                                  Vec3(0,0,sizeZ * OpenMM::NmPerAngstrom));
	    
	    if(behavior == 0){
	      nonbond.setNonbondedMethod(OpenMM::NonbondedForce::CutoffPeriodic );
	      nonbond.setCutoffDistance(cutOff * OpenMM::NmPerAngstrom);
	    }
	    else if(behavior == 1){
	      nonbond.setNonbondedMethod(OpenMM::NonbondedForce::Ewald );
	      nonbond.setCutoffDistance(cutOff * OpenMM::NmPerAngstrom);
	    }

	    int summer = 0;
	    int bonder =0;
	    int summing[noC];
	   
	  for(int i=0; i<noC; i++){
          
	    for(int k=0; k<instances[i]; k++){
	      for(int l=0; l<mainMolecule[i].atomNo; l++){
		
		  system->addParticle(mainMolecule[i].atom[l].mass);
		  nonbond.addParticle(mainMolecule[i].atom[l].charge, 
				      mainMolecule[i].atom[l].sigma * OpenMM::NmPerAngstrom* OpenMM::SigmaPerVdwRadius , 
				      mainMolecule[i].atom[l].epsilon * OpenMM::KJPerKcal);
		 
		  pos.push_back(positions[l+summer+k*mainMolecule[i].atomNo]);
		//   printf("hi\n");
		  vel.push_back(velocities[l+summer+k*mainMolecule[i].atomNo]);
		  
		 // printf("Sigma = %lf\tEpsilon = %lf\n", mainMolecule[i].atom[l].sigma * OpenMM::NmPerAngstrom* OpenMM::SigmaPerVdwRadius ,  mainMolecule[i].atom[l].epsilon * OpenMM::KJPerKcal  );
	      }
	      for(int l=0; l<mainMolecule[i].bondNo; l++){
		//system->addConstraint(mainMolecule[i].bond[l].index[0] + mainMolecule[i].atomNo * k + summer, 
		//				  mainMolecule[i].bond[l].index[1] + mainMolecule[i].atomNo * k + summer, 
		//				  mainMolecule[i].bond[l].length *OpenMM::NmPerAngstrom);
		/*system->addConstraint(mainMolecule[i].bond[l].index[0] + mainMolecule[i].atomNo * k + summer, mainMolecule[i].bond[l].index[1] + mainMolecule[i].atomNo * k + summer, 
		  mainMolecule[i].bond[l].length *OpenMM::NmPerAngstrom
		); */
		  bondStretch.addBond(mainMolecule[i].bond[l].index[0] + mainMolecule[i].atomNo * k + summer, 
						  mainMolecule[i].bond[l].index[1] + mainMolecule[i].atomNo * k + summer, 
						  mainMolecule[i].bond[l].length *OpenMM::NmPerAngstrom, 
						  mainMolecule[i].bond[l].forceConstant*  OpenMM::KJPerKcal * OpenMM::AngstromsPerNm * OpenMM::AngstromsPerNm);
		 bondPairs.push_back(std::make_pair(mainMolecule[i].bond[l].index[0] + mainMolecule[i].atomNo * k + summer,
						      mainMolecule[i].bond[l].index[1] + mainMolecule[i].atomNo * k + summer));
		  bonder++;
	      }
	      for(int l=0; l<mainMolecule[i].angleNo; l++){
		//std::vector<double> param;
		//param.push_back(100/(sin(angle*  mainMolecule[i].angle[l].angle * OpenMM::RadiansPerDegree)));
		//param.push_back( mainMolecule[i].angle[l].angle * OpenMM::RadiansPerDegree * OpenMM::RadiansPerDegree);
		//bondAngle.addAngle(mainMolecule[i].angle[l].index[1]+ mainMolecule[i].atomNo * k + summer, mainMolecule[i].angle[l].index[0]+ mainMolecule[i].atomNo * k + summer,
		// mainMolecule[i].angle[l].index[2]+ mainMolecule[i].atomNo * k + summer,param);
		  bondBend.addAngle(mainMolecule[i].angle[l].index[1]+ mainMolecule[i].atomNo * k + summer, 
				    mainMolecule[i].angle[l].index[0]+ mainMolecule[i].atomNo * k + summer, 
				    mainMolecule[i].angle[l].index[2]+ mainMolecule[i].atomNo * k + summer, 
				    mainMolecule[i].angle[l].angle * OpenMM::RadiansPerDegree, 
				    100 * OpenMM::KJPerKcal);
		  bondPairs.push_back(std::make_pair(mainMolecule[i].angle[l].index[1]+ mainMolecule[i].atomNo * k + summer,
						     mainMolecule[i].angle[l].index[2]+ mainMolecule[i].atomNo * k + summer));
	      }
	      for(int l=0; l<mainMolecule[i].torsionNo; l++){
		if(mainMolecule[i].torsion[l].forceConstant == 40.0){
		  bondInversion.addTorsion(mainMolecule[i].torsion[l].index[0]+ mainMolecule[i].atomNo * k + summer,
					   mainMolecule[i].torsion[l].index[1]+ mainMolecule[i].atomNo * k + summer,
					   mainMolecule[i].torsion[l].index[2]+ mainMolecule[i].atomNo * k + summer,
					   mainMolecule[i].torsion[l].index[3]+ mainMolecule[i].atomNo * k + summer, 
					 1,
					 0,
					 40.0 * OpenMM::KJPerKcal
					  );
		}
		else{
		  std::vector< double >  param;
		  param.push_back(mainMolecule[i].torsion[l].forceConstant * OpenMM::KJPerKcal);
		  param.push_back(mainMolecule[i].torsion[l].phase);
		  param.push_back(mainMolecule[i].torsion[l].angle * OpenMM::RadiansPerDegree);
		  bondTorsion.addTorsion(mainMolecule[i].torsion[l].index[0]+ mainMolecule[i].atomNo * k + summer,
					 mainMolecule[i].torsion[l].index[1]+ mainMolecule[i].atomNo * k + summer,
					 mainMolecule[i].torsion[l].index[2]+ mainMolecule[i].atomNo * k + summer,
					 mainMolecule[i].torsion[l].index[3]+ mainMolecule[i].atomNo * k + summer,
					 param	);
		//  fprintf(energyRecord, "k = %lf\tn= %lf\tt=%lf\n",mainMolecule[i].torsion[l].forceConstant * OpenMM::KJPerKcal, mainMolecule[i].torsion[l].phase,mainMolecule[i].torsion[l].angle * OpenMM::RadiansPerDegree  );
//		  bondPairs.push_back(std::make_pair(mainMolecule[i].torsion[l].index[0]+ mainMolecule[i].atomNo * k + summer,
//						    mainMolecule[i].torsion[l].index[3]+ mainMolecule[i].atomNo * k + summer));
		}
		
	      }
	    }
	    summing[i]=summer;
	    summer += instances[i]* mainMolecule[i].atomNo;
	  }

	    nonbond.createExceptionsFromBonds(bondPairs, Coulomb14Scale, LennardJones14Scale);
	   // OpenMM::Integrator& integrator =*new  OpenMM::LangevinIntegrator(temperature, frictionInPerPs, stepSize * OpenMM::PsPerFs);
	    OpenMM::Integrator& integrator = * new OpenMM::VerletIntegrator(stepSize * OpenMM::PsPerFs);
	    OpenMM::Context context       = OpenMM::Context(*system, integrator);
	    context.setPositions(pos);
	    context.setVelocities(vel);
	    
	    int infoMask1 = 0;
	    infoMask1 += OpenMM::State::Positions;
	    infoMask1 += OpenMM::State::Energy;
	    OpenMM::State state = context.getState(infoMask1);
	    newPos = state.getPositions();
	    double e = state.getPotentialEnergy()+state.getKineticEnergy();
	    printf("%lf\n", e);
	    
	   
}