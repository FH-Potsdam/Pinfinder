/**
 * Pinfinder a small sketch for finding the right pins/keys for a keyboard hack
 * @author mphasize
 * http://mphasize.de/
 *
 * Copyright (c) 2013 mphasize
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

color bgColor = color(50);
color stColor = color(255);
color fgColor = color(255);

PFont Fsystem;

int fader = 0;
int keycount = 0;

Key[] keys = new Key[10];

String textnow = "";

void setup() {
  size(800,330);
  Fsystem = createFont("Arial", 13);
  Key k = new Key("");
  for(int i = 0; i < keys.length; i++) {
    keys[i] = k;
  }
}


void draw () {
  if(fader > 0) {
    fader -= 5;
  }
  background(0);
  fill(255, fader);
  textFont(Fsystem, 60);
  text(textnow, 50, 120);
  pushMatrix();
  translate(640,10);
  for(int i = 0; i < keys.length; i++) {
    keys[i].draw();
    translate(0,30);
  }
  popMatrix();
}



void keyPressed(java.awt.event.KeyEvent e) {
  Key k;
  int kc = e.getKeyCode();
  textnow = e.getKeyText(kc);
  if(textnow.startsWith("Unknown")) {
    textnow = str(e.getKeyChar());
  }
  if(!inList(textnow)) {
    for(int i = 1; i < keys.length; i++) {
      keys[i-1] = keys[i];
    }
    k = new Key(textnow);
    keys[9] = k;
  }
  fader = 255;
}

boolean inList(String textnow) {
  boolean ret = false;
  for(int i = 0; i < keys.length; i++) {
    if(keys[i].keytext.equals(textnow)) {
      ret = true;
    }
    println(keys[i].keytext +" : "+ textnow);
  }
  return ret;
}

void loadMap() {
  println("Loading...");
  println("Done!");
}

void saveMap() {
  println("Saving...");
  println("Done");
}




