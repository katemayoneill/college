// Peter, 11/04/2022
// credit for creating second window goes to https://stackoverflow.com/questions/32243316/new-window-in-processing
// credit for closing second window without closing main goes to https://forum.processing.org/two/discussion/17310/intercept-window-closure-in-p2d-renderer-processing-3
/*public class DataPointApplet extends PApplet {
  String data;
  DataPointApplet(String data)
  {
    this.data = data;
  }
  public void settings() {
    size(200, 400);
  }
  
  void setup()
  {
    setDefaultClosePolicy(this);
  }
  
  void setDefaultClosePolicy(PApplet pa)
  {
    final Object surf = pa.getSurface().getNative();
    final javax.swing.JFrame f = (javax.swing.JFrame)
      ((processing.awt.PSurfaceAWT.SmoothCanvas) surf).getFrame(); 
    for (java.awt.event.WindowListener wl : f.getWindowListeners())
      if (wl.toString().startsWith("processing.awt.PSurfaceAWT"))
        f.removeWindowListener(wl);
    f.setDefaultCloseOperation(f.DISPOSE_ON_CLOSE);
  }
  public void draw() {
    background(255);
    fill(0);
    text(data,20,20);
  }

}*/
