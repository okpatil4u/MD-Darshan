#include <cstdio>
#include <string>
#include <cstdlib>
#include <vector>
#include "OpenMM.h"
#include <fstream>
#include <time.h>
#include<iostream>
#include <GL/freeglut.h>
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
void iterateSystem();
void setSystem();
void initGraphics();
void drawMolecules();
void drawAxis();
void show();
void reshape (int w, int h);
void disp();
void mouse(int button, int state, int x, int y);
void mouseMotion(int x, int y);
void drawCube();
void stepFor(int steps);
void loadParameters(FILE *fp);
void createMenu();
void menu_select(int);
int main(int argc, char **argv) {
    try {
	int temp[noC];
	display = temp;
	FILE *fp;
	fp = fopen("optimizeSystem.mole","r");
    
	loadSystemData(fp);
	loadMolecules(fp);
	fclose(fp);
	printf("molecule loading complete\n");
	fp = fopen("simulationParameters.mole","r");
	loadParameters(fp);
	fclose(fp);
	printf("parameter loading complete\n");
	loadPositions();
	printf("position loading complete\n");
	glutInit(&argc, argv);  
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
    fscanf(fp,"%lf",&temperature);
    fscanf(fp,"%d", &type);
    
    if(type == 0){
      fscanf(fp,"%lf",&sizeX);
      fscanf(fp,"%lf",&sizeY);
      fscanf(fp,"%lf",&sizeZ);
    }
    else if(type == 1){
      fscanf(fp,"%lf",&pressure);
      fscanf(fp,"%lf",&sizeX);
      fscanf(fp,"%lf",&sizeY);
      fscanf(fp,"%lf",&sizeZ);
    }
    //Periodic 0
    //Periodic-ewald 1
    //Confined 2
    //NonPeriodic
    fscanf(fp,"%d",&behavior);
    if(behavior == 0 || behavior == 1){
      fscanf(fp,"%lf",&cutOff);
     
    }
    else if(behavior == 2){
      fscanf(fp,"%lf", &sigmaWall);
      fscanf(fp,"%lf", &epsilonWall);
      fscanf(fp,"%lf", &cutOff);
    }
}
void loadParameters(FILE *fp){
    fscanf(fp, "%lf", &equilibriumTime);
    fscanf(fp, "%lf", &simulationTime);
    fscanf(fp, "%lf", &stepSize);
    fscanf(fp, "%lf", &reportingInterval);
    fscanf(fp, "%d", &saveInterval);
    fscanf(fp, "%s", path);
    printf("%lf %lf %lf\n", simulationTime, stepSize, reportingInterval);
}
void loadMolecules(FILE *fp){
  
    fscanf(fp,"%d",&noMoles);
    //Number of instances of each molecule
    molecule mol[noC];
    for(int i =0; i<noC; i++){
      int copies;
      int noAtoms;
      fscanf(fp, "%d", &copies);
      fscanf(fp, "%d", &noAtoms);
      instances.push_back(copies);
      noOfAtoms.push_back(noAtoms);
      
      std::vector<atoms> atom;
      int n;
      for(int j =0; j<noAtoms; j++){
	atoms a ;
	int n;
	double mass, charge, sigma, epsilon, x, y, z;
	fscanf(fp,"%d %lf %lf %lf %lf %lf %lf %lf", &n, &mass, &charge, &sigma, &epsilon, &x, &y, &z);
	a.initiate(n,mass, charge, sigma, epsilon, x, y, z);
	atom.push_back(a);
      }
      
      int noBonds;
      fscanf(fp,"%d", &noBonds);
      noOfBonds.push_back(noBonds);
      std::vector<bonds> bond;
      for(int j =0; j<noBonds; j++){
	bonds b;
	int index0, index1;
	double length, forceConstant;
	fscanf(fp,"%d %d %lf %lf", &index0, &index1, &length, &forceConstant);
	b.initiate(index0, index1, length, forceConstant);
	bond.push_back(b);
      }
      
      int noAngles;
      fscanf(fp, "%d", &noAngles);
      noOfAngles.push_back(noAngles);
      std::vector<angles> angle;
      for(int j =0; j<noAngles; j++){
	angles an;
	int index0, index1, index2;
	double ang, force;
	fscanf(fp,"%d %d %d %lf %lf", &index0, &index1, &index2, &ang, &force);
	an.initiate(index0, index1, index2, ang, force);
	angle.push_back(an);
      }
      
      int noTorsions;
      fscanf(fp,"%d", &noTorsions);
      noOfTorsions.push_back(noTorsions);
      std::vector<torsions> torsion;
      for(int j =0; j<noTorsions; j++){
	torsions tor;
	int index0, index1, index2, index3;
	double angle, force, phase;
	fscanf(fp,"%d %d %d %d %lf %lf %lf", &index0, &index1, &index2, &index3, &force, &angle, &phase);
	tor.initiate(index0, index1, index2, index3, force, angle, phase);
	torsion.push_back(tor);
      }
      mol[i].newMolecule(noAtoms, noBonds, noAngles, noTorsions, atom, bond, angle, torsion);
      mainMolecule.push_back(mol[i]);
    }
    int noExp = 0;
    fscanf(fp, "%d", &noExp);
    for(int i=0; i<noExp; i++){  
      Expression e;
      int no;
      fscanf(fp,"%d", &no);
      e.number = no;
      char form[80];
           
      fscanf(fp,"%s", form);
      std::string *formula = new std::string(form);
      e.formula = *formula;
     
      int argNo;
      fscanf(fp,"%d", &argNo);
      std::vector<std::string> constant;
      std::vector<float> values;
      for(int j=0; j<argNo; j++){	
	char s[10];
	float value;
	fscanf(fp,"%s %f", s, &value);
	std::string *name = new std::string(s);
	constant.push_back(*name);
	values.push_back(value);
      }
      e.constant = constant;
      e.values = values;
      express.push_back(e);
    }
    for(int i=0; i<express.size(); i++){
      printf("%s\n", express[i].formula.c_str());
      for(int j=0; j<express[i].constant.size(); j++){
	printf("%s\t%f\n",express[i].constant[j].c_str(), express[i].values[j]);
      }
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
	    OpenMM::Platform::loadPluginsFromDirectory(
		OpenMM::Platform::getDefaultPluginsDirectory());
	     FILE *energyRecord;
	    energyRecord = fopen("energy.dat", "w");
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
	    if(type == 0){
	      printf("NVT\n");
	      system->setDefaultPeriodicBoxVectors(Vec3(sizeX * OpenMM::NmPerAngstrom,0,0),
                                 Vec3(0,sizeY * OpenMM::NmPerAngstrom,0), 
                                  Vec3(0,0,sizeZ * OpenMM::NmPerAngstrom));
	    }
	    else if(type == 1){
	      printf("NPT Pressure = %lf\n", pressure);
	      
	      OpenMM::MonteCarloBarostat& barostat = *new OpenMM::MonteCarloBarostat(pressure, temperature, 25);
	      system->addForce(&barostat);
	      system->setDefaultPeriodicBoxVectors(Vec3(sizeX * OpenMM::NmPerAngstrom,0,0),
                                 Vec3(0,sizeY * OpenMM::NmPerAngstrom,0), 
                                  Vec3(0,0,sizeZ * OpenMM::NmPerAngstrom));
	    }
    
	    //Periodic 0
	    //Periodic-ewald 1
	    //Confined 2
	    //NonPeriodic
	    if(behavior == 0){
	      printf("Periodic\n");
	      nonbond.setNonbondedMethod(OpenMM::NonbondedForce::CutoffPeriodic );
	      nonbond.setCutoffDistance(cutOff * OpenMM::NmPerAngstrom);
	    }
	    else if(behavior == 1){
	      printf("Periodic-Ewald\n");
	      nonbond.setNonbondedMethod(OpenMM::NonbondedForce::Ewald );
	      nonbond.setCutoffDistance(cutOff * OpenMM::NmPerAngstrom);
	    }
	    else if(behavior == 2){
	      nonbond.setNonbondedMethod(OpenMM::NonbondedForce::CutoffNonPeriodic );
	      nonbond.setCutoffDistance(cutOff * OpenMM::NmPerAngstrom);
	    }
	    else if(behavior == 3){
	      nonbond.setNonbondedMethod(OpenMM::NonbondedForce::NoCutoff );
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
		  vel.push_back(velocities[l+summer+k*mainMolecule[i].atomNo]);
		  fprintf(energyRecord,"Sigma = %lf\tEpsilon = %lf\n", mainMolecule[i].atom[l].sigma * OpenMM::NmPerAngstrom* OpenMM::SigmaPerVdwRadius ,  mainMolecule[i].atom[l].epsilon * OpenMM::KJPerKcal  );
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
		  fprintf(energyRecord, "k = %lf\tn= %lf\tt=%lf\n",mainMolecule[i].torsion[l].forceConstant * OpenMM::KJPerKcal, mainMolecule[i].torsion[l].phase,mainMolecule[i].torsion[l].angle * OpenMM::RadiansPerDegree  );
//		  bondPairs.push_back(std::make_pair(mainMolecule[i].torsion[l].index[0]+ mainMolecule[i].atomNo * k + summer,
//						    mainMolecule[i].torsion[l].index[3]+ mainMolecule[i].atomNo * k + summer));
		}
		
	      }
	    }
	    summing[i]=summer;
	    summer += instances[i]* mainMolecule[i].atomNo;
	  }
	  for(int i=0; i<express.size(); i++){
	   OpenMM::CustomExternalForce *    extForce = new OpenMM::CustomExternalForce(express[i].formula);

	      for(int j=0; j<express[i].constant.size(); j++){
		extForce->addPerParticleParameter(express[i].constant[j]);
		
	      }	   
	      system->addForce(extForce);
	  //for(int n=0; n<express.size(); n++){
	    std::vector<double> param;
	    for(int m=0; m<express[i].constant.size(); m++){
	      param.push_back(express[i].values[m]);
	    }
	    for(int k=0; k<instances[express[i].number]; k++){
	      for(int l=0; l<mainMolecule[express[i].number].atomNo; l++){
		  //printf("Mass = %lf\tSigma = %lf\tEpsilon = %lf\n", mainMolecule[i].atom[l].mass, mainMolecule[i].atom[l].sigma , mainMolecule[i].atom[l].epsilon  );
		  extForce->addParticle(l+summing[i]+k*mainMolecule[express[i].number].atomNo, param);
		
	      }
	      
	    }
	  }
	  
	  /*if(behavior == 2){
	      int X = sizeX/sigmaWall;
	      int Y = sizeY/sigmaWall;
	      int Z = sizeZ/sigmaWall;
	      int particles =0;
	      for(int i=0; i <= X; i++){
		  for(int j=0; j <= Y; j++){
		      for(int k=0; k<= Z; k++){
			  if(i == 0 || i == X){
			      system->addParticle(1e17);
			      nonbond.addParticle( 0, sigmaWall * OpenMM::NmPerAngstrom , epsilonWall * OpenMM::KJPerKcal);
			      Vec3 loc;
			      loc[0] = i * sigmaWall * OpenMM::NmPerAngstrom;
			      loc[1] = j * sigmaWall * OpenMM::NmPerAngstrom;
			      loc[2] = k * sigmaWall * OpenMM::NmPerAngstrom;
			      pos.push_back(loc);
			      Vec3 vec;
			      vec[0] = 0;
			      vec[1] = 0;
			      vec[2] = 0;
			      vel.push_back(vec);
			      particles++;
			  }
			  else if(j == 0 || j == Y){
			      system->addParticle(1e17);
			      nonbond.addParticle( 0, sigmaWall * OpenMM::NmPerAngstrom , epsilonWall * OpenMM::KJPerKcal);
			      Vec3 loc;
			      loc[0] = i * sigmaWall * OpenMM::NmPerAngstrom;
			      loc[1] = j * sigmaWall * OpenMM::NmPerAngstrom;
			      loc[2] = k * sigmaWall * OpenMM::NmPerAngstrom;
			      pos.push_back(loc);
			      Vec3 vec;
			      vec[0] = 0;
			      vec[1] = 0;
			      vec[2] = 0;
			      vel.push_back(vec);
			      particles++;
			  }
			  else if(k == 0 || k == Z){
			     system->addParticle(1e17);
			      nonbond.addParticle( 0, sigmaWall * OpenMM::NmPerAngstrom , epsilonWall * OpenMM::KJPerKcal);
			      Vec3 loc;
			      loc[0] = i * sigmaWall * OpenMM::NmPerAngstrom;
			      loc[1] = j * sigmaWall * OpenMM::NmPerAngstrom;
			      loc[2] = k * sigmaWall * OpenMM::NmPerAngstrom;
			      pos.push_back(loc);
			      Vec3 vec;
			      vec[0] = 0;
			      vec[1] = 0;
			      vec[2] = 0;
			      vel.push_back(vec);
			      particles++;
			  }
		      }
		  }
	      }
	  }*/
	  
	    nonbond.createExceptionsFromBonds(bondPairs, Coulomb14Scale, LennardJones14Scale);
	   // OpenMM::Integrator& integrator =*new  OpenMM::LangevinIntegrator(temperature, frictionInPerPs, stepSize * OpenMM::PsPerFs);
	    OpenMM::Integrator& integrator = * new OpenMM::VerletIntegrator(stepSize * OpenMM::PsPerFs);
	    OpenMM::Context context       = OpenMM::Context(*system, integrator);
	    context.setPositions(pos);
	    context.setVelocities(vel);
	    
	      OpenMM::LocalEnergyMinimizer::minimize(context,1000 , 1000);
	    std::string name1 = context.getPlatform().getName();
	    printf("Platform = %s\n", name1.c_str());
	    int infoMask1 = 0;
	    infoMask1 += OpenMM::State::Positions;
	    infoMask1 += OpenMM::State::Energy;
	    infoMask1 += OpenMM::State::Velocities;
	    OpenMM::State state = context.getState(infoMask1);
	    newPos = state.getPositions();
	    double e = state.getPotentialEnergy();
	    //printf("Energy = %lf\n", e);
	    initGraphics();
	    
	   
	    
	    Vec3 a, b, c;
	    
	    double sum=0;
	    int count=0;
	    int save=0;
	    int times =0;
	     summer = 0;
	   
	     FILE *data;
	     char name[100];
	     sprintf(name,"%s.dat", path);
	     printf("%s\n", name);
	     data = fopen(name,"w");
	     fprintf(data,"%d\n",(int)positions.size());
	     
	    /* printf("%lf\t%lf\n", equilibriumTime/stepSize, simulationTime/stepSize);
	    for(int i=0; i<equilibriumTime/stepSize; i+=reportingInterval*stepSize){
		 integrator.step(reportingInterval);
		 
		 OpenMM::State state1 = context.getState(infoMask1);
		 double energy = state1.getPotentialEnergy() + state1.getKineticEnergy();
		 newPos = state1.getPositions();
		 newVel = state1.getVelocities();
		 state1.getPeriodicBoxVectors(a, b, c);
		 
		 sizeX = a[0]*OpenMM::AngstromsPerNm;
		 sizeY = b[1]*OpenMM::AngstromsPerNm;
		 sizeZ = c[2]*OpenMM::AngstromsPerNm;
		 
		 if(type == 0)
		 printf("%d Energy = %lf\n",i+1, energy);
		 else{
		   sum += sizeX*sizeY*sizeZ;
		   count++;
		   printf("%d Energy = %lf Volume =%lf\n",i+1, energy, sum/count);
		   
		 }
		 
		 glutMainLoopEvent();
		 disp();
	    }*/
	    printf("Equilibrium Time Complete");
	    for(int i=0; i<simulationTime/stepSize; i+=reportingInterval*stepSize){
		 integrator.step(reportingInterval);
		 
		 OpenMM::State state1 = context.getState(infoMask1);
		 double energy = state1.getPotentialEnergy()+state1.getKineticEnergy();
		 newPos = state1.getPositions();
		 newVel = state1.getVelocities();
		 state1.getPeriodicBoxVectors(a, b, c);
		 
		 fprintf(energyRecord, "%d\t%lf\t%lf\n", i, state1.getPotentialEnergy(),state1.getKineticEnergy());
		 sizeX = a[0]*OpenMM::AngstromsPerNm;
		 sizeY = b[1]*OpenMM::AngstromsPerNm;
		 sizeZ = c[2]*OpenMM::AngstromsPerNm;
		 
		 if(type == 0)
		 printf("%lf Energy = %lf\n",i+1+equilibriumTime/stepSize, energy);
		 else{
		   sum += sizeX*sizeY*sizeZ;
		   count++;
		   printf("%lf Energy = %lf Volume =%lf\n",i+1+equilibriumTime/stepSize, energy, sum/count);
		   
		 }
		 
		 glutMainLoopEvent();
		 disp();
		 int a = (int)((i)/stepSize);
		 if(a%saveInterval == 0){
		   times++;
		   printf("Saving\n");
		    for(int j=0; j<noC; j++){
		      for(int k=0; k<instances[j]; k++){
			 for(int l=0; l<mainMolecule[j].atomNo; l++){
			    positions[l+summer+k*mainMolecule[j].atomNo][0] = newPos[l+summer+k*mainMolecule[j].atomNo][0];
			    positions[l+summer+k*mainMolecule[j].atomNo][1] = newPos[l+summer+k*mainMolecule[j].atomNo][1];
			    positions[l+summer+k*mainMolecule[j].atomNo][2] = newPos[l+summer+k*mainMolecule[j].atomNo][2];
			    velocities[l+summer+k*mainMolecule[j].atomNo][0] = newVel[l+summer+k*mainMolecule[j].atomNo][0];
			    velocities[l+summer+k*mainMolecule[j].atomNo][1] = newVel[l+summer+k*mainMolecule[j].atomNo][1];
			    velocities[l+summer+k*mainMolecule[j].atomNo][2] = newVel[l+summer+k*mainMolecule[j].atomNo][2];
			  }
		      }
		      summer += instances[j]*mainMolecule[j].atomNo;
		    }
		    addinPos.push_back(positions);
		    summer = 0;
		    printf("Vector Size = %d\n", (int)addinPos.size());
		    fprintf(data,"%d\n", int(i+1+equilibriumTime/stepSize)); 
		    if(type == 1){
			fprintf(data, "%lf\t%lf\t%lf\t%lf\n", sizeX, sizeY, sizeZ,energy);		      
		    }
		    for(int j=0; j<positions.size(); j++){
			fprintf(data,"%d\t%lf\t%lf\t%lf\n", j+1, positions[j][0], positions[j][1], positions[j][2]);
		    }
		    for(int j=0; j<velocities.size(); j++){
			fprintf(data,"%d\t%lf\t%lf\t%lf\n", j+1, velocities[j][0], velocities[j][1], velocities[j][2]);
		    }
		 }
	    }
	    printf("Saving\n");
	    times++;
	    for(int i=0; i<noC; i++){
		for(int k=0; k<instances[i]; k++){
		    for(int l=0; l<mainMolecule[i].atomNo; l++){
			positions[l+summer+k*mainMolecule[i].atomNo][0] = newPos[l+summer+k*mainMolecule[i].atomNo][0];
			positions[l+summer+k*mainMolecule[i].atomNo][1] = newPos[l+summer+k*mainMolecule[i].atomNo][1];
			positions[l+summer+k*mainMolecule[i].atomNo][2] = newPos[l+summer+k*mainMolecule[i].atomNo][2];
			velocities[l+summer+k*mainMolecule[i].atomNo][0] = newVel[l+summer+k*mainMolecule[i].atomNo][0];
			velocities[l+summer+k*mainMolecule[i].atomNo][1] = newVel[l+summer+k*mainMolecule[i].atomNo][1];
			velocities[l+summer+k*mainMolecule[i].atomNo][2] = newVel[l+summer+k*mainMolecule[i].atomNo][2];
		    }
		}
		summer += instances[i]*mainMolecule[i].atomNo;
	    }
	    summer = 0;
	    fprintf(data,"%d\n",(int)(simulationTime/stepSize+equilibriumTime/stepSize)); 
	    if(type == 1){
			fprintf(data, "%lf\t%lf\t%lf\n", sizeX, sizeY, sizeZ);		      
	    }
	    for(int i=0; i<positions.size(); i++){
		fprintf(data,"%d\t%lf\t%lf\t%lf\n", i+1, positions[i][0], positions[i][1], positions[i][2]);
	    }
	    for(int i=0; i<velocities.size(); i++){
		fprintf(data,"%d\t%lf\t%lf\t%lf\n", i+1, velocities[i][0], velocities[i][1], velocities[i][2]);
	    }
	    fprintf(data,"End\n");
	    fclose(data);
	    data = fopen("checkIt.txt","w");
	    fprintf(data,"Done");
	    fprintf(data,"\n%d",times);
	    fclose(data);
	    fclose(energyRecord);
}
void initGraphics(){   
	for(int i=0; i<noC; i++){
	  display[i]=1;
	}
	//int result = glGetBooleanv(GL_STEREO);
	//printf("%d",result);
	glutInitDisplayMode(GLUT_RGB | GLUT_DOUBLE| GLUT_DEPTH );  
	glutInitWindowSize(1200,580);  
	glutInitWindowPosition(0,105);  
	int win = glutCreateWindow("MD Darshan"); 
	GLfloat mat_specular[] = { 1.0, 1.0, 1.0, 1.0 };
	GLfloat mat_shininess[] = { 50.0 };
	GLfloat light_position[] = { 1.0, 1.0, 1.0, 0.0 };
	glClearColor (0.0, 0.0, 0.0, 0.0);
	glShadeModel (GL_SMOOTH);
	glMaterialfv(GL_FRONT, GL_SPECULAR, mat_specular);
	glMaterialfv(GL_FRONT, GL_SHININESS, mat_shininess);
	glEnable(GL_LIGHTING);
	glEnable(GL_LIGHT0);
	glEnable(GL_DEPTH_TEST);
	glutDisplayFunc(disp);
	glutReshapeFunc(reshape); 
	glutMotionFunc (mouseMotion);
	glutMouseFunc(mouse);
	//glClearColor(0.0,0.0,0.0,0.0); 
	createMenu();
	 glutMainLoopEvent();
	printf("Graphics Initialized\n");
}
void disp(){
	glClear (GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	show();
}
void reshape (int w, int h) {  
	glViewport (0, 0, (GLsizei) w, (GLsizei) h);
	glMatrixMode (GL_PROJECTION);
	glLoadIdentity();
	gluPerspective(60, (GLfloat)w / (GLfloat)h,1.0, 100.0); 
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
}
void show()
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glLoadIdentity();
	        glTranslatef(0.0f, 0.0f, zoom); 
	gluLookAt(	0.0f, 0.0f, -1.0f,
				0.0f, 0.0f,  0.0f,
				0.0f, 1.0f,  0.0f);
	glRotatef( angleX, 0.0f, 1.0f, 0.0f);
	glRotatef( angleY, 1.0f, 0.0f, 0.0f);
	glRotatef( angleZ, 0.0f, 0.0f, 1.0f);
	drawAxis();
	drawCube();
	
	drawMolecules();
	 
	glutSwapBuffers();
	
}
void drawAxis()
{
	glColor3f(1.f, 0.f, 0.f);
	glRasterPos3f(0, -8, 1.1);
	glutBitmapCharacter(GLUT_BITMAP_HELVETICA_18,'Z');
  	glBegin(GL_LINE_STRIP);
		glVertex3f(0,-8,0);
		glVertex3f(0,-8,1);
	glEnd();
	glColor3f(0.f, 1.f, 0.f);
	glRasterPos3f(0, -6.9, 0);
	glutBitmapCharacter(GLUT_BITMAP_HELVETICA_18,'Y');
	glBegin(GL_LINE_STRIP);
		glVertex3f(0,-8,0);
		glVertex3f(0,-7,0);
	glEnd();
	glColor3f(0.f, 0.f, 1.f);
	glRasterPos3f(1.1, -8, 0);
	glutBitmapCharacter(GLUT_BITMAP_HELVETICA_18,'X');
	glBegin(GL_LINE_STRIP);
		glVertex3f(0,-8,0);
		glVertex3f(1,-8,0);
	glEnd();
}
void drawMolecules(){
  
	 glLineWidth(1);
	 glColor3f(1.0f,1.0f,1.0f);
	 int bonder =0;
	 int summer = 0;
	 // 
	 
	  for(int i=0; i<noC; i++){
	    for(int k=0; k<instances[i]; k++){
	      for(int l=0; l<mainMolecule[i].bondNo; l++){
		  if(display[i]==1){
		  int index0 =mainMolecule[i].bond[l].index[0] + mainMolecule[i].atomNo * k + summer;
		  int index1 =mainMolecule[i].bond[l].index[1] + mainMolecule[i].atomNo * k + summer;
		  glBegin(GL_LINES);
		  glVertex3f( newPos[index0][0]*5-sizeX/4, newPos[index0][1]*5-sizeY/4, newPos[index0][2]*5-sizeZ/4);
		  glVertex3f( newPos[index1][0]*5-sizeX/4, newPos[index1][1]*5-sizeY/4, newPos[index1][2]*5-sizeZ/4);
		  glEnd();
		  bonder++;
		  }
	      }
	    }
	    summer += instances[i]* mainMolecule[i].atomNo;
	  }
	  summer =0;
	  bonder =0;
	 for(int i=0; i<noC; i++){
	    for(int k=0; k<instances[i]; k++){
	      for(int l=0; l<mainMolecule[i].atomNo; l++){
		  if(display[i]==1){
		    int index0 =l + mainMolecule[i].atomNo * k + summer;
		    glPushMatrix();
		    glTranslatef(newPos[index0][0]*5-sizeX/4, newPos[index0][1]*5-sizeY/4, newPos[index0][2]*5-sizeZ/4);
		    //glutSolidSphere(0.1, 15, 15);
		    glutSolidCube(0.1);
		    glPopMatrix();
		    bonder++;
		  }
	      }
	    }
	    summer += instances[i]* mainMolecule[i].atomNo;
	  }
	// printf("Positions = %d", bonder);
	/* for(int i=0; i<positions.size();i++){
	  // if(display[i]==1){
		glPushMatrix();
		glTranslatef(newPos[i][0]*5-sizeX/4, newPos[i][1]*5-sizeY/4, newPos[i][2]*5-sizeZ/4);
		//glutSolidSphere(0.1, 15, 15);
		glutSolidCube(0.1);
		glPopMatrix();
	 //  }
	}*/
}
void mouseMotion(int x, int y)
{
  if((RMB!=1)&&(MMB!=1))
  {
	if(xOrigin>0){
	xNew= xOrigin-x ;
	if(xNew>0)
	  angleX-=3.0f;
	else if(xNew<0)
	  angleX+=3.0f;
	if(angleX>360)
	  angleX-=360;
	else if(angleX<0)
	  angleX+=360;
	show();  	
	}
	if(yOrigin>0)
	{
	  yNew = yOrigin-y;
	  if(((angleXX>=315)&&(angleXX<=360))||((angleXX>=0)&&(angleXX<45)))
	  {
	    if(yNew>0)
	      angleY-=1.5f;
	    else if(yNew<0)
	      angleY+=1.5f;
	  }
	  else if((angleXX>=135)&&(angleXX<225))
	  {
	    if(yNew<0)
	      angleY-=1.5f;
	    else if(yNew>0)
	      angleY+=1.5f;
	  }
	  else if((angleXX>=45)&&(angleXX<135))
	  {
	    if(yNew>0)
	      angleZ-=1.5f;
	    else if(yNew<0)
	      angleZ+=1.5f;
	  }
	  else if((angleXX>=225)&&(angleXX<315))
	  {
	    if(yNew<0)
	      angleZ-=1.5f;
	    else if(yNew>0)
	      angleZ+=1.5f;
	  }
	  if(angleY>360)
	    angleY-=360;
	  else if(angleY<0)
	    angleY+=360;
	}
	xOrigin=x;
	yOrigin=y;
	LMB =0;
  }
  else
  {
	if(zoomOrigin >0)
	{
	  zoomNew = y - zoomOrigin;
	  if(zoomNew <0)
	  {
	    zoom+=0.3f;
	  }
	  else if(zoomNew>0)
	  {
	    zoom-=0.3f;
	  }
	  if(zoom>30)
	    zoom = 30;
	  else if(zoom<-100)
	    zoom = -100;
	  zoomOrigin = y;
	  show();
	}
  }
}
void mouse(int button, int state, int x, int y)
{
  switch(button)
  {
    case GLUT_LEFT_BUTTON :
		if (state == GLUT_UP) {
			xOrigin = -1;
			yOrigin = -1;
			LMB =0;
			angleXX = angleX;
		}
		else  {// state = GLUT_DOWN
			LMB =1;
			xOrigin = x;
			yOrigin = y;
		}

      break;
    case GLUT_MIDDLE_BUTTON :
      if(state == GLUT_DOWN)
      {
	    RMB = 1;
	    zoomOrigin = y;
      }
      else 
      {
	RMB = 0;
	zoomOrigin = -1;
      }
      break;
   
    default:
      break;
  }
}
void drawCube()
{
  
	Xl = sizeX/4;
	Yl = sizeY/4;
	Zl = sizeZ/4;
	double Xs = -sizeX/4;
	double Ys = -sizeY/4;
	double Zs = -sizeZ/4;
  	    glLineWidth(1);
	glColor3f(1.f,1.f,1.f);
	glBegin(GL_LINE_STRIP);
		glVertex3f(Xs,Ys,Zs);
		glVertex3f(Xl,Ys,Zs);
		glVertex3f(Xl,Ys,Zl);
		glVertex3f(Xs,Ys,Zl);
		glVertex3f(Xs,Yl,Zl);
		glVertex3f(Xs,Yl,Zs);
		glVertex3f(Xs,Ys,Zs);
		glVertex3f(Xs,Ys,Zl);
	glEnd();
	glBegin(GL_LINE_STRIP);
		glVertex3f(Xs,Yl,Zs);
		glVertex3f(Xl,Yl,Zs);
		glVertex3f(Xl,Ys,Zs);
	glEnd();
	glBegin(GL_LINE_STRIP);
		glVertex3f(Xs,Yl,Zl);
		glVertex3f(Xl,Yl,Zl);
		glVertex3f(Xl,Ys,Zl);
	glEnd();
	glBegin(GL_LINE_STRIP);
		glVertex3f(Xl,Yl,Zs);
		glVertex3f(Xl,Yl,Zl);
	glEnd();
	 
}

void menu_select(int item)
{
  if(display[item]==1){
    display[item]=0;
  }
  else if(display[item]==0){
    display[item]=1;
  }
  show();
}
void createMenu(){
  glutCreateMenu(menu_select);
  
  for(int i=0; i<noC; i++){
    glutAddMenuEntry("Molecule", i);
  }
  glutAttachMenu(GLUT_RIGHT_BUTTON);
}
