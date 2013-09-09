class Key {
  String keytext;

  Box button;


  Key(String t) {
    keytext = t;
    init();
  }

  void init() {
    button = new Box(0,0,150,20);
    button.text = keytext;
  }

  void draw() {
    button.draw();
  }


}
