class DataPointDisplayer //peter
{
  int numDataPointsVisible;
  int boxHeight;
  int boxWidth;
  color textColor;
  color boxColor;
  String [] dataPoints;
  int offset;
  int x;
  int y;
  
  DataPointDisplayer(int x, int y, int numDataPointsVisible,int boxHeight,int boxWidth,color textColor,color boxColor)
  {
    this.x = x;
    this.y = y;
    this.numDataPointsVisible=numDataPointsVisible;
    this.boxHeight=boxHeight;
    this.boxWidth=boxWidth;
    this.textColor=textColor;
    this.boxColor=boxColor;
    dataPoints = new String[0];
  }
  
  void updateDataSet(String [] dataPoints)
  {
    offset = 0;
    this.dataPoints = dataPoints;
  }
  void scroll(float scrollAmount)
  {
    if (dataPoints.length < 2)
      return;
    offset = constrain((int)(offset+scrollAmount),0,dataPoints.length-numDataPointsVisible);
  }
  boolean getEvent(int mX,int mY)
  {
    if (mX >= x && mX<=x+boxWidth && mY >= y && mY <= y+boxHeight)
      return true;
    return false;
  }
  void draw()
  {
    textFont(plainFont);
    stroke(0);
    fill(boxColor);
    rect(x,y,boxWidth,boxHeight);
    noStroke();
    fill(textColor);
    if (dataPoints.length!=0)
      text(dataPoints[offset],x+5,y+15);
  }
}
