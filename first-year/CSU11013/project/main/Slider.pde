// Daire
final int SLIDER_EVENT_NULL = 0;
final int SLIDER_EVENT_ONE = 1;
final int SLIDER_EVENT_TWO = 2;

class Slider
{
    int x,y,width,height;
    SliderWidget sliderWidget1, sliderWidget2;
    ArrayList<SliderWidget> sliders;
    color barColor, sliderWidgetColor;
    String dataKey;
    int sliderEvent;
    PFont sliderFont;
    double minNumber, maxNumber, minNumberDisplay, maxNumberDisplay, numberRange, months;
    int minSpareMonths, maxSpareMonths;
    String minMonthString, maxMonthString;
    DataPoint[] datapoints;
    Date minDate, maxDate, minDateDisplay, maxDateDisplay;
    
    Slider(int x,int y, int width, int height, color barColor,color sliderWidgetColor,
           String dataKey, int sliderEvent, PFont sliderFont, DataPoint[] datapoints)
    {
         this.x = x;
         this.y = y;
         this.width = width;
         this.height = height;
         this.barColor = barColor;
         this.dataKey = dataKey;
         this.sliderWidgetColor = sliderWidgetColor;
         this.sliderEvent = sliderEvent;
         this.sliderFont = sliderFont;
         this.datapoints = datapoints;
         sliderWidget1 = new SliderWidget(x+3,y+3,width/20,height-6,SLIDER_EVENT_ONE, sliderWidgetColor);
         sliderWidget2 = new SliderWidget(x+width-(width/20)-3,y+3,width/20,height-6,SLIDER_EVENT_TWO, sliderWidgetColor);
         sliders = new ArrayList<SliderWidget>();
         sliders.add(sliderWidget1);
         sliders.add(sliderWidget2);
         initialise(datapoints);
    }
    
    void initialise(DataPoint[] datapoints)
    {
         sliderWidget1.x = sliderWidget1.initialX;
         sliderWidget2.x = sliderWidget2.initialX;
         minNumber = 0;
         maxNumber = 0;
         minDate = new Date("9999");
         maxDate = new Date("-");
         maxDate.year -= 1;
         
         if (colTypes.get(dataKey).equalsIgnoreCase("int")||
             colTypes.get(dataKey).equalsIgnoreCase("float"))
         {
           for (int i = 0; i<datapoints.length; i++)
           {
              String string = datapoints[i].get(dataKey);
              int number = parseInt(string);
              if (number < minNumber)
                  minNumber = number;
              else if (number > maxNumber)
                  maxNumber = number;
           }
           numberRange = maxNumber - minNumber;
           minNumberDisplay = minNumber;
           maxNumberDisplay = maxNumber;
         }
         
         else if (colTypes.get(dataKey).equalsIgnoreCase("date"))
         {
           for (int i =0; i<datapoints.length; i++)
           {
              String dateString = datapoints[i].get(dataKey);
              Date currentDate = new Date(dateString);
              if (currentDate.year > 1900)
              {
                if (currentDate.isLessThan(minDate))
                    minDate = currentDate;
                else if (currentDate.isGreaterThan(maxDate))
                    maxDate = currentDate;
              }
           }
           int years = maxDate.year-minDate.year;
           months = years*12 + (maxDate.month-minDate.month);
         }        
         minDateDisplay = minDate;
         maxDateDisplay = new Date(maxDate);
         maxDateDisplay.day = 32;
         maxDateDisplay.time = Integer.MAX_VALUE;
    }
    
