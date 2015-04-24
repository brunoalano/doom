/**
 * Displays a Button into Interace
 */
class Button implements UiElement {
  float button_width, button_height;
  PVector coordinate;
  
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
