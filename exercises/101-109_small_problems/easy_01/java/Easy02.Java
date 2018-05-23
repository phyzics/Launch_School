class Odd {
  boolean isOdd(int i) {
    if ((i % 2) != 0) return true;
    return false;
  }
}

class Easy02 {
  public static void main(String[] args) {
    Odd odd = new Odd();

    System.out.println(odd.isOdd(2));
    System.out.println(odd.isOdd(5));
    System.out.println(odd.isOdd(-17));
    System.out.println(odd.isOdd(-8));
    System.out.println(odd.isOdd(0));
    System.out.println(odd.isOdd(7));
  }
}