    void draw()
    {
      stroke(0);
      strokeWeight(1.5);
      fill(barColor);
      rect(x,y,width,height);
      line(x,y+height/2,x+width,y+height/2);
      for (int i = 0; i<sliders.size(); i++)
      {
        SliderWidget sliderWidget = (SliderWidget) sliders.get(i);
        sliderWidget.draw();
      }
      if (sliderWidget1.sliderLocked == true)
      {
        if (sliderWidget1.x<x+3)
            sliderWidget1.x = x+3;
        if (sliderWidget1.x>sliderWidget2.x-sliderWidget1.width)
            sliderWidget1.x = sliderWidget2.x-sliderWidget1.width;
      }
      else if (sliderWidget2.sliderLocked == true)
      {
        if (sliderWidget2.x<sliderWidget1.x+sliderWidget1.width)
            sliderWidget2.x = sliderWidget1.x+sliderWidget1.width;
        if (sliderWidget2.x>x+width-sliderWidget2.width-3)
            sliderWidget2.x = x+width-sliderWidget2.width-3;
      }
      
      fill(255);
      textAlign(CENTER);
      textSize(11);
      text("min." + dataKey, x+(width/10), y-10);
      text("max." + dataKey, x+width-(width/10), y-10);
      
      if (colTypes.get(dataKey).equalsIgnoreCase("int")||
             colTypes.get(dataKey).equalsIgnoreCase("float"))
      {
        minNumberDisplay = minNumber+((sliderWidget1.x-x-3)*(numberRange/(width-2*(sliderWidget1.width+3))));
        maxNumberDisplay = maxNumber+((sliderWidget2.x-x-width+(sliderWidget2.width+3))*(numberRange/(width-2*(sliderWidget1.width+3))));
        text((int)minNumberDisplay, x+(width/10), y-30);
        text((int)maxNumberDisplay, x+width-(width/10), y-30);
      }
      else if (colTypes.get(dataKey).equalsIgnoreCase("date"))
      {
        double currentMinMonthOffset = ((sliderWidget1.x-x-3)*(months/(width-2*(sliderWidget1.width+3))));
        int minMonthsCount = (int)currentMinMonthOffset;
        while (minMonthsCount%12 != 0)
        {
           minMonthsCount = minMonthsCount - 1;
        }
        int currentMinYearOffset = minMonthsCount/12;
        minSpareMonths = (int)currentMinMonthOffset - minMonthsCount + minDate.month;
        if (minSpareMonths > 12)
        {
            currentMinYearOffset++;
            minSpareMonths = minSpareMonths - 12;
        }
        minMonthString = getMonth(minSpareMonths);
        minDateDisplay = new Date(str(minDate.year+currentMinYearOffset)+" "+minMonthString);
        
        int currentMaxMonthOffset = (int)((sliderWidget2.x-x-width+(sliderWidget2.width+3))*(months/(width-2*(sliderWidget1.width+3))));
        maxDateDisplay.month = maxDate.month + currentMaxMonthOffset;
        int yearCount = 0;
        while (maxDateDisplay.month <= 0)
        {
          maxDateDisplay.month += 12;
          yearCount ++;
        }

        maxDateDisplay.year = maxDate.year - yearCount;
        text(minMonthString+" "+str(minDateDisplay.year), x+(width/10), y-30);
        text(getMonth(maxDateDisplay.month)+" "+str(maxDateDisplay.year), x+width-(width/10), y-30);
      }
      textAlign(BASELINE);
      //println(dataKey,minNumberDisplay);
    }
    
    String getMonth(int monthNumber)
    {
      if (monthNumber<0)
          monthNumber = monthNumber * - 1;
      switch(monthNumber)
        {
          case 1:
          return "Jan";
          case 2:
          return "Feb";
          case 3:
          return "Mar";
          case 4:
          return "Apr";
          case 5:
          return "May";
          case 6:
          return "Jun";
          case 7:
          return "Jul";
          case 8:
          return "Aug";
          case 9:
          return "Sep";
          case 10:
          return "Oct";
          case 11:
          return "Nov";
          case 12:
          return "Dec";
          default:
          return "";
        }
    }
    
    int getEvent(int mX, int mY)
    {
      int event = 0;
      for (int i = 0; i<sliders.size(); i++)
      {
        SliderWidget sliderWidget = (SliderWidget) sliders.get(i);
        event = sliderWidget.getEvent(mX, mY);
        if (event == SLIDER_EVENT_ONE)
            return event;
        if (event == SLIDER_EVENT_TWO)
            return event;
      }
      return event;
    }
    
