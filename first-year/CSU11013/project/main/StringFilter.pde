// Vaibhav(24/03/22)
import java.util.Arrays;
class StringFilter {

  int x;
  int y;
  String label;
  PFont font;
  CheckBoxWidget [] myWidgets;
  int offset;
  final int numVisibleOptions = 6;

  StringFilter(int x, int y, String label) {
    this.x=x;
    this.y=y;
    this.label=label;
    init_widget();
  }
  
  boolean contains(String value)
  {
    for (CheckBoxWidget widget: myWidgets)
    {
      if (widget.active && widget.label.equals(value))
        return true;
    }
    return false;
  }
  HashSet<String> getActive() // peter
  {
    return Arrays.stream(myWidgets)
      .filter(w -> w.active)
      .map(w -> w.label)
      .collect(Collectors.toCollection(HashSet::new));
  }
  void draw()
  {
    stroke(255);
    strokeWeight(1.5);
    fill(255);
    textFont(plainFont);
    text(label, x-30, y-5);
    for (int i = offset; i < offset+min(myWidgets.length,numVisibleOptions); i++) {
      if (i < myWidgets.length && myWidgets[i].isVisible)
        myWidgets[i].draw();
    }
  }
  
  void scroll(float scrollAmount)
  {
    for (int i = offset; i< offset+6;i++)
    {
      if (i<myWidgets.length)
        myWidgets[i].isVisible = false;
    }
    offset += 6*scrollAmount;
    if (offset >= Math.floor(myWidgets.length/6)*6)
      offset = (int)Math.floor(myWidgets.length/6)*6;
    if (offset < 0)
      offset = 0;
    if (offset == myWidgets.length)
      offset -= 6;
    
    for (int i = offset; i< offset+6;i++)
    {
      if (i<myWidgets.length)
        myWidgets[i].isVisible = true;
    }
  }
  
  boolean getEvent(int mX,int mY)
  {
    return (mX >= x-30 && mX <= x+90*6+25 && mY >= y && mY <= y+25);
  }

  String [] getUniqueKeys(String variable)
  {
    HashMap<String, Integer> varValues = new HashMap<String, Integer>();
    String col;
    for (DataPoint element : fileCache.get(fileMenu.currentOption))
    {
      col = element.get(variable);
      if (!varValues.containsKey(col))
        varValues.put(col, 1);
    }
    return varValues.keySet().stream().sorted().toArray(String[]::new);
  }
  void init_widget() {
    String [] keys = getUniqueKeys(label);
    myWidgets = new CheckBoxWidget [keys.length];
    offset = 0;
    for (int i = 0; i < myWidgets.length; i++) {
      myWidgets[i] = new CheckBoxWidget( x + 90 * (i%6), y, 25, 25, keys[i], color(255));
    }
    for (int i = offset; i< offset+6;i++)
    {
      if (i<myWidgets.length)
        myWidgets[i].isVisible = true;
    }
  }
  void click() {
    for (int i = 0; i < myWidgets.length; i++) {
      if (myWidgets[i].getEvent(mouseX, mouseY))
       {
         for (DataPoint element: fileCache.get(fileMenu.currentOption))
         {
           if (!myWidgets[i].active && myWidgets[i].label.equals(element.get(label)) && !element.inactiveFilters.contains(myWidgets[i]))
           {
             element.inactiveFilters.add(myWidgets[i]);
             wasQueryChanged = true;
           }
           else if (myWidgets[i].active && element.inactiveFilters.contains(myWidgets[i]))
           {
             element.inactiveFilters.remove(myWidgets[i]);
             wasQueryChanged = true;
           }
        }
      }
    }
  }
}
//
