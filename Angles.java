
public class Angles {
	public int cAtom;
	public int oAtoms[]=new int[2];
	public double angle;
	public double strength;
	public void newAngle(int c, int o1, int o2, double a, double s){
		cAtom = c;
		oAtoms[0]=o1;
		oAtoms[1]=o2;
		angle =a;
		strength =s;
	}
}