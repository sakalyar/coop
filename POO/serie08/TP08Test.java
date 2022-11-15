package serie08;

import util.TPTester;

public final class TP08Test {
    private TP08Test() {
        // rien
    }
    public static void main(String[] args) {
        TPTester t = new TPTester(
                serie08.StdSpeedometerModelTestCons.class
        );
        int exitValue = t.runAll();
        if (exitValue == 0) {
            t = new TPTester(
                serie08.StdSpeedometerModelTest.class
            );
            exitValue = t.runAll();
        }
        System.exit(exitValue);
    }
}
