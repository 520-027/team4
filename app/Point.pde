class Point {
  int value;

  Point() {
    value = 0;
  }

  void add(int p) {
    value += p;
  }

  void subtract(int p) {
    value -= p;
  }

  int get() {
    return value;
  }

  void reset() {
    value = 0;
  }
}
