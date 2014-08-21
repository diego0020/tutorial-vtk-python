class Buttons
{
  class Button
  {
    int x;
    int y;
    int w;
    int h;
    
    String label;
    String tag;
    
    boolean hasMouse()
    {
      return mouseX >= x && mouseX <= (x+w) && 
             mouseY >= y && mouseY <= (y+h);  
    } 
   
    void draw()
    {
      boolean inside  = hasMouse();
      boolean clicked = inside && mousePressed && mouseButton == LEFT;
      
      stroke( inside ? 255 : 192 );
      
      fill( clicked ? 128 : 0 );
      rect( x, y, w, h );
      
      textSize( 16 );
      
      fill( inside ? 255 : 192 );
      textAlign( CENTER, CENTER );
      text( label, x+w/2, y+h/2 );
    }
  };  ArrayList buttons;
  
  Buttons() 
  {
    buttons = new ArrayList();
  }
  
  void add( int x, int y, int w, int h, String label, String tag )
  {
    Button b = new Button();
    
    b.x = x;
    b.y = y;
    b.w = w;
    b.h = h;
    b.label = label;
    b.tag   = tag;
    
    buttons.add( b );
  }
  
  void draw()
  {
    pushMatrix();
    resetMatrix();
    
    for( int i=0; i<buttons.size(); ++i )
      ((Button)buttons.get(i)).draw();
    
    popMatrix();
  }
  
  String clicked()
  {
    for( int i=0; i<buttons.size(); ++i )
    {
      Button b = (Button)buttons.get(i);
      
      if( b.hasMouse() )
        return b.tag;
    }
    
    return null;
  }
}
