package tpfacade;
import java.util.*;

public interface Printer {
	/* print the documentation and return the job id */
	public int print(String doc);
}



class PrinterImpl implements Printer {
	private static int jobid=0;

	public static Printer getDefaultPrinter() {
		return new PrinterImpl();
	}

	public int print(String doc) {
		return ++jobid;
	}
}




