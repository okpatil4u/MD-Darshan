import com.sun.j3d.utils.picking.*; 
import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.Graphics;
import java.awt.GraphicsConfiguration;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.awt.event.MouseWheelEvent;
import java.awt.event.MouseWheelListener;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.Map;
import java.util.Random;
import java.util.StringTokenizer;
import java.util.Timer;
import java.util.TimerTask;
import java.util.Vector;

import javax.imageio.ImageIO;
import javax.media.j3d.Appearance;
import javax.media.j3d.BoundingSphere;
import javax.media.j3d.BranchGroup;
import javax.media.j3d.Canvas3D;
import javax.media.j3d.DirectionalLight;
import javax.media.j3d.LineArray;
import javax.media.j3d.Material;
import javax.media.j3d.Shape3D;
import javax.media.j3d.Transform3D;
import javax.media.j3d.TransformGroup;
import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextField;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.vecmath.AxisAngle4f;
import javax.vecmath.Color3f;
import javax.vecmath.Point3d;
import javax.vecmath.Vector3d;
import javax.vecmath.Vector3f;

/*import wiiusej.Wiimote;
import wiiusej.wiiusejevents.physicalevents.ExpansionEvent;
import wiiusej.wiiusejevents.physicalevents.IREvent;
import wiiusej.wiiusejevents.physicalevents.MotionSensingEvent;
import wiiusej.wiiusejevents.physicalevents.WiimoteButtonsEvent;
import wiiusej.wiiusejevents.utils.WiimoteListener;
import wiiusej.wiiusejevents.wiiuseapievents.ClassicControllerInsertedEvent;
import wiiusej.wiiusejevents.wiiuseapievents.ClassicControllerRemovedEvent;
import wiiusej.wiiusejevents.wiiuseapievents.DisconnectionEvent;
import wiiusej.wiiusejevents.wiiuseapievents.GuitarHeroInsertedEvent;
import wiiusej.wiiusejevents.wiiuseapievents.GuitarHeroRemovedEvent;
import wiiusej.wiiusejevents.wiiuseapievents.NunchukInsertedEvent;
import wiiusej.wiiusejevents.wiiuseapievents.NunchukRemovedEvent;
import wiiusej.wiiusejevents.wiiuseapievents.StatusEvent;*/

import com.sun.j3d.utils.geometry.Cylinder;
import com.sun.j3d.utils.geometry.Primitive;
import com.sun.j3d.utils.geometry.Sphere;
import com.sun.j3d.utils.universe.SimpleUniverse;
import com.sun.j3d.utils.universe.ViewingPlatform;
import com.sun.j3d.utils.behaviors.vp.OrbitBehavior;
public class MoleculeBuilder {
	static Darshan main;
	static SimpleUniverse uniMole;
	static Canvas3D canvasMole;
	static TransformGroup moleTransGroup;
	static JPanel jmole;
	static JPanel jmtkit;
	static String mouseMode = "Put";
	static boolean canDrag = false;
	static BranchGroup moleBranchGroup;
	static File saveSysTo;
	static Vector<Atom> allAtoms = null;
	static int selectedIndex=5;
	static int selectedId =9999, selectedId2=9999, selectedId3 = 9999, selectedId4, selectedBond=9999;
	static Molecule selectedMol;
	static Vector<Num> toMove;
	static int yesb=0;
	static Vector<Angles> angle;
	static int angleCount;
	static ViewingPlatform view;
	static Position mousePos;
	static OrbitBehavior orbit;
	static int atomToCheck=0;
	static boolean shut;
	static boolean export = false;
	static int selectedBondId=9999;
	static Vector<Torsion> torsion;
	static int torsionCount;
	static boolean saved = false;
	static boolean minimized = false;
	static String fffile;
	static boolean dragged = false;
	static int minimizations = 0;
	static double energy = 0;
	//static Transform3D newCameraTransform, oldCameraTransform;
	static double theta =0;
	static JFrame imageFrame = null;
	static boolean rightButton = false;
	static boolean middleButton = false;
	static TransformGroup wiiSphere;
	static Position accl = new Position();
	static boolean clear = false;
	static boolean cntMode = false;
	static boolean chance = true;
	
	public void initiateMoleculeBuilder(Darshan ab, String ffFile){
		main=ab;
		fffile = ffFile;
		allAtoms = new Vector<Atom>();
		selectedMol = new Molecule();
		mousePos=new Position();
		atomToCheck=0;
		shut = false;
		minimizations =0;
		energy = 0;
	}
	@SuppressWarnings("static-access")
	public void setMolToolKit(final int total){
		//main.jtext.setText("\nCreating new toolkit window\n");
		main.working = true;
		jmtkit = new JPanel();
		jmtkit.setBounds((int)(main.width/1.151770658), 0,(int) (main.width/7.588888889), (int)((int)main.height/1.024));
		JPanel molToolPane = new JPanel();

		molToolPane.setVisible(true);
		main.jdesk.add(jmtkit);
		main.frame.add(main.jdesk);
		final DefaultListModel atomModel = new DefaultListModel();
		atomModel.addElement("H");
		atomModel.addElement("B");
		atomModel.addElement("C");
		atomModel.addElement("N");
		atomModel.addElement("O");
		atomModel.addElement("F");
		atomModel.addElement("Al");
		atomModel.addElement("Si");
		atomModel.addElement("P");
		atomModel.addElement("S");
		atomModel.addElement("Cl");
		atomModel.addElement("Ga");
		atomModel.addElement("Ge");
		atomModel.addElement("As");
		atomModel.addElement("Se");
		atomModel.addElement("Br");
		atomModel.addElement("In");
		atomModel.addElement("Sn");
		atomModel.addElement("Sb");
		atomModel.addElement("Te");
		atomModel.addElement("I");
		atomModel.addElement("Na");
		atomModel.addElement("Ca");
		atomModel.addElement("Fe");
		atomModel.addElement("Zn");
		
		final JList atomList = new JList(atomModel);
		atomList.setSelectedIndex(2);
		atomList.setVisibleRowCount(18);
		JScrollPane atomScroll = new JScrollPane(atomList);
		mouseMode = "Put";
		atomList.addListSelectionListener(new ListSelectionListener(){
			public void valueChanged(ListSelectionEvent arg0) {
				mouseMode = "Put";
				selectedId = 9999;
				int b =	atomList.getSelectedIndex();
				switch(b){
					case 0:
						selectedIndex = 0;
						break;
					case 1:
						selectedIndex = 3;
						break;
					case 2:
						selectedIndex = 5;
						break;
					case 3:
						selectedIndex = 9;
						break;
					case 4:
						selectedIndex = 13;
						break;
					case 5:
						selectedIndex = 17;
						break;
					case 6:
						selectedIndex = 18;
						break;
					case 7:
						selectedIndex = 19;
						break;
					case 8:
						selectedIndex = 20;
						break;
					case 9:
						selectedIndex = 21;
						break;
					case 10:
						selectedIndex = 22;
						break;
					case 11:
						selectedIndex = 23;
						break;
					case 12:
						selectedIndex = 24;
						break;
					case 13:
						selectedIndex = 25;
						break;
					case 14:
						selectedIndex = 26;
						break;
					case 15:
						selectedIndex = 27;
						break;
					case 16:
						selectedIndex = 28;
						break;
					case 17:
						selectedIndex = 29;
						break;
					case 18:
						selectedIndex = 30;
						break;
					case 19:
						selectedIndex = 31;
						break;
					case 20:
						selectedIndex = 32;
						break;
					case 21:
						selectedIndex = 33;
						break;
					case 22:
						selectedIndex = 34;
						break;
					case 23:
						selectedIndex = 35;
						break;
					case 24:
						selectedIndex = 36;
						break;
				}
			}			
		});
		atomScroll.setSize(60, 300);
		jmtkit.setLayout(new BorderLayout());
		jmtkit.add(atomScroll,BorderLayout.NORTH);
		molToolPane.setSize(166,200);
		JButton jminb = new JButton("Optimize");
		jminb.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent arg0) {
				if(uniMole!=null){
					if(selectedMol!=null){
						boolean works = true;
							if(works){
								minimizeMol();
							}
						}
					}
				}
		});
		jminb.setToolTipText("Click to optimize the structure");
		JButton butCharges = new JButton("Set Charge");
		butCharges.setToolTipText("Set charge manually");
		butCharges.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent arg0) {
					mouseMode = "Set";
					main.jtext.setText("Click on an atom to edit it's charge");
			}			
		});
		JButton butBonds = new JButton("Edit Bonds");
		butBonds.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent arg0) {
				mouseMode = "Bonds";
				main.jtext.setText("Click on a bond to edit it's length");
			}			
		});
		JButton butLength = new JButton("Check Length");
		butLength.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent arg0) {
				if(selectedId != 9999){
					Transform3D atom1 = new Transform3D();
					Transform3D atom2 = new Transform3D();
					selectedMol.moleTrans.get(selectedId).getTransform(atom1);
					selectedMol.moleTrans.get(selectedId2).getTransform(atom2);
				
					Vector3f v1 = new Vector3f();
					Vector3f v2 = new Vector3f();
					atom1.get(v1);
					atom2.get(v2);
				
				
					double r = Math.sqrt((v1.x-v2.x)*(v1.x-v2.x)+(v1.y-v2.y)*(v1.y-v2.y)+(v1.z-v2.z)*(v1.z-v2.z))/0.1;
					main.jtext.setText("Distance = "+r);
				}
				else{
					main.jtext.setText("Select two atoms and then press 'Check Length' button");
				}
			}			
		});
		
		JButton butAddH = new JButton("Add Hydrogen");
		butAddH.setToolTipText("Add hydrogens to satisfy valency");
		butAddH.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent arg0){
				int tempIndex = selectedIndex;
				energy = 0;
				checkHybridizations();
				
				for(int i=0; i< selectedMol.total; i++){
					if((selectedMol.atoms.get(i).minvalency-selectedMol.atoms.get(i).bondedTo  )>0){
						Double val = selectedMol.atoms.get(i).minvalency-selectedMol.atoms.get(i).bondedTo ;
						double diff = 0;
						for(int j=0; j<val; j++){
							Vector3f v1 = selectedMol.vec.get(i);
							double temp = selectedMol.atoms.get(i).bondLength + 0.33;
							//Random randomGenerator = new Random();
							//boolean r1 = randomGenerator.nextBoolean();
							float x1 = v1.x, y1 = v1.y, z1 = v1.z;
							//if(r1){
								if(j%2==0)
								x1 = (float) (v1.x + temp/15+diff);
								else 
									x1 = (float) (v1.x + temp/15-diff);
								if(j%2==0)
									y1 = (float) (v1.y + temp/15-diff);
								else
									y1 = (float) (v1.y + temp/15+diff);
								if(j%2==0)
									z1 = (float) (v1.z + temp/15+diff);
								else
								z1 = (float) (v1.z + temp/15-diff);
							//}
							//else{
							//	x1 = (float) (v1.x - temp/15);
						//		y1 = (float) (v1.y - temp/15);
								//z1 = (float) (v1.z - temp/15);
						//	}
						//	
							selectedIndex = 0;
							put(x1, y1, z1);
							selectedId = i;
							selectedId2 = selectedMol.total-1;
							putBond(1);
							diff += 0.025;
						}
					}
				}
				checkHybridizations();
				minimizeMol();
				selectedIndex = tempIndex;
			}
		});
		JButton butClear = new JButton("Clear");
		butClear.setToolTipText("Clear canvas");
		butClear.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent arg0) {
				int bonds = selectedMol.bondTotal;
				for(int i=bonds-1; i>=0; i--){
					selectedMol.removeBond(i);
				}
				int atoms = selectedMol.total;
				for(int i=atoms -1 ; i>=0; i--){
					selectedMol.removeAtom(i);
				}
				minimizations = 0;
				minimized = false;
				energy = 0;
				view.setNominalViewingTransform();
				selectedIndex = 5;
				
				/*Darshan temp = main;
				String tempFile = fffile;
				clear();				
				initiateMoleculeBuilder(temp, tempFile);*/
			}			
		});
		JButton jrView = new JButton("Reset View");
		jrView.setToolTipText("Reset original view");
		jrView.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent arg0) {
						view.setNominalViewingTransform();
					}
		});
		JButton jimage = new JButton("Load Image");
		jimage.setToolTipText("Load image of molecule");
		jimage.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent arg0) {
				JFileChooser jfc = new JFileChooser();
				//jfc.setCurrentDirectory(new File());
				int f = jfc.showOpenDialog(main);
				if(f == JFileChooser.APPROVE_OPTION ){
					if(imageFrame != null)
						imageFrame.dispose();
					File file = jfc.getSelectedFile();
					if(file.exists()){
						imageFrame = new JFrame();
						imageFrame.setTitle("Molecule Image");
						imageFrame.setBounds(400, 150, 340, 200);
						imageFrame.setLayout(new BorderLayout());
						imageFrame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
						ImagePanel molImage = new ImagePanel(file);
						imageFrame.getContentPane().add(molImage);
						imageFrame.setVisible(true);
						imageFrame.setAlwaysOnTop(true);
					}else{
						main.jtext.setText("File Does Not Exists");
					}
				}
			}
			
		});
		final JButton jcntMode = new JButton("C Mode Off");
		jcntMode.setToolTipText("Set auto-optimization off to draw  graphene structures easily");
		jcntMode.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent arg0) {
				if(cntMode){
					cntMode = false;
					jcntMode.setText("CNT Mode Off");
				}
				else{
					cntMode = true;
					jcntMode.setText("CNT Mode On");
				}
			}			
		});
		final JButton jdiscard = new JButton("Reset Charge");
		jdiscard.setToolTipText("Discard manually set charge distribution");
		jdiscard.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e) {
				for(int i=0; i<selectedMol.total; i++){
					selectedMol.atoms.get(i).changed = false;
				}
				minimizeMol();
			}			
		});
		molToolPane.setLayout(new FlowLayout());
		//ImageIcon minIcon = createImageIcon("miniMole.jpg", "Optimise");
		//jminb.setIcon(minIcon);
		molToolPane.add(jimage);
		molToolPane.add(butAddH);
		molToolPane.add(butCharges);
		molToolPane.add(jdiscard);
		//molToolPane.add(butBonds);
		//molToolPane.add(butLength);
		molToolPane.add(jminb);
		molToolPane.add(jrView);
		molToolPane.add(jcntMode);
		molToolPane.add(butClear);
		//molToolPane.add(calCharges);

		jmtkit.add(molToolPane, BorderLayout.CENTER);
		jmtkit.setVisible(true);
		
		molFrame();
		//main.jtext.setText(minIcon.getDescription());
	}
