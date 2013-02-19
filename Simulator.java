import com.sun.j3d.utils.picking.*; 
import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.GraphicsConfiguration;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.awt.event.MouseWheelEvent;
import java.awt.event.MouseWheelListener;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.StringTokenizer;
import java.util.Vector;

import javax.media.j3d.Appearance;
import javax.media.j3d.BoundingSphere;
import javax.media.j3d.BranchGroup;
import javax.media.j3d.Canvas3D;
import javax.media.j3d.ColoringAttributes;
import javax.media.j3d.DirectionalLight;
import javax.media.j3d.LineArray;
import javax.media.j3d.Material;
import javax.media.j3d.Shape3D;
import javax.media.j3d.Transform3D;
import javax.media.j3d.TransformGroup;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JInternalFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.event.InternalFrameEvent;
import javax.swing.event.InternalFrameListener;
import javax.vecmath.AxisAngle4f;
import javax.vecmath.Color3f;
import javax.vecmath.Point3d;
import javax.vecmath.Point3f;
import javax.vecmath.Vector3d;
import javax.vecmath.Vector3f;

import com.sun.j3d.utils.geometry.Cylinder;
import com.sun.j3d.utils.geometry.Primitive;
import com.sun.j3d.utils.geometry.Sphere;
import com.sun.j3d.utils.universe.SimpleUniverse;
import com.sun.j3d.utils.universe.ViewingPlatform;
import com.sun.j3d.utils.behaviors.vp.OrbitBehavior;
public class Simulator {
	static Darshan main;
	static SimpleUniverse uniMole;
	static Canvas3D canvasMole;
	static TransformGroup moleTransGroup;
	static JInternalFrame jmole;
	static JInternalFrame jmtkit;
	static String mouseMode = "Select";
	static boolean canDrag = false;
	static BranchGroup moleBranchGroup;
	static File saveSysTo;
	static int yesb=0;
	static Vector<Molecule> mole;
	static Vector<Vector<Angles>> mainAngle;
	static Vector<Num> mainAngleCount;
	static double scale;
	static Vector<Num> toMove;
	static ViewingPlatform view;
	static OrbitBehavior orbit;
	static boolean mainYes = true;
	static boolean shut;
	static boolean export = false;
	static int selectedBondId=9999;
	static Vector<Vector<Torsion>> mainTorsion;
	static Vector<Num> mainTorsionCount;
	static float Temperature= 298;
	static float size[];
	static float simulationTime;
	static float stepSize;
	static float reportingInterval;
	static int moleCount;
	static Vector<Vector<Atom>> allMoles;
	static Vector<Num> allMolesCount;
	public void initiateSimulator(Darshan ab, float temp, float x, float y, float z){
		main=ab;
		mole = new Vector<Molecule>();
		scale=0.005;
		shut = false;
		Temperature = temp;
		size=new float[3];
		size[0]=x;
		size[1]=y;
		size[2]=z;
		allMoles = new Vector<Vector<Atom>>();
		allMolesCount = new Vector<Num>();
		moleCount=0;
		molFrame();
	}
	public void put(float x, float y, float z, int selectedIndex, Vector<Atom> allAtoms, String ffFile, Molecule molecule){
		moleBranchGroup = new BranchGroup();
		moleTransGroup = createBehaviors();
		moleTransGroup.addChild(  createSphere(selectedIndex));
		moleBranchGroup.addChild(moleTransGroup);
		Vector3f temp = new Vector3f(x,y,z);
		Transform3D tempT = new Transform3D();
		tempT.setTranslation(temp);
		moleTransGroup.setTransform(tempT);
		Atom a1 = Atom.copy(allAtoms.get(selectedIndex));
		PickCanvas pickCanvas = new PickCanvas(canvasMole, moleBranchGroup);
	    pickCanvas.setMode(PickCanvas.BOUNDS);
		molecule.addAtom(a1, moleTransGroup,pickCanvas,temp,selectedIndex);
		uniMole.addBranchGraph(moleBranchGroup);
		moleTransGroup=null;
		//main.jtext.append("\n"+a1.name);
	}
	public void placeAtom(float x, float y, float z, int chosen, Molecule molecule){
		Transform3D t3d = new Transform3D();
		t3d.setTranslation(new Vector3f(x,y,z));
		moleTransGroup=molecule.moleTrans.get(chosen);
		moleTransGroup.setTransform(t3d);
		molecule.vec.remove(chosen);
		molecule.vec.add(chosen, new Vector3f(x,y,z));
		yesb =0;
		toMove=null;
		toMove=new Vector<Num>();
		for(int i=0;i<molecule.bondTotal;i++)
		{
			int s1=molecule.bonds.get(i).index[0];
			int s2=molecule.bonds.get(i).index[1];
			if(s1==chosen){
				yesb++;
				Num m=new Num();
				m.n =i;
				toMove.add(m);
			}
			else if(s2==chosen){
				yesb++;
				Num m=new Num();
				m.n =i;
				toMove.add(m);
			}
			
		}
		if(toMove!=null){
			for(int i=0;i<yesb;i++){
				moleTransGroup = molecule.bondTrans.get(toMove.get(i).n);
				Vector3f pos = new Vector3f(x,y,z);
				int s1[] = molecule.bonds.get(toMove.get(i).n).index;
				Vector3f pos1 = molecule.vec.get(s1[1]);
				if(s1[1]==chosen){
					pos1 = molecule.vec.get(s1[0]);
				}
				Vector3f cross = new Vector3f();
				Vector3f YAXIS = new Vector3f(0, 1, 0);
				Vector3f temp = new Vector3f((pos.x+pos1.x)/2,(pos.y+pos1.y)/2,(pos.z+pos1.z)/2);
				Vector3f temp1 = new Vector3f((pos.x-pos1.x),(pos.y-pos1.y),(pos.z-pos1.z));
				double oldl = molecule.bonds.get(toMove.get(i).n).length;
				double l = Math.sqrt(Squares.sqr(pos.x-pos1.x)+Squares.sqr(pos.y-pos1.y)+Squares.sqr(pos.z-pos1.z));
				temp1.normalize();
				l=l/oldl;
				cross.cross(YAXIS,temp1);
				AxisAngle4f tempAA = new AxisAngle4f();
				tempAA.set(cross,(float)Math.acos(YAXIS.dot(temp1)));
				Transform3D tempT = new Transform3D();
				tempT.set(tempAA);
				tempT.setTranslation(temp);
				tempT.setScale(new Vector3d(1,l,1));
				moleTransGroup.setTransform(tempT);
			}
		}
		
}
	public static void putBond(Molecule molecule, int selectedId, int selectedId2){
		
		Vector3f pos = molecule.vec.get(selectedId);
		Vector3f pos1 = molecule.vec.get(selectedId2);
		Vector3f cross = new Vector3f();
		Vector3f YAXIS = new Vector3f(0, 1, 0);
		Vector3f temp = new Vector3f((pos.x+pos1.x)/2,(pos.y+pos1.y)/2,(pos.z+pos1.z)/2);
		Vector3f temp1 = new Vector3f((pos.x-pos1.x),(pos.y-pos1.y),(pos.z-pos1.z));
		
		double l = (float)Math.sqrt(Squares.sqr(pos.x-pos1.x)+Squares.sqr(pos.y-pos1.y)+Squares.sqr(pos.z-pos1.z));
		
		temp1.normalize();

		cross.cross(YAXIS,temp1);
		
		AxisAngle4f tempAA = new AxisAngle4f();
		
		tempAA.set(cross,(float)Math.acos(YAXIS.dot(temp1)));
		
		moleBranchGroup = new BranchGroup();
		moleTransGroup = createBehaviors();
		moleTransGroup.addChild(  createCylinder(l,0));
		moleTransGroup.addChild(  createCylinder(l,0));
		TransformGroup t1 = createBehaviors();
		t1.addChild(createCylinder(l/2,1));
		TransformGroup t2 = createBehaviors();
		t2.addChild(createCylinder(l/5,2));
		moleBranchGroup.addChild(moleTransGroup);
		moleBranchGroup.addChild(t1);
		moleBranchGroup.addChild(t2);
		Transform3D tempT = new Transform3D();
		tempT.set(tempAA);
		tempT.setTranslation(temp);
		try{
			moleTransGroup.setTransform(tempT);
			t1.setTransform(tempT);
			t2.setTransform(tempT);
			int i=1;
			PickCanvas pickCanvas = new PickCanvas(canvasMole, moleBranchGroup);
		    pickCanvas.setMode(PickCanvas.BOUNDS);
			molecule.addBond(moleTransGroup,t1, t2,selectedId,selectedId2,l,i, pickCanvas);
			uniMole.addBranchGraph(moleBranchGroup);
			moleTransGroup=null;
			//main.jtext.setText("\nValency = "+selectedMol.atoms.get(selectedId).valency+selectedMol.atoms.get(selectedId2).valency);
			selectedId=9999;
			selectedId2=9999;
		}catch(javax.media.j3d.BadTransformException e){
			
		}
	}
	@SuppressWarnings("static-access")
	private static void saveMol(){
		JFileChooser jfc = new JFileChooser();
		int f = jfc.showSaveDialog(main.frame);
		if(f == JFileChooser.APPROVE_OPTION){
			File file = jfc.getSelectedFile();
		checkAngles();
		try {
			file.createNewFile();
		} catch (IOException e) {
			main.jtext.setText("\nError : Cannot create new file");
		}
		if(file.exists()){
			if(file.canWrite()){
				try {
					FileWriter wfile = new FileWriter(file.toString());
					BufferedWriter out = new BufferedWriter(wfile);
					if(export)
						out.write("1\n");
					else
						out.write("0\n");
			/*		out.write(ffFile);
					out.write("\n"+atomToCheck);
					for(int i=0;i<atomToCheck;i++){
						out.write("\n"+allAtoms.get(i).RFID);
					}
					out.write("\n"+selectedMol.total);
					for(int i=0;i<selectedMol.total;i++){
						Atom a1 = selectedMol.atoms.get(i);
						out.write("\n"+a1.RFID+" "+selectedMol.vec.get(i).x/0.2+" "+selectedMol.vec.get(i).y/0.2+" "+selectedMol.vec.get(i).z/0.2);
					}
					out.write("\n"+selectedMol.bondTotal);
					for(int i=0;i<selectedMol.bondTotal;i++){
						Bond b = selectedMol.bonds.get(i);
						out.write("\n"+b.index[0]+" "+b.index[1]);
					}*/
					out.write("\nEnd");
					out.close();
				}catch(IOException e){
					main.jtext.setText("\nError : Could not save");
				}
				} 
			}
			else{
				main.jtext.setText("\nError : File Write Error");
			}
		}
	}
	@SuppressWarnings("static-access")
	public static void molFrame(){
		jmole = new JInternalFrame("Simulator", false, true, false ,false);
		jmole.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
		jmole.setName("Simulator");
		jmole.setLayout(new BorderLayout());
		
		GraphicsConfiguration confMole = SimpleUniverse.getPreferredConfiguration();
		canvasMole = new Canvas3D(confMole);
		
		jmole.add(canvasMole,BorderLayout.CENTER);
		
		uniMole = new SimpleUniverse(canvasMole);
		
		moleBranchGroup = new BranchGroup();
		addLights( moleBranchGroup );
		
		canvasMole.addMouseListener(new MouseListener(){
			public void mouseClicked(MouseEvent arg0) {

			}
			public void mouseEntered(MouseEvent arg0) {}
			public void mouseExited(MouseEvent arg0) {}
			public void mousePressed(MouseEvent arg0) {}
			public void mouseReleased(MouseEvent arg0) {}
		});
		
		canvasMole.addMouseWheelListener(new MouseWheelListener(){

			public void mouseWheelMoved(MouseWheelEvent arg0) {
				if(arg0.getWheelRotation()<0){
					scale*=0.95;
					
				}
				else if(arg0.getWheelRotation()>0){
					scale/=0.95;
				}
			}
		});
		
		canvasMole.addMouseMotionListener(new MouseMotionListener(){
			public void mouseDragged(MouseEvent arg0) {
				if(mouseMode=="Rotate"){
					orbit.setRotateEnable(true);
					orbit.setViewingPlatform(uniMole.getViewingPlatform());
				}
			}
			public void mouseMoved(MouseEvent arg0) {}		
		});
		orbit = new OrbitBehavior(canvasMole,orbit.REVERSE_TRANSLATE );
	    orbit.setSchedulingBounds(new BoundingSphere(new Point3d(0.0, 0.0, 0.0), Double.POSITIVE_INFINITY));
	    uniMole.getViewingPlatform().setViewPlatformBehavior(orbit);
	    drawBounds();
		uniMole.addBranchGraph(moleBranchGroup);
	    view = uniMole.getViewingPlatform();
		view.setNominalViewingTransform();
		jmole.setBounds(0,0,1100,500);
		jmole.setVisible(true);
		main.jdesk.add(jmole);
		main.frame.add(main.jdesk);
		
		//main.jtext.setText("\nMolecule Designer Created");
		
		jmole.addInternalFrameListener(new InternalFrameListener(){
			public void internalFrameActivated(InternalFrameEvent arg0) {}
			public void internalFrameClosed(InternalFrameEvent arg0) {}
			public void internalFrameClosing(InternalFrameEvent arg0) {
				askMoleSave("Exit");
			}
			public void internalFrameDeactivated(InternalFrameEvent arg0) {}
			public void internalFrameDeiconified(InternalFrameEvent arg0) {}
			public void internalFrameIconified(InternalFrameEvent arg0) {}
			public void internalFrameOpened(InternalFrameEvent arg0) {}
		});
	}
	public static void drawBounds(){
		Color3f green = new Color3f(0.0f, 1.0f, 0.0f);
		Appearance app = new Appearance();
	    ColoringAttributes ca = new ColoringAttributes(green,
	        ColoringAttributes.SHADE_FLAT);
	    app.setColoringAttributes(ca);
	    Point3f[] plaPts = new Point3f[2];
	    
	 	plaPts[0] = new Point3f(size[0]/2, size[1]/2, size[2]/2);
		plaPts[1] = new Point3f(- size[0]/2, size[1]/2, size[2]/2);
	    LineArray pla = new LineArray(2, LineArray.COORDINATES);
	    pla.setCoordinates(0, plaPts);
	    Shape3D plShape = new Shape3D(pla, app);
	    moleBranchGroup.addChild(plShape);
	    
	    plaPts[0] = new Point3f(-size[0]/2, size[1]/2, size[2]/2);
		plaPts[1] = new Point3f(-size[0]/2, -size[1]/2, size[2]/2);
	    pla = new LineArray(2, LineArray.COORDINATES);
	    pla.setCoordinates(0, plaPts);
	    plShape = new Shape3D(pla, app);
	    moleBranchGroup.addChild(plShape);
	    
	    plaPts[0] = new Point3f(-size[0]/2, -size[1]/2, size[2]/2);
		plaPts[1] = new Point3f(size[0]/2, -size[1]/2, size[2]/2);
	    pla = new LineArray(2, LineArray.COORDINATES);
	    pla.setCoordinates(0, plaPts);
	    plShape = new Shape3D(pla, app);
	    moleBranchGroup.addChild(plShape);
	    
	    plaPts[0] = new Point3f(size[0]/2, -size[1]/2, size[2]/2);
		plaPts[1] = new Point3f(size[0]/2, size[1]/2, size[2]/2);
	    pla = new LineArray(2, LineArray.COORDINATES);
	    pla.setCoordinates(0, plaPts);
	    plShape = new Shape3D(pla, app);
	    moleBranchGroup.addChild(plShape);
	    
	    plaPts[0] = new Point3f(size[0]/2, size[1]/2, -size[2]/2);
		plaPts[1] = new Point3f(- size[0]/2, size[1]/2, -size[2]/2);
	    pla = new LineArray(2, LineArray.COORDINATES);
	    pla.setCoordinates(0, plaPts);
	    plShape = new Shape3D(pla, app);
	    moleBranchGroup.addChild(plShape);
	    
	    plaPts[0] = new Point3f(-size[0]/2, size[1]/2, -size[2]/2);
		plaPts[1] = new Point3f(-size[0]/2, -size[1]/2, -size[2]/2);
	    pla = new LineArray(2, LineArray.COORDINATES);
	    pla.setCoordinates(0, plaPts);
	    plShape = new Shape3D(pla, app);
	    moleBranchGroup.addChild(plShape);
	    
	    plaPts[0] = new Point3f(-size[0]/2, -size[1]/2, -size[2]/2);
		plaPts[1] = new Point3f(size[0]/2, -size[1]/2, -size[2]/2);
	    pla = new LineArray(2, LineArray.COORDINATES);
	    pla.setCoordinates(0, plaPts);
	    plShape = new Shape3D(pla, app);
	    moleBranchGroup.addChild(plShape);
	    
	    plaPts[0] = new Point3f(size[0]/2, -size[1]/2, -size[2]/2);
		plaPts[1] = new Point3f(size[0]/2, size[1]/2, -size[2]/2);
	    pla = new LineArray(2, LineArray.COORDINATES);
	    pla.setCoordinates(0, plaPts);
	    plShape = new Shape3D(pla, app);
	    moleBranchGroup.addChild(plShape);
	    
	    plaPts[0] = new Point3f(size[0]/2, size[1]/2, size[2]/2);
		plaPts[1] = new Point3f(size[0]/2, size[1]/2, -size[2]/2);
	    pla = new LineArray(2, LineArray.COORDINATES);
	    pla.setCoordinates(0, plaPts);
	    plShape = new Shape3D(pla, app);
	    moleBranchGroup.addChild(plShape);
	    
	    plaPts[0] = new Point3f(-size[0]/2, size[1]/2, size[2]/2);
		plaPts[1] = new Point3f(-size[0]/2, size[1]/2, -size[2]/2);
	    pla = new LineArray(2, LineArray.COORDINATES);
	    pla.setCoordinates(0, plaPts);
	    plShape = new Shape3D(pla, app);
	    moleBranchGroup.addChild(plShape);
	    
	    plaPts[0] = new Point3f(-size[0]/2, -size[1]/2, size[2]/2);
		plaPts[1] = new Point3f(-size[0]/2, -size[1]/2, -size[2]/2);
	    pla = new LineArray(2, LineArray.COORDINATES);
	    pla.setCoordinates(0, plaPts);
	    plShape = new Shape3D(pla, app);
	    moleBranchGroup.addChild(plShape);
	    
	    plaPts[0] = new Point3f(size[0]/2, -size[1]/2, size[2]/2);
		plaPts[1] = new Point3f(size[0]/2, -size[1]/2, -size[2]/2);
	    pla = new LineArray(2, LineArray.COORDINATES);
	    pla.setCoordinates(0, plaPts);
	    plShape = new Shape3D(pla, app);
	    moleBranchGroup.addChild(plShape);
	    
	}

