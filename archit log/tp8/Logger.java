
public class Logger {
    private static Logger instance;
    private int logCounter;

    private Logger() {
        logCounter = 1;
    }

    public static Logger getInstance() {
        if (instance == null) {
            instance = new Logger();
        }
        return instance;
    }

    public void logInfo(String message) {
        System.out.println("[" + logCounter++ + "] INFO: " + message);
    }

    public void logWarning(String message) {
        System.out.println("[" + logCounter++ + "] WARNING: " + message);
    }

    public void logError(String message) {
        System.out.println("[" + logCounter++ + "] ERROR: " + message);
    }
}
