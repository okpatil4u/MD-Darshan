
public class Torsion {
	public int atom[]=new int[4];
	public double forceConst;
	public double angle;
	public double periodicity;
	public void addTorsion(int a, int b, int c, int d, double k, double theta, double n){
		atom[0]=a;
		atom[1]=b;
		atom[2]=c;
		atom[3]=d;
		forceConst=k;
		angle = theta;
		periodicity = n;
	}
}