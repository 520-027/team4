class Masu {
  int index;
  String type;
  String description;
  PImage masuImage;

 PImage whiteMasu, blueMasu, redMasu, greenMasu, goalMasu;

  Masu(int i, PImage w, PImage b, PImage r, PImage g, PImage go) {
    index = i;
    whiteMasu = w;
    blueMasu = b;
    redMasu = r;
    greenMasu = g;
    if (i == 59) {
      type = "white";
      description = "Goal";
      masuImage = go;
      return;
    }
    int rNum = int(random(100));
    if (rNum < 50) {
      type = "white";
      description = "White Masu";
      masuImage = whiteMasu;
    } else if (rNum < 70) {
      type = "blue";
      description = "Blue Masu";
      masuImage = blueMasu;
    } else if (rNum < 90) {
      type = "red";
      description = "Red Masu";
      masuImage = redMasu;
    } else {
      type = "green";
      description = "Green Masu";
      masuImage = greenMasu;
    }
  }

  void draw(int localIndex) {
    image(masuImage, 30 + localIndex * 70, 300, 50, 50);
  }

  void event(Player p) {
    if (type.equals("blue")) {
      float r = random(1);
      if (r < 0.5) {
        p.point.add(10);
      } else if (r < 0.8) {
        p.move(2);
      } else {
        p.point.add(20);
      }
    } else if (type.equals("red")) {
      float r = random(1);
        if (r < 0.5) {
          p.point.subtract(10);
        } else if (r < 0.8) {
          p.move(-2);
        } else {
          p.point.subtract(20);
        }
    } else if (type.equals("green")) {
      p.rest = 1;
    }
  }
}
