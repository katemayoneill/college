class dropDownMenuWidget // peter
{
  String currentOption;
  String [] inactiveOptions;
  boolean isMouseOver;
  int x;
  int y;
  color activeColor;
  color inactiveColor;
  color textColor;
  int boxHeight = 20;
  int boxWidth = 80;
  boolean optionChanged;
  int offset;
  verticalScrollBar scrollBar;
  
  dropDownMenuWidget(String currentOption,int x,int y,color activeColor,color textColor,String[] inactiveOptions,color inactiveColor,verticalScrollBar scrollBar)
  {
    this.currentOption = currentOption;
    this.x = x;
    this.y = y;
    this.activeColor = activeColor;
    this.textColor = textColor;
    this.inactiveOptions = inactiveOptions;
    this.inactiveColor = inactiveColor;
    this.scrollBar = scrollBar;
  }
  
  void draw()
  {
    stroke(255);
    fill(activeColor);
    rect(x,y,boxWidth,boxHeight);
    textFont(plainFont);
    fill(textColor);
    text(currentOption,x+2,y+15);  
    if (isMouseOver)
    {
      for (int i = 0; i < min(5,inactiveOptions.length); i++)
      {
        fill(inactiveColor);
        rect(x,y+(i+1)*boxHeight,boxWidth,boxHeight);
        fill(textColor);
        text(inactiveOptions[i+offset],x+2,y+(i+1)*boxHeight+15);        
      }
    }
  }
  
  boolean getEvent(int mX,int mY)
  {
    if ((scrollBar!=null && scrollBar.overEvent()) || (!isMouseOver && (mX > x && mX < x+boxWidth && mY > y && mY < y+boxHeight)))
    {
      isMouseOver = true;
    }
    else if (isMouseOver && ((scrollBar!=null && mX > scrollBar.xpos || mX > x) && mX < x+boxWidth && mY > y && mY < y+boxHeight*(1+inactiveOptions.length)))
    {
    }
    else
    {
      isMouseOver = false;
    }
    return isMouseOver;
  }
  
  void click()
  {
    if (scrollBar!=null && scrollBar.overEvent())
      return;
    int yPos = (mouseY - y)/20+offset;
    if (yPos != 0)
    {
      String temp = currentOption;
      currentOption = inactiveOptions[yPos-1];
      inactiveOptions[yPos-1] = temp;
      optionChanged = true;
      wasQueryChanged = true;
    }
  }
  
  void scroll(float scrollAmount)
  {
    offset += scrollAmount;
    if (offset > inactiveOptions.length-5)
      offset = inactiveOptions.length-5;
    if (offset < 0)
      offset = 0;
    if (scrollBar!=null)
    {
      scrollBar.newSliderPos = offset*scrollBar.sliderHeight/inactiveOptions.length+y;
      if (scrollBar.newSliderPos < scrollBar.ypos || scrollBar.newSliderPos > scrollBar.ypos + scrollBar.sliderHeight)
        scrollBar.newSliderPos -= scrollAmount*boxHeight;
      scrollBar.update();
      
    }
  }
  void scrollBarUpdate()
  {
    offset = (int)(scrollBar.sliderPos-y)*inactiveOptions.length/scrollBar.sliderHeight;
    scroll(0);

  }
  
}
