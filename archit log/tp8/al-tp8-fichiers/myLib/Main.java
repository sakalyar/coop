package myLib;

public class Main {

    public static void main(String[] args) {

        Logger log1 = Logger.initLogger("console");
        Logger log2 = Logger.initLogger("filelog");
        
        System.out.println();
        
        log1.logInfo("Blank log message");
        log1.logWarning("Typical warning message");
        log1.logError("Typical error message");
        log1.logInfo("Blank log message");
        
        System.out.println();
        
        log2.logInfo("Blank log message");
        log2.logWarning("Typical warning message");
        log2.logError("Typical error message");
        log2.logInfo("Blank log message");
        
    }
}
