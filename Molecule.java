import java.util.Vector;
import com.sun.j3d.utils.picking.*; 
import javax.media.j3d.Transform3D;
import javax.media.j3d.TransformGroup;
import javax.vecmath.Vector3f;

public class Molecule {
	public Vector<Atom> atoms;
	public Vector<TransformGroup> moleTrans;
	public int total = 0;
	public Vector<Vector3f> vec;
	public Vector<PickCanvas> pk;
	public Vector<PickCanvas> bondPk;
	public Vector<TransformGroup> bondTrans;
	public Vector<TransformGroup> bondTrans1;
	public Vector<TransformGroup> bondTrans2;
	public int bondTotal = 0;
	public Vector<Bond> bonds;
	public Vector<Num> atomType;
	public Vector<Num> bonding;
	//public String fffile;
	public Vector<Num> rf;
	public int rfNo;
	public Vector<Num> valency;
	public Molecule(){
		atoms= new Vector<Atom>();
		moleTrans = new Vector<TransformGroup>();
		vec = new Vector<Vector3f>();
		pk = new Vector<PickCanvas>();
		bondTrans = new Vector<TransformGroup>();
		bondTrans1 = new Vector<TransformGroup>();
		bondTrans2 = new Vector<TransformGroup>();
		bonds = new Vector<Bond>();
		atomType = new Vector<Num>();
		bondPk = new Vector<PickCanvas>();
		rf = new Vector<Num>();
		valency = new Vector<Num>();
		bonding = new Vector<Num>();
		rfNo=0;
		total=0;
	}
	public void addAtom(Atom a, TransformGroup b, PickCanvas c, Vector3f temp, int type){
		Atom a1 = a;
		a1.setIndex(total);
		atoms.add(a1);
		moleTrans.add(b);
		vec.add(temp);
		pk.add(c);
		Num t = new Num();
		t.n=type;
		atomType.add(t);
		Num voila = new Num();
		voila.n = 0;
		bonding.add(voila);
		boolean yes = true;
		for(int i=0; i<rfNo; i++){
			if(rf.get(i).n==a1.RFID){
				yes = false;
			}
		}
		if(yes){
			Num nu = new Num();
			nu.n = a1.RFID;
			rf.add(nu);
			rfNo++;
		}
		total++;
	}
	public void addAtom( TransformGroup b, PickCanvas c, Vector3f temp, int type){
		moleTrans.add(b);
		vec.add(temp);
		pk.add(c);
		Num t = new Num();
		t.n=type;
		atomType.add(t);
		Num voila = new Num();
		voila.n = 0;
		bonding.add(voila);
		total++;
	}
	public void addAtom(Atom a, TransformGroup moleTransGroup, Vector3f temp, int rFID) {
		Atom a1 = a;
		a1.setIndex(total);
		atoms.add(a1);
		moleTrans.add(moleTransGroup);
		vec.add(temp);
		Num voila = new Num();
		voila.n = 0;
		bonding.add(voila);
		boolean yes = true;
		for(int i=0; i<rfNo; i++){
			if(rf.get(i).n== rFID){
				yes = false;
			}
		}
		if(yes){
			Num nu = new Num();
			nu.n = rFID;
			rf.add(nu);
			rfNo++;
		}
		total++;
	}
	public void addBond(TransformGroup b, TransformGroup b1, TransformGroup b2, int c, int d, double l, int s, PickCanvas bpk){
		bondTrans.add(b);
		bondTrans1.add(b1);
		bondTrans2.add(b2);
		Bond g = new Bond();
		g.bond(c, d, l, s);
		bonds.add(g);
		bondPk.add(bpk);
		bondTotal++;
	}
	public void addBond(TransformGroup b, TransformGroup b1, int c, int d, double l, int s){
		bondTrans.add(b);
		bondTrans1.add(b1);
		Bond g = new Bond();
		g.bond(c, d, l, s);
		bonds.add(g);
		bondTotal++;
	}
	public void addBond(TransformGroup b, int c, int d, double l, int s){
		bondTrans.add(b);
		bonding.get(c).n++;
		bonding.get(d).n++;
		Bond g = new Bond();
		g.bond(c, d, l, s);
		bonds.add(g);
		bondTotal++;
	}
	public void removeBond(int select){
		Vector3f temp = new Vector3f(100.0f,100.0f,100.0f);
		Transform3D temp1 = new Transform3D();
		temp1.setTranslation(temp);
		bondTrans.get(select).setTransform(temp1);
		bondTrans.remove(select);
		bondTrans1.get(select).setTransform(temp1);
		bondTrans1.remove(select);
		bondTrans2.get(select).setTransform(temp1);
		bondTrans2.remove(select);
		atoms.get(bonds.get(select).index[0]).bondedTo--;
		atoms.get(bonds.get(select).index[1]).bondedTo--;
		bonds.remove(select);
		bondPk.remove(select);
		bondTotal--;
	}
	public void removeAtom(int selectedId){
		this.atoms.remove(selectedId);
		bonding.remove(selectedId);
		Vector3f temp = new Vector3f(100.0f,100.0f,100.0f);
		Transform3D temp1 = new Transform3D();
		temp1.setTranslation(temp);
		moleTrans.get(selectedId).setTransform(temp1);
		moleTrans.remove(selectedId);
		vec.remove(selectedId);
		pk.remove(selectedId);
		atomType.remove(selectedId);
		for(int i=0; i<bondTotal; i++){
			if(bonds.get(i).index[0]>selectedId)
				bonds.get(i).index[0]--;
			if(bonds.get(i).index[1]>selectedId)
				bonds.get(i).index[1]--;
		}
		total--;
	}
	public void changeStrength(int selectedBondId) {
		switch(bonds.get(selectedBondId).strength){
			case 1:
				bonds.get(selectedBondId).strength=4;
				break;
			case 2:
				bonds.get(selectedBondId).strength=3;
				break;
			case 3:
				bonds.get(selectedBondId).strength=1;
				break;
			case 4:
				bonds.get(selectedBondId).strength=2;
				break;
		}
	}
	
}