/*	protected ImageIcon createImageIcon(String path, String description) {
		java.net.URL imgURL = getClass().getResource(path);
		if (imgURL != null) {
			return new ImageIcon(imgURL, description);
		} 
		else{
			return null;
		}
}*/

	private static void put(float x, float y){
		BranchGroup moleBranch = new BranchGroup();
		TransformGroup moleTrans = createBehaviors();
		moleTrans.addChild(  createSphere(selectedIndex));
		moleBranch.addChild(moleTrans);
		Vector3f temp = new Vector3f(x,y,0);
		Transform3D tempT = new Transform3D();
		tempT.setTranslation(temp);
		moleTrans.setTransform(tempT);
		Atom a1 = Atom.copy(allAtoms.get(selectedIndex));
		PickCanvas pickCanvas = new PickCanvas(canvasMole, moleBranch);
	    pickCanvas.setMode(PickCanvas.BOUNDS);
		selectedMol.addAtom(a1, moleTrans,pickCanvas,temp,selectedIndex);
		moleTransGroup.addChild(moleBranch);
		//uniMole.addBranchGraph(moleBranch);
		//moleTransGroup=null;
	}
	public static void put(float x, float y, float z){
		saved = false;
		BranchGroup moleBranch = new BranchGroup();
		TransformGroup moleTrans = createBehaviors();
		moleTrans.addChild(  createSphere(selectedIndex));
		moleBranch.addChild(moleTrans);
		Vector3f temp = new Vector3f(x,y,z);
		Transform3D tempT = new Transform3D();
		tempT.setTranslation(temp);
		moleTrans.setTransform(tempT);
		Atom a1 = Atom.copy(allAtoms.get(selectedIndex));
		PickCanvas pickCanvas = new PickCanvas(canvasMole, moleBranch);
	    pickCanvas.setMode(PickCanvas.BOUNDS);
		selectedMol.addAtom(a1, moleTrans,pickCanvas,temp,selectedIndex);
		moleTransGroup.addChild(moleBranch);
		//uniMole.addBranchGraph(moleBranchGroup);
		//moleTransGroup=null;
	}
	public static void placeAtom(float x, float y, float z, int chosen){
		Transform3D t3d = new Transform3D();
		t3d.setTranslation(new Vector3f(x,y,z));
		TransformGroup moleTrans=selectedMol.moleTrans.get(chosen);
		moleTrans.setTransform(t3d);
		selectedMol.vec.remove(chosen);
		selectedMol.vec.add(chosen, new Vector3f(x,y,z));
		yesb =0;
		toMove=null;
		toMove=new Vector<Num>();
		for(int i=0;i<selectedMol.bondTotal;i++)
		{
			int s1=selectedMol.bonds.get(i).index[0];
			int s2=selectedMol.bonds.get(i).index[1];
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
				moleTrans = selectedMol.bondTrans.get(toMove.get(i).n);
				Vector3f pos = new Vector3f(x,y,z);
				int s1[] = selectedMol.bonds.get(toMove.get(i).n).index;
				Vector3f pos1 = selectedMol.vec.get(s1[1]);
				if(s1[1]==chosen){
					pos1 = selectedMol.vec.get(s1[0]);
				}
				Vector3f cross = new Vector3f();
				Vector3f YAXIS = new Vector3f(0, 1, 0);
				Vector3f temp = new Vector3f((pos.x+pos1.x)/2,(pos.y+pos1.y)/2,(pos.z+pos1.z)/2);
				Vector3f temp1 = new Vector3f((pos.x-pos1.x),(pos.y-pos1.y),(pos.z-pos1.z));
				double oldl = selectedMol.bonds.get(toMove.get(i).n).length;
				double l = Math.sqrt(Squares.sqr(pos.x-pos1.x)+Squares.sqr(pos.y-pos1.y)+Squares.sqr(pos.z-pos1.z));
				temp1.normalize();
				l=l/oldl;
				cross.cross(YAXIS,temp1);
				AxisAngle4f tempAA = new AxisAngle4f();
				tempAA.set(cross,(float)Math.acos(YAXIS.dot(temp1)));
				Transform3D tempT = new Transform3D();
				tempT.set(tempAA);
				tempT.setTranslation(temp);
				Transform3D tempT1 = new Transform3D();
				tempT1.set(tempAA);
				tempT1.setTranslation(temp);
				Transform3D tempT2 = new Transform3D();
				tempT2.set(tempAA);
				tempT2.setTranslation(temp);
				tempT.setScale(new Vector3d(1,l,1));
				moleTrans.setTransform(tempT);
				TransformGroup t1 = selectedMol.bondTrans1.get(toMove.get(i).n);
				TransformGroup t2 = selectedMol.bondTrans2.get(toMove.get(i).n);
				float ratio1=1;
				float ratio2=1;
				switch(selectedMol.bonds.get(toMove.get(i).n).strength){
					case 1:
							ratio1=0.5f;
							ratio2=0.5f;
							break;
					case 2:
							ratio1= 2f;
							ratio2=0.5f;
							break;
					case 3:
							ratio1 =2f;
							ratio2 = 2f;
							break;
					case 4:
							ratio1 = 0.5f;
							ratio2 = 3f;
				}
				tempT1.setScale(new Vector3d(ratio1,l,ratio1));
				tempT2.setScale(new Vector3d(ratio2,l,ratio2));
				t1.setTransform(tempT1);
				t2.setTransform(tempT2);
			}
		}
		
}
	public static void putBond(int tempStrength){
		saved = false; 
		selectedMol.atoms.get(selectedId).bondedTo++;
		selectedMol.atoms.get(selectedId2).bondedTo++;
		if(selectedMol.atoms.get(selectedId).bondedTo>=selectedMol.atoms.get(selectedId).maxvalency)
			selectedMol.atoms.get(selectedId).maxvalency++;
		if(selectedMol.atoms.get(selectedId2).bondedTo>=selectedMol.atoms.get(selectedId2).maxvalency)
			selectedMol.atoms.get(selectedId2).maxvalency++;
		
		Vector3f pos = selectedMol.vec.get(selectedId);
		Vector3f pos1 = selectedMol.vec.get(selectedId2);
		Vector3f cross = new Vector3f();
		Vector3f YAXIS = new Vector3f(0, 1, 0);
		Vector3f temp = new Vector3f((pos.x+pos1.x)/2,(pos.y+pos1.y)/2,(pos.z+pos1.z)/2);
		Vector3f temp1 = new Vector3f((pos.x-pos1.x),(pos.y-pos1.y),(pos.z-pos1.z));
		
		double l = (float)Math.sqrt(Squares.sqr(pos.x-pos1.x)+Squares.sqr(pos.y-pos1.y)+Squares.sqr(pos.z-pos1.z));
		
		temp1.normalize();

		cross.cross(YAXIS,temp1);
		
		AxisAngle4f tempAA = new AxisAngle4f();
		
		tempAA.set(cross,(float)Math.acos(YAXIS.dot(temp1)));
		
		BranchGroup moleBranch = new BranchGroup();
		TransformGroup moleTrans = createBehaviors();
		moleTrans.addChild(  createCylinder(l,0));
		TransformGroup t1 = createBehaviors();
		t1.addChild(createCylinder(l/2,1));
		TransformGroup t2 = createBehaviors();
		t2.addChild(createCylinder(l/6,2));
		moleBranch.addChild(moleTrans);
		moleBranch.addChild(t1);
		moleBranch.addChild(t2);
		moleTransGroup.addChild(moleBranch);
		Transform3D tempT = new Transform3D();
		tempT.set(tempAA);
		tempT.setTranslation(temp);
		try{
			moleTrans.setTransform(tempT);
			Transform3D tempT1 = new Transform3D();
			tempT1.set(tempAA);
			tempT1.setTranslation(temp);
			Transform3D tempT2 = new Transform3D();
			tempT2.set(tempAA);
			tempT2.setTranslation(temp);
			float ratio1=1;
			float ratio2=1;
			if(tempStrength == 4){
				ratio1 = 0.5f;
				ratio2 = 3f;
			}
			tempT1.setScale(new Vector3d(ratio1,1,ratio1));
			tempT2.setScale(new Vector3d(ratio2,1,ratio2));
			t1.setTransform(tempT1);
			t2.setTransform(tempT2);
			int i=tempStrength;
			PickCanvas pickCanvas = new PickCanvas(canvasMole, moleBranch);
		    pickCanvas.setMode(PickCanvas.BOUNDS);
			selectedMol.addBond(moleTrans,t1,t2,selectedId,selectedId2,l,i, pickCanvas);
			//uniMole.addBranchGraph(moleBranch);
			//moleTransGroup=null;

			selectedId=9999;
			selectedId2=9999;
		}catch(javax.media.j3d.BadTransformException e){
			
		}
	}
	@SuppressWarnings("static-access")
	public static void exportMol(){
		JFileChooser jfc = new JFileChooser();
		jfc.setCurrentDirectory(new File(main.workSpace));
		int f = jfc.showSaveDialog(main.frame);
		if(f == JFileChooser.APPROVE_OPTION){
			File file = new File(jfc.getSelectedFile().getAbsolutePath()+".exp");
		checkAngles();
		try {
			file.createNewFile();
		} catch (IOException e) {
			main.jtext.setText("\nError : Cannot create new file");
		}
		if(file.exists()){
			if(file.canWrite()){
				try {
					double lx=0, ly =0, lz =0, hx = 0, hy =0, hz =0;
					for(int i=0; i<selectedMol.total; i++){
							Vector3f v1 = selectedMol.vec.get(i);
							if(v1.x<lx)
								lx = v1.x;
							if(v1.y<ly)
								ly = v1.y;
							if(v1.z<lz)
								lz = v1.z;
							if(v1.x>hx)
								hx = v1.x;
							if(v1.y>hy)
								hy = v1.y;
							if(v1.z>hz)
								hz = v1.z;
					}
					FileWriter wfile = new FileWriter(file.toString());
					BufferedWriter out = new BufferedWriter(wfile);
					out.write("1");
					out.write("\n"+selectedMol.total);
					for(int i=0;i<selectedMol.total;i++){
						Atom a1 = selectedMol.atoms.get(i);
						out.write("\n"+a1.RFID+" "+a1.name+" "+a1.mass+" "+a1.charge+" "+a1.sigma/2+" "+a1.epsilon+" "+allAtoms.get(selectedMol.atomType.get(i).n).maxvalency+" "+a1.bondLength+" "+a1.bondAngle+" "+a1.hybridization+" "+(selectedMol.vec.get(i).x-lx)/0.1+" "+(selectedMol.vec.get(i).y-ly)/0.1+" "+(selectedMol.vec.get(i).z-lz)/0.1);
					}
					out.write("\n"+selectedMol.bondTotal);
					for(int i=0;i<selectedMol.bondTotal;i++){
						Bond b = selectedMol.bonds.get(i);
						Atom a1 = selectedMol.atoms.get(b.index[0]);
						Atom a2 = selectedMol.atoms.get(b.index[1]);
						if(b.strength == 4)
							out.write("\n"+b.index[0]+" "+b.index[1]+" "+(a1.bondLength+a2.bondLength+b.addLength-0.01)+" "+1050);
						else
							out.write("\n"+b.index[0]+" "+b.index[1]+" "+(a1.bondLength+a2.bondLength+b.addLength-0.01)+" "+b.strength*700);
					}
					out.write("\n"+angleCount);
					for(int i=0; i<angleCount; i++){
						Angles a = angle.get(i);
						if(a.strength>1000)
							a.strength = 200;
						out.write("\n"+a.cAtom+" "+a.oAtoms[0]+" "+a.oAtoms[1]+" "+a.angle+" "+a.strength);
					}
					out.write("\n"+torsionCount);
					for(int i=0; i<torsionCount; i++){
						Torsion t = torsion.get(i);
						out.write("\n"+t.atom[0]+" "+t.atom[1]+" "+t.atom[2]+" "+t.atom[3]+" "+t.forceConst+" "+t.angle+" "+t.periodicity);
					}
					
					out.write("\nEnd");
					out.write("\n"+(hx-lx)/0.1+"\t"+(hy-ly)/0.1+"\t"+(hz-lz)/0.1);
					out.close();
					wfile.close();
					saved= true;
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
	public static void saveMol(){
		JFileChooser jfc = new JFileChooser();
		jfc.setCurrentDirectory(new File(main.workSpace));
		int f = jfc.showSaveDialog(main.frame);
		if(f == JFileChooser.APPROVE_OPTION){
			File file = new File(jfc.getSelectedFile().getAbsolutePath()+".sav");
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
					out.write("28031986");
					//out.write(selectedMol.fffile);
					out.write("\n"+selectedMol.total);
					for(int i=0;i<selectedMol.total;i++){
						Atom a1 = selectedMol.atoms.get(i);
						out.write("\n"+a1.RFID+" "+a1.name+" "+a1.mass+" "+a1.charge+" "+a1.sigma+" "+a1.epsilon+" "+a1.maxvalency+" "+a1.bondLength+" "+a1.bondAngle+" "+a1.hybridization+" "+selectedMol.vec.get(i).x/0.1+" "+selectedMol.vec.get(i).y/0.1+" "+selectedMol.vec.get(i).z/0.1);
					}
					out.write("\n"+selectedMol.bondTotal);
					for(int i=0;i<selectedMol.bondTotal;i++){
						Bond b = selectedMol.bonds.get(i);
						out.write("\n"+b.index[0]+" "+b.index[1]+" "+b.strength+" "+b.addLength);
					}
					out.write("\nEnd");
					out.close();
					saved= true;
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
	public static void dragAtom(float x, float y){
		energy =0;
		Transform3D t3d = new Transform3D();
		float z= selectedMol.vec.get(selectedId).z;
		t3d.setTranslation(new Vector3f(x,y,z));
		TransformGroup moleTrans=selectedMol.moleTrans.get(selectedId);
		moleTrans.setTransform(t3d);
		selectedMol.vec.remove(selectedId);
		selectedMol.vec.add(selectedId, new Vector3f(x,y,z));
		if(toMove!=null){
			for(int i=0;i<yesb;i++){
				if(selectedMol.bondTotal <= toMove.get(i).n)
					break;
				moleTrans = selectedMol.bondTrans.get(toMove.get(i).n);
				TransformGroup t1 = selectedMol.bondTrans1.get(toMove.get(i).n);
				TransformGroup t2 = selectedMol.bondTrans2.get(toMove.get(i).n);
				Vector3f pos = new Vector3f(x,y,z);
				int s1[] = selectedMol.bonds.get(toMove.get(i).n).index;
				Vector3f pos1 = selectedMol.vec.get(s1[1]);
				if(s1[1]==selectedId){
					pos1 = selectedMol.vec.get(s1[0]);
				}
				Vector3f cross = new Vector3f();
				Vector3f YAXIS = new Vector3f(0, 1, 0);
				Vector3f temp = new Vector3f((pos.x+pos1.x)/2,(pos.y+pos1.y)/2,(pos.z+pos1.z)/2);
				Vector3f temp1 = new Vector3f((pos.x-pos1.x),(pos.y-pos1.y),(pos.z-pos1.z));
				double oldl = selectedMol.bonds.get(toMove.get(i).n).length;
				double l = Math.sqrt(Squares.sqr(pos.x-pos1.x)+Squares.sqr(pos.y-pos1.y)+Squares.sqr(pos.z-pos1.z));
				temp1.normalize();
				l=l/oldl;
				cross.cross(YAXIS,temp1);
						
				AxisAngle4f tempAA = new AxisAngle4f();
						
				tempAA.set(cross,(float)Math.acos(YAXIS.dot(temp1)));
				Transform3D tempT = new Transform3D();
				tempT.set(tempAA);
				tempT.setTranslation(temp);
				tempT.setScale(new Vector3d(1,l,1));	Transform3D tempT1 = new Transform3D();
				tempT1.set(tempAA);
				tempT1.setTranslation(temp);
				Transform3D tempT2 = new Transform3D();
				tempT2.set(tempAA);
				tempT2.setTranslation(temp);
				tempT.setScale(new Vector3d(1,l,1));
				moleTrans.setTransform(tempT);
				float ratio1=1;
				float ratio2=1;
				switch(selectedMol.bonds.get(toMove.get(i).n).strength){
					case 1:
							ratio1=0.5f;
							ratio2=0.5f;
							break;
					case 2:
							ratio1= 2f;
							ratio2=0.5f;
							break;
					case 3:
							ratio1 =2f;
							ratio2 = 2f;
							break;
					case 4:
							ratio1 =0.5f;
							ratio2 =3f;
				}
				tempT1.setScale(new Vector3d(ratio1,l,ratio1));
				tempT2.setScale(new Vector3d(ratio2,l,ratio2));
				t1.setTransform(tempT1);
				t2.setTransform(tempT2);

			}
		}
	}
	
	@SuppressWarnings("static-access")
	public static void molFrame(){
		GraphicsConfiguration confMole = SimpleUniverse.getPreferredConfiguration();
		canvasMole =  new Canvas3D(confMole);
		
		uniMole =  new SimpleUniverse(canvasMole);
		
		moleBranchGroup = new BranchGroup();
		addLights( moleBranchGroup );
		moleTransGroup = new TransformGroup();
		moleTransGroup.setCapability(TransformGroup.ALLOW_CHILDREN_EXTEND);
		moleTransGroup.setCapability(TransformGroup.ALLOW_CHILDREN_WRITE);
		moleTransGroup.setCapability(TransformGroup.ALLOW_TRANSFORM_READ);
		moleTransGroup.setCapability(TransformGroup.ALLOW_TRANSFORM_WRITE);
		moleBranchGroup.addChild(moleTransGroup);
		
		wiiSphere = testSphere();
		wiiSphere.setCapability(TransformGroup.ALLOW_CHILDREN_EXTEND);
		wiiSphere.setCapability(TransformGroup.ALLOW_CHILDREN_WRITE);
		wiiSphere.setCapability(TransformGroup.ALLOW_TRANSFORM_READ);
		wiiSphere.setCapability(TransformGroup.ALLOW_TRANSFORM_WRITE);
		//moleBranchGroup.addChild(wiiSphere);
		canvasMole.addMouseListener(new MouseListener(){
			public void mouseClicked(MouseEvent arg0) {
				if(mousePos!= null){
					//mousePos.x=arg0.getX();
					//mousePos.y=arg0.getY();
					//mousePos.z=0;
				}
				if(!arg0.isShiftDown()){
					tryToPick(arg0);
				}
				
					

			}
			public void mouseEntered(MouseEvent arg0) {}
			public void mouseExited(MouseEvent arg0) {}
			public void mousePressed(MouseEvent arg0) {
				if(arg0.getButton() == MouseEvent.BUTTON3){
					rightButton = true;
					middleButton = false;
					return;
				}
				else if(arg0.getButton() == MouseEvent.BUTTON2){
					rightButton = false;
					middleButton = true;
					return;
				}
				rightButton = false;
				middleButton = false;
			}
			public void mouseReleased(MouseEvent arg0) {
				if(dragged ){
					
					selectedId = 9999;
					if(!cntMode)
					minimizeMol();
					dragged = false;
				}

				//uniMole.getViewingPlatform().getViewPlatformTransform().getTransform(newCameraTransform);
				//Vector3f v1 = new Vector3f(), v2 = new Vector3f();
				//oldCameraTransform.get(v1);
				//newCameraTransform.get(v2);
				//if(v1.length()!=0 && v2.length()!=0)
				//	theta = Math.acos(v1.dot(v2)/(v1.length()*v2.length()));
			}
		});
		
		
		canvasMole.addMouseMotionListener(new MouseMotionListener(){
			public void mouseDragged(MouseEvent arg0) {
				if((!arg0.isShiftDown())&&!rightButton&&!middleButton){
					for(int i=0;i<selectedMol.total;i++){
						selectedMol.pk.get(i).setShapeLocation(arg0);
					    PickResult result =selectedMol.pk.get(i).pickClosest();
					    if (result != null) {
					       Shape3D s = (Shape3D)result.getNode(PickResult.SHAPE3D);
					       if (s != null) {
					    	   main.jtext.setText("\nSelected "+selectedMol.atoms.get(i).name);
					    	   selectedId = i;
					    	   break;
					       }
					    }
					}
					if(selectedMol.bondTotal !=0){
						yesb=0;
						toMove = new Vector<Num>();
						for(int i=0;i<selectedMol.bondTotal;i++)
						{
							if(selectedMol.bonds.get(i).index[0]==selectedId){
								yesb++;
								Num m=new Num();
								m.n =i;
								toMove.add(m);
							}
							else if(selectedMol.bonds.get(i).index[1]==selectedId){
								yesb++;
								Num m=new Num();
								m.n =i;
								toMove.add(m);
							}
						}
						if(yesb==0){
							toMove=null;
						}
					}
					orbit.setRotateEnable(false);
					if(selectedMol.total!=0&&selectedId!=9999){
						Point3d p1 = getPoint(arg0.getX(), arg0.getY());
								dragAtom((float)p1.x, (float) p1.y);
								dragged = true;
					}
				}
				else if(arg0.isShiftDown()){
					orbit.setRotateEnable(true);
					
					/*if(Math.abs(arg0.getX()-mousePos.x)>Math.abs(arg0.getY()-mousePos.y)){
						if(arg0.getX()>mousePos.x){
							Transform3D t3d = new Transform3D();
							Transform3D c3d = new Transform3D();
							moleTransGroup.getTransform(t3d);
							Transform3D roty = new Transform3D();
							//System.out.println(""+arg0.getX()+" "+mousePos.x+" "+arg0.getY()+" "+mousePos.y);
							roty.rotY(0.1D);
							t3d.mul(roty);
							selectedMol.moleTrans.get(0).getTransform(c3d);
							Vector3f v3f = new Vector3f();
							c3d.get(v3f);
							System.out.println("Before"+v3f.x+" "+v3f.y+" "+v3f.z);
							moleTransGroup.setTransform(t3d);
							selectedMol.moleTrans.get(0).getTransform(c3d);
							v3f = new Vector3f();
							c3d.get(v3f);
							System.out.println("After"+v3f.x+" "+v3f.y+" "+v3f.z);
							
						}
						else{
							Transform3D t3d = new Transform3D();
							moleTransGroup.getTransform(t3d);
							Transform3D roty = new Transform3D();
							//System.out.println(""+arg0.getX()+" "+mousePos.x+" "+arg0.getY()+" "+mousePos.y);
							roty.rotY(-0.1D);
							t3d.mul(roty);
							moleTransGroup.setTransform(t3d);
						}
					}
					else{
						Transform3D t3d = new Transform3D();
						moleTransGroup.getTransform(t3d);
						t3d.rotX(0.1);
						moleTransGroup.setTransform(t3d);
					}*/
						
				}
				
			}
			public void mouseMoved(MouseEvent arg0) {}		
		});
		orbit = new OrbitBehavior(canvasMole,orbit.DISABLE_ROTATE+orbit.REVERSE_TRANSLATE);
	    orbit.setSchedulingBounds(new BoundingSphere(new Point3d(0.0, 0.0, 0.0), Double.POSITIVE_INFINITY));
	    uniMole.getViewingPlatform().setViewPlatformBehavior(orbit);
	   
	    //oldCameraTransform = new Transform3D();
	    //newCameraTransform = new Transform3D();
	   
	    
		uniMole.addBranchGraph(moleBranchGroup);
	    view = uniMole.getViewingPlatform();
		view.setNominalViewingTransform();
		// uniMole.getViewingPlatform().getViewPlatformTransform().getTransform(oldCameraTransform);
		main.mainPane.add(canvasMole, BorderLayout.CENTER);
		main.mainPane.setBounds(0, 0, (int) (main.width/1.151770658), (int) (main.height/1.181538462));
		//main.jtext.setText("\nMolecule Designer Created");
	}
	@SuppressWarnings("static-access")
	public static void tryToPick(MouseEvent e){
		boolean yes = false;
		for(int i=0;i<selectedMol.total;i++){
			selectedMol.pk.get(i).setShapeLocation(e);
		    PickResult result =selectedMol.pk.get(i).pickClosest();
		    if (result != null) {
		       Shape3D s = (Shape3D)result.getNode(PickResult.SHAPE3D);
		       if (s != null) {
		    	   int temp = selectedId;
		    	   selectedId = i;
		    	   if(temp!=selectedId){
		    		   	int temp1 = selectedId2;
						selectedId2=temp;
						temp = selectedId3;
						selectedId3 = temp1;
						selectedId4 = temp;
		    	   }
				   main.jtext.setText(""+selectedMol.atoms.get(selectedId).name);
		    	   yes = true;
		    	   break;
		       }
		    }
		}
		if(!yes){
			energy = 0;
			boolean yes1= true;
			if(e.getButton()==MouseEvent.BUTTON1){
				int selectedBondId = 9999;
				for(int i=0;i<selectedMol.bondTotal;i++){
					selectedMol.bondPk.get(i).setShapeLocation(e);
					PickResult result =selectedMol.bondPk.get(i).pickClosest();
					if (result != null) {
						Shape3D s = (Shape3D)result.getNode(PickResult.SHAPE3D);
						if (s != null) {
							yes1 = false;
							selectedBondId = i;
							if(mouseMode == "Put"){
								int oldStrength = selectedMol.bonds.get(selectedBondId).strength;
								selectedMol.changeStrength(selectedBondId);
								energy = 0;
								//main.jtext.setText("Bond Order = "+selectedMol.bonds.get(selectedBondId).strength);
								
								changeBond(selectedBondId, selectedMol.bonds.get(selectedBondId).strength, oldStrength);
								if(!cntMode)
									minimizeMol();
							}
							else if(mouseMode == "Bonds"){
								energy = 0;
								setBonds(selectedBondId);
							}
							/*else
							{
								//main.jtext.setText("Bond Order = "+selectedMol.bonds.get(selectedBondId).strength);
							}*/
							break;
						}
					}
				}
			}
			if(e.getButton()==MouseEvent.BUTTON1&&yes1){
				if(mouseMode=="Put"&&selectedIndex!=9999){
					int xloc = e.getX();
					int yloc = e.getY();
					//uniMole.getViewingPlatform().getViewPlatformTransform().getTransform(newCameraTransform);
					//Vector3f v3f = new Vector3f();
					//newCameraTransform.get(v3f);
					Point3d p1 = getPoint(xloc, yloc);
					energy = 0;
					
						put((float)p1.x, (float)p1.y);	
				}
			}		
			else if(e.getButton()==MouseEvent.BUTTON3){
				int selectedBondId = 9999;
				for(int i=0;i<selectedMol.bondTotal;i++){
					selectedMol.bondPk.get(i).setShapeLocation(e);
					PickResult result =selectedMol.bondPk.get(i).pickClosest();
					if (result != null) {
						Shape3D s = (Shape3D)result.getNode(PickResult.SHAPE3D);
						if (s != null) {
							selectedBondId = i;
							selectedMol.removeBond(selectedBondId);
							energy = 0;
							break;
						}
					}
				}
			}
		}
		else{
			if(mouseMode == "Put"&&e.getButton()==MouseEvent.BUTTON1){
					if((selectedId2!=9999)&&(selectedId!=9999)){
						if(selectedMol.bondTotal !=0){
							int s1, s2;
							yes=true;
							for(int i=0;i<selectedMol.bondTotal;i++)
							{
								s1=selectedMol.bonds.get(i).index[0];
								s2=selectedMol.bonds.get(i).index[1];
								if(((s1==selectedId)&&(s2==selectedId2))||((s2==selectedId)&&(s1==selectedId2))){
									yes = false;
								}
							}
							if(yes)
								if((selectedId2!=9999)&&(selectedId!=9999)){
									if(!cntMode){
									putBond(1);
									minimizeMol();
									}
									else
										putBond(4);
									
									energy = 0;
									//main.jtext.setText("Bonded   "+selectedMol.atoms.get(selectedId2).name+" "+selectedMol.atoms.get(selectedId).name);
								}
								
						}
						else{
							if(!cntMode){
								putBond(1);
								minimizeMol();
							}
								else
									putBond(4);
								
						}
							
					}
			}
			else if(e.getButton()==MouseEvent.BUTTON3){
				boolean yes1= true;
				for(int i=0;i<selectedMol.bondTotal;i++){
					if((selectedMol.bonds.get(i).index[0]==selectedId)||(selectedMol.bonds.get(i).index[1]==selectedId)){
						yes1=false;
						break;
					}
				}
				if(yes1){
					selectedMol.removeAtom(selectedId);
					energy = 0;
					checkAngles();
					selectedId=9999;
				}
				else{
					main.jtext.setText("Please debond the selected atom");
					selectedId=9999;
				}
			}
			else if(mouseMode == "Set"&&e.getButton()==MouseEvent.BUTTON1&&!e.isShiftDown()){
				setCharges(selectedId);
				energy = 0;
			}
		}
	}
	public static void setBonds(final int selectedBondId) {
		final JFrame bondFrame = new JFrame("Set Charge Distribution for "+selectedMol.atoms.get(selectedBondId).RFID);
		
		bondFrame.setBounds(400, 150, 300, 200);
		bondFrame.setVisible(true);
		bondFrame.setLayout(new BorderLayout());
		
		JPanel bondPanel = new JPanel(new GridBagLayout());
		bondFrame.add(bondPanel, BorderLayout.CENTER);
		bondFrame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		
		JLabel length = new JLabel("Length");
		
		final JTextField textLength = new JTextField(""+(selectedMol.atoms.get(selectedMol.bonds.get(selectedBondId).index[0]).bondLength + selectedMol.atoms.get(selectedMol.bonds.get(selectedBondId).index[1]).bondLength+selectedMol.bonds.get(selectedBondId).addLength));
		
		JPanel butPanel = new JPanel(new FlowLayout());
		JButton butOk = new JButton("Ok");
		JButton butCancel = new JButton("Cancel");
		
		butOk.addActionListener(new ActionListener(){
			@SuppressWarnings("static-access")
			public void actionPerformed(ActionEvent arg0) {
				try{
					double a = Double.parseDouble(textLength.getText());
					selectedMol.bonds.get(selectedBondId).addLength = a - (selectedMol.atoms.get(selectedMol.bonds.get(selectedBondId).index[0]).bondLength + selectedMol.atoms.get(selectedMol.bonds.get(selectedBondId).index[1]).bondLength)+0.01;
					bondFrame.dispose();
					mouseMode = "Put";
				}catch(NumberFormatException e){
					main.jtext.setText("Wrong Input"+e.getMessage());
				}
			}			
		});
		
		butCancel.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent arg0) {
				bondFrame.dispose();
				
			}			
		});
		
		butPanel.add(butOk);
		butPanel.add(butCancel);
		
		bondPanel.add(length,  new GBC(0,0,1,1).setFill(GBC.BOTH).setWeight(100, 0).setInsets(5));
		bondPanel.add(textLength, new GBC(1,0,1,1).setFill(GBC.BOTH).setWeight(100, 0).setInsets(5));
		bondPanel.add(butPanel, new GBC(0,2, 2, 2).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(5) );
		
	}
	public static void setCharges(final int selectedId) {
		final JFrame chargeFrame = new JFrame("Set Charge Distribution for "+selectedMol.atoms.get(selectedId).name);
		
		chargeFrame.setBounds(400, 150, 320, 150);
		chargeFrame.setVisible(true);
		chargeFrame.setLayout(new BorderLayout());
		
		JPanel chargePanel = new JPanel(new GridBagLayout());
		chargeFrame.add(chargePanel, BorderLayout.CENTER);
		chargeFrame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		
//		JLabel valency = new JLabel("Valency");
		JLabel charge = new JLabel("Charge");
		//JLabel sigma = new JLabel("Sigma");
		//JLabel epsilon = new JLabel("Epsilon");
		//JLabel mass = new JLabel("Mass");
		//JLabel bondAngle = new JLabel("Angle");
		
		final JTextField textCharge = new JTextField(""+selectedMol.atoms.get(selectedId).charge);
		//final JTextField textSigma = new JTextField(""+selectedMol.atoms.get(selectedId).sigma);
		//final JTextField textEpsilon = new JTextField(""+selectedMol.atoms.get(selectedId).epsilon);
		//final JTextField textMass = new JTextField(""+selectedMol.atoms.get(selectedId).mass);
		//final JTextField textAngle = new JTextField(""+selectedMol.atoms.get(selectedId).bondAngle);
		
		JPanel butPanel = new JPanel(new FlowLayout());
		JButton butOk = new JButton("Ok");
		JButton butCancel = new JButton("Cancel");
		chance = true;
		butOk.addActionListener(new ActionListener(){
			@SuppressWarnings("static-access")
			public void actionPerformed(ActionEvent arg0) {
				try{
					if(chance){
						main.jtext.setText("Setting charges manually can lead to unstable simulations. To apply these changes, press Ok again.");
						chance = false;
					}
					else{
						selectedMol.atoms.get(selectedId).charge = Double.parseDouble(textCharge.getText());
						//selectedMol.atoms.get(selectedId).sigma = Double.parseDouble(textSigma.getText());
						//selectedMol.atoms.get(selectedId).epsilon = Double.parseDouble(textEpsilon.getText());
						//selectedMol.atoms.get(selectedId).mass = Double.parseDouble(textMass.getText());
						//selectedMol.atoms.get(selectedId).bondAngle = Double.parseDouble(textAngle.getText());
						selectedMol.atoms.get(selectedId).changed = true;
						chargeFrame.dispose();
						mouseMode = "Put";
						energy = 0;
						minimizeMol();
					}
				}catch(NumberFormatException e){
					main.jtext.setText("Wrong Input"+e.getMessage());
				}
			}			
		});
		
		butCancel.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent arg0) {
				chargeFrame.dispose();
				
			}			
		});
		
		butPanel.add(butOk);
		butPanel.add(butCancel);
		
		//chargePanel.add(mass,  new GBC(0,0,1,1).setFill(GBC.BOTH).setWeight(100, 0).setInsets(5));
		//chargePanel.add(textMass, new GBC(1,0,1,1).setFill(GBC.BOTH).setWeight(100, 0).setInsets(5));
		//chargePanel.add(sigma,  new GBC(0,1,1,1).setFill(GBC.BOTH).setWeight(100, 0).setInsets(5));
		//chargePanel.add(textSigma, new GBC(1,1,1,1).setFill(GBC.BOTH).setWeight(100, 0).setInsets(5));
		//chargePanel.add(epsilon,  new GBC(0,2,1,1).setFill(GBC.BOTH).setWeight(100, 0).setInsets(5));
		//chargePanel.add(textEpsilon, new GBC(1,2,1,1).setFill(GBC.BOTH).setWeight(100, 0).setInsets(5));
		chargePanel.add(charge, new GBC(0,3,1,1).setFill(GBC.BOTH).setWeight(100, 0).setInsets(5));
		chargePanel.add(textCharge, new GBC(1,3,1,1).setFill(GBC.BOTH).setWeight(100, 0).setInsets(5));
		//chargePanel.add(bondAngle, new GBC(0,4,1,1).setFill(GBC.BOTH).setWeight(100, 0).setInsets(5));
		//chargePanel.add(textAngle, new GBC(1,4,1,1).setFill(GBC.BOTH).setWeight(100, 0).setInsets(5));
		chargePanel.add(butPanel, new GBC(0,5, 2, 2).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(5) );
		
	}
	public static void changeBond(int selectedBondId2, int strength, int oldStrength) {
		TransformGroup t1 = selectedMol.bondTrans1.get(selectedBondId2);
		TransformGroup t2 = selectedMol.bondTrans2.get(selectedBondId2);
		int s1[] = selectedMol.bonds.get(selectedBondId2).index;
		Vector3f pos = selectedMol.vec.get(s1[0]);
		Vector3f pos1 = selectedMol.vec.get(s1[1]);
		Double oldlength = selectedMol.bonds.get(selectedBondId2).length;
		Vector3f cross = new Vector3f();
		Vector3f YAXIS = new Vector3f(0, 1, 0);
		Vector3f temp = new Vector3f((pos.x+pos1.x)/2,(pos.y+pos1.y)/2,(pos.z+pos1.z)/2);
		Vector3f temp1 = new Vector3f((pos.x-pos1.x),(pos.y-pos1.y),(pos.z-pos1.z));
		double l = Math.sqrt(Squares.sqr(pos.x-pos1.x)+Squares.sqr(pos.y-pos1.y)+Squares.sqr(pos.z-pos1.z));
		temp1.normalize();
		l=l/oldlength;
		temp1.normalize();
		cross.cross(YAXIS,temp1);
				
		AxisAngle4f tempAA = new AxisAngle4f();
				
		tempAA.set(cross,(float)Math.acos(YAXIS.dot(temp1)));
		Transform3D tempT1 = new Transform3D();
		tempT1.set(tempAA);
		tempT1.setTranslation(temp);
		Transform3D tempT2 = new Transform3D();
		tempT2.set(tempAA);
		tempT2.setTranslation(temp);
		float ratio1=1;
		float ratio2=1;
		switch(strength){
		case 1:
			ratio1=0.5f;
			ratio2=0.5f;
			break;
	case 2:
			ratio1= 2f;
			ratio2=0.5f;
			break;
	case 3:
			ratio1 =2f;
			ratio2 = 2f;
			break;
	case 4:
			ratio1 =0.5f;
			ratio2 =3f;
		}
		tempT1.setScale(new Vector3d(ratio1,l,ratio1));
		tempT2.setScale(new Vector3d(ratio2,l,ratio2));
		t1.setTransform(tempT1);
		t2.setTransform(tempT2);
	}
	/*public static void bondPick(MouseEvent e){
		main.jtext.append("\nIn bond pick");
		boolean yes = true;
		for(int i=0;i<selectedMol.bondTotal;i++){
			selectedMol.pk.get(i).setShapeLocation(e);
		    PickResult result =selectedMol.pk.get(i).pickClosest();
		    if (result != null) {
		       Shape3D s = (Shape3D)result.getNode(PickResult.SHAPE3D);
		       main.jtext.append("\nIn bond loop");
		       if (s != null) {
		    	   main.jtext.append("\nSelected "+i);
		    	   selectedBond = i;
		    	   yes = false;
		    	   break;
		       }
		    }
		}
		if(!yes){
			if(mouseMode=="Remove"){
				selectedMol.removeBond(selectedBond);
				selectedBond=9999;
			}
		}
	}*/
	public static void checkTorsion(){
		torsion = new Vector<Torsion>();
		torsionCount = 0;
		for(int i =0;i<angleCount-1;i++){
			for(int j=i+1;j<angleCount;j++){
				for(int k=0;k<selectedMol.bondTotal;k++){
					//main.jtext.append("\n"+i+" "+j+" "+k);
					if(((angle.get(i).cAtom==selectedMol.bonds.get(k).index[0])&&(angle.get(j).cAtom==selectedMol.bonds.get(k).index[1]))||(angle.get(i).cAtom==selectedMol.bonds.get(k).index[1])&&(angle.get(j).cAtom==selectedMol.bonds.get(k).index[0])){
						double theta=0;
						double forceConst=0;
						double n=0;
						if(selectedMol.atoms.get(angle.get(i).cAtom).hybridization == 3 && selectedMol.atoms.get(angle.get(j).cAtom).hybridization == 3&&selectedMol.bonds.get(k).strength==1){
							theta = 180;
							n = 3;
							forceConst = 2;
						}
						else if((((selectedMol.atoms.get(angle.get(i).cAtom).hybridization == 2||selectedMol.atoms.get(angle.get(i).cAtom).hybridization == 0) && selectedMol.atoms.get(angle.get(j).cAtom).hybridization == 3))&&selectedMol.bonds.get(k).strength==1){
							theta = 0;
							n = 6;
							forceConst = 1;
							//System.out.println("Here"+5);
							/*if(angle.get(i).oAtoms[0]==angle.get(j).cAtom && (selectedMol.atoms.get(angle.get(i).oAtoms[1]).hybridization != 0 ||selectedMol.atoms.get(angle.get(i).oAtoms[1]).hybridization != 2)){
								theta = 180;
								n =3;
								forceConst = 2;
								System.out.println("Here"+1);
							}
							else if(angle.get(i).oAtoms[1]==angle.get(j).cAtom && (selectedMol.atoms.get(angle.get(i).oAtoms[0]).hybridization != 0 ||selectedMol.atoms.get(angle.get(i).oAtoms[0]).hybridization != 2)){
								theta = 180;
								n =3;
								forceConst = 2;
								System.out.println("Here"+2);
							}*/
						}
						else if((selectedMol.atoms.get(angle.get(i).cAtom).hybridization == 3 && (selectedMol.atoms.get(angle.get(j).cAtom).hybridization == 2&&selectedMol.atoms.get(angle.get(j).cAtom).hybridization == 0))&&selectedMol.bonds.get(k).strength==1){
							theta = 0;
							n = 6;
							forceConst = 1;
							//System.out.println("Here"+6);
							/*if(angle.get(j).oAtoms[0]==angle.get(i).cAtom && (selectedMol.atoms.get(angle.get(j).oAtoms[1]).hybridization != 0 ||selectedMol.atoms.get(angle.get(j).oAtoms[1]).hybridization != 2)){
								theta = 180;
								n =3;
								forceConst = 2;
								System.out.println("Here"+3);
							}
							else if(angle.get(j).oAtoms[1]==angle.get(i).cAtom && (selectedMol.atoms.get(angle.get(j).oAtoms[0]).hybridization != 0 ||selectedMol.atoms.get(angle.get(j).oAtoms[0]).hybridization != 2)){
								theta = 180;
								n =3;
								forceConst = 2;
								System.out.println("Here"+4);
							}*/
						}
						else if(selectedMol.atoms.get(angle.get(i).cAtom).hybridization == 2 && selectedMol.atoms.get(angle.get(j).cAtom).hybridization == 2&&selectedMol.bonds.get(k).strength==2){
							theta = 0;
							n = 2;//2
							forceConst = 45;
						}
						else if(selectedMol.atoms.get(angle.get(i).cAtom).hybridization == 0 && selectedMol.atoms.get(angle.get(j).cAtom).hybridization == 0&& selectedMol.bonds.get(k).strength==4){
							theta = 0;
							n = 2;
							forceConst = 25;
						}
						else if((selectedMol.atoms.get(angle.get(i).cAtom).hybridization == 0 && selectedMol.atoms.get(angle.get(j).cAtom).hybridization == 0)&&(selectedMol.atoms.get(angle.get(i).oAtoms[1]).hybridization == 0 && selectedMol.atoms.get(angle.get(j).oAtoms[0]).hybridization == 0)&&(selectedMol.atoms.get(angle.get(i).oAtoms[0]).hybridization == 0 && selectedMol.atoms.get(angle.get(j).oAtoms[1]).hybridization == 0)){
							theta = 180;
							n = 2;
							forceConst = 10;
						}
						else if((selectedMol.atoms.get(angle.get(i).cAtom).hybridization == 0 && selectedMol.atoms.get(angle.get(j).cAtom).hybridization == 0)&&selectedMol.bonds.get(k).strength==1){
							theta = 180;
							n = 2;
							forceConst = 5;
						}
						else if((selectedMol.atoms.get(angle.get(i).cAtom).hybridization == 2 && selectedMol.atoms.get(angle.get(j).cAtom).hybridization == 2)&&selectedMol.bonds.get(k).strength==1){
							theta = 180;
							n = 2;
							forceConst = 5;
						}
						else if((selectedMol.atoms.get(angle.get(i).cAtom).RFID == 14||selectedMol.atoms.get(angle.get(i).cAtom).RFID == 22||selectedMol.atoms.get(angle.get(i).cAtom).RFID == 27||selectedMol.atoms.get(angle.get(i).cAtom).RFID == 32) && (selectedMol.atoms.get(angle.get(j).cAtom).RFID == 14||selectedMol.atoms.get(angle.get(j).cAtom).RFID == 22||selectedMol.atoms.get(angle.get(j).cAtom).RFID == 27||selectedMol.atoms.get(angle.get(j).cAtom).RFID == 32)){
							theta = 90;
							n = 2;
							forceConst = 2;
						}
						else if((selectedMol.atoms.get(angle.get(i).cAtom).hybridization == 2 || selectedMol.atoms.get(angle.get(i).cAtom).hybridization == 0) && (selectedMol.atoms.get(angle.get(j).cAtom).hybridization == 3) ){
							if(angle.get(i).oAtoms[0]==angle.get(j).cAtom){
								if(selectedMol.atoms.get(angle.get(i).oAtoms[1]).hybridization != 2 || selectedMol.atoms.get(angle.get(i).oAtoms[1]).hybridization != 0){
									theta = 180;
									n = 3;
									forceConst = 2;
								}
							}
							else if(angle.get(i).oAtoms[1]==angle.get(j).cAtom){
								if(selectedMol.atoms.get(angle.get(i).oAtoms[0]).hybridization != 2 || selectedMol.atoms.get(angle.get(i).oAtoms[0]).hybridization != 0){
									theta = 180;
									n = 3;
									forceConst = 2;
								}
							}							
						}
						else if((selectedMol.atoms.get(angle.get(j).cAtom).hybridization == 2 || selectedMol.atoms.get(angle.get(j).cAtom).hybridization == 0) && (selectedMol.atoms.get(angle.get(i).cAtom).hybridization == 3) ){
							if(angle.get(j).oAtoms[0]==angle.get(i).cAtom){
								if(selectedMol.atoms.get(angle.get(j).oAtoms[1]).hybridization != 2 || selectedMol.atoms.get(angle.get(j).oAtoms[1]).hybridization != 0){
									theta = 180;
									n = 3;
									forceConst = 2;
								}
							}
							else if(angle.get(j).oAtoms[1]==angle.get(i).cAtom){
								if(selectedMol.atoms.get(angle.get(j).oAtoms[0]).hybridization != 2 || selectedMol.atoms.get(angle.get(j).oAtoms[0]).hybridization != 0){
									theta = 180;
									n = 3;
									forceConst = 2;
								}
							}							
						}
						else if(((selectedMol.atoms.get(angle.get(i).cAtom).hybridization == 2||selectedMol.atoms.get(angle.get(i).cAtom).hybridization == 0))&&((selectedMol.atoms.get(angle.get(j).cAtom).RFID == 14||selectedMol.atoms.get(angle.get(j).cAtom).RFID == 22||selectedMol.atoms.get(angle.get(j).cAtom).RFID == 27||selectedMol.atoms.get(angle.get(j).cAtom).RFID == 32) )){
							theta = 180;
							n = 2;
							forceConst = 2;
						}
						else if(( (selectedMol.atoms.get(angle.get(j).cAtom).hybridization == 2||selectedMol.atoms.get(angle.get(j).cAtom).hybridization == 0))&&((selectedMol.atoms.get(angle.get(i).cAtom).RFID == 14||selectedMol.atoms.get(angle.get(i).cAtom).RFID == 22||selectedMol.atoms.get(angle.get(i).cAtom).RFID == 27||selectedMol.atoms.get(angle.get(i).cAtom).RFID == 32) )){
							theta = 180;
							n = 2;
							forceConst = 2;
						}
						//int tempTorsionCount = torsionCount;
						//forceConst = forceConst/(selectedMol.atoms.get(angle.get(i).cAtom).valency1-selectedMol.atoms.get(angle.get(i).cAtom).valency);
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
						//tempTorsionCount = torsionCount - tempTorsionCount;
						//selectedMol.atoms.get(angle.get(i).cAtom).torsionCount += tempTorsionCount;
						//selectedMol.atoms.get(angle.get(j).cAtom).torsionCount += tempTorsionCount;
					}
				}
			}
		}
		for(int i=0; i<torsionCount; i++){
			if(torsion.get(i).forceConst == 0){
				torsion.remove(i);
				i--;
				torsionCount--;
			}
		}
		int instance[] = new int[torsionCount];
		int divisor[] = new int[torsionCount];
 		boolean go[] = new boolean[torsionCount];
		for(int i=0;i<torsionCount; i++){
			instance[i] = -1;
			divisor[i] = 1;
			go[i] = true;
		}
		for(int i=0; i<torsionCount-1; i++){
			for(int j=i+1; j<torsionCount; j++){
				if(!go[i])
					break;
				else{
					instance[i] = i;
					
				}
				if(torsion.get(i).atom[1]==torsion.get(j).atom[1]&&torsion.get(i).atom[2]==torsion.get(j).atom[2]&&go[i]&&go[j]){
					instance[j] = i;
					divisor[i]++;
					go[j]=false;
				}
			}
			go[i] = false;
		}
		for(int i=0; i<torsionCount; i++){
			go[i] = true;
		}
		for(int i=0; i<torsionCount-1; i++){
			for(int j=i+1; j<torsionCount; j++){
				if(!go[i])
					break;
				if(instance[i]==instance[j]&&go[i]&&go[j]){
					divisor[j]=divisor[i];
					go[j]=false;
				}
			}
			go[i] = false;
		}
		//System.out.println("go");
		for(int i=0; i<torsionCount; i++){
			//System.out.println(""+instance[i]+" "+divisor[i]);
			torsion.get(i).forceConst/=divisor[i];
		}
		/*for(int i=0; i<torsionCount; i++){
			if(selectedMol.atoms.get(torsion.get(i).atom[1]).torsionCount <selectedMol.atoms.get(torsion.get(i).atom[2]).torsionCount){
				//System.out.println("Torsion Count ="+selectedMol.atoms.get(torsion.get(i).atom[1]).torsionCount);
				torsion.get(i).forceConst /=selectedMol.atoms.get(torsion.get(i).atom[1]).torsionCount;
			}
			else{
				//System.out.println("Torsion Count ="+selectedMol.atoms.get(torsion.get(i).atom[2]).torsionCount);
				torsion.get(i).forceConst /=selectedMol.atoms.get(torsion.get(i).atom[2]).torsionCount;
			}
		}*/
		//System.out.println("TorsionCount ="+torsionCount);
	}
	public static void checkInversion(){
		for(int i =0;i<angleCount-1;i++){
			for(int j=i+1;j<angleCount;j++){
				for(int k=0;k<selectedMol.bondTotal;k++){
					//main.jtext.append("\n"+i+" "+j+" "+k);
					
					if((angle.get(i).cAtom==selectedMol.bonds.get(k).index[0])&&(angle.get(j).cAtom==selectedMol.bonds.get(k).index[0])){
						double theta=0;
						double forceConst=40.0;
						double n=1;
						if((angle.get(i).oAtoms[0]==selectedMol.bonds.get(k).index[1])&&(angle.get(j).oAtoms[0]==selectedMol.bonds.get(k).index[1]))
						{
							if((selectedMol.atoms.get(angle.get(i).cAtom).hybridization==0)||(selectedMol.atoms.get(angle.get(i).cAtom).hybridization==2)){
								
								Torsion t = new Torsion();
								t.addTorsion( angle.get(j).oAtoms[1], angle.get(i).cAtom, angle.get(i).oAtoms[1] ,angle.get(i).oAtoms[0], forceConst, theta, n);
								torsion.add(t);
								torsionCount+=1;
							}
							/*else if(selectedMol.atoms.get(angle.get(i).cAtom).RFID == 6){;
								n =3;
								theta=54.74;
								forceConst = forceConst/9;
								Torsion t = new Torsion();
								t.addTorsion( angle.get(j).oAtoms[1], angle.get(i).cAtom, angle.get(i).oAtoms[1] ,angle.get(i).oAtoms[0], forceConst, theta, n);
								torsion.add(t);
								torsionCount+=1;
							}*/
						}
						else if((angle.get(i).oAtoms[1]==selectedMol.bonds.get(k).index[1])&&(angle.get(j).oAtoms[1]==selectedMol.bonds.get(k).index[1]))
						{
							if((selectedMol.atoms.get(angle.get(i).cAtom).hybridization==0)||(selectedMol.atoms.get(angle.get(i).cAtom).hybridization==2)){
								
								Torsion t = new Torsion();
								t.addTorsion( angle.get(j).oAtoms[0],angle.get(i).cAtom, angle.get(i).oAtoms[0] ,   angle.get(i).oAtoms[1],forceConst, theta, n);
								torsion.add(t);
								torsionCount+=1;
							}
							/*else if(selectedMol.atoms.get(angle.get(i).cAtom).RFID == 6){
								n =3;
								theta=54.74;
								forceConst = forceConst/9;
								Torsion t = new Torsion();
								t.addTorsion( angle.get(j).oAtoms[0],angle.get(i).cAtom, angle.get(i).oAtoms[0] ,   angle.get(i).oAtoms[1],forceConst, theta, n);
								torsion.add(t);
								torsionCount+=1;
							}*/
							
						}
						else if((angle.get(i).oAtoms[0]==selectedMol.bonds.get(k).index[1])&&(angle.get(j).oAtoms[1]==selectedMol.bonds.get(k).index[1]))
						{
							if((selectedMol.atoms.get(angle.get(i).cAtom).hybridization==0)||(selectedMol.atoms.get(angle.get(i).cAtom).hybridization==2)){ 
								
								Torsion t = new Torsion();
								t.addTorsion(angle.get(j).oAtoms[0],angle.get(i).cAtom, angle.get(i).oAtoms[1] , angle.get(i).oAtoms[0], forceConst, theta, n);
								torsion.add(t);
								torsionCount+=1;
							}
							/*else if(selectedMol.atoms.get(angle.get(i).cAtom).RFID == 6){								 
								n =3;
								theta=54.74;
								forceConst = forceConst/9;
								Torsion t = new Torsion();
								t.addTorsion(angle.get(j).oAtoms[0],angle.get(i).cAtom, angle.get(i).oAtoms[1] , angle.get(i).oAtoms[0], forceConst, theta, n);
								torsion.add(t);
								torsionCount+=1;
							}*/
						}
						else if((angle.get(i).oAtoms[1]==selectedMol.bonds.get(k).index[1])&&(angle.get(j).oAtoms[0]==selectedMol.bonds.get(k).index[1]))
						{
							if((selectedMol.atoms.get(angle.get(i).cAtom).hybridization==0)||(selectedMol.atoms.get(angle.get(i).cAtom).hybridization==2)){
								
								Torsion t = new Torsion();
								t.addTorsion( angle.get(j).oAtoms[1],angle.get(i).cAtom, angle.get(i).oAtoms[0] ,  angle.get(i).oAtoms[1], forceConst, theta, n);
								torsion.add(t);
								torsionCount+=1;
							}
							/*else if(selectedMol.atoms.get(angle.get(i).cAtom).RFID == 6){
								n =3;
								theta=54.74;
								forceConst = forceConst/9;
								Torsion t = new Torsion();
								t.addTorsion( angle.get(j).oAtoms[1],angle.get(i).cAtom, angle.get(i).oAtoms[0] ,  angle.get(i).oAtoms[1], forceConst, theta, n);
								torsion.add(t);
								torsionCount+=1;
							}*/
						}
					}
					else if((angle.get(i).cAtom==selectedMol.bonds.get(k).index[1])&&(angle.get(j).cAtom==selectedMol.bonds.get(k).index[1])){
						double theta=0;
						double forceConst=40.0;
						double n=1;
						if((angle.get(i).oAtoms[0]==selectedMol.bonds.get(k).index[0])&&(angle.get(j).oAtoms[0]==selectedMol.bonds.get(k).index[0]))
						{
							if((selectedMol.atoms.get(angle.get(i).cAtom).hybridization==0)||(selectedMol.atoms.get(angle.get(i).cAtom).hybridization==2)){
								
								Torsion t = new Torsion();
								t.addTorsion( angle.get(j).oAtoms[1],angle.get(i).cAtom, angle.get(i).oAtoms[1] ,  angle.get(i).oAtoms[0],forceConst, theta, n);
								torsion.add(t);
								torsionCount+=1;
							}
							/*else if(selectedMol.atoms.get(angle.get(i).cAtom).RFID == 6){
								 
								n =3;
								theta=54.74;
								forceConst = forceConst/9;
								Torsion t = new Torsion();
								t.addTorsion( angle.get(j).oAtoms[1],angle.get(i).cAtom, angle.get(i).oAtoms[1] ,  angle.get(i).oAtoms[0],forceConst, theta, n);
								torsion.add(t);
								torsionCount+=1;
							}*/
							
						}
						else if((angle.get(i).oAtoms[1]==selectedMol.bonds.get(k).index[0])&&(angle.get(j).oAtoms[1]==selectedMol.bonds.get(k).index[0]))
						{
							if((selectedMol.atoms.get(angle.get(i).cAtom).hybridization==0)||(selectedMol.atoms.get(angle.get(i).cAtom).hybridization==2)){
								
								Torsion t = new Torsion();
								t.addTorsion( angle.get(j).oAtoms[0],angle.get(i).cAtom, angle.get(i).oAtoms[0] ,  angle.get(i).oAtoms[1],forceConst, theta, n);
								torsion.add(t);
								torsionCount+=1;
							}
							/*else if(selectedMol.atoms.get(angle.get(i).cAtom).RFID == 6){
								n =3;
								theta=54.74;
								forceConst = forceConst/9;
								Torsion t = new Torsion();
								t.addTorsion( angle.get(j).oAtoms[0],angle.get(i).cAtom, angle.get(i).oAtoms[0] ,  angle.get(i).oAtoms[1],forceConst, theta, n);
								torsion.add(t);
								torsionCount+=1;
							}		*/				
						}
						else if((angle.get(i).oAtoms[0]==selectedMol.bonds.get(k).index[0])&&(angle.get(j).oAtoms[1]==selectedMol.bonds.get(k).index[0]))
						{
							if((selectedMol.atoms.get(angle.get(i).cAtom).hybridization==0)||(selectedMol.atoms.get(angle.get(i).cAtom).hybridization==2)){
								
								Torsion t = new Torsion();
								t.addTorsion( angle.get(j).oAtoms[0], angle.get(i).cAtom, angle.get(i).oAtoms[1] , angle.get(i).oAtoms[0], forceConst, theta, n);
								torsion.add(t);
								torsionCount+=1;
							}
							/*else if(selectedMol.atoms.get(angle.get(i).cAtom).RFID == 6){
								n =3;
								theta=54.74;
								forceConst = forceConst/9;
								Torsion t = new Torsion();
								t.addTorsion( angle.get(j).oAtoms[0], angle.get(i).cAtom, angle.get(i).oAtoms[1] , angle.get(i).oAtoms[0], forceConst, theta, n);
								torsion.add(t);
								torsionCount+=1;
							}*/
							
						}
						else if((angle.get(i).oAtoms[1]==selectedMol.bonds.get(k).index[0])&&(angle.get(j).oAtoms[0]==selectedMol.bonds.get(k).index[0]))
						{
							if((selectedMol.atoms.get(angle.get(i).cAtom).hybridization==0)||(selectedMol.atoms.get(angle.get(i).cAtom).hybridization==2)){
								
								Torsion t = new Torsion();
								t.addTorsion(angle.get(j).oAtoms[1], angle.get(i).cAtom, angle.get(i).oAtoms[0] ,  angle.get(i).oAtoms[1],  forceConst, theta, n);
								torsion.add(t);
								torsionCount+=1;
							}
							/*else if(selectedMol.atoms.get(angle.get(i).cAtom).RFID == 6){
								n =3;
								theta=54.74;
								forceConst = forceConst/9;
								Torsion t = new Torsion();
								t.addTorsion(angle.get(j).oAtoms[1], angle.get(i).cAtom, angle.get(i).oAtoms[0] ,  angle.get(i).oAtoms[1],  forceConst, theta, n);
								torsion.add(t);
								torsionCount+=1;
							}*/
							
						}
					}
				}
			}
		}
	}
	public static void checkAngles(){
		angle = new Vector<Angles>();
		
		double count[]= new double[selectedMol.total];
		int c=0;
		angleCount=0;
		for(int i=0;i<selectedMol.total;i++){
			count[i]=0;
			count[i]=selectedMol.atoms.get(i).maxvalency;
			c++;
		}
		int angleData[][]=new int[c][];
		for(int i=0,j=0;i<selectedMol.total;i++){
			if(count[i]!=0){
				angleData[j]=new int[2+(int) count[i]];
				angleData[j][1]=i;
				angleData[j][0]=2;
				j++;
			}
		}
		for(int i=0;i<c;i++){
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
		for(int i=0;i<c;i++){
			switch(angleData[i][0]-1){
				case 3:
					ang = new Angles();
					ang.newAngle(angleData[i][1],angleData[i][2],angleData[i][3],selectedMol.atoms.get(angleData[i][1]).bondAngle,100);//(Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)*Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)));
					angle.add(ang);
					angleCount++;
					break;
				case 4:
					ang = new Angles();
					ang.newAngle(angleData[i][1],angleData[i][2],angleData[i][3],selectedMol.atoms.get(angleData[i][1]).bondAngle,100);//(Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)*Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)));
					angle.add(ang);
					ang = new Angles();
					ang.newAngle(angleData[i][1],angleData[i][3],angleData[i][4],selectedMol.atoms.get(angleData[i][1]).bondAngle,100);//(Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)*Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)));
					angle.add(ang);
					ang = new Angles();
					ang.newAngle(angleData[i][1],angleData[i][2],angleData[i][4],selectedMol.atoms.get(angleData[i][1]).bondAngle,100);//(Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)*Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)));
					angle.add(ang);
					angleCount+=3;
					break;
				case 5:
					ang = new Angles();
					ang.newAngle(angleData[i][1],angleData[i][2],angleData[i][3],selectedMol.atoms.get(angleData[i][1]).bondAngle,100);//(Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)*Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)));
					angle.add(ang);
					ang = new Angles();
					ang.newAngle(angleData[i][1],angleData[i][3],angleData[i][4],selectedMol.atoms.get(angleData[i][1]).bondAngle,100);//(Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)*Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)));
					angle.add(ang);
					ang = new Angles();
					ang.newAngle(angleData[i][1],angleData[i][4],angleData[i][5],selectedMol.atoms.get(angleData[i][1]).bondAngle,100);//(Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)*Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)));
					angle.add(ang);
					ang = new Angles();
					ang.newAngle(angleData[i][1],angleData[i][5],angleData[i][2],selectedMol.atoms.get(angleData[i][1]).bondAngle,100);//(Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)*Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)));
					angle.add(ang);
					ang = new Angles();
					ang.newAngle(angleData[i][1],angleData[i][2],angleData[i][4],selectedMol.atoms.get(angleData[i][1]).bondAngle,100);//(Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)*Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)));
					angle.add(ang);
					ang = new Angles();
					ang.newAngle(angleData[i][1],angleData[i][3],angleData[i][5],selectedMol.atoms.get(angleData[i][1]).bondAngle,100);//(Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)*Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)));
					angle.add(ang);
					angleCount+=6;
					break;
				case 6:
					ang = new Angles();
					ang.newAngle(angleData[i][1],angleData[i][2],angleData[i][3],selectedMol.atoms.get(angleData[i][1]).bondAngle,100);//(Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)*Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)));
					angle.add(ang);
					ang = new Angles();
					ang.newAngle(angleData[i][1],angleData[i][3],angleData[i][4],selectedMol.atoms.get(angleData[i][1]).bondAngle,100);//(Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)*Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)));
					angle.add(ang);
					ang = new Angles();
					ang.newAngle(angleData[i][1],angleData[i][4],angleData[i][5],selectedMol.atoms.get(angleData[i][1]).bondAngle,100);//(Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)*Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)));
					angle.add(ang);
					ang = new Angles();
					ang.newAngle(angleData[i][1],angleData[i][5],angleData[i][6],selectedMol.atoms.get(angleData[i][1]).bondAngle,100);//(Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)*Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)));
					angle.add(ang);
					ang = new Angles();
					ang.newAngle(angleData[i][1],angleData[i][6],angleData[i][2],selectedMol.atoms.get(angleData[i][1]).bondAngle,100);//(Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)*Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)));
					angle.add(ang);
					ang = new Angles();
					ang.newAngle(angleData[i][1],angleData[i][2],angleData[i][4],selectedMol.atoms.get(angleData[i][1]).bondAngle,100);//(Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)*Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)));
					angle.add(ang);
					ang = new Angles();
					ang.newAngle(angleData[i][1],angleData[i][3],angleData[i][5],selectedMol.atoms.get(angleData[i][1]).bondAngle,100);//(Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)*Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)));
					angle.add(ang);
					ang = new Angles();
					ang.newAngle(angleData[i][1],angleData[i][4],angleData[i][6],selectedMol.atoms.get(angleData[i][1]).bondAngle,100);//(Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)*Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)));
					angle.add(ang);
					ang = new Angles();
					ang.newAngle(angleData[i][1],angleData[i][5],angleData[i][2],selectedMol.atoms.get(angleData[i][1]).bondAngle,100);//(Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)*Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)));
					angle.add(ang);
					ang = new Angles();
					ang.newAngle(angleData[i][1],angleData[i][6],angleData[i][3],selectedMol.atoms.get(angleData[i][1]).bondAngle,100);///(Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)*Math.sin(selectedMol.atoms.get(angleData[i][1]).bondAngle * Math.PI/180)));
					angle.add(ang);
					angleCount+=10;
					break;
			}
		}
	}
	@SuppressWarnings({ "deprecation" })
	public static void askMoleSave(final String state){
		if(state == "Save"){
			saveMol();
		}
		else if(state == "Export"){
			if(minimized)
			exportMol();
		}
		else if(state == "Exit"&&saved){
			destroy();
		}
		else if(state == "Clear"&&saved){
			clear();
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
			JLabel lblSave = new JLabel("Save current molecular settings?");
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
		else if(state == "Clear"){
			final JDialog diaSaveSys = new JDialog();
			diaSaveSys.setBounds(500,250,300,135);
			JPanel p1,p2;
			p1= new JPanel();
			p2= new JPanel();
			p2.setLayout(new FlowLayout());
			Container contSaveSys = diaSaveSys.getContentPane();
			contSaveSys.setLayout(new GridLayout(2,1));
			JLabel lblSave = new JLabel("Save current molecular settings?");
			JButton butYes = new JButton("Yes"); 
			JButton butNo = new JButton("No");
			JButton butCancel = new JButton("Cancel");
		
			butYes.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent arg0) {
						diaSaveSys.dispose();
						saveMol();
						clear();
				}			
			});
			butNo.addActionListener(new ActionListener(){
				public void actionPerformed(ActionEvent arg0) {
						diaSaveSys.dispose();
						clear();
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
	@SuppressWarnings("static-access")
	public static void clear() {
		selectedMol.total = 0;
		selectedMol.bondTotal = 0;
		mouseMode = "Select";
		minimized = false;
		main = null;
		shut = false;
		selectedMol = null;
		allAtoms = null;
		mousePos= null;
		atomToCheck=0;
		jmtkit.setVisible(false);
		main.jdesk.remove(jmtkit);
		jmtkit = null;
		if(imageFrame!=null)
		imageFrame.dispose();
		main.mainPane.remove(canvasMole);
		main.working = false;
		main.mBuilder = null;
		canDrag = false;
		export = false;
		saved = false;
		clear = true;
		
	}
	@SuppressWarnings("static-access")
	private static void destroy(){
		selectedMol.total = 0;
		selectedMol.bondTotal = 0;
		selectedIndex = 9999;
		minimized = false;
		shut = false;
		selectedMol = null;
		mouseMode = "Select";
		allAtoms = null;
		mousePos= null;
		main.mainPane.remove(canvasMole);
		atomToCheck=0;
		jmtkit.setVisible(false);
		if(imageFrame!=null)
		imageFrame.dispose();
		main.jdesk.remove(jmtkit);
		jmtkit = null;
		main.mBuilder = null;
		canDrag = false;
		export = false;
		saved = false;
		main.working = false;
		main = null;
		
		System.exit(0);
	}
	private static void addLights(BranchGroup moleBranchGroup) {
		Color3f color = new Color3f( 1.0f,1.0f,1.0f );
		Vector3f direction = new Vector3f( 0.0f, -0.0f, -2.0f );
		DirectionalLight light = new DirectionalLight( color, direction );
		light.setInfluencingBounds( new BoundingSphere( new Point3d(0.0,0.0,0.0), 200.0 ));
		moleBranchGroup.addChild( light );
		direction = new Vector3f( -2.0f, 0.0f, 2.0f );
		light = new DirectionalLight( color, direction );
		light.setInfluencingBounds( new BoundingSphere( new Point3d(0.0,0.0,0.0), 200.0 ));
		moleBranchGroup.addChild( light );
		direction = new Vector3f( 2.0f, -2.0f, 0.0f );
		light = new DirectionalLight( color, direction );
		light.setInfluencingBounds( new BoundingSphere( new Point3d(0.0,0.0,0.0), 200.0 ));
		moleBranchGroup.addChild( light );
		

	}
	private static Sphere createSphere(int color) {
		Appearance app = new Appearance();
		Color n = new Color();
		n.newColor(color);
		Color3f objColor = new Color3f(n.r, n.g, n.b);
		Color3f black = new Color3f(0.0f, 0.0f, 0.0f);
		app.setMaterial(new Material(objColor, black, objColor, black, 80.0f));
		Sphere sphere = new Sphere( 0.03f, Primitive.GENERATE_NORMALS, app);
		return sphere;
	}
	private static Cylinder createCylinder(double length, int i) {
		
		Appearance app = new Appearance();
			Color3f whiteColor = new Color3f(1.0f, 1.0f, 1.0f);
			Color3f black = new Color3f(0.0f, 0.0f, 0.0f);
			Color3f redColor = new Color3f(0.5f, 0.5f, 0.5f);
			if(i==0){
				app.setMaterial(new Material(whiteColor, black, whiteColor, whiteColor, 80.0f));
				Cylinder cylinder = new Cylinder( 0.01f,(float)length, app);
				return cylinder;
			}
			else if(i==1){
				app.setMaterial(new Material(redColor, black, redColor, redColor, 80.0f));
				Cylinder cylinder = new Cylinder( 0.006f,(float)length, app);
				return cylinder;
			}
			else {
				app.setMaterial(new Material(whiteColor, black, whiteColor, whiteColor, 80.0f));
				Cylinder cylinder = new Cylinder( 0.0065f,(float)length, app);
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
	public static void minimizeMol(){
		
		File file = new File("miniMole.mole");
			checkHybridizations();
			checkCharges();
			checkAngles();
			checkTorsion();
			checkInversion();
		try {
			if(file.exists()&&!minimized){
				for(int i=0;i<selectedMol.total;i++){
					selectedMol.vec.get(i).z=selectedMol.vec.get(i).z-(float)i/5000;
				}
			}
			file.createNewFile();
		} catch (IOException e) {
			main.jtext.setText("\nError : Cannot create new file");
		}
		if(file.exists()){
			if(file.canWrite()){
				try {
					FileWriter wfile = new FileWriter(file.toString());
					BufferedWriter out = new BufferedWriter(wfile);
					if(energy == 0){
						out.write(""+90000000000000.0);
					}
					else 
					out.write(""+energy);
					out.write("\n"+selectedMol.total);
					for(int i=0;i<selectedMol.total;i++){
						Atom a1 = selectedMol.atoms.get(i);
						out.write("\n"+(i+1)+" "+a1.mass+" "+0+" "+a1.sigma/(2)+" "+a1.epsilon+" "+selectedMol.vec.get(i).x/0.1+" "+selectedMol.vec.get(i).y/0.1+" "+selectedMol.vec.get(i).z/0.1);
					}
					out.write("\n"+selectedMol.bondTotal);
				//	out.write("\n0");
				//	main.jtext.append(selectedMol.fffile);
					
					/*if(selectedMol.fffile == "tip3p.abat"){
						out.write("\n1");
						//main.jtext.append("Tip3p");
					}
					else {
						//main.jtext.append(selectedMol.fffile);
						out.write("\n0");
					}*/
					for(int i=0;i<selectedMol.bondTotal;i++){
						Bond b = selectedMol.bonds.get(i);
						Atom a1 = selectedMol.atoms.get(b.index[0]);
						Atom a2 = selectedMol.atoms.get(b.index[1]);
						if(b.strength == 4)
							out.write("\n"+b.index[0]+" "+b.index[1]+" "+(a1.bondLength+a2.bondLength+b.addLength-0.01)+" "+1.5*700);
						else
							out.write("\n"+b.index[0]+" "+b.index[1]+" "+(a1.bondLength+a2.bondLength+b.addLength-0.01)+" "+b.strength*700);
					}
					out.write("\n"+angleCount);
					for(int i=0;i<angleCount;i++){
						double angling = angle.get(i).angle;
						if(angling == 180)
							angling = 179.9999999;
						out.write("\n"+angle.get(i).cAtom+" "+angle.get(i).oAtoms[0]+" "+angle.get(i).oAtoms[1]+" "+angling+" "+angle.get(i).strength);
					}
					out.write("\n"+torsionCount);
					for(int i=0;i<torsionCount;i++){
						out.write("\n"+torsion.get(i).atom[0]+" "+torsion.get(i).atom[1]+" "+torsion.get(i).atom[2]+" "+torsion.get(i).atom[3]+" "+torsion.get(i).forceConst+" "+torsion.get(i).angle+" "+torsion.get(i).periodicity);
					}
					out.write("\nEnd");
					out.close();
					try{
						ProcessBuilder process = new ProcessBuilder("./minimize");
						process.redirectErrorStream(true);
						Map<String, String> env = process.environment();
						Process p = null;
						env.put("LD_LIBRARY_PATH", "openmm/lib:"+main.ld_library_path);
						env.put("OPENMM_PLUGIN_DIR", "openmm/lib/plugins");
//						env.put("LD_LIBRARY_PATH", "/usr/local/cuda/lib64:/home/sanatpc/Library/OpenMM3.0-Linux64/lib:/usr/local/cuda/lib");
//						env.put("PATH", "/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin");
//						env.put("OPENMM_PLUGIN_DIR", "/home/sanatpc/Library/OpenMM3.0-Linux64/lib/plugins");
//						env.put("LD_LIBRARY_PATH", "/usr/local/cuda/lib64:/home/omkar/Library/OpenMM3.0-Linux64/lib:/usr/local/cuda/lib");
//						env.put("PATH", "/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin");
//						env.put("OPENMM_PLUGIN_DIR", "/home/omkar/Library/OpenMM3.0-Linux64/lib/plugins");
//						env.put("LD_LIBRARY_PATH", "/usr/local/cuda/lib64:/home/sim1/Work/Softwares/OpenMM/lib:/usr/lib64:/lib:/usr/lib:/usr/local/lib");
//						env.put("PATH", "/home/sim1/Work/Simulations/NewWork/jre1.6.0_30/bin:/usr/local/cuda/bin:$PATH");
//						env.put("OPENMM_PLUGIN_DIR", "/home/sim1/Work/Softwares/OpenMM/lib/plugins");
						p = ((ProcessBuilder) process).start();
						
						try{
							InputStream is1 = p.getInputStream();
							InputStreamReader isr1 = new InputStreamReader(is1);
							BufferedReader br1 = new BufferedReader(isr1);
							String line1;
								while ((line1 = br1.readLine()) != null) {
									try{
										energy = Double.parseDouble(line1);
									}
									catch(NumberFormatException e){
										
									}
								}
								
									main.jtext.setText("Energy = "+energy+" KJ");
							/*try {
								
								p.waitFor();
							} catch (InterruptedException e) {
								p.destroy();
							}*/
							
							BufferedReader  in1 = new BufferedReader(new FileReader("miniMolRes.mole"));
							String s = in1.readLine();
							StringTokenizer st1 = new StringTokenizer(s);
							String no = st1.nextToken();
							int no1 = Integer.parseInt(no);
							for(int i=0;i<no1;i++){
								s = in1.readLine();
								st1 = new StringTokenizer(s);
								st1.nextToken();
								if(st1.hasMoreTokens()){
									try{
										placeAtom((float)(Float.parseFloat(st1.nextToken())*0.1),(float)(Float.parseFloat(st1.nextToken())*0.1),(float)(Float.parseFloat(st1.nextToken())*0.1),i);
									}catch(NumberFormatException e){
										main.jtext.setText("Few atoms may be overlapping");
										break;
									}
									}
							}
							minimized = true;
							mouseMode = "Put";
						}catch(IOException e){
							main.jtext.setText("\nError : Cannot read minimization results");
						}
					}catch(IOException e){
						main.jtext.setText("\nError : Minimize not working");
					}
				} catch (IOException e) {
					main.jtext.setText("\nError : Unable to save molecule");
				}
			}
			else{
				main.jtext.setText("\nError : File Write Error");
			}
		}
	}
	
	public static void checkCharges() {
		double xp[] = new double[selectedMol.total];
		double en[][] = new double[selectedMol.total][3];
		double Q[] = new double[selectedMol.total];
		for(int i=0; i<selectedMol.total; i++){
			if(selectedMol.atoms.get(i).changed)
				Q[i] = selectedMol.atoms.get(i).charge;
		}
		for(int i=0; i<selectedMol.total; i++){
			switch(selectedMol.atoms.get(i).RFID){
			case 1:
				en[i][0] = 7.17;
				en[i][1] = 6.24;
				en[i][2] = -0.56;
				break;
			case 6:
				en[i][0] = 7.98;
				en[i][1] = 9.18;
				en[i][2] = 1.88;
				break;
			case 7:
			case 8:
				en[i][0] = 8.79;
				en[i][1] = 9.32;
				en[i][2] = 1.51;
				break;
			case 9:
				en[i][0] = 10.39;
				en[i][1] = 9.45;
				en[i][2] = 0.73;
				break;
			case 10:
				en[i][0] = 11.54;
				en[i][1] = 10.82;
				en[i][2] = 1.36;
				break;
			case 11:
			case 12:
				en[i][0] = 12.87;
				en[i][1] = 11.15;
				en[i][2] = 0.85;
				break;
			case 13:
				en[i][0] = 15.68;
				en[i][1] = 11.7;
				en[i][2] = -0.27;
				break;
			case 14:
				en[i][0] = 14.18;
				en[i][1] = 12.92;
				en[i][2] = 1.39;
				break;
			case 15:
			case 16:
				en[i][0] = 17.07;
				en[i][1] = 13.79;
				en[i][2] = 0.47;
				break;
			case 18:
				en[i][0] = 14.66;
				en[i][1] = 13.85;
				en[i][2] = 2.31;
				break;
			case 22:
				en[i][0] = 10.14;
				en[i][1] = 9.13;
				en[i][2] = 1.38;
				break;
			case 23:
				en[i][0] = 11.00;
				en[i][1] = 9.69;
				en[i][2] = 1.35;
				break;
			case 28:
				en[i][0] = 10.08;
				en[i][1] = 8.47;
				en[i][2] = 1.16;
				break;
			case 33:
				en[i][0] = 9.90;
				en[i][1] = 7.96;
				en[i][2] = 0.96;
				break;
			default:
				en[i][0] = 0;
				en[i][1] = 0;
				en[i][2] = 0;
				break;
			}	
			xp[i] = en[i][0] + en[i][1] + en[i][2];
		}
		for(int i=0; i<selectedMol.total; i++){
			switch(selectedMol.atoms.get(i).RFID){
			case 1:
				xp[i] = 20.02;
				break;
				default:
					break;
			}
		}
		BondData bonds[] = new BondData[selectedMol.total];
		for(int i=0; i<selectedMol.total; i++){
			bonds[i] = new BondData();
		}
		for(int i=0; i<selectedMol.bondTotal; i++){
				Bond b = selectedMol.bonds.get(i);
				bonds[b.index[0]].bondedTo.add(b.index[1]);
				bonds[b.index[1]].bondedTo.add(b.index[0]);
		}
		
		double alpha = 1.0;
		for(int k=0; k<10; k++){
			alpha*=0.5;
			double q[] = new double[selectedMol.total];
			for(int i=0; i<selectedMol.total; i++){
				if(!selectedMol.atoms.get(i).changed)
				for(int j=0; j<bonds[i].bondedTo.size(); j++){
					int d = bonds[i].bondedTo.get(j);
					double x1 = en[i][0]+en[i][1]*Q[i]+en[i][2]*Q[i]*Q[i];
					double x2 = en[d][0]+en[d][1]*Q[d]+en[d][2]*Q[d]*Q[d];
					
					if(x1>x2){
						q[i] += (x2-x1)*alpha/xp[d];
					}
					else{
						q[i] += (x2-x1)*alpha/xp[i];
					}							
				}						
			}
			for(int i=0; i<selectedMol.total; i++){
				Q[i] += q[i];
			}
		}
		for(int i=0; i<selectedMol.total; i++){
		switch(selectedMol.atoms.get(i).RFID){
			case 1:
			case 6:
			case 7:
			case 8:
			case 9:
			case 10:
			case 11:
			case 12:
			case 13:
			case 14:
			case 15:
			case 16:
			case 18:
			case 22:
			case 23:
			case 28:
			case 33:
				selectedMol.atoms.get(i).charge = Q[i];
			System.out.println(""+Q[i]);
			break;
		default:
				
		}
			//selectedMol.atoms.get(i).charge = Q[i];
			
		}
	}

	public void createCNT(double rad, double len) {
		double peri = 2 * 22 * rad / 7;
		int radInt = (int) (peri / 0.24248);
		double x=0, y=0, z=0;
		selectedIndex = 6;
		Vector<Vector<Integer>> bondData = new Vector<Vector<Integer>>();
		peri = radInt * 0.24248;
		rad = 7* peri /44;
		
		double theta = Math.asin(0.24248/(2*rad));
		//double x1 = rad/Math.sqrt(1+(y/x)*(y/x));
		//double y1 = (y/x)*x1;
		//put((float)x, (float)y, (float)z);
		int count = 0;
		for(int j=0; z>-len ; j++){
			if(j%4 == 0 ){
				Vector<Integer> tempBondData = new Vector<Integer>();
				for(int i=0; i< radInt; i +=1){
					x = rad * Math.cos((2*theta)*i);
					y = rad * Math.sin((2*theta)*i);
					put((float)x, (float)y, (float)z);
					tempBondData.add(count);
					count++;
				}
				bondData.add(tempBondData);
				z-=0.14;
			}
			else if(j%4 == 1){
				Vector<Integer> tempBondData = new Vector<Integer>();
				for(int i=0; i< radInt; i +=1){
					x = rad * Math.cos((2*theta)*i);
					y = rad * Math.sin((2*theta)*i);
					put((float)x, (float)y, (float)z);
					tempBondData.add(count);
					count++;
				}
				bondData.add(tempBondData);
				z-=0.07;
			}
			else if(j%4 == 2){
				Vector<Integer> tempBondData = new Vector<Integer>();
				for(double i=0.5; i< radInt+0.5; i +=1){
					x = rad * Math.cos((2*theta)*i);
					y = rad * Math.sin((2*theta)*i);
					put((float)x, (float)y, (float)z);
					tempBondData.add(count);
					count++;
				}
				bondData.add(tempBondData);
				z-=0.14;
			}
			else if(j%4 == 3){
				Vector<Integer> tempBondData = new Vector<Integer>();
				for(double i=0.5; i< radInt+0.5; i +=1){
					x = rad * Math.cos((2*theta)*i);
					y = rad * Math.sin((2*theta)*i);
					put((float)x, (float)y, (float)z);
					tempBondData.add(count);
					count++;
				}
				bondData.add(tempBondData);
				z-=0.07;
			}
		}
		for(int i=0; i<bondData.size()-1; i++){
			for(int j=0; j<bondData.get(0).size(); j++){
				selectedId = bondData.get(i).get(j);
				selectedId2 = bondData.get(i+1).get(j);
				putBond(4);
				
			}
			for(int j=1; j<bondData.get(i).size(); j++){
				if(i%2==1&&i%4==1){
					selectedId = bondData.get(i).get(j);
					selectedId2 = bondData.get(i+1).get(j-1);
					putBond(4);
				}
				
			}
			for(int j=0; j<bondData.get(i).size(); j++){
				if(i%2==1&&i%4==3&&j+1<bondData.get(i+1).size()){
					selectedId = bondData.get(i).get(j);
					selectedId2 = bondData.get(i+1).get(j+1);
					putBond(4);
				}
			}
			if(i%2==1&&i%4==1){
				selectedId = bondData.get(i).get(0);
				selectedId2 = bondData.get(i+1).get(bondData.get(i+1).size()-1);
				putBond(4);
			}
			if(i%2==1&&i%4==3){
				selectedId = bondData.get(i).get(bondData.get(i+1).size()-1);
				selectedId2 = bondData.get(i+1).get(0);
				putBond(4);
			}
			
		}
		/*for(int j=0; j<bondData.get(0).size()-1; j++){
				selectedId = bondData.get(0).get(j);
				selectedId2 = bondData.get(0).get(j+1);
				putBond(4);
		}
		selectedId = bondData.get(0).get(bondData.get(0).size()-1);
		selectedId2 = bondData.get(0).get(0);
		putBond(4);*/
		
		//checkAngles();
		//checkTorsion();
		//checkInversion();
		//minimized = true;
	}
	public static void checkHybridizations(){
		int checkHybrid[] = new int[selectedMol.total];
		for(int i=0; i<selectedMol.total; i++){
			checkHybrid[i]=1;
		}
		for(int i=0; i<selectedMol.bondTotal; i++){
			if(selectedMol.bonds.get(i).strength == 3){
				checkHybrid[selectedMol.bonds.get(i).index[0]] = 3;
				checkHybrid[selectedMol.bonds.get(i).index[1]] = 3;
			}
		}
		for(int i=0; i<selectedMol.bondTotal; i++){
			if(selectedMol.bonds.get(i).strength == 2){
				if(checkHybrid[selectedMol.bonds.get(i).index[0]] !=3)
					checkHybrid[selectedMol.bonds.get(i).index[0]] = 2;
				if(checkHybrid[selectedMol.bonds.get(i).index[1]] !=3)
					checkHybrid[selectedMol.bonds.get(i).index[1]] = 2;
			}
		}
		for(int i=0; i<selectedMol.bondTotal; i++){
			if(selectedMol.bonds.get(i).strength == 4){
				if(checkHybrid[selectedMol.bonds.get(i).index[0]] !=3 && checkHybrid[selectedMol.bonds.get(i).index[0]] !=2)
					checkHybrid[selectedMol.bonds.get(i).index[0]] = 4;
				if(checkHybrid[selectedMol.bonds.get(i).index[1]] !=3 && checkHybrid[selectedMol.bonds.get(i).index[1]] !=2)
					checkHybrid[selectedMol.bonds.get(i).index[1]] = 4;
			}
		}
		int hydrogens=0;
		Atom A = null;
		for(int i=0; i<selectedMol.total; i++){
			switch(selectedMol.atoms.get(i).RFID){
				case 1:
				case 2:
				case 3:
					//hydrogen code here
					break;
				case 5:
				case 4:
					if(checkHybrid[i]==1){
						A = selectedMol.atoms.remove(i);
						Atom B = Atom.copy(allAtoms.get(3));
						B.charge = A.charge;
						B.sigma = A.sigma;
						B.maxvalency = A.maxvalency;
						B.bondedTo = A.bondedTo;
						if(B.changed)
						B.bondAngle = A.bondAngle;
						selectedMol.atoms.add(i,B);
					}
					else if(checkHybrid[i]!=1){
						A = selectedMol.atoms.remove(i);
						Atom B = Atom.copy(allAtoms.get(4));
						B.charge = A.charge;
						B.sigma = A.sigma;
						B.maxvalency = A.maxvalency;
						B.bondedTo = A.bondedTo;
						if(B.changed)
						B.bondAngle = A.bondAngle;
						selectedMol.atoms.add(i,B);
					}
					break;
				case 6:
				case 7:
				case 8:
				case 9:
					hydrogens = checkImplicitHydrogen(i);
					//System.out.println(""+hydrogens);
					if(checkHybrid[i]==1){
						A = selectedMol.atoms.remove(i);
						Atom B = Atom.copy(allAtoms.get(5));
						B.charge = A.charge;
						B.changed = A.changed;
						if(A.changed){
							B.epsilon = A.epsilon;
							B.sigma = A.sigma;		
							B.bondAngle = A.bondAngle;
						}
						else{
							switch(hydrogens){
								default:
									B.epsilon = A.epsilon;
									B.sigma = A.sigma;		
									break;
							}
						}
						B.maxvalency = A.maxvalency;
						B.minvalency = 4.0;
						B.bondedTo = A.bondedTo;
//						B.bondAngle = A.bondAngle;
						selectedMol.atoms.add(i,B);
					}
					else if(checkHybrid[i]==4){
						A = selectedMol.atoms.remove(i);
						Atom B = Atom.copy(allAtoms.get(6));
						B.charge = A.charge;
						B.changed = A.changed;
						if(A.changed){
							B.epsilon = A.epsilon;
							B.sigma = A.sigma;	
							B.bondAngle = A.bondAngle;
						}
						else{
							switch(hydrogens){
								default:
									B.epsilon = A.epsilon;
									B.sigma = A.sigma;		
									break;
							}
						}
						B.maxvalency = A.maxvalency;
						B.minvalency = 3.0;
						B.bondedTo = A.bondedTo;
//						B.bondAngle = A.bondAngle;
						selectedMol.atoms.add(i,B);
					}
					else if(checkHybrid[i]==2){
						A = selectedMol.atoms.remove(i);
						Atom B = Atom.copy(allAtoms.get(7));
						B.charge = A.charge;
						B.changed = A.changed;
						if(A.changed){
							B.epsilon = A.epsilon;
							B.sigma = A.sigma;			
							B.bondAngle = A.bondAngle;
						}
						else{
							switch(hydrogens){
								default:
									B.epsilon = A.epsilon;
									B.sigma = A.sigma;		
									break;
							}
						}
						B.maxvalency = A.maxvalency;
						B.minvalency = 3.0;
						B.bondedTo = A.bondedTo;
//						B.bondAngle = A.bondAngle;
						selectedMol.atoms.add(i,B);
					}
					else if(checkHybrid[i]==3){
						A = selectedMol.atoms.remove(i);
						Atom B = Atom.copy(allAtoms.get(8));
						B.charge = A.charge;
						B.changed = A.changed;
						
						if(A.changed){
							B.epsilon = A.epsilon;
							B.sigma = A.sigma;		
							B.bondAngle = A.bondAngle;
						}
						else{
							switch(hydrogens){
								default:
									B.epsilon = A.epsilon;
									B.sigma = A.sigma;		
									break;
							}
						}
						B.maxvalency = A.maxvalency;
						B.minvalency = 2.0;
						B.bondedTo = A.bondedTo;
//						B.bondAngle = A.bondAngle;
						selectedMol.atoms.add(i,B);
					}
					break;
				case 10:
				case 11:
				case 12:
				case 13:
					hydrogens = checkImplicitHydrogen(i);
					//System.out.println(""+hydrogens);
					if(checkHybrid[i]==1){
						A = selectedMol.atoms.remove(i);
						Atom B = Atom.copy(allAtoms.get(9));
						B.charge = A.charge;
						
						B.changed = A.changed;
						if(A.changed){
							B.epsilon = A.epsilon;
							B.sigma = A.sigma;		
							B.bondAngle = A.bondAngle;
						}
						else{
							switch(hydrogens){
								default:
									
										B.epsilon = A.epsilon;
										B.sigma = A.sigma;							
								
									break;
							}
						}
						B.maxvalency = A.maxvalency;
						B.minvalency = 3.0;
						B.bondedTo = A.bondedTo;
//						B.bondAngle = A.bondAngle;
						selectedMol.atoms.add(i,B);
					}
					else if(checkHybrid[i]==4){
						A = selectedMol.atoms.remove(i);
						Atom B = Atom.copy(allAtoms.get(10));
						B.charge = A.charge;
						B.changed = A.changed;
						if(A.changed){
							B.epsilon = A.epsilon;
							B.sigma = A.sigma;		
							B.bondAngle = A.bondAngle;
						}
						else{
							switch(hydrogens){
								
								default:
									B.epsilon = A.epsilon;
									B.sigma = A.sigma;		
									break;
							}
						}
						B.maxvalency = A.maxvalency;
						B.minvalency = 2.0;
						B.bondedTo = A.bondedTo;
//						B.bondAngle = A.bondAngle;
						selectedMol.atoms.add(i,B);
					}
					else if(checkHybrid[i]==2){
						A = selectedMol.atoms.remove(i);
						Atom B = Atom.copy(allAtoms.get(11));
						B.charge = A.charge;
						B.changed = A.changed;
						if(A.changed){
							B.epsilon = A.epsilon;
							B.sigma = A.sigma;
							B.bondAngle = A.bondAngle;
						}
						else{
							switch(hydrogens){
							
								default:
									B.epsilon = A.epsilon;
									B.sigma = A.sigma;		
									break;
							}
						}
						B.maxvalency = A.maxvalency;
						B.minvalency = 2.0;
						B.bondedTo = A.bondedTo;
//						B.bondAngle = A.bondAngle;
						selectedMol.atoms.add(i,B);
					}
					else if(checkHybrid[i]==3){
						A = selectedMol.atoms.remove(i);
						Atom B = Atom.copy(allAtoms.get(12));
						B.charge = A.charge;
						B.changed = A.changed;
						
						if(A.changed){
							B.epsilon = A.epsilon;
							B.sigma = A.sigma;
							B.bondAngle = A.bondAngle;
						}
						else{
							switch(hydrogens){
								
								default:
									B.epsilon = A.epsilon;
									B.sigma = A.sigma;		
									break;
							}
						}
						B.maxvalency = A.maxvalency;
						B.minvalency = 1.0;
						B.bondedTo = A.bondedTo;
//						B.bondAngle = A.bondAngle;
						selectedMol.atoms.add(i,B);
					}
					break;
				case 14:
				case 15:
				case 16:
				case 17:
					hydrogens = checkImplicitHydrogen(i);
					//System.out.println(""+hydrogens);
					if(checkHybrid[i]==1){
						A = selectedMol.atoms.remove(i);
						Atom B = Atom.copy(allAtoms.get(13));
						B.charge = A.charge;
						B.changed = A.changed;
						if(A.changed){
							B.epsilon = A.epsilon;
							B.sigma = A.sigma;	
							B.bondAngle = A.bondAngle;
						}
						else{
							switch(hydrogens){
								
								default:
									B.epsilon = A.epsilon;
									B.sigma = A.sigma;		
									break;
							}
						}
						B.maxvalency = A.maxvalency;
						B.minvalency = 2.0;
						B.bondedTo = A.bondedTo;
//						B.bondAngle = A.bondAngle;
						selectedMol.atoms.add(i,B);
					}
					else if(checkHybrid[i]==4){
						A = selectedMol.atoms.remove(i);
						Atom B = Atom.copy(allAtoms.get(14));
						B.charge = A.charge;
						B.changed = A.changed;
						if(A.changed){
							B.epsilon = A.epsilon;
							B.sigma = A.sigma;	
							B.bondAngle = A.bondAngle;
						}
						else{
							switch(hydrogens){
								
								default:
									B.epsilon = A.epsilon;
									B.sigma = A.sigma;		
									break;
							}
						}
						B.maxvalency = A.maxvalency;
						B.minvalency = 1.0;
						B.bondedTo = A.bondedTo;
//						B.bondAngle = A.bondAngle;
						selectedMol.atoms.add(i,B);
					}
					else if(checkHybrid[i]==2){
						A = selectedMol.atoms.remove(i);
						Atom B = Atom.copy(allAtoms.get(15));
						B.charge = A.charge;
						B.changed = A.changed;
						if(A.changed){
							B.epsilon = A.epsilon;
							B.sigma = A.sigma;	
							B.bondAngle = A.bondAngle;
						}
						else{
							switch(hydrogens){
								
								default:
									B.epsilon = A.epsilon;
									B.sigma = A.sigma;		
									break;
							}
						}
						B.maxvalency = A.maxvalency;
						B.minvalency = 1.0;
						B.bondedTo = A.bondedTo;
//						B.bondAngle = A.bondAngle;
						selectedMol.atoms.add(i,B);
					}
					else if(checkHybrid[i]==3){
						A = selectedMol.atoms.remove(i);
						Atom B = Atom.copy(allAtoms.get(16));
						B.charge = A.charge;
						B.changed = A.changed;
						if(A.changed){
							B.epsilon = A.epsilon;
							B.sigma = A.sigma;	
							B.bondAngle = A.bondAngle;
						}
						B.epsilon = A.epsilon;
						B.maxvalency = A.maxvalency;
						B.minvalency = 1.0;
						B.bondedTo = A.bondedTo;
//						B.bondAngle = A.bondAngle;
						selectedMol.atoms.add(i,B);
					}
					break;
				default:
					break;
			}
		}
	}
	private static int checkImplicitHydrogen(int selected) {
		int hydrogens = 0;
		for(int i=0; i<selectedMol.bondTotal; i++){
			Bond b = selectedMol.bonds.get(i);
			if(b.index[0]==selected){
				if(selectedMol.atoms.get(b.index[1]).RFID == 1){
					hydrogens++;
				}
			}
			else if(b.index[1]==selected){
				if(selectedMol.atoms.get(b.index[0]).RFID == 1){
					hydrogens++;
				}
			}
		}
		return hydrogens;
	}
	public static Point3d getPoint(int x, int y) {
		Point3d VworldPt = new Point3d();
		Point3d centerEyePt = new Point3d();
		// convert the canvas point to ImagePlate coords
		canvasMole.getPixelLocationInImagePlate(x, y, VworldPt);
		// transform the point from an imageplate coordinate to a Vworld
		// coordinate
		Transform3D imagePlateToVworld = new Transform3D();
		canvasMole.getImagePlateToVworld(imagePlateToVworld);
		imagePlateToVworld.transform(VworldPt);

		canvasMole.getCenterEyeInImagePlate(centerEyePt);
		imagePlateToVworld.transform(centerEyePt);
		double alpha = 0.0;
		if (VworldPt.z != centerEyePt.z) {
		alpha = centerEyePt.z / (VworldPt.z - centerEyePt.z);
		}

		Point3d planePt = new Point3d(
		centerEyePt.x - alpha * (VworldPt.x - centerEyePt.x),
		centerEyePt.y - alpha * (VworldPt.y - centerEyePt.y),
		0.0); //centerEyePt.z - beta * (VworldPt.z - centerEyePt.z )

		return planePt;
	}

	@SuppressWarnings("serial")
	public class ImagePanel extends JPanel{

	    private BufferedImage image;
	    public ImagePanel(File file) {
	       try {    
				
				image = ImageIO.read(file);
				//BufferedImage bi = new BufferedImage(image.getWidth(null), image.getHeight(null), BufferedImage.TYPE_INT_ARGB);
	       } catch (IOException ex) {
	            // handle exception...
	       }
	    }

	    public void paintComponent(Graphics g) {
	    	//g = bi.createGraphics();
	        g.drawImage(image, 0, 0,310, 170, null); // see javadoc for more info on the parameters

	    }

	}
	public static TransformGroup testSphere(){
		TransformGroup tg = new TransformGroup();
		BranchGroup moleBranch = new BranchGroup();
		TransformGroup moleTrans = createBehaviors();
		moleTrans.addChild(  createSphere(22));
		moleBranch.addChild(moleTrans);
		Vector3f temp = new Vector3f(0,0,0);
		Transform3D tempT = new Transform3D();
		tempT.setTranslation(temp);
		moleTrans.setTransform(tempT);
		tg.addChild(moleBranch);
		return tg;
	}
	/*public void initiateWiimote(Wiimote wiimote) {
		wiimote.activateMotionSensing();
		wiimote.addWiiMoteEventListeners(new WiimoteListener(){
			public void onButtonsEvent(WiimoteButtonsEvent arg0) {
				if(arg0.isButtonBHeld()){
					accl.z = 1;
				}
				else
					accl.z = 0;
			}
			public void onClassicControllerInsertedEvent(ClassicControllerInsertedEvent arg0) {}
			public void onClassicControllerRemovedEvent(ClassicControllerRemovedEvent arg0) {}
			public void onDisconnectionEvent(DisconnectionEvent arg0) {}
			public void onExpansionEvent(ExpansionEvent arg0) {}
			public void onGuitarHeroInsertedEvent(GuitarHeroInsertedEvent arg0) {}
			public void onGuitarHeroRemovedEvent(GuitarHeroRemovedEvent arg0) {}
			public void onIrEvent(IREvent arg0) {}
			public void onMotionSensingEvent(MotionSensingEvent arg0) {
				//System.out.println(""+arg0.getRawAcceleration().getX()+" "+accl.x);
				love++;
				if(accl.z == 1 ){
				if( arg0.getOrientation().getARoll()> 0){
					TransformGroup tg = new TransformGroup();
					Transform3D wiiTrans = new Transform3D();
					Transform3D rotate = new Transform3D();
					tg = uniMole.getViewingPlatform().getViewPlatformTransform();
					tg.getTransform(wiiTrans);
					rotate.rotZ(0.02);
					wiiTrans.mul(rotate);
					tg.setTransform(wiiTrans);
				}
				else{
					TransformGroup tg = new TransformGroup();
					Transform3D wiiTrans = new Transform3D();
					Transform3D rotate = new Transform3D();
					tg = uniMole.getViewingPlatform().getViewPlatformTransform();
					tg.getTransform(wiiTrans);
					rotate.rotZ(-0.02);
					wiiTrans.mul(rotate);
					tg.setTransform(wiiTrans);
				}
				
				//System.out.println(" "+arg0.getOrientation().getARoll()+" "+arg0.getOrientation().getAPitch()+" " +arg0.getOrientation().getYaw());
				}
				//accl.x = arg0.getOrientation().getARoll();
				//accl.y = arg0.getRawAcceleration().getY();
				//accl.z = arg0.getRawAcceleration().getZ();
			}
			public void onNunchukInsertedEvent(NunchukInsertedEvent arg0) {}
			public void onNunchukRemovedEvent(NunchukRemovedEvent arg0) {}
			public void onStatusEvent(StatusEvent arg0) {}			
		});
	}*/
	
	static class BondData{
		public Vector<Integer> bondedTo;
		BondData(){
			bondedTo = new Vector<Integer>();
		}
	}
}