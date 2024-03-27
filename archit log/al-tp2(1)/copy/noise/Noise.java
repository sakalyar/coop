package noise;
import java.util.*;

public class Noise {
	private static Random r=new Random();
	public static double getNoise() {
		return 5-10*r.nextDouble();
	}
	public static double getNoise(double v) {
		return (2*r.nextDouble()-1)*v/5;
	}
}

