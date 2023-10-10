import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.stream.Collectors;
import java.awt.Frame;
import java.util.LinkedHashMap;
import java.util.stream.Stream;

Alien [] aliens;
PImage alienImage;
PImage explodeImage;
PImage mothershipImage;
PImage directAlienImage;
int framerate;
int timer;

PImage alien;
PFont fancyFont;
PFont plainFont;
PFont smallNumFont;
PFont stdFont;
Graph mainGraph;
dropDownMenuWidget subjectMenu;
dropDownMenuWidget fileMenu;
dropDownMenuWidget searchTypesMenu;
dropDownMenuWidget searchSubjectMenu;
dropDownMenuWidget graphTypeMenu;
dropDownMenuWidget secondVarMenu;
dropDownMenuWidget [] dropDownMenuArray;
boolean wasQueryChanged;
boolean logged = false;
ArrayList<TextBox> textboxes = new ArrayList<TextBox>();
HashMap<String,DataPoint[]> fileCache;
HashMap<String,Slider[]> sliderCache;
HashMap<String,String> colTypes;
scrollBar [] scrollBars;
verticalScrollBar queryScrollBar;
StringFilter stringFilter;
DataPointDisplayer SubSetDisplayer;
BooleanFilter[] flagList;
PShape square;
boolean loaded = false;
StringFilter [] stringFilters;
Slider [] sliders;



void processFileData(String fileName)
{
  ArrayList < String []> data = getFile(fileName,41);
  String [] cols = data.get(0);
  DataPoint [] dataPoints = new DataPoint[data.size()-1];
  for (int i = 1; i < data.size(); i++)
  {
    dataPoints[i-1] = new DataPoint(data.get(i),cols);
  }
  fileCache.put(fileName,dataPoints);
}

