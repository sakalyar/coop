package tp8;

public class Main {
    public static void main(String[] args) {
        Logger logger = Logger.getInstance();
        
        logger.logInfo("Initializing application...");
        logger.logWarning("This is a warning message.");
        logger.logError("An error occurred!");

        SomeClass someObject = new SomeClass();
        someObject.doSomething(logger);
    }
}

class SomeClass {
    public void doSomething(Logger logger) {
        logger.logInfo("Doing something...");
    }
}
