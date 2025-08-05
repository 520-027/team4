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
    if (position < 0) position = 0;
    if (position >= 60) position = 59;
  }

  void drawRelative(int relativeIndex) {
    int overlapCount = 0;
    for (int i = 0; i < game.players.length; i++) {
      if (i == id) break;
      if (game.players[i].position == this.position) {
        overlapCount++;
      }
    }
    int baseX = 30 + relativeIndex * 70;
    int offset = 10 * overlapCount;
    image(playerImages[id], baseX + offset, 300 - offset, 50, 50);
  }
}
