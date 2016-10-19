int i=50;

class Button {
  int x, y;
  boolean isClicked=false;


  Button(int buttonX, int buttonY) {
    x=buttonX;
    y=buttonY;
  }

  boolean checkClicked(int mx, int my) {
    if (mx>x && my>y && mx<x+i && my<y+i) {
      if (isClicked) {
        isClicked=false;
      } else {
        isClicked=true;
      }
    }
    return isClicked;
  }

  void draw() {
    if (isClicked) {
      fill(100);
    } else {
      fill(255);
    }
    rect(x, y, i, i);
  }

  boolean clicked() {
    return isClicked;
  }
  void notClicked() {
    isClicked = false;
  }
}



int size=10;
Button buttonR=new Button(20, 20);
Button buttonG=new Button(20, 20+i);
Button buttonB=new Button(20, 20+2*i);
Button buttonY=new Button(20, 20+3*i);

void mouseClicked() {
  boolean newClickR = buttonR.checkClicked(mouseX, mouseY);
  boolean newClickG =buttonG.checkClicked(mouseX, mouseY);
  boolean newClickB =buttonB.checkClicked(mouseX, mouseY);
  boolean newClickY =buttonY.checkClicked(mouseX, mouseY);

  if (newClickR) {
    buttonG.notClicked();
    buttonY.notClicked();
    buttonB.notClicked();
  }
  if (newClickG) {
    buttonR.notClicked();
    buttonY.notClicked();
    buttonB.notClicked();
  }
  if (newClickB) {
    buttonR.notClicked();
    buttonY.notClicked();
    buttonG.notClicked();
  }
  if (newClickY) {
    buttonR.notClicked();
    buttonG.notClicked();
    buttonB.notClicked();
  }
}

void setup() {
  size(1000, 1000);
  background(0);
}

void draw() {
  if (buttonR.clicked()) {
    if (mousePressed) {
      fill(139, 0, 0);
      rect(mouseX, mouseY, size, size);
    }
  }
  if (buttonG.clicked()) {
    if (mousePressed) {
      fill(0, 139, 0);
      rect(mouseX, mouseY, size, size);
    }
  }
  if (buttonB.clicked()) {
    if (mousePressed) {
      fill(0, 0, 139);
      rect(mouseX, mouseY, size, size);
    }
  }
  if (buttonY.clicked()) {    
    if (mousePressed) {
      fill(139, 139, 0);
      rect(mouseX, mouseY, size, size);
    }
  }


  buttonR.draw();
  buttonG.draw();
  buttonB.draw();
  buttonY.draw();
}

