// Kate
final int ACTIVE = 1;
final int OFF = 2;
final int EITHER = 3;
final int EVENT_NULL = 0;

class BooleanFilter {


  int x, y, width, height;
  String label;
  int event;
  color widgetColor, labelColor;
  PFont widgetFont;
  String variable;
  String labelDescription;
  int hovercount;

  RadioWidget active, off, either;
  ArrayList radioList;
  BooleanFilter(int x, int y, int width, int height, color widgetColor, PFont widgetFont, String label, String variable, String labelDescription) {
    this.x=x;
    this.y=y;
    this.width = width;
    this.height= height;
    this.widgetColor=widgetColor;
    this.widgetFont=widgetFont;
    this.label = label; // creates a lcal string label
    labelColor= color(#FFFFFF);
    active = new RadioWidget(x, y, width, height, "active",
      widgetColor, widgetFont, ACTIVE);
    off = new RadioWidget(x + 40, y, width, height, "off",
      widgetColor, widgetFont, OFF);
    either = new RadioWidget(x + 80, y, width, height, "either",
      widgetColor, widgetFont, EITHER);
    either.active = true;
    event = EITHER;
    this.variable = variable;
    this.labelDescription = labelDescription;
  }
  void mousePressed() {
    if (active.hover(mouseX, mouseY)
      || either.hover(mouseX, mouseY) || off.hover(mouseX, mouseY)) {
      event = EVENT_NULL;
      println(hovercount);
      if (event != EVENT_NULL) {
      }
      event = EVENT_NULL;
      event = max(event, active.getEvent(mouseX, mouseY));
      event = max(event, off.getEvent(mouseX, mouseY));
      event = max(event, either.getEvent(mouseX, mouseY));
      
      switch(event) {
      case ACTIVE:
        active.active = true;
        either.active = false;
        off.active = false;
        for (DataPoint element: fileCache.get(fileMenu.currentOption))
        {
          if (!element.get(variable).equals("Active")&& !element.inactiveFilters.contains(this))
          {
            element.inactiveFilters.add(this);
            wasQueryChanged = true;

          }
          else if (element.get(variable).equals("Active") && element.inactiveFilters.contains(this))
          {
            element.inactiveFilters.remove(this);
            wasQueryChanged = true;
          }
        }
        break;
      case EITHER:
        active.active = false;
        either.active =true;
        off.active = false;
        for (DataPoint element: fileCache.get(fileMenu.currentOption))
        {
          if (element.inactiveFilters.contains(this))
          {
            element.inactiveFilters.remove(this);
            wasQueryChanged = true;
          }
        }
        break;
      case OFF:
        active.active = false;
        either.active = false;
        off.active = true;
        for (DataPoint element: fileCache.get(fileMenu.currentOption))
        {
          if (!element.get(variable).equals("Inactive") && !element.inactiveFilters.contains(this))
          {
            element.inactiveFilters.add(this);
            wasQueryChanged = true;
          }
          else if (element.get(variable).equals("Inactive") && element.inactiveFilters.contains(this));
          {
            element.inactiveFilters.remove(this);
            wasQueryChanged = true;
          }
        }
      }
    }
  }
  boolean hover(int mX, int mY) {
    if (active.hover(mX, mY) || either.hover(mX, mY) || off.hover(mX, mY)) {
      return true;
    }
    return false;
  }
  boolean labelHover(int mX, int mY) {
    if (mX>x-85 && mX<x && mY>y && mY <y+height) {
      return true;
    }
    return false;
  }

  void draw() {
    fill(color(#FF0000));
    text(label, x-85, y+width/2);
    active.draw();
    off.draw();
    either.draw();
    //println(labelHover(mouseX, mouseY));
      if(labelHover(mouseX, mouseY)){
      fill(color(#70A59B));
      rect(mouseX, mouseY, -520, 100);
      fill(color(#7C0000));
      text(labelDescription, mouseX-10, mouseY+10, -500, 250);
      
      hovercount++;
      
    }
  }

}
