package serie04;

import util.TPTester;

public final class TP04Test {
    private TP04Test() {
        // rien
    }
    public static void main(String[] args) {
        TPTester t = new TPTester(
                serie04.CivTest.class,
                serie04.StdContactTest.class,
                serie04.StdPhoneBookTest.class
        );
        int exitValue = t.runAll();
        System.exit(exitValue);
    }
}
