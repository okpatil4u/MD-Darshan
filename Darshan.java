import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Arrays;
import java.util.StringTokenizer;
import java.util.Vector;
import com.sun.java.swing.plaf.gtk.GTKLookAndFeel;
import javax.media.j3d.Canvas3D;
import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JCheckBoxMenuItem;
import javax.swing.JComboBox;
import javax.swing.JDesktopPane;
import javax.swing.JDialog;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JPanel;
import javax.swing.JProgressBar;
import javax.swing.JRadioButton;
import javax.swing.JSlider;
import javax.swing.JTextField;
import javax.swing.JToolBar;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
//import wiiusej.WiiUseApiManager;
//import wiiusej.Wiimote;

@SuppressWarnings("serial")
public class Darshan extends JFrame {
	static JLabel jtext;
	static JPanel mainPane;
	static JPanel toolPane;
	static JDesktopPane jdesk;
	static JFrame frame;
	static JPanel jcons;
	static String mouseMode="Select";
	static int selectedIndex=9999;
	static String file = new String("No file");
	static MoleculeBuilder mBuilder;
	static SystemBuilder sBuilder;
	static PostProcessor post;
	static Simulator simu;
	static Canvas3D canvas;
	static Darshan ab;
	static JToolBar jtool;
	//static JProgressBar bar;
	static boolean working = false;
	static String workSpace = null;
	static String ld_library_path = null;
	static Process process1 = null;
	static boolean goPost = false;
	static int height, width;
	
