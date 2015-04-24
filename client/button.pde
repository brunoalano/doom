import java.util.Observable;
import java.util.Observer;

/**
 * Displays a Button into Interace
 */
class Button implements UiElement, Observer {
  float button_width, button_height;
  PVector coordinate;
  
  /**
   * Receives event from Observerable
   *
   * The observable will send an object to this Observer, and
   * we will call an action when the X and Y are defiend for
   * this button
   */
  public void update(Observable o, Object arg) {
    /* Fetch coordinate (X, Y) */
    List<Integer> click_coordinate = (List<Integer>) arg;
    
    /* Check if we are selected by the click */
    if ( click_coordinate.get(0) >= this.coordinate.x && click_coordinate.get(0) <= (this.coordinate.x + this.button_width) |
        click_coordinate.get(1) >= this.coordinate.y && click_coordinate.get(1) <= (this.coordinate.y + this.button_height) )
    {
      /* Call the click action */
      this.clicked( click_coordinate );
    }
  }
  
  /**
   * Action when Clicked
   *
   * When the user clicked in this element, we catch this
   * actino based on the Observer pattern
   */
  public void clicked(List<Integer> position)
  {
    background(0);
  }
  
  /**
   * Creates the Button Object
   *
   * @param button_width   size of the button
   * @param button_height  size of the button
   * @param coordinate     coordinate of x,y axis
   */
  Button(float button_width, float button_height, PVector coord)
  {
    this.coordinate = coord;
    this.button_width = button_width;
    this.button_height = button_height;
  }
   
  /**
   * Draw this Object into Interface
   */
  void draw() {
    pushStyle();
    fill(0);
    rect(coordinate.x, coordinate.y, button_width, button_height);
    popStyle();
  }
}
