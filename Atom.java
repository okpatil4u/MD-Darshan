public class Atom {
	public String name;
	public Double mass;
	public Double charge;
	public Double sigma;
	public Double epsilon;
	public int bondedTo;
	public Double minvalency;
	public Double maxvalency;
	public Double bondLength;
	public Double bondAngle;
	public int RFID;
	public int hybridization;
	public int torsionCount;
	boolean changed=false;
	int index;

	public Atom( int rf, String n, Double m, Double c, Double s, Double e, Double v, Double bl, Double ba, int hb){
		name = n;
		mass = m;
		charge = c;
		sigma = s;
		epsilon = e;
		maxvalency = v;
		minvalency = v;
		bondLength = bl;
		bondAngle = ba;
		RFID = rf;
		bondedTo = 0;
		hybridization =  hb;
		torsionCount = 0;
	}
	public static Atom copy(Atom oldAtom){
		Atom newAtom = new Atom(oldAtom.RFID,oldAtom.name,oldAtom.mass,oldAtom.charge,oldAtom.sigma,oldAtom.epsilon, oldAtom.maxvalency,oldAtom.bondLength,oldAtom.bondAngle, oldAtom.hybridization);
		return newAtom;
	}
	public void setIndex(int i){
		index = i;
	}
}