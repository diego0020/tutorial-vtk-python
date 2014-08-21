// global Buttons instance for a minimal GUI
Buttons  buttons;

// color for the circle
color circleColor = color( 255, 0, 0 );



// this function is called once at the beginning of execution
void setup() 
{ 
  // resize the window to 800x800
  size( 800, 800 );
  
  // add minimal GUI
  buttons = new Buttons();
  
  // syntax: buttons.add( x, y, w, h, label, tag )
  //   x, y are the upper left corner in window pixel coordinates
  //   w, h are width and height in window pixel coordinates
  //   label is the text drawn into the button
  //   tag is the string returned from buttons.clicked()
  
  buttons.add( 10, 10, 780, 20, "make circle red", "red" );
  buttons.add( 10, 40, 780, 20, "make circle blue", "blue" );
}



// this function is called periodically to redraw the window
// (see documentation of loop(), noLoop(), redraw() and frameRate)
void draw()
{
  // clear window with a dark gray background
  background( 64 );

  fill( circleColor );
  stroke( 255 );
  
  float angle = 2*PI*( 0.5 + 0.5*cos( millis() / 10000.0 * 2*PI ) );
  
  arc( 400, 400, 600, 600, 0, angle, PIE );

  // draw the GUI
  buttons.draw();  
}



// this function is called whenever a mouse button is pressed
void mouseClicked()
{
  // check if a button was clicked
  String r = buttons.clicked();
    
  if( r == null )
    // no button clicked, do nothing
    ;
  else if( r == "red" )
    circleColor = color( 255, 0, 0 );
  else if( r == "blue" )
    circleColor = color( 0, 0, 255 );
}