	public JMenuBar createMenu(){		
		JMenuBar menubar = new JMenuBar();
		JMenu jmbuild = new JMenu("Molecule");
		JMenuItem jmmol = new JMenuItem("New");
		JMenuItem jmsavem = new JMenuItem("Save");
		JMenuItem jmload = new JMenuItem("Load");	
		JMenuItem jmclosem = new JMenuItem("Close");
		JMenuItem jmexport = new JMenuItem("Export");
		JMenu jmadvanced = new JMenu("Advanced");
		JMenuItem jmcnt = new JMenuItem("Carbon Nanotube");
		//JMenuItem jmwii = new JMenuItem("Activate Wiimote");
		JMenuItem jmwiidisable = new JMenuItem("Deactivate Wiimote");
		jmwiidisable.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent arg0) {
				if(process1!= null){
					process1.destroy();
					process1 = null;
				}
			}			
		});
		/*jmwii.addActionListener(new ActionListener(){
			@SuppressWarnings("deprecation")
			public void actionPerformed(ActionEvent arg0) {
				if(mBuilder!=null){
					/*final String[] command1 = {"wminput"};
					final ProcessBuilder probuilder1 = new ProcessBuilder( command1 );
					
					
					final JDialog diawii = new JDialog();
					diawii.setTitle("Activate Wii");
					diawii.setBounds(500,250,300,150);
					diawii.setLayout(new BorderLayout());
					JPanel p1 = new JPanel(new FlowLayout());
					JPanel p2 = new JPanel();
					p2.setLayout(new GridLayout(3,2));
					JLabel lbl1 = new JLabel("          Press 1 and 2 simulateneously");
					JLabel lbl2 = new JLabel("                        then press ok");
					JButton butYes = new JButton("OK");
					JButton butNo = new JButton("Cancel");
					butYes.addActionListener(new ActionListener(){
						public void actionPerformed(ActionEvent arg0) {
							Wiimote[] wiimotes = WiiUseApiManager.getWiimotes(1, true);
							if(wiimotes.length != 0){
							
								diawii.dispose();
								mBuilder.initiateWiimote(wiimotes[0]);
							}															
						}							
					});
					butNo.addActionListener(new ActionListener(){
						public void actionPerformed(ActionEvent arg0) {
							diawii.dispose();
						}						
					});
					p1.add(butYes);
					p1.add(butNo);
					p2.add(lbl1);
					p2.add(lbl2);
					diawii.add(p2, BorderLayout.CENTER);
					diawii.add(p1, BorderLayout.SOUTH);
					diawii.show();
				}
			}			
		});*/
		
		jmadvanced.add(jmcnt);
		//jmadvanced.add(jmwii);
		//jmadvanced.add(jmwiidisable);
		//JMenuItem jmcut = new JMenuItem("Cut");
		//JMenuItem jmcopy = new JMenuItem("Copy");
		//JMenuItem jmpaste = new JMenuItem("Paste");
		//JMenuItem jmdel = new JMenuItem("Delete");
		//JMenuItem jmbond = new JMenuItem("Specify Bond");
		//JMenuItem jmangle = new JMenuItem("Specify Angle");
		jmcnt.addActionListener(new ActionListener(){
			@SuppressWarnings("deprecation")
			public void actionPerformed(ActionEvent arg0) {
				if(mBuilder!=null){
				final JDialog diacnt = new JDialog();
				diacnt.setTitle("Carbon Nanotube Setup");
				diacnt.setBounds(500,250,300,150);
				diacnt.setLayout(new BorderLayout());
				JPanel p1 = new JPanel(new FlowLayout());
				JPanel p2 = new JPanel();
				p2.setLayout(new GridLayout(3,2));
				JLabel lbl1 = new JLabel("Radius (Ang)");
				JLabel lbl2 = new JLabel("Length (Ang)");
				final JTextField txtRad = new JTextField("10");
				final JTextField txtLen = new JTextField("40");
				JButton butYes = new JButton("OK");
				JButton butNo = new JButton("Cancel");
				butYes.addActionListener(new ActionListener(){
					public void actionPerformed(ActionEvent arg0) {
						diacnt.dispose();
						jtext.setText("Please Wait While Structure is analyzed");
						try{
							mBuilder.createCNT(Double.parseDouble(txtRad.getText()) * 0.1, Double.parseDouble(txtLen.getText()) * 0.1);									
					
						}catch(NumberFormatException e){
								jtext.setText("Wrong Input");
						}
						}
				});
				butNo.addActionListener(new ActionListener(){
					public void actionPerformed(ActionEvent arg0) {
						diacnt.dispose();
					}						
				});
				p1.add(butYes);
				p1.add(butNo);
				p2.add(lbl1);
				p2.add(txtRad);
				p2.add(lbl2);
				p2.add(txtLen);
				diacnt.add(p2, BorderLayout.CENTER);
				diacnt.add(p1, BorderLayout.SOUTH);
				diacnt.show();
			}		
			}
		});
		jmmol.addActionListener(new ActionListener(){
			@SuppressWarnings("static-access")
			public void actionPerformed(ActionEvent arg0) {
				if(mBuilder!= null){
					jtext.setText("Clear");
						mBuilder.askMoleSave("Clear");						
				}
				else if(sBuilder!= null){
						sBuilder.askSysSave("Clear");
				}
				else if(post!= null){
					post.clear();
					if(post!= null)
						post = null;
				}
				if(!working)
					newMolWnd();
							
			}
		});
		jmclosem.addActionListener(new ActionListener(){
			@SuppressWarnings("static-access")
			public void actionPerformed(ActionEvent arg0) {
				if(mBuilder!=null){
					mBuilder.askMoleSave("Clear");
				}
			}
			
		});
		jmsavem.addActionListener(new ActionListener(){
			@SuppressWarnings("static-access")
			public void actionPerformed(ActionEvent arg0){
				if(mBuilder!=null){
					if(mBuilder.selectedMol!=null)
						mBuilder.askMoleSave("Save");
				}
			}
		});
		jmload.addActionListener(new ActionListener(){
			@SuppressWarnings({ "static-access" })
			public void actionPerformed(ActionEvent arg0) {
				if(mBuilder!=null){
					mBuilder.askMoleSave("Clear");					
				}
				else{
					loadMol();
				}
			}
		});
		jmexport.addActionListener(new ActionListener(){
			@SuppressWarnings("static-access")
			public void actionPerformed(ActionEvent arg0) {
				if(mBuilder!=null){
					if((mBuilder.selectedMol!=null)&&(mBuilder.minimized))
						mBuilder.askMoleSave("Export");
					else
						jtext.setText("Optimize the molecular structure before exporting");
				}
			}
			
		});
		jmbuild.add(jmmol);
		jmbuild.addSeparator();
		jmbuild.add(jmload);
		jmbuild.add(jmsavem);
		jmbuild.add(jmexport);
		jmbuild.addSeparator();
		jmbuild.add(jmadvanced);
		jmbuild.addSeparator();
		jmbuild.add(jmclosem);
		//jmbuild.addSeparator();
		//jmbuild.add(jmcut);
		//jmbuild.add(jmcopy);
		//jmbuild.add(jmpaste);
		//jmbuild.add(jmdel);
		menubar.add(jmbuild);
		
		JMenu jfile = new JMenu("System");
		JMenuItem jmnew = new JMenuItem("New");
		JMenuItem jmopen = new JMenuItem("Load");
		JMenuItem jmclose = new JMenuItem("Close");
		//JMenu jmrun = new JMenu("Run");
		//JMenuItem jmsim = new JMenuItem("Simulation");
		//JMenuItem jmopt = new JMenuItem("Optimization");
		//JMenuItem jmimport = new JMenuItem("Import");
		JMenuItem jmsave = new JMenuItem("Save");
		JMenuItem jmexit = new JMenuItem("Exit");
		jmexit.addActionListener(new ActionListener(){
			@SuppressWarnings("static-access")
			public void actionPerformed(ActionEvent arg0) {
				if(sBuilder!=null){
					sBuilder.askSysSave("Exit");				
				}
				else if(mBuilder!=null){
						mBuilder.askMoleSave("Exit");
				}
				else if(post!= null){
					post.clear();
					if(post!= null)
						post = null;
				}
				if(!working)
					System.exit(0);
			}
		});
		jmopen.addActionListener(new ActionListener(){
			@SuppressWarnings("static-access")
			public void actionPerformed(ActionEvent arg0) {
				if(sBuilder!=null){
						sBuilder.askSysSave("Clear");
						if(sBuilder == null){
							loadSys();
						}
				}
				else if(mBuilder!=null){
						mBuilder.askMoleSave("Clear");
						if(mBuilder == null){
							loadSys();
						}
				}
				else if(post!= null){
					post.clear();
					if(post!= null)
						post = null;
				}
				if(!working)
					loadSys();
				
			}
		});
		jmnew.addActionListener(new ActionListener(){
			@SuppressWarnings("static-access")
			public void actionPerformed(ActionEvent arg0) {
				if(mBuilder!= null){
					mBuilder.askMoleSave("Clear");
					if(mBuilder == null){
						newSysWnd();
					}
				}
				else if(sBuilder!= null){
					sBuilder.askSysSave("Clear");	
					if(sBuilder == null){
						newSysWnd();
					}
				}
				else if(post!= null){
					post.clear();
					if(post!= null)
						post = null;
				}
				if(!working)
					newSysWnd();
								
			}
		});
		jmclose.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent arg0) {
				if(sBuilder!= null){
						sBuilder.askSysSave("Clear");
				}
			}
		});
		jmsave.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent arg0) {
				if(sBuilder!= null){
						sBuilder.askSysSave("Save");
				}
			}
		});
		/*jmsim.addActionListener(new ActionListener(){
			@SuppressWarnings("static-access")
			public void actionPerformed(ActionEvent arg0) {
				if(sBuilder!= null)
					if(!sBuilder.kaamChalu){
					sBuilder.setSimWnd();
					}
			}			
		});*/
		//jmrun.add(jmopt);
		//jmrun.add(jmsim);
		//
		/*jmimport.addActionListener(new ActionListener(){
			@SuppressWarnings("static-access")
			public void actionPerformed(ActionEvent arg0) {
				if(mBuilder!= null){
					mBuilder.askMoleSave("Clear");
					if(mBuilder == null){
						importSys();
					}
				}
				if(sBuilder!= null){
					sBuilder.askSysSave("Clear");	
					if(sBuilder == null){
						importSys();
					}
				}
				else{
					importSys();
				}	
			}

			private void importSys() {
				
				
			}
		});*/
		jfile.add(jmnew);
		jfile.add(jmsave);
		jfile.addSeparator();
		//jfile.add(jmrun);
		//jfile.addSeparator();
		jfile.add(jmopen);		
		jfile.add(jmclose);	
		jfile.addSeparator();
		//jfile.add(jmimport);
		
		jfile.add(jmexit);
		menubar.add(jfile);
		/*JMenu jmSim = new JMenu("Simulator");
		JMenuItem jmsaveS = new JMenuItem("Save");
		JMenuItem jmloadS = new JMenuItem("Load");		
		JMenuItem jmupdateS = new JMenuItem("Update");
		//JMenuItem jmcut = new JMenuItem("Cut");
		//JMenuItem jmcopy = new JMenuItem("Copy");
		//JMenuItem jmpaste = new JMenuItem("Paste");
		//JMenuItem jmdel = new JMenuItem("Delete");
		//JMenuItem jmbond = new JMenuItem("Specify Bond");
		//JMenuItem jmangle = new JMenuItem("Specify Angle");
		jmsaveS.addActionListener(new ActionListener(){
			@SuppressWarnings("static-access")
			public void actionPerformed(ActionEvent arg0){
				if(simu!=null){
					if(!simu.mole.isEmpty())
						simu.askMoleSave("Save");
				}
			}
		});
		jmloadS.addActionListener(new ActionListener(){
			@SuppressWarnings({ "static-access" })
			public void actionPerformed(ActionEvent arg0) {
				if(mBuilder!=null){
						mBuilder.askMoleSave("Exit");					
				}
				else if(sBuilder!=null){
						sBuilder.askSysSave("Exit");					
				}
				else{
					loadSim();
				}
			}
		});
		jmupdateS.addActionListener(new ActionListener(){
			@SuppressWarnings("static-access")
			public void actionPerformed(ActionEvent arg0) {
				if(simu!=null){
					if(!simu.mole.isEmpty())
						simu.loadCords();
				}
			}
			
		});
		jmSim.add(jmloadS);
		jmSim.add(jmsaveS);
		jmSim.add(jmupdateS);
		//jmbuild.add(jmrepl);
		//jmbuild.addSeparator();
		//jmbuild.add(jmcut);
		//jmbuild.add(jmcopy);
		//jmbuild.add(jmpaste);
		//jmbuild.add(jmdel);
		menubar.add(jmSim);
		*/
		
		JMenu jmpost = new JMenu("Post-Processor");
		JMenuItem jmloadCase = new JMenuItem("Load Case");
		JMenuItem jmcloseCase = new JMenuItem("Close");
		
		jmloadCase.addActionListener(new ActionListener(){
			@SuppressWarnings("static-access")
			public void actionPerformed(ActionEvent arg0) {
				if(mBuilder!= null){
					mBuilder.askMoleSave("Clear");
				}
				else if(sBuilder!= null){
					sBuilder.askSysSave("Clear");	
				}
				else if(post != null){
					post.clear();
				}
				if(!working)
					loadPost();
			}			
		});
		jmcloseCase.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent arg0) {
				if(post!= null){
					post.clear();
					if(post!= null)
						post = null;
				}
			}			
		});
		jmpost.add(jmloadCase);
		jmpost.add(jmcloseCase);
		menubar.add(jmpost);
		
		JMenu jmSettings = new JMenu("Settings");
		JMenuItem jmWorkspace = new JMenuItem("Workspace");
		jmWorkspace.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent arg0) {
				final JFrame defaultSettings = new JFrame();
				defaultSettings.setTitle("Set Default Workspace");
				defaultSettings.setBounds(400, 150, 340, 200);
				defaultSettings.setLayout(new BorderLayout());
				defaultSettings.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
				JPanel simPanel = new JPanel(new GridBagLayout());
				
				JPanel buttonPanel = new JPanel(new FlowLayout());
				JLabel folder = new JLabel("Select Directory");
				final JButton selectFolder = new JButton("...");
				selectFolder.addActionListener(new ActionListener(){
					public void actionPerformed(ActionEvent arg0) {
						JFileChooser folder = new JFileChooser();
						folder.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
						int f = folder.showSaveDialog(ab);
						if(f==JFileChooser.APPROVE_OPTION){
							String save = folder.getSelectedFile().getPath();
							selectFolder.setText(save);
						}
					}				
				});
				JLabel jcuda = new JLabel("Select Cuda Directory");
				final JButton selectCuda = new JButton("...");
				selectCuda.addActionListener(new ActionListener(){
					public void actionPerformed(ActionEvent arg0) {
						JFileChooser folder = new JFileChooser();
						folder.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
						int f = folder.showSaveDialog(ab);
						if(f==JFileChooser.APPROVE_OPTION){
							String save = folder.getSelectedFile().getPath();
							selectCuda.setText(save);
						}
					}				
				});
				simPanel.add(folder, new GBC(0,0,1,1).setFill(GBC.BOTH).setWeight(100, 0).setInsets(5));
				simPanel.add(selectFolder, new GBC(1,0,1,1).setFill(GBC.BOTH).setWeight(100, 0).setInsets(5));
				simPanel.add(jcuda, new GBC(0,1,1,1).setFill(GBC.BOTH).setWeight(100, 0).setInsets(5));
				simPanel.add(selectCuda, new GBC(1,1,1,1).setFill(GBC.BOTH).setWeight(100, 0).setInsets(5));
				JButton ok = new JButton("Ok");
				JButton cancel = new JButton("Cancel");
				
				ok.addActionListener(new ActionListener(){
					public void actionPerformed(ActionEvent arg0) {
						File checkFile = new File(selectFolder.getText());
						if(checkFile.isDirectory()){
							try {
								FileWriter writer = new FileWriter("default.txt");
								writer.write(selectFolder.getText());
								if(!selectCuda.getText().contains("..."))
								writer.write("\n"+selectCuda.getText());
								writer.close();
								defaultSettings.dispose();
			//					System.out.println("System path is set, please restart");
			//					System.exit(0);
							} catch (IOException e) {
								jtext.setText("IO Error");
							}
						}
					}
				});
				cancel.addActionListener(new ActionListener(){
					public void actionPerformed(ActionEvent arg0) {
						defaultSettings.dispose();
						System.exit(0);
					}				
				});
				buttonPanel.add(ok);
				buttonPanel.add(cancel);
				simPanel.add(buttonPanel, new GBC(0,2, 2, 2).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(5));
				defaultSettings.add(simPanel, BorderLayout.CENTER);
				defaultSettings.setVisible(true);
			}			
		});
		
		jmSettings.add(jmWorkspace);
		menubar.add(jmSettings);
		
		JMenu jmana = new JMenu("Analyze");
		JMenu jmene= new JMenu("Energy");
		JMenuItem jmpe= new JMenuItem("Potential Energy");
		JMenuItem jmke= new JMenuItem("Kinetic Energy");
		jmene.add(jmpe);
		jmene.add(jmke);
		JMenuItem jmp= new JMenuItem("Pressure");
		JMenuItem jmt= new JMenuItem("Temperature");
		JMenuItem jmrdf = new JMenuItem("Radial Distribution Function");
		JMenu jmtp = new JMenu("Transport Coefficients");
		JMenuItem jmd = new JMenuItem("Diffusion Coefficient");
		JMenuItem jmk = new JMenuItem("Thermal Conductivity");
		JMenuItem jmv = new JMenuItem("Molecular Viscosity");
		jmtp.add(jmd);
		jmtp.add(jmk);
		jmtp.add(jmv);
		jmana.add(jmrdf);
		jmana.add(jmene);
		jmana.add(jmp);
		jmana.add(jmt);
		jmana.add(jmtp);
		//menubar.add(jmana);

		JMenu jmwindow = new JMenu("Window");
		JCheckBoxMenuItem jmgraph = new JCheckBoxMenuItem("System");
		JCheckBoxMenuItem jmcons = new JCheckBoxMenuItem("Console");
		JCheckBoxMenuItem jmmoltkt = new JCheckBoxMenuItem("Molecular Toolkit");
		jmwindow.add(jmgraph);
		jmwindow.add(jmcons);
		jmwindow.add(jmmoltkt);
		//menubar.add(jmwindow);
		
		JMenu jmhelp = new JMenu("Help");
		JMenuItem jmcontents = new JMenuItem("Contents");
		JMenuItem jmabout = new JMenuItem("About");
		jmabout.addActionListener(new ActionListener(){
			@SuppressWarnings("deprecation")
			public void actionPerformed(ActionEvent arg0) {
				final JDialog diaSaveSys = new JDialog(frame,"About");
				diaSaveSys.setLayout(new BorderLayout());
				diaSaveSys.setBounds(500,250,300,200);
				JPanel p1 = new JPanel();
				JPanel p2 = new JPanel();
				p2.setLayout(new GridLayout(2,1));
				Container contSaveSys = diaSaveSys.getContentPane();
				contSaveSys.setLayout(new GridLayout(2,1));
				JLabel lbl1 = new JLabel("This software is property of");
				JLabel lbl2 = new JLabel("Inkilab Technology Private Ltd.");
				JButton butYes = new JButton("OK");
				butYes.addActionListener(new ActionListener(){
					public void actionPerformed(ActionEvent arg0) {
						diaSaveSys.dispose();
					}							
				});
				p1.add(butYes);
				p2.add(lbl1);
				p2.add(lbl2);
				diaSaveSys.add(p2, BorderLayout.CENTER);
				diaSaveSys.add(p1, BorderLayout.SOUTH);
				diaSaveSys.show();
			}
		});
		jmhelp.add(jmcontents);
		jmhelp.add(jmabout);
		menubar.add(jmhelp);
		
		return menubar;
	}
	public void sysCons(){
		jcons = new JPanel(new GridBagLayout());
		//bar = new JProgressBar();
		//bar.setMaximum(0);
		//bar.setMaximum(100);
		//bar.setValue(0);
		jtext = new JLabel();
		jcons.add(jtext, new GBC(0,0,1,1).setFill(GBC.VERTICAL).setWeight(100, 0).setAnchor(GBC.NORTH));
		//jcons.add(bar, new GBC(1,0,1,1).setFill(GBC.VERTICAL).setWeight(100, 0).setAnchor(GBC.CENTER));
		jtext.setText("MD Darshan vBeta initiated...");
		//jcons.setBounds(0, 650, 1366, 20);
		jcons.setBounds(0, (int)((int)height/1.181538462), width, 20);
	}
	public void loadPost(){
		final JDialog diacnt = new JDialog();
		diacnt.setTitle("Choose Files");
		diacnt.setBounds(500,250,300,150);
		diacnt.setLayout(new BorderLayout());
		JPanel p1 = new JPanel(new FlowLayout());
		JPanel p2 = new JPanel();
		p2.setLayout(new GridLayout(3,2));
		JLabel lbl1 = new JLabel("Case File");
		JLabel lbl2 = new JLabel("Data File");
		final JButton bcase = new JButton("..");
		final JButton bdata = new JButton("..");
		
		
		bcase.addActionListener(new ActionListener(){
			@SuppressWarnings("static-access")
			public void actionPerformed(ActionEvent arg0) {
				JFileChooser jfc = new JFileChooser();
				jfc.setCurrentDirectory(new File(workSpace));
				int works = jfc.showOpenDialog(frame);
				
				if(works == JFileChooser.APPROVE_OPTION){
					File file = jfc.getSelectedFile();
					if(file.canRead()){
						goPost = false;
						BufferedReader in;
						try {
							in = new BufferedReader(new FileReader(file));
							if(Integer.parseInt(in.readLine())==25011989){
								PostProcessor p1 = new PostProcessor();
								if(p1.initializePostProcessor(ab, file)){
									post = p1;
									bcase.setText(""+post.caseFile.getName());
									post.go();
								}								
								in.close();					
							}
							else{
								jtext.setText("Invalid File");
							}
						} catch (FileNotFoundException e) {
							jtext.setText("File Not Found");
						}  catch (IOException e) {
							jtext.setText("IO error");
						}
					}
				}
			}			
		});
		
		bdata.addActionListener(new ActionListener(){
			@SuppressWarnings({ "static-access" })
			public void actionPerformed(ActionEvent e) {
				if(post != null){
					JFileChooser jfc = new JFileChooser();
					jfc.setCurrentDirectory(new File(ab.workSpace));
					int totalNo = 0;
					for(int i=0; i<post.noC; i++){
					
						totalNo += post.molecules[i].atomNo * post.moleNumber[i];
					}
					
					int f = jfc.showOpenDialog(ab);
				
					if(f == JFileChooser.APPROVE_OPTION){
						File filename = jfc.getSelectedFile();
						
						try {
							BufferedReader input =  new BufferedReader(new FileReader(filename));
							int number= Integer.parseInt(input.readLine());
							
							//System.out.println(""+number+" "+totalNo);
							if(number == totalNo){
								post.dataFile = filename;
								bdata.setText(""+filename.getName());
								goPost = true;
							}
							else{
								goPost = false;
								jtext.setText("Data file does not match with given case file");
							}
							input.close();
						} catch (FileNotFoundException e1) {
							goPost = false;
							jtext.setText("File Not Found");
						}catch (NumberFormatException e1) {
							goPost = false;
							jtext.setText("Invalid File");
						} catch (IOException e1) {
							goPost = false;
							jtext.setText("IO Error");
						}						
					}
				}
				else{
					jtext.setText("Choose a valid case file first");
				}
			}			
		});
		JButton butYes = new JButton("OK");
		JButton butNo = new JButton("Cancel");
		butYes.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent arg0) {
				if(post!=null && goPost){
					diacnt.dispose();
					jtext.setText("Loading");
					post.loadVisualizer();					
				}
			}							
		});
		butNo.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent arg0) {
				diacnt.dispose();
			}						
		});
		p1.add(butYes);
		p1.add(butNo);
		p2.add(lbl1);
		p2.add(bcase);
		p2.add(lbl2);
		p2.add(bdata);
		diacnt.add(p2, BorderLayout.CENTER);
		diacnt.add(p1, BorderLayout.SOUTH);
		diacnt.setVisible(true);
		
		
	}
	@SuppressWarnings("static-access")
	public void loadMol(){
		JFileChooser jfc = new JFileChooser();
		jfc.setCurrentDirectory(new File(ab.workSpace));
		
		
		int f = jfc.showOpenDialog(frame);
		if(f == JFileChooser.APPROVE_OPTION){
			File file = jfc.getSelectedFile();
			
			try {
				mBuilder=null;
				//jtext.setText(file.toString());
				BufferedReader  in = new BufferedReader(new FileReader(file));
				
				String export =in.readLine();
				double v=Double.parseDouble(export);
				if(v!=28031986){
					jtext.setText("Invalid File");
					return;
				}
				String ffFile= "dreiding.abat";
				mBuilder = new MoleculeBuilder();
				mBuilder.initiateMoleculeBuilder(ab,ffFile);
				BufferedReader  ff = new BufferedReader(new FileReader(ffFile));
				jtext.setText(ff.toString());
				while(ff.ready()){
					String sf = ff.readLine();
					StringTokenizer sf1 = new StringTokenizer(sf);
					Atom a = new Atom(Integer.parseInt(sf1.nextToken()),sf1.nextToken(),Double.parseDouble(sf1.nextToken()),Double.parseDouble(sf1.nextToken()),Double.parseDouble(sf1.nextToken()),Double.parseDouble(sf1.nextToken()),Double.parseDouble(sf1.nextToken()),Double.parseDouble(sf1.nextToken()),Double.parseDouble(sf1.nextToken()), Integer.parseInt(sf1.nextToken()));
					mBuilder.allAtoms.add(a);
					mBuilder.atomToCheck++;
				}
				if(!mBuilder.allAtoms.isEmpty()){
					if(sBuilder!=null){
						sBuilder.askSysSave("Exit");
						if(sBuilder == null){
							mBuilder.setMolToolKit(mBuilder.atomToCheck);
							int noAtoms = Integer.parseInt(in.readLine());
							jtext.setText("\n"+noAtoms);
							for(int i=0;i<noAtoms;i++){
								String s = in.readLine();
								
								StringTokenizer st = new StringTokenizer(s);
								
								int rf = Integer.parseInt(st.nextToken());
								//jtext.setText("\n"+rf);
								for(int j=0;j<mBuilder.atomToCheck;j++){
									if(rf==mBuilder.allAtoms.get(j).RFID){
										mBuilder.selectedIndex=j;
										Atom a = new Atom(Integer.parseInt(st.nextToken()), st.nextToken(), Double.parseDouble(st.nextToken()),Double.parseDouble(st.nextToken()),Double.parseDouble(st.nextToken()),Double.parseDouble(st.nextToken()),Double.parseDouble(st.nextToken()),Double.parseDouble(st.nextToken()),Double.parseDouble(st.nextToken()),Integer.parseInt(st.nextToken()));
										mBuilder.put((float)(Float.parseFloat(st.nextToken())*0.1),(float) (Float.parseFloat(st.nextToken())*0.1), (float)(Float.parseFloat(st.nextToken())*0.1));
										mBuilder.selectedMol.atoms.get(mBuilder.selectedMol.total - 1).RFID = a.RFID;
										mBuilder.selectedMol.atoms.get(mBuilder.selectedMol.total - 1).name = a.name;
										mBuilder.selectedMol.atoms.get(mBuilder.selectedMol.total - 1).mass = a.mass;
										mBuilder.selectedMol.atoms.get(mBuilder.selectedMol.total - 1).sigma = a.sigma;
										mBuilder.selectedMol.atoms.get(mBuilder.selectedMol.total - 1).epsilon = a.epsilon;
										mBuilder.selectedMol.atoms.get(mBuilder.selectedMol.total - 1).charge = a.charge;
										mBuilder.selectedMol.atoms.get(mBuilder.selectedMol.total - 1).bondLength = a.bondLength;
										mBuilder.selectedMol.atoms.get(mBuilder.selectedMol.total - 1).bondAngle = a.bondAngle;
										mBuilder.selectedMol.atoms.get(mBuilder.selectedMol.total - 1).hybridization = a.hybridization;
									}
								}
							}
							int noBonds = Integer.parseInt(in.readLine());
							for(int i=0;i<noBonds;i++){
								String s = in.readLine();
								StringTokenizer st = new StringTokenizer(s);
								mBuilder.selectedId=Integer.parseInt(st.nextToken());
								mBuilder.selectedId2=Integer.parseInt(st.nextToken());
								int tempStrength = Integer.parseInt(st.nextToken());
								double addLength = Double.parseDouble(st.nextToken());
								mBuilder.putBond(tempStrength);
								mBuilder.selectedMol.bonds.get(mBuilder.selectedMol.bondTotal).addLength = addLength;
							}
						}
					}
					else{
						mBuilder.setMolToolKit(mBuilder.atomToCheck);
						int noAtoms = Integer.parseInt(in.readLine());
						jtext.setText("\n"+noAtoms);
						for(int i=0;i<noAtoms;i++){
							String s = in.readLine();
							
							StringTokenizer st = new StringTokenizer(s);
							
							int rf = Integer.parseInt(st.nextToken());
							//jtext.setText("\n"+rf);
							for(int j=0;j<mBuilder.atomToCheck;j++){
								if(rf==mBuilder.allAtoms.get(j).RFID){
									mBuilder.selectedIndex=j;
									Atom a = new Atom(rf, st.nextToken(), Double.parseDouble(st.nextToken()),Double.parseDouble(st.nextToken()),Double.parseDouble(st.nextToken()),Double.parseDouble(st.nextToken()),Double.parseDouble(st.nextToken()),Double.parseDouble(st.nextToken()),Double.parseDouble(st.nextToken()),Integer.parseInt(st.nextToken()));
									mBuilder.put((float)(Float.parseFloat(st.nextToken())*0.1),(float) (Float.parseFloat(st.nextToken())*0.1), (float)(Float.parseFloat(st.nextToken())*0.1));
									mBuilder.selectedMol.atoms.get(mBuilder.selectedMol.total - 1).RFID = a.RFID;
									mBuilder.selectedMol.atoms.get(mBuilder.selectedMol.total - 1).name = a.name;
									mBuilder.selectedMol.atoms.get(mBuilder.selectedMol.total - 1).mass = a.mass;
									mBuilder.selectedMol.atoms.get(mBuilder.selectedMol.total - 1).sigma = a.sigma;
									mBuilder.selectedMol.atoms.get(mBuilder.selectedMol.total - 1).epsilon = a.epsilon;
									mBuilder.selectedMol.atoms.get(mBuilder.selectedMol.total - 1).charge = a.charge;
									mBuilder.selectedMol.atoms.get(mBuilder.selectedMol.total - 1).bondLength = a.bondLength;
									mBuilder.selectedMol.atoms.get(mBuilder.selectedMol.total - 1).bondAngle = a.bondAngle;
									mBuilder.selectedMol.atoms.get(mBuilder.selectedMol.total - 1).hybridization = a.hybridization;
								}
							}
						}
						int noBonds = Integer.parseInt(in.readLine());
						for(int i=0;i<noBonds;i++){
							String s = in.readLine();
							StringTokenizer st = new StringTokenizer(s);
							mBuilder.selectedId=Integer.parseInt(st.nextToken());
							mBuilder.selectedId2=Integer.parseInt(st.nextToken());
							int tempStrength = Integer.parseInt(st.nextToken());
							double addLength = Double.parseDouble(st.nextToken());
							mBuilder.putBond(tempStrength);
							mBuilder.selectedMol.bonds.get(mBuilder.selectedMol.bondTotal-1).addLength = addLength;
						}
					}
				}
			} catch (IOException e) {jtext.setText("\nError : Cannot read file");}
		} 
		
	}
	public void loadSys(){
		
		JFileChooser jfc = new JFileChooser();
		jfc.setCurrentDirectory(new File(workSpace));
		int works = jfc.showOpenDialog(frame);
		
		if(works == JFileChooser.APPROVE_OPTION){
			File file = jfc.getSelectedFile();
			if(file.canRead()){
				BufferedReader in;
				try {
					in = new BufferedReader(new FileReader(file));
					if(Integer.parseInt(in.readLine())==28041986){
						
						int noC = Integer.parseInt(in.readLine());
						float temp = Float.parseFloat(in.readLine());
						int behavior = Integer.parseInt(in.readLine());
						float sizex=0, sizey=0, sizez=0, press=0;
						if(behavior == 0){
							sizex = Float.parseFloat(in.readLine());
							sizey = Float.parseFloat(in.readLine());
							sizez = Float.parseFloat(in.readLine());
						}
						else if(behavior == 1){
							press = Float.parseFloat(in.readLine());
							sizex = Float.parseFloat(in.readLine());
							sizey = Float.parseFloat(in.readLine());
							sizez = Float.parseFloat(in.readLine());
						}
						int cutOffType = Integer.parseInt(in.readLine());
						float cutOff = Float.parseFloat(in.readLine());
						
						SystemProperties sysProp = new SystemProperties();
						if(behavior == 0 && cutOffType == 0){
							sysProp.initiateNVTPeriodic("NVT","Periodic", temp, sizex,  sizey,   sizez, cutOff);
						}
						else if(behavior == 0 && cutOffType == 1){
							sysProp.initiateNVTPeriodic("NVT","Periodic-Ewald", temp, sizex,  sizey,   sizez, cutOff);
						}
						else if(behavior == 1 && cutOffType == 0){
							sysProp.initiateNPTPeriodic("NPT","Periodic", temp, press, sizex,  sizey,   sizez, cutOff);
						}
						else if(behavior == 1 && cutOffType == 1){
							sysProp.initiateNPTPeriodic("NPT","Periodic-Ewald", temp, press, sizex,  sizey,   sizez, cutOff);
						}
						sBuilder = new SystemBuilder();
						sBuilder.initiateSystemBuilder(ab, sysProp);
						sBuilder.loadSystem(in, noC);
						in.close();					
					}
					else{
						jtext.setText("Invalid File");
					}
				} catch (FileNotFoundException e) {
					jtext.setText("File Not Found");
				} catch (NumberFormatException e) {
					jtext.setText("Invalid File");
				} catch (IOException e) {
					jtext.setText("IO error");
				}
			}
		}
	}
	public void waiting (double d){
        long t0, t1;
        t0 =  System.currentTimeMillis();
        do{
            t1 = System.currentTimeMillis();
        }
        while ((t1 - t0) < (d * 1000));
    }
	/*public void newMolWnd(){
			final JFrame newMol = new JFrame("New Molecule Setup");
			newMol.setBounds(400, 150, 300, 200);
			newMol.setVisible(true);
			newMol.setLayout(new GridLayout(2,2));
			newMol.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		
			JPanel p1,p2,p5;
			ButtonGroup bgen = new ButtonGroup();
			p1 = new JPanel(new FlowLayout());
			p2 = new JPanel(new GridLayout(2,1));
			p5 = new JPanel(new FlowLayout());
		
			final JRadioButton ctip3p = new JRadioButton("Tip3p");
			final JRadioButton cdrdng = new JRadioButton("Drieding");
			bgen.add(cdrdng);
			bgen.add(ctip3p);
		
			JButton butCreate = new JButton("Create");
			JButton butCancel = new JButton("Cancel");
			
			p1.add(new JLabel("Force Fields    "));
			p2.add(ctip3p);
			p2.add(cdrdng);
			p1.add(p2);	
		
			p5.add(butCreate);
			p5.add(butCancel);
		
		
			butCancel.addActionListener(new ActionListener(){
				public void actionPerformed(ActionEvent arg0) {
					newMol.dispose();
				}			
			});
			butCreate.addActionListener(new ActionListener(){
				public void actionPerformed(ActionEvent e) {
					if(cdrdng.isSelected()){
						newMol.dispose();
						chooseAtoms("dreiding.abat");
					}	
					else if(ctip3p.isSelected()){
						newMol.dispose();
						chooseAtoms("tip3p.abat");
					}
				}			
			});
			newMol.add(p1);
			newMol.add(p5);
	}*/
	public void newMolWnd(){
		chooseAtoms("dreiding.abat");
	}
	@SuppressWarnings("static-access")
	public void chooseAtoms(String state){
			final String ffFile = state;
			jtext.setText(state);
			try {
				mBuilder=null;
				mBuilder = new MoleculeBuilder();
				mBuilder.initiateMoleculeBuilder(ab, ffFile);
				BufferedReader  in1 = new BufferedReader(new FileReader(ffFile));
				int sb=0;
				while(in1.ready()){
					String s = in1.readLine();
					StringTokenizer st = new StringTokenizer(s);
					if(st.hasMoreTokens()){
						int a1= Integer.parseInt(st.nextToken());
						String atomCheck = st.nextToken();
						Atom a = new Atom(a1,atomCheck,Double.parseDouble(st.nextToken()),Double.parseDouble(st.nextToken()),Double.parseDouble(st.nextToken()),Double.parseDouble(st.nextToken()),Double.parseDouble(st.nextToken()),Double.parseDouble(st.nextToken()),Double.parseDouble(st.nextToken()), Integer.parseInt(st.nextToken()));
						mBuilder.allAtoms.add(a);
						mBuilder.atomToCheck++;
						jtext.setText("\nAtom"+a.name+" "+a.charge+" "+a.mass+" "+a.sigma+" "+a.epsilon+" "+a.bondLength+" "+a.bondAngle+" "+a.maxvalency);
						sb++;
					}
				}						
				jtext.setText("\nAtoms Loaded into Memory");
				mBuilder.setMolToolKit(sb);								
			} catch (IOException e) {jtext.setText("\nError : Cannot read file");}
	}

	public static void newSysWnd(){
		final JFrame newSys = new JFrame();
		newSys.setTitle("Set Properties");
		newSys.setBounds(400, 150, 340, 200);
		newSys.setVisible(true);
		newSys.setLayout(new GridBagLayout());
		newSys.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		
		final JPanel p1;
		final JPanel p2;
		
	//	p1 = new JPanel(new FlowLayout());
//		p2 = new JPanel(new GridLayout(1,2));
	//	p3 = new JPanel(new FlowLayout());
		p1 = new JPanel(new GridBagLayout());
		p2 = new JPanel(new FlowLayout());
		

		JLabel jlTemp = new JLabel("Temperature (Kelvin)");
		final JTextField jtTemp = new JTextField("298");
	//	p1.add(jlTemp);
	//	p1.add(jtTemp);
		JLabel system = new JLabel("System Behavior");
		final JComboBox boxBehavior = new JComboBox();
		boxBehavior.addItem("Periodic");
		boxBehavior.addItem("Periodic-Ewald");
		//boxBehavior.addItem("Confined");
		//boxBehavior.addItem("Non-Periodic");
		ButtonGroup rbEnsbl = new ButtonGroup();
		final JRadioButton rbNVT = new JRadioButton("Constant Volume",false);
		rbNVT.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent arg0) {
				if(boxBehavior.getItemCount() == 3){
					boxBehavior.setSelectedIndex(0);
					//boxBehavior.addItem("Confined");
				}
				
			}
			
		});
		final JRadioButton rbNPT = new JRadioButton("Constant Pressure", true);
		rbNPT.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent arg0) {
				if(boxBehavior.getItemCount() == 3){
					boxBehavior.setSelectedIndex(0);
					//boxBehavior.removeItem("Confined");
					
				}
			}
		});
		rbEnsbl.add(rbNPT);
		rbEnsbl.add(rbNVT);
