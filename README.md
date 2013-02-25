#MD Darshan

MD Darshan is a powerful molecular dynamics simulation software for the experimentalists and product developers. Its based on OpenMM plugins developed by Simbios.

It allow you to build a library of molecules that are of interest, set them up to design systems or screen candidates for a wide variety of applications, run simulations and visualize and analyze results.  It allows you to design new systems, analyze their stability, and test their properties.

MD Darshan can be used by a specialist for sophisticated simulations, or new research into molecular dynamics of materials. Alternatively, it can be customized for ready use in product formulation, or screening of candidates for a variety of applications.

Potential design systems include: polymer systems, solutions, emulsion systems, crystals, coatings and specialized surfaces, and wide variety of nano-structures.

Simulations can be run to model assembly, aggregation or order formation or formation of different structures, stability of systems, dynamic analysis such as diffusion, dissolution of crystals or other structures, response to different stresses and small changes in structure under stress.  These applications are of interest to industries or labs engaged in study of emulsions, paints, lotions, polymer formulations, adhesives, glues, composites, coatings, drug formulations, and their testing. 

##Supported OS

MD Darshan is well tested with Ubuntu 10.10 and Ubuntu 12.04. But it also works well with other distributions of Ubuntu.

##Installation

1. Download or clone the repository.
2. Install libjava3d-java and freeglut3-dev using Synaptic Package Manager. You can also install them using aptitude as <br /><tt>sudo apt-get install libjava3d-java freeglut3-dev</tt><br />
3. Use <tt>sudo gedit ~/.bashrc</tt><br />Add following line to your .bashrc file<br /><tt>export CLASSPATH=.:/usr/share/java/j3dcore.jar:/usr/share/java/j3dutils.jar:/usr/share/java/vecmath.jar</tt><br />
4. Use <tt>make</tt> to install the setup.
5. You can run the program with <tt>java Darshan</tt>

##Using MD Darshan

MD Darshan works through 3 parts.

1. Molecule Builder - Design your molecule or nanostructure and export them for simulations.
2. System Builder - Design simulation system, setup and run simulations.
3. Postprocessor - View and analyze your simulation results.

### Molecule Builder

You can build your molecular structures here. To build a new molecule, click Molecule => New.
You can see here a black canvas at center and a toolkit panel in the right. You can select atom type by clicking on atom name in the list.
You can draw a molecule by clicking on the canvas and erase it with a right click.

####Basic Drawing
Clicking on two successive atoms will generate a bond. You can remove the bond with a right click.
A bond can be single, resonant, double and triple. You can change type of bond by clicking on it. 
Order of bond change is single => resonant => double => triple => single.

In order to remove a bonded atom, you will have to remove the bond first.

####Navigation
You can translate view position with right click and drag. For rotate view, press right shift and then left click and drag mouse.

####Toolkit Panel
#####Atom List#####
You can select draw atom type from this list. 

#####Toolbox#####

1. Load Image - If you want to refer to an image while drawing a molecule. Click on "Load Image", select the image and place the window where you can see it better.
2. Add Hydrogen - To automatically add hydrogen atoms to satisfy valency of drawn structure. Click on "Add Hydrogen"
3. Set Charge - Charge distribution calculation is automatically done using "Gasteiger Charges". To add charges manually, click on "Set Charge" and the click on atom you want to edit. Edit charge on your own risk.
4. Optimize - Structure energy optimization is done at every step. But to manually optimize energy click "Optimize".
5. Reset View - To reset the original view after rotation or translation click "Reset View".
6. CNT Mode off - To draw complicated carbon based structures, you need to turn this mode on by clickin on "CNT Mode off". It will stop automatic energy optimization and set resonant bond as default bond. You can turn this mode off by again clicking on the same button.
7. Clear - You can clear the canvas by clicking on clear button.

####Save and export
You can save your current drawing using Molecule => Save. <b>In order to import a molecule in System Builder, you will need to export it from Molecular Builder. Don't forget to save or export the molecule before you close the window.</b>

####Load
You can load a previously saved molecule with Molecule => Load

####Carbon Nanotube
To draw a carbon nanotube, select Molecule => Advanced => Carbon Nanotube and give it dimensions.

###System Builder
System builder sets simulation parameters, participating molecules. It also simulates given ensemble.

####Setting up ensemble
Click on System => New. A window with "Set properties" title pop up. Set temperature in Kelvin. Select simulation type from constant temperature and constant pressure. Then select default system behavior.
Click next. Depending on your initial choices, set volume or pressure and initial volume. You can also set force cutoff radius in angstrom.
Click Create to create the system.

####Basic Navigation
Here you can see a blank simulation system box at center canvas with toolkit in the right. You can rotate the box by dragging the mouse. And you can zoom in or out using mouse scroll.

####Toolkit Panel
Domain List 
This is the list of created domains (regions)

Toolbox

1. Add Molecule - To add a single molecule click on "Add Molecule". Set its coordinates and click on "Create". You can also exclude this molecule volume by checking "Exclude form other regions"
2. Add Domain - To create a volume filled with number of molecules, click on "Add Domain". Set its center coordinates and volume of replication. You can also exclude this volume from further replication by checking "Exclude from other regions"
3. V-Domain - To make a domain immovable (no positional change throughout simulation), select the domain from list and click on "V-Domain".
4. Set Size - To change the domain size, click on set size and enter new size parameters. (You may need to empty the domain list first).
5. Import domain - To import previously simulated domains click on "Import Domain" and select the file. This file has to be exported from post processor.
6. Remove - To remove a domain, select the domain from list and click on "Remove"
7. Simulate - To simulate the given system, click on "Simulate"

Simulate
A window will pop up with list of parameters.
1. Simulation time after equilibrium - Time of simulation in pico seconds.
2. Step Size - Step size in pico seconds. Default 1 fs (0.001 ps). Make sure the step size is small for stable simulation.
3. Reporting Interval - Simulation graphics window refresh rate. Default 10 frames per refresh.
4. Save Frequency - File save frequency. You can view these results in Postprocessor.
5. Case - Set case file name. This file will be created in default workspace folder.

Click on "Ok" to start the simulation. A black window will pop up in a few seconds. This window will refresh and remain until simulations completes. You can close this window to stop the simulation. You can find result case and data files in workspace.

####Save and load
You can save and load the system file. Please note that save file is different than case file.


