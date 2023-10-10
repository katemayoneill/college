class Graph      // peter
{
  int x;
  int y;
  int totalWidth;
  int totalHeight;
  Bar [] bars;
  int offset;
  int maxDisplayedBars = 10;
  Double maxBarValue;
  int selectedBarIndex;
  String currentVariable;
  String lastBarClicked = "defaultLastBar";
  
  Graph(int totalWidth,int totalHeight)
  {
    bars = new Bar[0];
    this.totalWidth = totalWidth;
    this.totalHeight = totalHeight;
  }
  
  void draw()
  {
    fill(255);
    rect(x,y,totalWidth,totalHeight);
    for (int i = 0; i < maxDisplayedBars; i++)
    {
      if (bars[i+offset] != null)
        bars[i+offset].draw(40+x+i*75);
    }
    textFont(smallNumFont);
    fill(0);
    rect(x+35,y,2,totalHeight-1);
    int numDigits = ceil((float)Math.log10(maxBarValue+1));
    int increment = (int)pow(10,numDigits-1);
    int firstDigit = Character.getNumericValue((maxBarValue+"").charAt(0));
    int roundedTop = (int)(Math.ceil(maxBarValue/pow(10,numDigits-1))*pow(10,numDigits-1));

    if (numDigits > 2 && firstDigit <= 1 && Character.getNumericValue((maxBarValue+"").charAt(1))<=5)
      increment /= 2;
    else if (numDigits > 1 && firstDigit <= 3)
      increment /= 4;
    for (int i = 0; i <= roundedTop; i += increment)
    {
      if (i == 0)
      {
        rect(25,i*totalHeight/roundedTop,10,2);
        text(roundedTop - i,0,i*totalHeight/roundedTop+10);
      }
      else if (i+increment > roundedTop || i == roundedTop)
      {
        rect(25,i*totalHeight/roundedTop-2,10,2);
        text(roundedTop - i,0,i*totalHeight/roundedTop);
      }
      else
      {
        rect(25,i*totalHeight/roundedTop,10,2);
        text(roundedTop - i,0,i*totalHeight/roundedTop+5);
      }
    }
    
  }
  
  void processBasicQuery(String variable, DataPoint [] dataPoints)
  {
    //println("query");
    clearBarSelection();
    currentVariable = variable;
    
    LinkedHashMap<String,Double> barValues = new LinkedHashMap<String,Double>();
    HashMap<String,Integer> barCount = new HashMap<String,Integer>();
    String col;
    
    
    for (DataPoint element : dataPoints)
    {
      element.currentSortedByField = variable;
    }
    Arrays.sort(dataPoints);
    
    //StringFilter[] changedStringFilters = Arrays.stream(stringFilters).filter(s->s.wasOptionChanged).toArray(StringFilter[]::new);
    for (DataPoint element: dataPoints)
    {
      if (element.inactiveFilters.size() ==0)
      {
        col = element.get(variable);
        if (col == null)
          col = "null";
        if (secondVarMenu.currentOption.equals("Count"))
        {
          if (barValues.containsKey(col))
            barValues.put(col,barValues.get(col)+1);
          else
            barValues.put(col,new Double(1.0));
        }
        else
        {
          if (barValues.containsKey(col))
          {
            barValues.put(col,barValues.get(col)+safeStringToDouble(element.get(secondVarMenu.currentOption)));
            barCount.put(col,barCount.get(col)+1);
          }
          else
          {
            barValues.put(col,safeStringToDouble(element.get(secondVarMenu.currentOption)));
            barCount.put(col,1);
          }
        }
      }
    }
    
    if (graphTypeMenu.currentOption.equals("Averages"))
    {
      if (secondVarMenu.currentOption.equals("Count"))
      {
        for (HashMap.Entry<String,Double> entry : barValues.entrySet() )
        {
          barValues.put(entry.getKey(),new Double(1));
        }
      }
      else
      {
        for (HashMap.Entry<String,Double> entry : barValues.entrySet() )
        {
          barValues.put(entry.getKey(),entry.getValue()/barCount.get(entry.getKey()));
        }
      }
    }
    bars = new Bar[max(barValues.size(),maxDisplayedBars)];
    
    maxBarValue = new Double(Integer.MIN_VALUE);
    
    for (double value: barValues.values())
    {
      if (maxBarValue < value)
        maxBarValue = value;
    }
    
    int i = 0; 

    String [] keys = barValues.keySet().toArray(String[]::new);
    
    int numDigits = ceil((float)Math.log10(maxBarValue+1));
    int roundedTop = (int)(Math.ceil(maxBarValue/pow(10,numDigits-1))*pow(10,numDigits-1));
    i = 0;
    int shiftedVal;
    for (String keyWord: keys)
    {
      shiftedVal = (int)Math.round(barValues.get(keyWord))*totalHeight/roundedTop;
      if (shiftedVal < 2 && barValues.get(keyWord)!=0)
        shiftedVal += 2;
      bars[i] = new Bar(40+x+i*75,totalHeight,65,shiftedVal,color(#13c2a8),keyWord,plainFont);
      i++;
    }
    scroll(0.0,null);


    Bar currentBar = bars[x+offset];
    if (lastBarClicked!= null && !lastBarClicked.equals("defaultLastBar") && currentBar != null)
    {
      SubSetDisplayer.updateDataSet(Arrays.stream(fileCache.get(fileMenu.currentOption))
            .filter(d-> d.get(currentVariable).equals(currentBar.label)&& d.inactiveFilters.size() ==0)
            .map(d->d.label)
            .toArray(String[]::new));
    }
    else
    {
      SubSetDisplayer.updateDataSet(Arrays.stream(fileCache.get(fileMenu.currentOption))
            .filter(d->d.inactiveFilters.size() ==0)
            .map(d->d.label)
            .toArray(String[]::new));
    }
    

  }
  
  boolean getEvent(int mX,int mY)
  {
    if (mX >= x && mX <= x+totalWidth && mY >= y && mY <= y +totalHeight)
      return true;
    else
      return false;
  }
  
  void scroll(float scrollAmount, scrollBar sb)
  {
    offset += scrollAmount;
    if (offset > bars.length-maxDisplayedBars)
      offset = bars.length-(maxDisplayedBars);
    if (offset < 0)
      offset = 0;
    
    if (sb!=null)
    {
      sb.newSliderPos = offset*(sb.sliderWidth)/bars.length;
      sb.update();
    }
    
  }
  
  void scrollBarUpdate(int sliderPos, int sliderWidth)
  {
    offset = sliderPos*bars.length/sliderWidth;
    if (offset > bars.length-maxDisplayedBars)
      offset = bars.length-(maxDisplayedBars);
    if (offset < 0)
      offset = 0;
  }
  
  void click(int mX,int mY)
  {
    if (!getEvent(mX,mY))
      return;
    int x = (int)Math.floor((mX-40.0)/75.0);
    if (x>=0 && x <= maxDisplayedBars)
    {
      Bar currentBar = bars[x+offset];
      if (currentBar != null && (lastBarClicked==null || !lastBarClicked.equals(currentBar.label)) 
      && mX+offset*75 >= currentBar.x && mX+offset*75<= currentBar.x+currentBar.width && mY <= currentBar.y && mY >= currentBar.y-currentBar.height)
      {
        clearBarSelection();
        SubSetDisplayer.updateDataSet(Arrays.stream(fileCache.get(fileMenu.currentOption))
            .filter(d->d.get(currentVariable).equals(currentBar.label) && d.inactiveFilters.size() ==0)
            .map(d->d.label)
            .toArray(String[]::new));
        currentBar.selected = true;
        selectedBarIndex = x+offset;
        lastBarClicked = currentBar.label;
      }
      else if (lastBarClicked != null && (currentBar==null || lastBarClicked!=currentBar.label))
      {
        SubSetDisplayer.updateDataSet(Arrays.stream(fileCache.get(fileMenu.currentOption))
        .filter(d-> d.inactiveFilters.size() ==0)
        .map(d->d.label)
        .toArray(String[]::new));
        clearBarSelection();
        lastBarClicked = null;
      }
    }
    else if (lastBarClicked!=null)
    {
      clearBarSelection();
      SubSetDisplayer.updateDataSet(Arrays.stream(fileCache.get(fileMenu.currentOption))
        .filter(n->n!=null && n.inactiveFilters.size() ==0)
        .map(d->d.label)
        .toArray(String[]::new));
      lastBarClicked = null;
    }
  }
  
  void clearBarSelection()
  {
    if (bars!=null && bars.length>selectedBarIndex)
    {
      if (bars[selectedBarIndex]!=null)
        bars[selectedBarIndex].selected = false;
      selectedBarIndex = 0;
    }
  }
  
  int typedComparison(String a, String b, String type)
  {
    switch (type)
    {
      case "String":
      case "Boolean":
        return a.compareTo(b);
     case "int":
     case "float":
       try
       {
         double A = Double.parseDouble(a);
         double B = Double.parseDouble(b);
         return (A > B)? 1 : ((A<B)? -1 : 0);
       }
       catch (NumberFormatException e)
       {
         int A = parseInt(a);
         int B = parseInt(b);
         return (A > B)? 1 : ((A<B)? -1 : 0);
       }
    case "date":
      return new Date(a).compareTo(new Date(b));
    default:
      return 0;
  }
 }
}

String autoNewLine(String paragraph,int size)
{
  String newParagraph = "";
  for (int i = 0; i< paragraph.length(); i++)
  {
    if ((i)%size==0 && i!=0)
      newParagraph += "\n";
    newParagraph += paragraph.charAt(i);
  }
  return newParagraph;
}

boolean isNumeric(String word) // peter
{
  try
  {
    Double.parseDouble(word);
    return true;
  }
  catch(Exception e)
  {
    return false;
  }
}

String roundIntFloat(String num)
{
  if (num.length()<3)
    return num;
  if (num.charAt(num.length()-1)==48 && num.charAt(num.length()-2)==46)
    return num.substring(0,num.length()-2);
  return num;
}

double safeStringToDouble(String num)
{
  try
  {
    return Double.parseDouble(num);
  }
  catch(NumberFormatException e)
  {
    return 0;
  }
}
