class Roulette {
  int currentValue = 1;
  float spinSpeed = 0;   
  boolean spinning = false;
  float spinTimer = 0;      
  int finalValue = 1;       
  float acceleration = 0.05;

  void startSpin() {
    spinning = true;
    spinSpeed = 0.2; 
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