void setup()
{
  timer = 0;
  framerate = 60;
  frameRate(framerate);
  aliens = new Alien [14];
  alienImage = loadImage("invader.gif");
  explodeImage = loadImage("exploding.gif");
  init_aliens(aliens,alienImage,explodeImage);
  
  int graphHeight = 400;
  int graphWidth = 800;
  size(1400,750);
  stdFont=loadFont("CopperplateGothic-Light-30.vlw");

  new Thread( () -> {
  colTypes = new HashMap<String,String>(); // peter, added so program knows type of each column
  String [] lineArray;
  for (String line: columnTypes.split("\n"))
  {
    lineArray = line.split("  ");
    colTypes.put(lineArray[0],lineArray[1]);
  }
  fileCache = new HashMap<String,DataPoint[]>();
  plainFont = loadFont("plainFont.vlw");
  smallNumFont = loadFont("smallNumFont.vlw");
  processFileData("gcat1k.tsv");
  String [] cols = colTypes.keySet().stream().filter(n -> !n.equals("State")).sorted().toArray(String[]::new);
  
  queryScrollBar= new verticalScrollBar(35,470,10,100,1);
  verticalScrollBar searchSubjectScrollBar= new verticalScrollBar(10,graphHeight+210,10,100,1);
  
  dropDownMenuArray = new dropDownMenuWidget[6];
  subjectMenu = new dropDownMenuWidget("State",50,470,color(#E78587),color(255),cols,color(#E78587),queryScrollBar);
  String [] files = new String[2];
  files[0] = "gcat10k.tsv";
  files[1] = "gcat.tsv";
  for (String file : files)
    processFileData(file);
  fileMenu = new dropDownMenuWidget("gcat1k.tsv",150,470,color(#E78587),color(255),files,color(#E78587),null);
  dropDownMenuArray[0] = subjectMenu;
  dropDownMenuArray[1] = fileMenu;  
  
  searchTypesMenu = new dropDownMenuWidget("Starts With",120,graphHeight+210,color(#E78587),color(255),new String []{"Contains","Ends With"},color(#E78587),null);
  searchSubjectMenu =  new dropDownMenuWidget("State",20,graphHeight+210,color(#E78587),color(255),cols,color(#E78587),searchSubjectScrollBar);
  dropDownMenuArray[2] = searchTypesMenu;
  dropDownMenuArray[3] = searchSubjectMenu;
  
  graphTypeMenu = new dropDownMenuWidget("Totals",630,graphHeight+210,color(#E78587),color(255),new String []{"Averages"},color(#E78587),null);;
  secondVarMenu =  new dropDownMenuWidget("Count",730,graphHeight+210,color(#E78587),color(255),
    Arrays.stream(cols)
    .filter(c->colTypes.get(c).equals("int")||colTypes.get(c).equals("float"))
    .toArray(String[]::new)
    ,color(#E78587),null);
  dropDownMenuArray[4] = graphTypeMenu;
  dropDownMenuArray[5] = secondVarMenu;
  
  SubSetDisplayer = new DataPointDisplayer(240,470,1,105,560,color(0),color(255));

  scrollBars = new scrollBar[3];
  scrollBars[1] = queryScrollBar;
  scrollBars[2] = searchSubjectScrollBar;
  scrollBars[0] = new scrollBar(5, (float)graphHeight+190,graphWidth-10, 10,1);
  scrollBars[0].update();
  scrollBars[0].newSliderPos = 5;
  String [] flagDescriptions = {"Mass of this GCAT object in kg, at launch, not including mass of attached objects.\nIf the MassFlag is '?' then the value is an estimate, hopefully good to about 20 percent."
      , "Dry mass of this GCAT object (which is a reasonable proxy for the mass of the object after its active lifetime). Value is in kg. Does not include the mass of attached objects.\nIf the DryFlag is '?' then the value is an estimate, hopefully good to about 20 percent."
      , "Total mass of this object at launch, in kg, if nonzero. For a set of GCAT objects attached to each other the total mass will be given for one of them (usually the S catalog entry), and the others will have TotMass = 0. If you add up the Mass values for each of the objects, the result should be equal to the TotMass.\nIf the TotFlag is '?' then the value is an estimate, hopefully good to about 20 percent."
      , "Longest dimension of the main body of the object in metres.\nIf LFlag is '?' the value is a guess, hopefully good to about 20 percent."
      , "The Diameter is the second longest dimension of the main body of the object in metres. Many objects are cylinders or square-sectioned cuboids, so I haven't bothered to give a separated depth and width. The length times the diameter is a reasonable approximation to the cross-section of the object not counting appendages.\nIf DFlag is '?' the value is a guess, hopefully good to about 20 percent."
      , "The Span is the largest dimension in metres of the entire object across all appendages (booms, solar arrays, antennae). To avoid hitting the object you should stay outside a sphere of diameter equal to the Span.\nIf SpanFlag is '?' the value is a guess, hopefully good to about 20 percent."
      , "Conventional apogee height in km of canonical orbit. Equal to apogee radius minus equatorial radius of central body.\nIf AF is equal to '?' the value is a guess."
      , "Conventional perigee height in km of canonical orbit. Equal to perigee radius minus equatorial radius of central body. \nIf PF is equal to '?' the value is a guess."
      , "Inclination of canonical orbit in degrees with respect to coordinate system equator. Heliocentric orbits are given with respect to the J2000 ecliptic. Earth orbits are given with respect to the equator of date (strictly, TEME equator). Orbits around other central bodies are given with respect to the IAU equator of that body.\nIf IF is equal to '?' the value is a guess."};
  String [] flagFieldLabels = {"Mass Flag","Dry Flag","Total Flag","Length Flag","Diameter Flag","Span Flag","Apogee Flag","Perigee Flag","Orbit Inclin-\nation Flag"};
  String [] flagFieldNames = {"MassFlag","DryFlag","TotFlag","LFlag","DFlag","SpanFlag","AF","PF","IF"};
  flagList = new BooleanFilter[flagFieldLabels.length];
  for (int i = 0; i< flagFieldLabels.length; i++)
  {
    flagList[i] = new BooleanFilter(900, 290+30*i, 10, 10, color(#FFFFFF), smallNumFont, flagFieldLabels[i],flagFieldNames[i], flagDescriptions[i]);
  }

  String [] stringFieldNames = {"State","OQUAL","Shape","OpOrbit","Type","Status"};
  stringFilters = new StringFilter [stringFieldNames.length];
  for (int i = 0; i < stringFieldNames.length; i++)
  {
    stringFilters[i] = new StringFilter(850,20+i*45,stringFieldNames[i]);
  }
  
  String [] dateFieldNames = {"LDate","DDate"};
  String [] numFieldNames = {"Apogee","Perigee","Diameter","Mass"};
  String [] fileNames = {"gcat1k.tsv","gcat10k.tsv","gcat.tsv"};
  sliderCache = new HashMap<String,Slider[]>();
  for (String fileName: fileNames)
  {
    sliders = new Slider[dateFieldNames.length+numFieldNames.length];
    
    for (int i = 0; i< dateFieldNames.length; i++)
    {
      sliders[i] = new Slider(820,600+i*95,200,50,color(255),color(0,100,200),dateFieldNames[i],SLIDER_EVENT_NULL,plainFont,fileCache.get(fileName));
    }
    for (int i = dateFieldNames.length; i < numFieldNames.length+dateFieldNames.length;i++)
    {
      sliders[i] = new Slider(850+220,600-2*95+(i-dateFieldNames.length)*95,200,50,color(255),color(0,100,200),numFieldNames[i-dateFieldNames.length],SLIDER_EVENT_NULL,plainFont,fileCache.get(fileName));
    }
    sliderCache.put(fileName,sliders);
  }
  TextBox textBox = new TextBox();
  textBox.X = 220;
  textBox.Y = graphHeight+210;
  textBox.W = 400;
  textBox.H = 35;
  textboxes.add(textBox);

  
  mainGraph = new Graph(graphWidth,graphHeight);
  mainGraph.processBasicQuery("State", fileCache.get("gcat1k.tsv"));           // displays default query
  
  alien = loadImage("alien.gif");
  loaded = true;
  }
  ).start();
}


void draw()
{
  //for (Alien alien: aliens){
  //  alien.move();
  //  alien.draw();
  //}
  if (!loaded)//frameCount<900)
  {
    background(0);
    fill(#0072bb);
    textFont(stdFont);
    String dots = "";
    for (int i = 0; i <(frameCount/10)%4; i++)
      dots += ".";
    text("Loading"+dots, width/2-80, height/2);
    return;
  }
  
  background(#69706f);
  mainGraph.draw();
  //queryScrollBar.update();
  for (scrollBar sb: scrollBars)
  {
    sb.display();
    sb.update();
  }
  SubSetDisplayer.draw();
  for (dropDownMenuWidget widget: dropDownMenuArray)
    widget.draw();
  for (BooleanFilter bf : flagList)
    bf.draw();
  strokeWeight(5);
  textFont(stdFont);
  for (StringFilter sf: stringFilters)
  {
    sf.draw();
  }
  for (Slider slider: sliderCache.get(fileMenu.currentOption))
    slider.draw();
  alien.resize(100,100);
 image(alien,1290,450);
 for (TextBox t : textboxes)
  {
    t.draw();
  }
}
void Submit() {
  if (textboxes.get(0).Text.equals("hi")) {
    if (textboxes.get(1).Text.equals("bye")) {
      logged = true;
    } else {
      logged = false;
    }
  } else {
    logged = false;
  }
}

void mouseMoved()
{
  if (!loaded)
    return;
  for (dropDownMenuWidget widget: dropDownMenuArray)
    widget.getEvent(mouseX,mouseY);
  for (Slider slider: sliderCache.get(fileMenu.currentOption))
    slider.getEvent(mouseX,mouseY);
}

void mouseDragged()
{
  if (!loaded)
    return;
  for (scrollBar sb: scrollBars)
  {
    if (sb.locked || sb.overEvent()){
      sb.update();
  }
  }
  if (subjectMenu.scrollBar.locked || subjectMenu.scrollBar.overEvent())
  {
    subjectMenu.scrollBar.update();
    subjectMenu.scrollBarUpdate();
  }
  if (scrollBars[0].overEvent() || scrollBars[0].locked)
    mainGraph.scrollBarUpdate((int)scrollBars[0].sliderPos,scrollBars[0].sliderWidth);
  for (Slider slider: sliderCache.get(fileMenu.currentOption))
    slider.move();
  
}
void mousePressed() {
  if (!loaded)
    return;
  for (dropDownMenuWidget widget: dropDownMenuArray)
    if (widget.getEvent(mouseX,mouseY))
      widget.click();
  
  if (searchSubjectMenu.optionChanged || searchTypesMenu.optionChanged || graphTypeMenu.optionChanged || secondVarMenu.optionChanged)
  {
    searchSubjectMenu.optionChanged = false;
    searchTypesMenu.optionChanged = false;
    graphTypeMenu.optionChanged = false;
    secondVarMenu.optionChanged = false;
    textboxes.get(0).filter();
    wasQueryChanged = true;
  }
  if (fileMenu.optionChanged)
  {
    fileMenu.optionChanged = false;     // 24/03, added file drop down menu, peter
    for (StringFilter sf: stringFilters)
      sf.init_widget();
    textboxes.get(0).filter();
  }
  
  for (Slider slider: sliderCache.get(fileMenu.currentOption))
    slider.sliderEvent = slider.getEvent(mouseX,mouseY);
  if (SubSetDisplayer.getEvent(mouseX,mouseY))
  {
      //String [] args = {"DataPoint Window"};
      //DataPointApplet otherWindow = new DataPointApplet(SubSetDisplayer.dataPoints[SubSetDisplayer.offset]);
      //PApplet.runSketch(args,otherWindow);
      //println(wasQueryChanged);
  }
  mainGraph.click(mouseX,mouseY);
  //println(wasQueryChanged);
  for (BooleanFilter bf : flagList)
    bf.mousePressed();
  for (StringFilter sf: stringFilters)
    sf.click();
  
  for (TextBox t : textboxes) {
    t.PRESSED(mouseX, mouseY);
  }
}

void mouseReleased()
{
  if (!loaded)
    return;
  for (Slider slider: sliderCache.get(fileMenu.currentOption))
  {
    slider.released();
  }
  
  if (wasQueryChanged)
  {
    mainGraph.processBasicQuery(subjectMenu.currentOption, fileCache.get(fileMenu.currentOption));   // peter 24/03
    wasQueryChanged = false;
  }
}


void mouseWheel(MouseEvent event)
{
  if (!loaded)
    return;
  for (dropDownMenuWidget widget: dropDownMenuArray) // peter
    if (widget.getEvent(mouseX,mouseY))
      widget.scroll(event.getCount());
  for (StringFilter sf: stringFilters) // peter
    if (sf.getEvent(mouseX,mouseY))
      sf.scroll(event.getCount());
  if (mainGraph.getEvent(mouseX,mouseY))
      mainGraph.scroll(event.getCount(),scrollBars[0]);
  if (SubSetDisplayer.getEvent(mouseX,mouseY))
    SubSetDisplayer.scroll(event.getCount());
}

void keyPressed() {
  for (TextBox t : textboxes) {
    if (t.KEYPRESSED(key, (int)keyCode)) {
      Submit();
    }
  }
  if (wasQueryChanged)
  {
    mainGraph.processBasicQuery(subjectMenu.currentOption, fileCache.get(fileMenu.currentOption));   // peter 24/03
    wasQueryChanged = false;
  }
}
public void init_aliens ( Alien[] alienArray,PImage alienImage,PImage explodeImage){
 /* for each position in the array,  create a new alien at an appropriate
 starting point on the screen */
 for (int index = 0; index < 10; index++)
 {
    alienArray[index] = new Alien(ALIEN_WIDTH*index+5,0,alienImage,explodeImage,24);
 }
}
