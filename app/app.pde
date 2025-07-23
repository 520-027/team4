Game game;
PImage bg;
int masuScreen = 10;
PImage whiteMasu, blueMasu, redMasu, greenMasu, goalMasu;
PImage[] playerImages = new PImage[3];

void setup() {
  size(800, 600);
  bg = loadImage("background.jpg");
  whiteMasu = loadImage("shiromasu.png");
  blueMasu = loadImage("space.png");
  redMasu = loadImage("akamasu.png");
  greenMasu = loadImage("midorimasu.png");
  goalMasu = loadImage("goal.png");
  
  playerImages[0] = loadImage("armor.png");
  playerImages[1] = loadImage("village.png");
  playerImages[2] = loadImage("mahotsukai.png");

  game = new Game();
  game.startGame(playerImages, whiteMasu, blueMasu, redMasu, greenMasu, goalMasu);

}

void draw() {
  background(255);

  Player currentP = game.players[game.currentPlayer];
  int currentScreen = currentP.position / masuScreen;

  int bgWidth = bg.width;
  int bgCount = 7;
  for (int i = -1; i <= bgCount; i++) {
  image(bg, (i - currentScreen) * bgWidth, 0);
  }

  for (int i = currentScreen * masuScreen; i < (currentScreen + 1) * masuScreen && i < game.masus.length; i++) {
    game.masus[i].draw(i - currentScreen * masuScreen);
  }

  for (Player p : game.players) {
    if (p.position / masuScreen == currentScreen) {
      p.drawRelative(p.position - currentScreen * masuScreen);
    }
  }
  
  game.update();
  game.drawUI();
}

void keyPressed() {
  if (key == ' ' && game.state == GameState.WAITING) {
    game.nextTurn();
  }
  
}