	public static void checkTorsion(){
		mainTorsion = new Vector<Vector<Torsion>>();
		mainTorsionCount = new Vector<Num>();
		for(int g=0; g<moleCount; g++){
			Molecule selectedMol = mole.get(g);
			Vector<Angles> angle = mainAngle.get(g);
			Num d = mainAngleCount.get(g);
			int angleCount = d.n;
			int torsionCount = 0;
			Vector<Torsion> torsion = new Vector<Torsion>();
			for(int i =0;i<angleCount-1;i++){
				for(int j=i;j<angleCount;j++){
					for(int k=0;k<selectedMol.bondTotal;k++){
						if(((angle.get(i).cAtom==selectedMol.bonds.get(k).index[0])&&(angle.get(j).cAtom==selectedMol.bonds.get(k).index[1]))||(angle.get(i).cAtom==selectedMol.bonds.get(k).index[1])&&(angle.get(j).cAtom==selectedMol.bonds.get(k).index[0])){
							double theta=0;
							double forceConst=0;
							double n=0;
							if(selectedMol.atoms.get(angle.get(i).cAtom).hybridization == 3 && selectedMol.atoms.get(angle.get(j).cAtom).hybridization == 3){
								theta = 180;
								n = 3;
								forceConst = 2;
							}
							else if((selectedMol.atoms.get(angle.get(i).cAtom).hybridization == 3 && selectedMol.atoms.get(angle.get(j).cAtom).hybridization == 2)||(selectedMol.atoms.get(angle.get(i).cAtom).hybridization == 2 && selectedMol.atoms.get(angle.get(j).cAtom).hybridization == 3)){
								theta = 0;
								n = 6;
								forceConst = 1;
							}
							else if(selectedMol.atoms.get(angle.get(i).cAtom).hybridization == 2 && selectedMol.atoms.get(angle.get(j).cAtom).hybridization == 2){
								theta = 0;
								n = 2;
								forceConst = 45;
							}
							else if(selectedMol.atoms.get(angle.get(i).cAtom).hybridization == 0 && selectedMol.atoms.get(angle.get(j).cAtom).hybridization == 0){
								theta = 0;
								n = 2;
								forceConst = 25;//
							}
							else if((selectedMol.atoms.get(angle.get(i).cAtom).hybridization == 0 && selectedMol.atoms.get(angle.get(j).cAtom).hybridization == 0)&&(selectedMol.atoms.get(angle.get(i).oAtoms[1]).hybridization == 0 && selectedMol.atoms.get(angle.get(j).oAtoms[0]).hybridization == 0)&&(selectedMol.atoms.get(angle.get(i).oAtoms[0]).hybridization == 0 && selectedMol.atoms.get(angle.get(j).oAtoms[1]).hybridization == 0)){
								theta = 180;
								n = 2;
								forceConst = 10;
							}
							else if((selectedMol.atoms.get(angle.get(i).cAtom).hybridization == 2 && selectedMol.atoms.get(angle.get(j).cAtom).hybridization == 2)&&(selectedMol.atoms.get(angle.get(i).oAtoms[1]).hybridization == 0 && selectedMol.atoms.get(angle.get(j).oAtoms[0]).hybridization == 0)&&(selectedMol.atoms.get(angle.get(i).oAtoms[0]).hybridization == 0 && selectedMol.atoms.get(angle.get(j).oAtoms[1]).hybridization == 0)){
								theta = 180;
								n = 2;
								forceConst = 10;
							}
							else if((selectedMol.atoms.get(angle.get(i).cAtom).hybridization == 3 && selectedMol.atoms.get(angle.get(j).cAtom).hybridization == 3)&&(selectedMol.atoms.get(angle.get(i).cAtom).RFID == 14 && selectedMol.atoms.get(angle.get(j).cAtom).RFID == 14)){
								theta = 90;
								n = 2;
								forceConst = 2;
							}
							if(selectedMol.atoms.get(angle.get(i).cAtom).hybridization == 3 && ((selectedMol.atoms.get(angle.get(j).cAtom).hybridization == 2)||(selectedMol.atoms.get(angle.get(j).cAtom).hybridization == 0))){
								if(!((selectedMol.atoms.get(angle.get(j).oAtoms[0]).hybridization==2)||(selectedMol.atoms.get(angle.get(j).oAtoms[0]).hybridization==0)||(selectedMol.atoms.get(angle.get(j).oAtoms[1]).hybridization==2)||(selectedMol.atoms.get(angle.get(j).oAtoms[1]).hybridization==0))){
									theta = 180;
									n = 3;
									forceConst = 2;
								}
							}
							else if(selectedMol.atoms.get(angle.get(j).cAtom).hybridization == 3 && ((selectedMol.atoms.get(angle.get(i).cAtom).hybridization == 2)||(selectedMol.atoms.get(angle.get(i).cAtom).hybridization == 0))){
								if(!((selectedMol.atoms.get(angle.get(i).oAtoms[0]).hybridization==2)||(selectedMol.atoms.get(angle.get(i).oAtoms[0]).hybridization==0)||(selectedMol.atoms.get(angle.get(i).oAtoms[1]).hybridization==2)||(selectedMol.atoms.get(angle.get(i).oAtoms[1]).hybridization==0))){
									theta = 180;
									n = 3;
									forceConst = 2;
								}
							}
							Torsion t = new Torsion();
							t.addTorsion(angle.get(i).oAtoms[0], angle.get(i).cAtom, angle.get(j).cAtom, angle.get(j).oAtoms[0], forceConst, theta, n);
							boolean ok = true;
							for(int v=0;v<torsionCount;v++){
								if((torsion.get(v).atom[0]==t.atom[0])&&(torsion.get(v).atom[1]==t.atom[1])&&(torsion.get(v).atom[2]==t.atom[2])&&(torsion.get(v).atom[3]==t.atom[3])){
									ok = false;
									break;								
								}
							}
							if((t.atom[0]==t.atom[2])||(t.atom[1]==t.atom[3])){
								ok = false;
							}
							if(ok){
								torsion.add(t);
								torsionCount+=1;
							}
							ok = true;
							t = new Torsion();
							t.addTorsion(angle.get(i).oAtoms[1], angle.get(i).cAtom, angle.get(j).cAtom, angle.get(j).oAtoms[1], forceConst, theta, n);
					
							for(int v=0;v<torsionCount;v++){
								if((torsion.get(v).atom[0]==t.atom[0])&&(torsion.get(v).atom[1]==t.atom[1])&&(torsion.get(v).atom[2]==t.atom[2])&&(torsion.get(v).atom[3]==t.atom[3])){
									ok = false;
									break;								
								}
							}
							if((t.atom[0]==t.atom[2])||(t.atom[1]==t.atom[3])){
								ok = false;
							}
							if(ok){
								torsion.add(t);
								torsionCount+=1;
							}
							ok = true;
							t = new Torsion();
							t.addTorsion(angle.get(i).oAtoms[0], angle.get(i).cAtom, angle.get(j).cAtom, angle.get(j).oAtoms[1], forceConst, theta, n);
					
							for(int v=0;v<torsionCount;v++){
								if((torsion.get(v).atom[0]==t.atom[0])&&(torsion.get(v).atom[1]==t.atom[1])&&(torsion.get(v).atom[2]==t.atom[2])&&(torsion.get(v).atom[3]==t.atom[3])){
									ok = false;
									break;								
								}
							}
							if((t.atom[0]==t.atom[2])||(t.atom[1]==t.atom[3])){
								ok = false;
							}
							if(ok){
								torsion.add(t);
								torsionCount+=1;
								}
							ok = true;
							t = new Torsion();
							t.addTorsion(angle.get(i).oAtoms[1], angle.get(i).cAtom, angle.get(j).cAtom, angle.get(j).oAtoms[0], forceConst, theta, n);
					
							for(int v=0;v<torsionCount;v++){
								if((torsion.get(v).atom[0]==t.atom[0])&&(torsion.get(v).atom[1]==t.atom[1])&&(torsion.get(v).atom[2]==t.atom[2])&&(torsion.get(v).atom[3]==t.atom[3])){
									ok = false;
									break;								
								}
							}
							if((t.atom[0]==t.atom[2])||(t.atom[1]==t.atom[3])){
								ok = false;
							}
							if(ok){
								torsion.add(t);
								torsionCount+=1;
							}
						
							
						}
					}
				}
			}
			Num nu = new Num();
			nu.n = torsionCount;
			mainTorsion.add(torsion);
			mainTorsionCount.add(nu);
		}
	}
	public static void checkAngles(){
		mainAngle = new Vector<Vector<Angles>>();
		mainAngleCount = new Vector<Num>();
		for(int g=0; g<moleCount; g++){
			Vector<Angles> tempAngle = new Vector<Angles>();
			int angleCount=0;
			Molecule selectedMol = mole.get(g);
			double count[]= new double[selectedMol.total];
			int c=0;
			for(int i=0;i<selectedMol.total;i++){
					for(int j=0; j<allMolesCount.get(g).n;j++){
						count[i]=0;
								
					}
			}
			int angleData[][]=new int[c][];
			int interested = 0;
			for(int i=0;i<selectedMol.total;i++){
				if(count[i]!=0){
					angleData[interested]=new int[2+(int) count[i]];
					angleData[interested][1]=i;
					angleData[interested][0]=2;
					interested++;
				}
			}
			for(int i=0;i<interested;i++){
				for(int j=0;j<selectedMol.bondTotal;j++){
					if(selectedMol.bonds.get(j).index[0]==angleData[i][1]){
						angleData[i][angleData[i][0]]=selectedMol.bonds.get(j).index[1];
						angleData[i][0]++;
					}
					else if(selectedMol.bonds.get(j).index[1]==angleData[i][1]){
						angleData[i][angleData[i][0]]=selectedMol.bonds.get(j).index[0];
						angleData[i][0]++;
					}
				}
			}
			Angles ang;
			int a =100;
			for(int i=0;i<interested;i++){
				switch(angleData[i][0]-1){
					case 3:
						ang = new Angles();
						ang.newAngle(angleData[i][1],angleData[i][2],angleData[i][3],selectedMol.atoms.get(angleData[i][1]).bondAngle,a);
						tempAngle.add(ang);
						angleCount++;
						break;
					case 4:
						ang = new Angles();
						ang.newAngle(angleData[i][1],angleData[i][2],angleData[i][3],selectedMol.atoms.get(angleData[i][1]).bondAngle,a);
						tempAngle.add(ang);
						ang = new Angles();
						ang.newAngle(angleData[i][1],angleData[i][3],angleData[i][4],selectedMol.atoms.get(angleData[i][1]).bondAngle,a);
						tempAngle.add(ang);
						ang = new Angles();
						ang.newAngle(angleData[i][1],angleData[i][2],angleData[i][4],selectedMol.atoms.get(angleData[i][1]).bondAngle,a);
						tempAngle.add(ang);
						angleCount+=3;
						break;
					case 5:
						ang = new Angles();
						ang.newAngle(angleData[i][1],angleData[i][2],angleData[i][3],selectedMol.atoms.get(angleData[i][1]).bondAngle,a);
						tempAngle.add(ang);
						ang = new Angles();
						ang.newAngle(angleData[i][1],angleData[i][3],angleData[i][4],selectedMol.atoms.get(angleData[i][1]).bondAngle,a);
						tempAngle.add(ang);
						ang = new Angles();
						ang.newAngle(angleData[i][1],angleData[i][4],angleData[i][5],selectedMol.atoms.get(angleData[i][1]).bondAngle,a);
						tempAngle.add(ang);
						ang = new Angles();
						ang.newAngle(angleData[i][1],angleData[i][5],angleData[i][2],selectedMol.atoms.get(angleData[i][1]).bondAngle,a);
						tempAngle.add(ang);
						ang = new Angles();
						ang.newAngle(angleData[i][1],angleData[i][2],angleData[i][4],selectedMol.atoms.get(angleData[i][1]).bondAngle,a);
						tempAngle.add(ang);
						ang = new Angles();
						ang.newAngle(angleData[i][1],angleData[i][3],angleData[i][5],selectedMol.atoms.get(angleData[i][1]).bondAngle,a);
						tempAngle.add(ang);
						angleCount+=6;
						break;
					case 6:
						ang = new Angles();
						ang.newAngle(angleData[i][1],angleData[i][2],angleData[i][3],selectedMol.atoms.get(angleData[i][1]).bondAngle,a);
						tempAngle.add(ang);
						ang = new Angles();
						ang.newAngle(angleData[i][1],angleData[i][3],angleData[i][4],selectedMol.atoms.get(angleData[i][1]).bondAngle,a);
						tempAngle.add(ang);
						ang = new Angles();
						ang.newAngle(angleData[i][1],angleData[i][4],angleData[i][5],selectedMol.atoms.get(angleData[i][1]).bondAngle,a);
						tempAngle.add(ang);
						ang = new Angles();
						ang.newAngle(angleData[i][1],angleData[i][5],angleData[i][6],selectedMol.atoms.get(angleData[i][1]).bondAngle,a);
						tempAngle.add(ang);
						ang = new Angles();
						ang.newAngle(angleData[i][1],angleData[i][6],angleData[i][2],selectedMol.atoms.get(angleData[i][1]).bondAngle,a);
						tempAngle.add(ang);
						ang = new Angles();
						ang.newAngle(angleData[i][1],angleData[i][2],angleData[i][4],selectedMol.atoms.get(angleData[i][1]).bondAngle,a);
						tempAngle.add(ang);
						ang = new Angles();
						ang.newAngle(angleData[i][1],angleData[i][3],angleData[i][5],selectedMol.atoms.get(angleData[i][1]).bondAngle,a);
						tempAngle.add(ang);
						ang = new Angles();
						ang.newAngle(angleData[i][1],angleData[i][4],angleData[i][6],selectedMol.atoms.get(angleData[i][1]).bondAngle,a);
						tempAngle.add(ang);
						ang = new Angles();
						ang.newAngle(angleData[i][1],angleData[i][5],angleData[i][2],selectedMol.atoms.get(angleData[i][1]).bondAngle,a);
						tempAngle.add(ang);
						ang = new Angles();
						ang.newAngle(angleData[i][1],angleData[i][6],angleData[i][3],selectedMol.atoms.get(angleData[i][1]).bondAngle,a);
						tempAngle.add(ang);
						angleCount+=10;
						break;
				}
			}
			mainAngle.add(tempAngle);
			Num nu = new Num();
			nu.n =angleCount;
			mainAngleCount.add(nu);
		}
	}
	@SuppressWarnings({ "deprecation" })
	public static void askMoleSave(final String state){
		if(state == "Save"){
			saveMol();
		}
		else if(state == "Export"){
			export = true;
			saveMol();
		}
		else if(state == "Exit"){
			final JDialog diaSaveSys = new JDialog();
			diaSaveSys.setBounds(500,250,300,135);
			JPanel p1,p2;
			p1= new JPanel();
			p2= new JPanel();
			p2.setLayout(new FlowLayout());
			Container contSaveSys = diaSaveSys.getContentPane();
			contSaveSys.setLayout(new GridLayout(2,1));
			JLabel lblSave = new JLabel("Save current simulator settings?");
			JButton butYes = new JButton("Yes"); 
			JButton butNo = new JButton("No");
			JButton butCancel = new JButton("Cancel");
		
			butYes.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent arg0) {
						diaSaveSys.dispose();
						saveMol();
						destroy();
				}			
			});
			butNo.addActionListener(new ActionListener(){
				public void actionPerformed(ActionEvent arg0) {
						diaSaveSys.dispose();
						destroy();
				}			
			});
			butCancel.addActionListener(new ActionListener(){
				public void actionPerformed(ActionEvent arg0) {
					diaSaveSys.dispose();
				}	
			});
			p1.add(lblSave);
			p2.add(butYes);
			p2.add(butNo);
			p2.add(butCancel);
			diaSaveSys.setLayout(new GridLayout(2,1));
			diaSaveSys.add(p1);
			diaSaveSys.add(p2);
			diaSaveSys.show();
		}
	}
	static void destroy(){
		main = null;
		mole = null;
		if(jmtkit!=null)
			jmtkit.dispose();
		if(jmole!=null)
			jmole.dispose();
		shut = true;
	}
	private static void addLights(BranchGroup moleBranchGroup) {
		Color3f color = new Color3f( 1.0f,1.0f,1.0f );
		Vector3f direction = new Vector3f( 0.0f, -0.0f, -2.0f );
		DirectionalLight light = new DirectionalLight( color, direction );
		light.setInfluencingBounds( new BoundingSphere( new Point3d(0.0,0.0,0.0), 200.0 ));
		moleBranchGroup.addChild( light );
		direction = new Vector3f( -0.0f, 0.0f, 2.0f );
		light = new DirectionalLight( color, direction );
		light.setInfluencingBounds( new BoundingSphere( new Point3d(0.0,0.0,0.0), 200.0 ));
		moleBranchGroup.addChild( light );
		direction = new Vector3f( 0.0f, -2.0f, 0.0f );
		light = new DirectionalLight( color, direction );
		light.setInfluencingBounds( new BoundingSphere( new Point3d(0.0,0.0,0.0), 200.0 ));
		moleBranchGroup.addChild( light );
		

	}
	private static Sphere createSphere(int color) {
		Appearance app = new Appearance();
		Color n = new Color();
		n.newColor(color%15);
		Color3f objColor = new Color3f(n.r, n.g, n.b);
		Color3f black = new Color3f(0.0f, 0.0f, 0.0f);
		app.setMaterial(new Material(objColor, black, objColor, black, 80.0f));
		Sphere sphere = new Sphere( 0.05f, Primitive.GENERATE_NORMALS, app);
		return sphere;
	}
	private static Cylinder createCylinder(double length, int i) {
		
		Appearance app = new Appearance();
			Color3f whiteColor = new Color3f(1.0f, 1.0f, 1.0f);
			Color3f black = new Color3f(0.0f, 0.0f, 0.0f);
			Color3f redColor = new Color3f(1.0f, 0.0f, 0.0f);
			if(i==0){
				app.setMaterial(new Material(whiteColor, black, whiteColor, whiteColor, 80.0f));
				Cylinder cylinder = new Cylinder( 0.01f,(float)length, app);
				return cylinder;
			}
			else if(i==1){
				app.setMaterial(new Material(redColor, black, redColor, redColor, 80.0f));
				Cylinder cylinder = new Cylinder( 0.009f,(float)length, app);
				return cylinder;
			}
			else {
				app.setMaterial(new Material(whiteColor, black, whiteColor, whiteColor, 80.0f));
				Cylinder cylinder = new Cylinder( 0.009f,(float)length, app);
				return cylinder;
			}
		
	}
	private static TransformGroup createBehaviors() {
		TransformGroup objTrans = new TransformGroup();
		
		objTrans.setCapability(TransformGroup.ALLOW_TRANSFORM_WRITE);
		objTrans.setCapability(TransformGroup.ALLOW_TRANSFORM_READ);
		return objTrans;
	}
	public void waiting (int n){
        long t0, t1;
        t0 =  System.currentTimeMillis();
        do{
            t1 = System.currentTimeMillis();
        }
        while ((t1 - t0) < (n * 1000));
    }
	@SuppressWarnings({ "static-access" })
	public void minimizeMol(){
		File file = new File("miniSys.mole");
		checkAngles();
		checkTorsion();
		try {
			file.createNewFile();
		} catch (IOException e) {
			main.jtext.setText("\nError : Cannot create new file");
		}
		if(file.exists()){
			if(file.canWrite()){
				try {
					FileWriter wfile = new FileWriter(file.toString());
					BufferedWriter out = new BufferedWriter(wfile);
					out.write(""+Temperature);
					out.write("\n"+size[0]/0.2);
					out.write("\n"+size[1]/0.2);
					out.write("\n"+size[2]/0.2);
					out.write("\n"+moleCount);
					int atomCount =0;
					for(int k =0; k<moleCount; k++){	
						Molecule selectedMol = mole.get(k);
						out.write("\n"+selectedMol.total);
						for(int i=0;i<selectedMol.total;i++){
							Atom a1 = selectedMol.atoms.get(i);
							out.write("\n"+a1.mass+" "+a1.charge+" "+a1.sigma+" "+a1.epsilon+" "+selectedMol.vec.get(i).x/0.2+" "+selectedMol.vec.get(i).y/0.2+" "+selectedMol.vec.get(i).z/0.2);
						}
						out.write("\n"+selectedMol.bondTotal);
						for(int i=0;i<selectedMol.bondTotal;i++){
							Bond b = selectedMol.bonds.get(i);
							Atom a1 = selectedMol.atoms.get(b.index[0]);
							Atom a2 = selectedMol.atoms.get(b.index[1]);
							out.write("\n"+(b.index[0]+atomCount)+" "+(b.index[1]+atomCount)+" "+(a1.bondLength+a2.bondLength)+" "+700);
						}
						Num nu = mainAngleCount.get(k);
						int angleCount = nu.n;
						out.write("\n"+angleCount);
						for(int i=0;i<angleCount;i++){
							out.write("\n"+(mainAngle.get(k).get(i).cAtom+atomCount)+" "+(mainAngle.get(k).get(i).oAtoms[0]+atomCount)+" "+(mainAngle.get(k).get(i).oAtoms[1]+atomCount)+" "+mainAngle.get(k).get(i).angle+" "+mainAngle.get(k).get(i).strength);
						}
						
						out.write("\n"+mainTorsionCount.get(k).n);
						//main.jtext.append("\n"+mainTorsionCount.get(k).n);
						for(int i=0;i<mainTorsionCount.get(k).n;i++){
							out.write("\n"+(mainTorsion.get(k).get(i).atom[0]+atomCount)+" "+(mainTorsion.get(k).get(i).atom[1]+atomCount)+" "+(mainTorsion.get(k).get(i).atom[2]+atomCount)+" "+(mainTorsion.get(k).get(i).atom[3]+atomCount)+" "+mainTorsion.get(k).get(i).forceConst+" "+mainTorsion.get(k).get(i).angle+" "+mainTorsion.get(k).get(i).periodicity);
						}
						atomCount+=selectedMol.total;	
					}
					out.write("\nEnd");
					out.close();
					/*try{
						ProcessBuilder process = new ProcessBuilder("./minimizeSys");
						Map env = process.environment();
						env.put("LD_LIBRARY_PATH", "/usr/local/cuda/lib64:/home/omkar/Library/OpenMM3.0-Linux64/lib:/usr/local/cuda/lib");
						env.put("PATH", "/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin");
						((ProcessBuilder) process).start();
					}catch(IOException e){
						main.jtext.setText("\nError : Minimize not working");
					}*/
				} catch (IOException e) {
					main.jtext.setText("\nError : Unable to save molecule");
				}
			}
			else{
				main.jtext.setText("\nError : File Write Error");
			}
		}
	}
	@SuppressWarnings("static-access")
	public void loadCords(){
		try{
			
			waiting(1);
			BufferedReader  in1 = new BufferedReader(new FileReader("miniSysRes.mole"));
			for(int k=0; k<moleCount;k++){	
				Molecule selectedMol = mole.get(k);
				for(int i=0; i<selectedMol.total; i++){
					String s = in1.readLine();
					StringTokenizer st1 = new StringTokenizer(s);
					st1.nextToken();
					if(st1.hasMoreTokens()){
						placeAtom((float)(Float.parseFloat(st1.nextToken())*0.2),(float)(Float.parseFloat(st1.nextToken())*0.2),(float)(Float.parseFloat(st1.nextToken())*0.2),i, selectedMol);
					}
				}
			}
		}catch(IOException e){
			main.jtext.setText("\nError : Cannot read minimization results");
		}
	}
	
}