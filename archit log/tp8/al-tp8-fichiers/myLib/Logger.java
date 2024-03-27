package myLib;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public abstract class Logger {
    protected int cnt;

    protected Logger() {
        cnt = 1;
    }

    public abstract void logInfo(String message);
    public abstract void logWarning(String message);
    public abstract void logError(String message);

    private static class ConsoleLoggerHolder {
        private static final Logger INSTANCE = new ConsoleLogger();
    }

    private static class FileLoggerHolder {
        private static final Logger INSTANCE = new FileLogger();
    }

    public static Logger initLogger(String type) {
        if (type.equals("filelog")) {
            return FileLoggerHolder.INSTANCE;
        } else {
            return ConsoleLoggerHolder.INSTANCE;
        }
    }
}

class ConsoleLogger extends Logger {
    @Override
    public void logInfo(String message) {
        System.out.println("( INFO ): " + message);
    }

    @Override
    public void logWarning(String message) {
        System.out.println("( WARNING ): " + message);
    }

    @Override
    public void logError(String message) {
        System.out.println("( ERROR ): " + message);
    }
}

class FileLogger extends Logger {
    @Override
    public void logInfo(String message) {
        try (PrintWriter writer = new PrintWriter(new FileWriter("/home/m1info-gil/sakalyar/TP univ Rouen/archit log/tp8/al-tp8-fichiers/myLib/Appli.log", true))) {
            writer.println("( INFO ): " + message);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void logWarning(String message) {
        try (PrintWriter writer = new PrintWriter(new FileWriter("/home/m1info-gil/sakalyar/TP univ Rouen/archit log/tp8/al-tp8-fichiers/myLib/Appli.log", true))) {
            writer.println("( WARNING ): " + message);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void logError(String message) {
        try (PrintWriter writer = new PrintWriter(new FileWriter("/home/m1info-gil/sakalyar/TP univ Rouen/archit log/tp8/al-tp8-fichiers/myLib/Appli.log", true))) {
            writer.println("( ERROR ): " + message);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}












// class Logger {
//     private static Logger instance;
//     private static int cnt; // Declare as static

//     protected Logger() {
//         // No need to initialize cnt here
//     }

//     public static Logger initLogger() {
//         if (instance == null) {
//             instance = new Logger();
//         }
//         return instance;
//     }

//     public void logInfo(String message) {
//         System.out.println("( cnt = " + cnt++ + " ) INFO: " + message);
//     }

//     public void logWarning(String message) {
//         System.out.println("( cnt = " + cnt++ + " ) WARNING: " + message);
//     }

//     public void logError(String message) {
//         System.out.println("( cnt = " + cnt++ + " ) ERROR: " + message);
//     }
// }

// class DerivedLogger1 extends Logger {
//     private static Logger instance;

//     private DerivedLogger1() {
//         super();
//     }

//     public static Logger getInstance() {
//         if (instance == null) {
//             synchronized (Logger.class) {
//                 if (instance == null) {
//                     instance = new DerivedLogger1();
//                 }
//             }
//         }
//         return instance;
//     }
// }

// class DerivedLogger2 extends Logger {
//     private static Logger instance;

//     private DerivedLogger2() {
//         super();
//     }

//     public static Logger getInstance() {
//         if (instance == null) {
//             synchronized (Logger.class) {
//                 if (instance == null) {
//                     instance = new DerivedLogger2();
//                 }
//             }
//         }
//         return instance;
//     }
// }
