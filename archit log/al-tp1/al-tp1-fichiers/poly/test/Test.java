package test;
import polynome.*;

public class Test {
	public static void main(String[] args) {
		System.out.println("Coucou");
		
		double[] cx={0.0,1.0,0,0,1};
		Polynome p=new Polynome(cx);
		
		System.out.println("p(2)="+p.computeValue(2.0));

		double[] cx2={1.0,0,0,1};
		Polynome p2=new Polynome(cx2);

		System.out.println("p2(2)="+p2.computeValue(2.0));

		System.out.println("(p+p2)(2)="+p.sum(p2).computeValue(2.0));
	}
}
