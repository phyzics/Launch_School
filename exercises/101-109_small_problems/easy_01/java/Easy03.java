class Digits {
  int[] digitList(int num) {
    String[] strDigits = Integer.toString(num).split("");
    int[] digits = new int[strDigits.length];

    for (int i = 0; i < digits.length; i++) {
      digits[i] = Integer.parseInt(strDigits[i]);
    }

    return digits;
  }
}

class Easy03 {
  public static void main(String[] args) {
    Digits d = new Digits();
    int[] t1 = d.digitList(12345);
    int[] t2 = d.digitList(7);
    int[] t3 = d.digitList(375290);
    int[] t4 = d.digitList(444);

    for (int n : t1) {
      System.out.print(n + " ");
    }
    System.out.println();

    for (int n : t2) {
      System.out.print(n + " ");
    }
    System.out.println();

    for (int n : t3) {
      System.out.print(n + " ");
    }
    System.out.println();

    for (int n : t4) {
      System.out.print(n + " ");
    }
    System.out.println();
  }
}
