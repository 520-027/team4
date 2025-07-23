class Roulette {
  int currentValue = 1;
  float spinSpeed = 0;   
  boolean spinning = false;
  float spinTimer = 0;      
  int finalValue = 1;       
<<<<<<< HEAD
  float deceleration = 0.2;//サイコロの減速速度
=======
  float acceleration = 0.05;
>>>>>>> b52f86cc0db484d417fbdb3406e7e7266585368a

  void startSpin() {
    spinning = true;
    spinSpeed = 1.5; //サイコロ初期スピード
    spinTimer = 0;
    finalValue = int(random(1, 7));
  }

  void update() {
    if (!spinning) return;

    spinTimer += spinSpeed;
    if (spinTimer >= 1) {
      currentValue++;
      if (currentValue > 6) currentValue = 1;
      spinTimer = 0;

      spinSpeed += acceleration;

      if (spinSpeed > 5) {
        spinning = false;
        currentValue = finalValue;
      }
    }
  }

  void draw() {
    fill(0);
    textSize(32);
    textAlign(CENTER, CENTER);
    text("Roulette: " + currentValue, width - 150, 60);
  }
  
  boolean isSpinning() {
    return spinning;
  }
}
