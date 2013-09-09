class Box {
  float x;
  float y;
  float w;
  float h;  
  int stWeight;
  String text;
  boolean drag;
  color cFG;
  color cST;  
  color cTX;

  Box() {
    x = 0;
    y = 0;
    w = width;
    h = width;
    cFG = bgColor;
    cST = stColor;
    cTX = fgColor;
    stWeight = 1;    
    text = "";
    drag = false;
  }

  Box(float mX, float mY, float mW, float mH) {
    x = mX;
    y = mY;
    w = mW;
    h = mH;
    cFG = bgColor;
    cST = stColor;
    cTX = fgColor;
    stWeight = 1;
    text = "";   
    drag = false; 
  }

  void setStroke(color mC, int weight) {
    cST = mC;
    stWeight = weight;
  }

  void setFill(color mC) 
  {
    cFG = mC;
  }
  void setText(color mC) 
  {
    cTX = mC;
  }


  void  draw() {
    fill(cFG);
    if(stWeight == 0) {
      noStroke();
    } 
    else {    
      stroke(cST);
      strokeWeight(stWeight); 
    }
    rect(x, y, w, h);
    fill(cTX);
    if(text.length() > 0) {
      textFont(Fsystem,13);
      text(text, x+3,y+h-4);
    }
    if(drag) {
      fill(0);
      triangle((x+w)-15, y+(h/2), (x+w)-11, y+4,(x+w)-11, y+h-4);
      triangle((x+w)-4, y+(h/2), (x+w)-8, y+4, (x+w)-8, y+h-4);
    }
  } 
}

String getText(int keycode) {
  String keytext = "";
  if(keycode == BACKSPACE) {
    keytext = "Backspace";
  }
  if(keycode == LEFT) {
    keytext = "Left";
  }
  if(keycode == RIGHT) {
    keytext = "Right";
  }
  if(keycode == DOWN) {
    keytext = "Down";
  }
  if(keycode == UP) {
    keytext = "Up";
  }
  if(keycode == SHIFT) {
    keytext = "Shift";
  }
  if(keycode == ALT) {
    keytext = "Alt";
  }
  if(keycode == CONTROL) {
    keytext = "Control";
  }
  if(keycode == RETURN) {
    keytext = "Return";
  }
  if(keycode == ENTER) {
    keytext = "Enter";
  }
  if(keycode == TAB) {
    keytext = "Tabulator";
  }
  if(keycode == ESC) {
    keytext = "Escape";
  }
  return keytext;
}



