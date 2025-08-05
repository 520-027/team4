enum GameState { WAITING, SPINNING, SHOW_RESULT }

class Game {
  Player[] players = new Player[3];
  Masu[] masus = new Masu[60];
  Roulette roulette = new Roulette();
  int turnCount = 0;
  ArrayList<String> logs = new ArrayList<String>();
  int currentPlayer = 0;
  boolean turnFinished = true;
  boolean gameEnded = false;
  int goalCount = 0;
  GameState state = GameState.WAITING;

  ArrayList<Firework> fireworks = new ArrayList<Firework>();
  int scrollTargetPosition = -1;
  int scrollStartTime = 0;

  void startGame(PImage[] playerImgs, PImage white, PImage blue, PImage red, PImage green, PImage goal) {
    for (int i = 0; i < 3; i++) {
      players[i] = new Player("Player " + (i+1), i, playerImgs);
    }
    for (int i = 0; i < masus.length; i++) {
      masus[i] = new Masu(i, white, blue, red, green, goal);
    }
    logs.add("Game start");
  }

  void nextTurn() {
    Player p = players[currentPlayer];
    if (p.position >= masus.length - 1) {
      endTurn();
      return;
    }
    if (p.rest > 0) {
      logs.add(p.name + " is resting this turn.");
      p.rest--;
      endTurn();
      return;
    } else {
      state = GameState.SPINNING;
      roulette.startSpin();
      logs.add(p.name + "'s turn: spinning roulette...");
    }
  }

  void update() {
    if (state == GameState.SPINNING) {
      roulette.update();
      if (!roulette.isSpinning()) {
        int steps = roulette.currentValue;
        Player p = players[currentPlayer];
        p.move(steps);
        if (p.position >= masus.length) {
          p.position = masus.length - 1;
        }
        masus[p.position].event(p);
        logs.add(p.name + " rolled a " + steps + " and landed on " + masus[p.position].description);
        checkGoal(p);

        scrollTargetPosition = p.position;
        scrollStartTime = millis();
        state = GameState.SHOW_RESULT;
      }
    } else if (state == GameState.SHOW_RESULT) {
      if (millis() - scrollStartTime >= 1000) {
        endTurn();
      }
    }
    if (gameEnded) noLoop();
  }

  void endTurn() {
    if (goalCount >= players.length) {
      showResult();
      return;
    }
    do {
      currentPlayer = (currentPlayer + 1) % players.length;
    } while (players[currentPlayer].position >= masus.length - 1);
    turnCount++;
    state = GameState.WAITING;
  }

  void checkGoal(Player p) {
    if (p.position >= masus.length - 1) {
      logs.add(p.name + " reached the goal!");
      if (goalCount == 0) {
        p.point.add(100);
        logs.add(p.name + " gets +100 points for finishing first!");
        launchFireworks(60, 10);
      } else if (goalCount == 1) {
        p.point.add(50);
        logs.add(p.name + " gets +50 points for finishing second!");
        launchFireworks(40, 6);
      } else {
        launchFireworks(20, 4);
      }
      goalCount++;
      if (goalCount == players.length) showResult();
    }
  }

  void launchFireworks(float radius, int count) {
    for (int i = 0; i < count; i++) {
      float x = random(width);
      float y = random(height / 2);
      fireworks.add(new Firework(x, y, radius, color(random(255), random(255), random(255))));
    }
  }

  void showResult() {
    if (gameEnded) return;
    logs.add("Thanks for playing.");
    gameEnded = true;
  }

  void drawUI() {
    fill(255, 220);
    rect(width - 795, 10, 180, 100);
    fill(0);
    textSize(16);
    text("Turn: " + turnCount, width - 150, 30);
    int y = 50;
    for (Player p : players) {
      fill(255, 0, 0);
      textAlign(LEFT, BASELINE);
      text(p.name + ": " + p.point.get() + " points", 10, y);
      y += 20;
    }
    int logY = height - 100;
    fill(255, 220);
    rect(width - 795, 475, 790, 120);
    for (int i = max(0, logs.size() - 5); i < logs.size(); i++) {
      fill(255, 0, 0);
      textAlign(LEFT, BASELINE);
      text(logs.get(i), 30, logY);
      logY += 18;
    }
    roulette.draw();
    fill(0);
    textSize(14);
    text("Press SPACE to advance turn", 100, 20);
  }
}
