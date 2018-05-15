class Repeat {
  void repeat(String text, int n) {
    for (int i = 1; i <= n; i++) {
      System.out.println(text);
    }
  }
}

class RepeatYourself {
  public static void main(String args[]) {
    Repeat rep = new Repeat();

    rep.repeat("Hello", 3);
  }
}