    void move()
    {
      if (sliderEvent == SLIDER_EVENT_ONE)
      {
        sliderWidget1.sliderLocked = true;
        sliderWidget2.sliderLocked = false;
      }
      else if (sliderEvent == SLIDER_EVENT_TWO)
      {
        sliderWidget2.sliderLocked = true;
        sliderWidget1.sliderLocked = false;
      }
      else if (sliderEvent == SLIDER_EVENT_NULL)
      {
        sliderWidget1.sliderLocked = false;
        sliderWidget2.sliderLocked = false;
      }
    }
    
    void released()
    {
      if (sliderEvent != SLIDER_EVENT_NULL)
      {
        int previousEvent = sliderEvent;
        sliderEvent = SLIDER_EVENT_NULL;
        sliderWidget1.sliderLocked = false;
        sliderWidget2.sliderLocked = false;
        if (previousEvent == SLIDER_EVENT_ONE)
        {
          if (sliderWidget1.x<x+3)
              sliderWidget1.x = x+3;
          if (sliderWidget1.x>sliderWidget2.x-sliderWidget1.width)
              sliderWidget1.x = sliderWidget2.x-sliderWidget1.width;
        }
        else if (previousEvent == SLIDER_EVENT_TWO)
        {
          if (sliderWidget2.x<sliderWidget1.x+sliderWidget1.width)
              sliderWidget2.x = sliderWidget1.x+sliderWidget1.width;
          if (sliderWidget2.x>x+width-sliderWidget2.width-3)
              sliderWidget2.x = x+width-sliderWidget2.width-3;
        }
      }
      switch (colTypes.get(dataKey))
      {
      case "int":
      case "float":
        double value;
        for (DataPoint element: fileCache.get(fileMenu.currentOption))
        {
          if (element.get(dataKey).trim().equalsIgnoreCase("inf"))
            value = maxNumberDisplay;
          else
          {
            try
            {
              value = Double.parseDouble(element.get(dataKey));
              if (value ==0 && !element.get(dataKey).equals("0"))
                value = minNumberDisplay;
            }
            catch (NumberFormatException e)
            {
              value = minNumberDisplay;
            }
          }
          if ((value < minNumberDisplay || value > maxNumberDisplay) && !element.inactiveFilters.contains(this))
          {
            element.inactiveFilters.add(this);
            wasQueryChanged = true;

          }
          else if (!(value < minNumberDisplay || value > maxNumberDisplay) && element.inactiveFilters.contains(this))
          {
            element.inactiveFilters.remove(this);
            wasQueryChanged = true;

          }
        }
        break;
      case "Date":
      for (DataPoint element: fileCache.get(fileMenu.currentOption))
      {
        Date date = new Date(element.get(dataKey));
        if (date.year <= 1000)
          date = minDateDisplay;
        
        if ((date.isLessThan(minDateDisplay) || date.isGreaterThan(maxDateDisplay)) && !element.inactiveFilters.contains(this)) 
        {
          element.inactiveFilters.add(this);
          wasQueryChanged = true;

        }
        else if (!(date.isLessThan(minDateDisplay) || date.isGreaterThan(maxDateDisplay)) && element.inactiveFilters.contains(this))
        {
          element.inactiveFilters.remove(this);
          wasQueryChanged = true;

        }
      }
      
      //println(dataKey,minNumberDisplay,maxNumberDisplay);
    }
  }
}

class SliderWidget
{
     int x, y, width, height, event;
     color sliderColor;
     boolean overSlider, sliderLocked;
     int initialX;
     
     SliderWidget(int x, int y, int width, int height, int event, color sliderColor)
     {
          this.x = x;
          this.y = y;
          initialX = x;
          this.width = width;
          this.height = height;
          this.event = event;
          this.sliderColor = sliderColor;
          overSlider = false;
          sliderLocked = false;
     }
     
     void draw()
     {
       fill(sliderColor);
       if (overSlider||sliderLocked)
           stroke(255,0,0);
       else
           noStroke();
       rect(x,y,width,height);
       if (sliderLocked)
       {
         x = mouseX;
       }
       noStroke();
     }
     
     int getEvent(int mX, int mY)
     {
     if(mX>x && mX < x+width && mY >y && mY <y+height){
        overSlider = true;
        return event;
     }
     overSlider = false;
     return SLIDER_EVENT_NULL;
  }
}
    
