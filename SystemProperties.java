import java.io.File;


public class SystemProperties {
	public String behavior;
	public float xx, yy, zz;
	public float temperature;
	public float pressure;
	public float cutOff;
	public float sigma, epsilon;
	public String type;
	int totalNumber;
	public void initiateNVTPeriodic(String typ, String behave, float x, float y, float z, float temp, float cutoff){
		behavior = behave;
		type = typ;
		xx = x;
		yy = y;
		zz = z;
		temperature = temp;
		cutOff = cutoff;
	}
	/*public void initiateNVTConfined(String typ, String behave, float x, float y, float z, float temp, float s, float e, float cut){
		behavior = behave;
		cutOff = cut;
		type = typ;
		xx = x; 
		yy = y;
		zz = z;
		temperature = temp;
		sigma = s;
		epsilon = e;
	}*/
	
	public void initiateNPTPeriodic(String typ, String behave, float temp, float press, float x, float y, float z, float cut){
		behavior = behave;
		type = typ;
		pressure = press;
		xx = x; 
		yy = y;
		zz = z;
		temperature = temp;
		cutOff = cut;
	}

}
