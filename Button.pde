class Button {
  float x, y, w, h;
  String label;

  Button(float xp, float yp, float wd, float ht) {
    x = xp;
    y = yp;
    w = wd;
    h = ht;
  }

  public void setLabel(String l) {
    label = l;
  }

  public void display(StyleCollection arrayOfStyles) {
    Style current = arrayOfStyles.getStyle(label);
    stroke(70);
    fill(current.getBackground());
    rect(x, y, w, h);
    fill(current.getStrokeColor());
    textSize(current.getTextSize());
    text(label, x+10, y+50);
  }


  public boolean isInside(float mX, float mY) {
    if (mX<x+w && mX>x && mY<y+h && mY>y) {
      return true;
    } else {
      return false;
    }
  }

  public String getText() {
    return label;
  }
}
