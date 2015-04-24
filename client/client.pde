/**
 * Doom Client
 *
 * This project aims to create a virtual Doom clone where you
 * can play as many users.
 *
 * @author Bruno Alano Medina <bruno@appzlab.com>
 * @author Yuri S. B.
 *
 * @license LGPL
 */
import java.util.Iterator;

/**
 * Creates the Interaction Interface
 *
 * This interface will allow user to start the
 * game client
 */
class GameInterface {
  /**
   * Store the elements
   */
  ArrayList<UiElement> elements = new ArrayList();
  
  /**
   * Store if need to redraw
   */
  boolean needRedraw = false;
  
  /**
   * Construct the new Interface
   */
  GameInterface()
  {
    /* Set the window size */
    size(800, 600);
    
    /* Define the background */
    background(255);
    
    /* Create Start Button */
    Button startButton = new Button(100.0, 100.0, new PVector(100.0, 100.0));
    this.add( startButton );
  }
  
  /**
   * Add Elements to Render
   *
   * This method will add elements to render in the
   * next Processing loop
   */
  void add(UiElement obj)
  {
    /* Add to the Vector of elements */
    elements.add(obj);
    
    /* Set to redraw */
    this.needRedraw = true;
  }
  
  /**
   * Draw the elements into Interface
   */
  void draw()
  {
    /* Iterate objects to draw */
    Iterator objectIterator = this.elements.iterator();
    while ( objectIterator.hasNext() )
    {
      Button btn = (Button)objectIterator.next();
      btn.draw();
    }
    
    /* Don't draw more */
    this.needRedraw = false;
  }
}

/**
 * Store Variables
 */
GameInterface game_interface;

/**
 * Setup from Processing
 */
void setup()
{
  game_interface = new GameInterface();
}

/**
 * Loop from Processing
 */
void draw()
{
  if ( game_interface.needRedraw )
  {
    game_interface.draw();
  }
}
