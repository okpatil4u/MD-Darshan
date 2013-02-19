import javax.media.j3d.Appearance;
import javax.media.j3d.BranchGroup;
import javax.media.j3d.LineArray;
import javax.media.j3d.Material;
import javax.media.j3d.Shape3D;
import javax.vecmath.Color3f;
import javax.vecmath.Point3d;
import javax.media.j3d.Transform3D;
import javax.vecmath.Vector3d;
import javax.vecmath.Vector3f;
import com.sun.j3d.utils.geometry.Cylinder;
import com.sun.j3d.utils.geometry.Primitive;
import com.sun.j3d.utils.geometry.Sphere;
import javax.media.j3d.TransformGroup;
import javax.media.j3d.PolygonAttributes;
import com.sun.j3d.utils.geometry.Box;
public class Region {
	static final int cube = 0, sphere = 2, cuboid = 1, cylinder = 3;
	float x = 0, y = 0 , z = 0, sizex = 0, sizey = 0, sizez = 0;
	Transform3D shape = null;
	int selected = 0;
	BranchGroup graph ;
	boolean exclude = false;
	TransformGroup tg;
	/*Region(float x, float y, float z, float size, int select){
			
			selected = select;
			graph = createBranchGroup();
			if(select == cube){
				PolygonAttributes pa=new PolygonAttributes(PolygonAttributes.POLYGON_LINE,
						PolygonAttributes.CULL_BACK, 0.0f);
				this.x = x;
				this.y = y;
				this.z = z;
				this.sizex = size;
				this.sizey = size;
				this.sizez = size;
				Appearance app = new Appearance();
				app.setPolygonAttributes(pa);
				Box sphere = new Box( size/2 , size/2 ,size/2 , app);
				
				Transform3D pos = new Transform3D();
				Vector3f poses = new Vector3f(x, y, z);
				pos.set(poses);
				tg = new TransformGroup();
				
				tg.setCapability(TransformGroup.ALLOW_TRANSFORM_WRITE);
				tg.setTransform(pos);
				tg.addChild(sphere);
				shape = pos;
				
				graph.addChild(tg);
			}
			/*else if(select == sphere){
				PolygonAttributes pa=new PolygonAttributes(PolygonAttributes.POLYGON_LINE,
						PolygonAttributes.CULL_BACK, 0.0f);
				this.x = x;
				this.y = y;
				this.z = z;
				this.sizex = size;
				this.sizey = size;
				this.sizez = size;
				Appearance app = new Appearance();
				app.setPolygonAttributes(pa);
				Sphere sphere = new Sphere( size , Primitive.GENERATE_NORMALS,20, app);
			
				Transform3D pos = new Transform3D();
				Vector3f poses = new Vector3f(x, y, z);
				pos.set(poses);
				TransformGroup tg = new TransformGroup();
				tg.setTransform(pos);
				tg.addChild(sphere);
				graph.addChild(tg);
			}
	}*/
	Region(float x, float y, float z, float sizex, float sizey, float sizez, SystemProperties sysProp, boolean xcl){
		selected = 1;
		System.out.println("Cuboid");
		graph = createBranchGroup();
		PolygonAttributes pa=new PolygonAttributes(PolygonAttributes.POLYGON_LINE,
				PolygonAttributes.CULL_BACK, 0.0f);
		this.x = x;
		this.y = y;
		this.z = z;
		this.sizex = sizex;
		this.sizey = sizey;
		this.sizez = sizez;
		Appearance app = new Appearance();
		app.setPolygonAttributes(pa);
		Box sphere = new Box( sizex *0.05f, sizey *0.05f,sizez*0.05f , app);
		
		Transform3D pos = new Transform3D();
		Vector3f poses = new Vector3f((x)*0.1f, (y)*0.1f, (z)*0.1f);
		pos.set(poses);
		tg = new TransformGroup();
		tg.setTransform(pos);
		tg.addChild(sphere);		
		shape = pos;
		graph.addChild(tg);
		exclude = xcl;
	}
	/*Region(float x, float y, float z, float rad, float length, int dir){
		selected = 2;
		graph = createBranchGroup();
		PolygonAttributes pa=new PolygonAttributes(PolygonAttributes.POLYGON_LINE,
				PolygonAttributes.CULL_BACK, 0.0f);
		
		Appearance app = new Appearance();
		app.setPolygonAttributes(pa);
		Cylinder sphere = new Cylinder(rad * 0.1f, length * 0.1f,Primitive.GENERATE_NORMALS, 10, 10, app);
	
		Transform3D pos = new Transform3D();
		Vector3f poses = new Vector3f(x, y, z);
		pos.set(poses);
		TransformGroup tg = new TransformGroup();
		
		
		if(dir == 0){
			this.x = x-rad/2;
			this.y = y-length/2;
			this.z = z-rad/2;
		}
		else if(dir == 1){
			this.x = x-length/2;
			this.y = y-rad/2;
			this.z = z-rad/2;
			Transform3D rotation = new Transform3D();
			rotation.rotZ(Math.PI/2);
			pos.mul(rotation);
			System.out.println("hi");
		}
		else if(dir == 2){
			this.x = x-rad/2;
			this.y = y-rad/2;
			this.z = z-length/2;
			Transform3D rotation = new Transform3D();
			rotation.rotX(Math.PI/2);
			pos.mul(rotation);
		}
		tg.setTransform(pos);
		tg.addChild(sphere);		
		graph.addChild(tg);
	}*/
	private BranchGroup createBranchGroup(){
		BranchGroup box = new BranchGroup();
		box.setCapability(BranchGroup.ALLOW_CHILDREN_READ);
		box.setCapability(BranchGroup.ALLOW_CHILDREN_WRITE);
		box.setCapability(BranchGroup.ALLOW_CHILDREN_EXTEND);  
		box.setCapability(BranchGroup.ALLOW_DETACH);
		return box;
	}
	public void changeShape(float x, float y, float z){
		float xscale = x/sizex;
		float yscale = y/sizey;
		float zscale = z/sizez;
		System.out.println(""+xscale+" "+yscale+" "+zscale);
		Vector3d scale = new Vector3d(xscale, yscale, zscale);
		shape.setScale(scale);
		sizex = x;
		sizey = y;
		sizez = z;
		graph.detach();
		tg.setTransform(shape);
	}
}
