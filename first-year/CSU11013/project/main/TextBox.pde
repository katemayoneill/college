public class TextBox {
  public int X = 0, Y = 0, H = 35, W = 200;
  public int TEXTSIZE = 24;

  public color Background = color(255);
  public color Foreground = color(0);
  public color BackgroundSelected = color(255);


  public boolean BorderEnable = false;
  public int BorderWeight = 1;

  public String Text = "";
  public int TextLength = 0;

  private boolean selected = false;

  TextBox() {
  }

  TextBox(int x, int y, int w, int h) {
    X = x;
    Y = y;
    W = w;
    H = h;
  }

  void draw() {
    if (selected) {
      fill(BackgroundSelected);
    } else {
      fill(Background);
    }
    rect(X, Y, W, H);

    fill(Foreground);
    textSize(TEXTSIZE);
    text(Text, X + (textWidth("a") / 2), Y + TEXTSIZE);
  }
  
  void filter()
  {
    switch (searchTypesMenu.currentOption)
    {
      case "Starts With":
        for (DataPoint element: fileCache.get(fileMenu.currentOption))
        {
           if (!element.get(searchSubjectMenu.currentOption).startsWith(Text) && !element.inactiveFilters.contains(this))
           {
             element.inactiveFilters.add(this);
             wasQueryChanged = true;
           }
           else if (element.get(searchSubjectMenu.currentOption).startsWith(Text) && element.inactiveFilters.contains(this))
           {
             element.inactiveFilters.remove(this);
             wasQueryChanged = true;
           }
        }
        break;
      case "Contains":
        for (DataPoint element: fileCache.get(fileMenu.currentOption))
        {
           if (!element.get(searchSubjectMenu.currentOption).contains(Text) && !element.inactiveFilters.contains(this))
           {
             element.inactiveFilters.add(this);
             wasQueryChanged = true;
           }
           else if (element.get(searchSubjectMenu.currentOption).contains(Text) && element.inactiveFilters.contains(this))
           {
             element.inactiveFilters.remove(this);
             wasQueryChanged = true;
           }
        }
        break;
      case "Ends With":
        for (DataPoint element: fileCache.get(fileMenu.currentOption))
        {
           if (!element.get(searchSubjectMenu.currentOption).endsWith(Text) && !element.inactiveFilters.contains(this))
           {
             element.inactiveFilters.add(this);
             wasQueryChanged = true;
           }
           else if (element.get(searchSubjectMenu.currentOption).endsWith(Text) && element.inactiveFilters.contains(this))
           {
             element.inactiveFilters.remove(this);
             wasQueryChanged = true;
           }
        }
    }
  }

  boolean KEYPRESSED(char KEY, int KEYCODE) {
    if (selected) {
      if (KEYCODE == (int)BACKSPACE) {
        BACKSPACE();
      } else if (KEYCODE == 32) {
        // SPACE
        addText(' ');
      } else if (KEYCODE == (int)ENTER) {
        return true;
      } else {
        // CHECK IF THE KEY IS A LETTER OR A NUMBER
        boolean isKeyCapitalLetter = (KEY >= 'A' && KEY <= 'Z');
        boolean isKeySmallLetter = (KEY >= 'a' && KEY <= 'z');
        boolean isKeyNumber = (KEY >= '0' && KEY <= '9');

        if (isKeyCapitalLetter || isKeySmallLetter || isKeyNumber) {
          addText(KEY);
          filter();
        }
      }
    }

    return false;
  }

  private void addText(char text) {
    if (textWidth(Text + text) < W) {
      Text += text;
      TextLength++;
    }
  }

  private void BACKSPACE() {
    if (TextLength - 1 >= 0) {
      Text = Text.substring(0, TextLength - 1);
      TextLength--;
      filter();
    }
  }
  private boolean overBox(int x, int y) {
    if (x >= X && x <= X + W) {
      if (y >= Y && y <= Y + H) {
        return true;
      }
    }

    return false;
  }

  void PRESSED(int x, int y) {
    if (overBox(x, y)) {
      selected = true;
    } else {
      selected = false;
    }
  }
}
