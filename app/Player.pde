class Player {
  String name;
  int position = 0;
  Point point;
  int rest = 0;
  int id;
  PImage[] playerImages;

  Player(String n, int id, PImage[] imgs) {
    this.name = n;
    this.id = id;
    this.playerImages = imgs;
    this.point = new Point();
  }

  void move(int steps) {
    position += steps;
    if (position < 0) {
      positin = 0;
    }
  }

  void drawRelative(int relativeIndex) {
    if (playerImages[id] != null) {
      image(playerImages[id], 30 + relativeIndex * 70, 300, 50, 50);
    } else {
      fill(255 * (id == 0 ? 1 : 0), 255 * (id == 1 ? 1 : 0), 255 * (id == 2 ? 1 : 0));
      ellipse(30 + relativeIndex * 60 + 25, 300 + 25, 30, 30);
    }
}
}