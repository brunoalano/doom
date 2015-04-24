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
import java.util.Observer;
import java.util.Observable;
import java.util.List;
import java.util.Arrays;

/**
 * Creates the Interaction Interface
 *
 * This interface will allow user to start the
 * game client
 */
class GameInterface extends Observable {
  /**
   * Store the elements
   */
  ArrayList<UiElement> elements = new ArrayList();
  
  /**
   * Store if need to redraw
   */
  boolean needRedraw = false;
  
  /**
   * Receives a Click Action
   */
  public void receiveClickAction( List coordinate )
  {
    setChanged();
    notifyObservers(coordinate);
  }
  
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
    
    /* Observe */
    this.addObserver(startButton);
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
    /* Debug */
    println("Drawing...");
    
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

/**
 * Receive Click Events
 */
void mouseClicked()
{
  /* Immutable List of Coordinates of Click */
  List<Integer> coord = Arrays.asList(mouseX, mouseY);
  
  /* Debug message */
  println("Clicked at X: " + coord.get(0) + " and Y: " + coord.get(1));
  
  /* Send to interface */
  game_interface.receiveClickAction( coord );
}