//		JLabel jlVol = new JLabel("Volume");
		//JLabel jlY = new JLabel("Density of Mixture");
		//JLabel jlZ = new JLabel("	Z (Angstrom)");
		//final JTextField jtY = new JTextField();
		//final JTextField jtZ = new JTextField();
		
	//	p1.add(jlNc);
	//	p1.add(jtNc);
//		p4.add(jlY);
//		p4.add(jtY);
//		p4.add(jlZ);
//		p4.add(jtZ);
		p1.add(jlTemp, new GBC(0,0,1,1).setFill(GBC.BOTH).setWeight(100, 0).setInsets(5));
		p1.add(jtTemp, new GBC(1,0,1,1).setFill(GBC.BOTH).setWeight(100, 0).setInsets(5));
		
		p1.add(system, new GBC(0,2,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(5));
		p1.add(boxBehavior, new GBC(1,2,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(5));
		
		p1.add(rbNPT, new GBC(1,3,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(1));
		p1.add(rbNVT, new GBC(0,3,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(5));
		
//		p3.add(jlVol);
		
		JButton butNext0 = new JButton("Next");
		JButton butCancel = new JButton("Cancel");
		p2.add(butNext0);
		p2.add(butCancel);
		
		newSys.setLayout(new BorderLayout());
	//	newSys.add(p1,BorderLayout.WEST);
		//newSys.add(p3,BorderLayout.EAST);
		newSys.add(p1,BorderLayout.CENTER);
		newSys.add(p2,BorderLayout.SOUTH);
		butCancel.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent arg0) {
				
					newSys.dispose();
			}			
		});
		
		butNext0.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent arg0) {
				try{
				Float temp = Float.parseFloat(jtTemp.getText());
					if(temp>0&&temp<1273){
						jtext.setText("Temperature ="+temp);
					//	sBuilder = new SystemBuilder();
						//sBuilder.initiateSystemBuilder(ab, temp, xDim, yDim, zDim);		
					//	sBuilder.sysFrame();
						newSys.remove(p1);
						newSys.remove(p2);
						
						setSysSystem(temp);
						//newSys.dispose();
						
					}
				}catch(java.lang.NumberFormatException e){
					jtext.setText("Invalid Input");
				}
			}

			private void setSysSystem(final float temp) {
				newSys.setTitle("System Settings");
				final JPanel p5= new JPanel(new GridBagLayout());
				final JPanel p6= new JPanel(new FlowLayout());
				
				JLabel lbPress = new JLabel("Pressure (bar)");
				final JTextField txtPress = new JTextField("1");
				
				JLabel setVolume = new JLabel("Set System Bounds (angstrom)");
				JLabel setWidth = new JLabel("Width (X-Axis)");
				JLabel setHeight = new JLabel("Height (Y-Axis)");
				JLabel setBreadth = new JLabel("Breadth (Z-Axis)");
				
				final JTextField txtWidth = new JTextField("30");
				final JTextField txtHeight = new JTextField("30");
				final JTextField txtBreadth = new JTextField("30");
				
				
				if(rbNPT.isSelected()){
					
					p5.add(lbPress,new GBC(0,0,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(10));
					p5.add(txtPress, new GBC(1,0,5,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(10));
					p5.add(setVolume, new GBC(0,1,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(10));
					setWidth.setText("Initial Width");
					setHeight.setText("Initial Height");
					setBreadth.setText("Initial Breadth");
					p5.add(setWidth, new GBC(0,2,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(1));
					p5.add(setHeight, new GBC(0,3,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(1));						
					p5.add(setBreadth,new GBC(0,4,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(1));
					p5.add(txtWidth, new GBC(1,2,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(1));
					p5.add(txtHeight, new GBC(1,3,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(1));
					p5.add(txtBreadth, new GBC(1,4,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(1));
				}
				else if(rbNVT.isSelected()){
					p5.add(setVolume, new GBC(0,0,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(10));
					p5.add(setWidth, new GBC(0,1,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(1));
					p5.add(setHeight, new GBC(0,2,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(1));						
					p5.add(setBreadth,new GBC(0,3,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(1));
					p5.add(txtWidth, new GBC(1,1,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(1));
					p5.add(txtHeight, new GBC(1,2,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(1));
					p5.add(txtBreadth, new GBC(1,3,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(1));
				}
				
				//txtDen.setf
				
				
				
				//final JLabel behavior = new JLabel();
				final JLabel lblPeriodic = new JLabel("Periodic Cut-off Radius (angstrom)");
				//final JLabel lblSigma = new JLabel("Sigma (angstrom)");
				//final JLabel lblEpsilon = new JLabel("Epsilon (kcal/mol)");
				final JTextField txtCutoff = new JTextField();
				//final JTextField txtSigma = new JTextField("3.195");
				//final JTextField txtEpsilon = new JTextField("0.0152");
				if(boxBehavior.getSelectedItem() == "Periodic"){
					p5.add(new JLabel(""),new GBC(0,8,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(1));
					txtCutoff.setText("8");
					p5.add(lblPeriodic,new GBC(0,9,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(10).setAnchor(GBC.WEST));
					p5.add(txtCutoff, new GBC(1,9,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(1));
				}
				else if(boxBehavior.getSelectedItem() == "Periodic-Ewald"){
					p5.add(new JLabel(""),new GBC(0,7,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(1));
					txtCutoff.setText("10");
					p5.add(lblPeriodic,new GBC(0,9,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(10).setAnchor(GBC.WEST));
					p5.add(txtCutoff, new GBC(1,9,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(1));
				}
				/*else if(boxBehavior.getSelectedItem() == "Confined"){
					behavior.setText("Set Wall Particle Parameters");
					txtCutoff.setText("4.54");
					p5.add(behavior,new GBC(0,8,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(10));
					p5.add(lblSigma,new GBC(0,9,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(1).setAnchor(GBC.WEST));
					p5.add(txtSigma, new GBC(1,9,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(1));
					p5.add(lblEpsilon,new GBC(0,10,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(1).setAnchor(GBC.WEST));
					p5.add(txtEpsilon, new GBC(1,10,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(1));
					p5.add(lblPeriodic,new GBC(0,11,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(10).setAnchor(GBC.WEST));
					p5.add(txtCutoff, new GBC(1,11,1,1).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(1));							
				}*/
				
				JButton butBack2 = new JButton("Back");
				butBack2.addActionListener(new ActionListener(){
					public void actionPerformed(ActionEvent arg0) {
						newSys.remove(p5);
						newSys.remove(p6);
						backToTempComp();
					}
				});
				JButton butCreate = new JButton("Create");
				butCreate.addActionListener(new ActionListener(){
					public void actionPerformed(ActionEvent arg0) {
						try{
						boolean check = true;
						check = false;
						SystemProperties sysProp = new SystemProperties();
						if(rbNPT.isSelected()){
							
							if(Float.parseFloat(txtPress.getText())>0){
								if(boxBehavior.getSelectedItem() == "Periodic"){
									if(Float.parseFloat(txtCutoff.getText())>0){
										sysProp.initiateNPTPeriodic("NPT","Periodic", temp, Float.parseFloat(txtPress.getText()), Float.parseFloat(txtWidth.getText()),  Float.parseFloat(txtHeight.getText()),   Float.parseFloat(txtBreadth.getText()), Float.parseFloat(txtCutoff.getText()));
										newSys.dispose();
										check = true;
									}
								}
								else if(boxBehavior.getSelectedItem() == "Periodic-Ewald"){
									if(Float.parseFloat(txtCutoff.getText())>0){
										sysProp.initiateNPTPeriodic("NPT","Periodic-Ewald", temp, Float.parseFloat(txtPress.getText()),  Float.parseFloat(txtWidth.getText()),  Float.parseFloat(txtHeight.getText()),   Float.parseFloat(txtBreadth.getText()), Float.parseFloat(txtCutoff.getText()));
										newSys.dispose();
										check = true;
									}
								}
								/*else if(boxBehavior.getSelectedItem() == "Non-Periodic"){
										sysProp.initiateNPTNonPeriodic("NPT","Non-Periodic", temp, Float.parseFloat(txtPress.getText()),   Float.parseFloat(txtWidth.getText()),  Float.parseFloat(txtHeight.getText()),   Float.parseFloat(txtBreadth.getText()));
										newSys.dispose();
										check = true;
								}*/
							}
						}
						else if(rbNVT.isSelected()){
							if((Float.parseFloat(txtWidth.getText())>0)&&(Float.parseFloat(txtHeight.getText())>0)&&(Float.parseFloat(txtBreadth.getText())>0)){
								if(boxBehavior.getSelectedItem() == "Periodic"){
									if(Float.parseFloat(txtCutoff.getText())>0){
										sysProp.initiateNVTPeriodic("NVT","Periodic",  Float.parseFloat(txtWidth.getText()),  Float.parseFloat(txtHeight.getText()),   Float.parseFloat(txtBreadth.getText()), temp, Float.parseFloat(txtCutoff.getText()));
										newSys.dispose();
										check = true;
									}
								}
								else if(boxBehavior.getSelectedItem() == "Periodic-Ewald"){
									if(Float.parseFloat(txtCutoff.getText())>0){
										sysProp.initiateNVTPeriodic("NVT","Periodic-Ewald",  Float.parseFloat(txtWidth.getText()),   Float.parseFloat(txtHeight.getText()),   Float.parseFloat(txtBreadth.getText()), temp, Float.parseFloat(txtCutoff.getText()));
										newSys.dispose();
										check = true;
									}
								}
								/*else if(boxBehavior.getSelectedItem() == "Confined"){
									if(Float.parseFloat(txtSigma.getText())>0 && Float.parseFloat(txtEpsilon.getText())>0){
										sysProp.initiateNVTConfined("NVT","Confined",  Float.parseFloat(txtWidth.getText()),   Float.parseFloat(txtHeight.getText()),   Float.parseFloat(txtBreadth.getText()), temp,  Float.parseFloat(txtSigma.getText()), Float.parseFloat(txtEpsilon.getText()), Float.parseFloat(txtCutoff.getText()));
										newSys.dispose();
										check = true;
									}
								}*/
							}
						}
						if(check){
							
							sBuilder = new SystemBuilder();
							sBuilder.initiateSystemBuilder(ab, sysProp);
						}
						}catch(NumberFormatException e){
							jtext.setText("Invalid Input");
						}
					}
				});
				JButton butCancel = new JButton("Cancel");
				butCancel.addActionListener(new ActionListener(){
					public void actionPerformed(ActionEvent arg0) {
							newSys.dispose();
					}
				});
				
				p6.add(butBack2);
				p6.add(butCreate);
				p6.add(butCancel);
				
				newSys.add(p5, BorderLayout.CENTER);
				newSys.add(p6, BorderLayout.SOUTH);

				newSys.setVisible(false);
				newSys.setVisible(true);
				if(rbNVT.isSelected())
					newSys.setBounds(400, 150, 400, (7)*40+10);
				else	
					newSys.setBounds(400, 150, 400, (7)*40+10);
					
				//newSys.repaint();
			}			
			private void backToTempComp(){
				newSys.add(p1,BorderLayout.CENTER);
				newSys.add(p2,BorderLayout.SOUTH);

				newSys.setVisible(false);
				newSys.setVisible(true);
				newSys.setBounds(400, 150, 340, 200);
			}
		});		
	}
	public void loadPane(){
		mainPane = new JPanel();
		mainPane.setLayout(new BorderLayout());
		
	}
	public void setPane(){
		toolPane = new JPanel();
		toolPane.setBounds((int)((int)width/1.151770658),0,(int)((int)width/7.588888889),(int)((int)height/1.024));
		jdesk.add(toolPane);
	}
	@SuppressWarnings("static-access")
	public Darshan(){
		File f = new File("default.txt");
		boolean run = false;
		if(f.exists()){
			try {
				BufferedReader read = new BufferedReader(new FileReader(f));
				String s = read.readLine();
				if(new File(s).isDirectory()){
					run = true;
					workSpace = s;
					System.out.println(s);
				}
				if(read.ready()){
					ld_library_path= read.readLine();
					
				}
				read.close();
				
			} catch (FileNotFoundException e) {
				jtext.setText("File Not Found");
			} catch (IOException e) {
				jtext.setText("IO error");
			}
		}
		if(run){
			Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();
			System.out.println(""+dim.height+"\t"+dim.width);
			frame = new JFrame("MD Darshan");
			height = dim.height;
			width = dim.width;
			frame.setBounds(0, 0, width,(int) ((int) height/1.066666667));
			loadPane();
			frame.addWindowListener(new WindowListener(){
				public void windowActivated(WindowEvent arg0) {}
				public void windowClosed(WindowEvent arg0) {}
				public void windowClosing(WindowEvent arg0) {
					if(sBuilder!=null){
						sBuilder.askSysSave("Exit");
					}
					else if(mBuilder!=null){
						mBuilder.askMoleSave("Exit");
					}
					else if(post != null){
						post.askExit();
					}
					else{
						ab=null;
						System.exit(0);
					}
				}
				public void windowDeactivated(WindowEvent arg0) {}
				public void windowDeiconified(WindowEvent arg0) {}
				public void windowIconified(WindowEvent arg0) {}
				public void windowOpened(WindowEvent arg0) {}			
			});
			jdesk = new JDesktopPane();
			sysCons();
			jcons.setVisible(true);
			jdesk.add(jcons);
			//jdesk.add(toolPane);
			jdesk.add(mainPane);
			JMenuBar menubar = this.createMenu();
			frame.setJMenuBar(menubar);
			frame.add(jdesk,BorderLayout.CENTER);
			frame.setVisible(true);
			frame.setExtendedState(JFrame.MAXIMIZED_BOTH); 
			frame.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
			
		}
		else{
			final JFrame defaultSettings = new JFrame();
			defaultSettings.setTitle("Set Default Workspace");
			defaultSettings.setBounds(400, 150, 340, 200);
			defaultSettings.setLayout(new BorderLayout());
			defaultSettings.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
			JPanel simPanel = new JPanel(new GridBagLayout());
			
			JPanel buttonPanel = new JPanel(new FlowLayout());
			JLabel folder = new JLabel("Select Directory");
			final JButton selectFolder = new JButton("...");
			selectFolder.addActionListener(new ActionListener(){
				public void actionPerformed(ActionEvent arg0) {
					JFileChooser folder = new JFileChooser();
					folder.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
					int f = folder.showSaveDialog(ab);
					if(f==JFileChooser.APPROVE_OPTION){
						String save = folder.getSelectedFile().getPath();
						selectFolder.setText(save);
					}
				}				
			});
			JLabel jcuda = new JLabel("Select Cuda Directory");
			final JButton selectCuda = new JButton("...");
			selectCuda.addActionListener(new ActionListener(){
				public void actionPerformed(ActionEvent arg0) {
					JFileChooser folder = new JFileChooser();
					folder.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
					int f = folder.showSaveDialog(ab);
					if(f==JFileChooser.APPROVE_OPTION){
						String save = folder.getSelectedFile().getPath();
						selectCuda.setText(save);
					}
				}				
			});
			simPanel.add(folder, new GBC(0,0,1,1).setFill(GBC.BOTH).setWeight(100, 0).setInsets(5));
			simPanel.add(selectFolder, new GBC(1,0,1,1).setFill(GBC.BOTH).setWeight(100, 0).setInsets(5));
			simPanel.add(jcuda, new GBC(0,1,1,1).setFill(GBC.BOTH).setWeight(100, 0).setInsets(5));
			simPanel.add(selectCuda, new GBC(1,1,1,1).setFill(GBC.BOTH).setWeight(100, 0).setInsets(5));
			JButton ok = new JButton("Ok");
			JButton cancel = new JButton("Cancel");
			
			ok.addActionListener(new ActionListener(){
				public void actionPerformed(ActionEvent arg0) {
					File checkFile = new File(selectFolder.getText());
					if(checkFile.isDirectory()){
						try {
							FileWriter writer = new FileWriter("default.txt");
							writer.write(selectFolder.getText());
							if(!selectCuda.getText().contains("..."))
							writer.write("\n"+selectCuda.getText());
							writer.close();
							defaultSettings.dispose();
							System.out.println("System path is set, please restart");
							System.exit(0);
						} catch (IOException e) {
							jtext.setText("IO Error");
						}
					}
				}
			});
			cancel.addActionListener(new ActionListener(){
				public void actionPerformed(ActionEvent arg0) {
					defaultSettings.dispose();
					System.exit(0);
				}				
			});
			buttonPanel.add(ok);
			buttonPanel.add(cancel);
			simPanel.add(buttonPanel, new GBC(0,2, 2, 2).setFill(GBC.HORIZONTAL).setWeight(100, 0).setInsets(5));
			defaultSettings.add(simPanel, BorderLayout.CENTER);
			defaultSettings.setVisible(true);
		}
	}
	public static void main(String args[]){
			ab=new Darshan();
		

		
	}
}