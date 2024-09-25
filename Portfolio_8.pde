String text = "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin \n literature from 45 BC, making it over 2000 years old. ";
String[] styleNames = {"dark", "light", "red", "blue"};
StyleCollection styles;
Style currentStyle; //the style object currently applied
Button[] buttons;

void setup() {
  size(800, 600);
  setupStyles();
  setupButtons();
}

void draw() {
  background(currentStyle.getBackground());
  fill(currentStyle.getFillColor());
  stroke(currentStyle.getStrokeColor());
  textSize(16);
  text(text, 50, 50);

  for (int i=0; i<buttons.length; i++) {
    buttons[i].display(styles);
  }
}

void setupStyles() {
  styles = new StyleCollection();
  Style dark = new Style("dark", color(0), color(255), color(255), 32);
  Style light = new Style("light", color(255), color(0), color(0), 32);
  Style red = new Style("red", color(50, 0, 0), color(255, 0, 0), color(255, 0, 0), 32);
  Style blue = new Style("blue", color(0, 0, 50), color(0, 0, 255), color(0, 0, 255), 32);

  styles.addStyle(dark);
  styles.addStyle(light);
  styles.addStyle(red);
  styles.addStyle(blue);

  currentStyle = dark;

  styles.setDefaultStyle(currentStyle);
}

void setupButtons() {
  buttons = new Button[4];
  for (int i=0; i<buttons.length; i++) {
    buttons[i] = new Button(100 + i*width/5, 450, 100, 80);
    buttons[i].setLabel(styleNames[i]);
  }
}

void mousePressed() {
  for (int i=0; i<buttons.length; i++) {
    if(buttons[i].isInside(mouseX, mouseY)){
    String clickedButton = buttons[i].getText(); //gets the label
    currentStyle = styles.getStyle(clickedButton);
    }
  }
}
