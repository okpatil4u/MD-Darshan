
public class Bond {
	public Double length;
	public Double addLength=0.0d;
	public int[] index = new int[2] ;
	public int strength;
	public void bond(int a1, int a2, double l, int s){
		index[0]=a1;
		index[1]=a2;
		length = l;
		strength = s;
	}
}