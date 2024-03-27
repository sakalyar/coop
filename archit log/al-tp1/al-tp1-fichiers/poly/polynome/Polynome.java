package polynome;

import java.security.InvalidParameterException;
import wonderland.graphicPackageYoullNeverFind.*;

public class Polynome {
	private double[] coefficients;
	
	public Polynome(double[] coefficients) {
		this.coefficients = coefficients.clone();
	}
	
	public int getDegree() {
		return coefficients.length;
	}
	
	public double getCoefficient(int i) {
		if ((i<0) || (i>=coefficients.length))
			throw new InvalidParameterException("Coefficient supérieur au degree du polynome.");

		return coefficients[i];
	}
	
	public double computeValue(double x) {
		// Ajoute la constante au résultat :
		double res=coefficients[0];
		
		// Démarre avec x puissance 1 :
		double d=x;
		
		// Ajoute le produit des puisances de x multipliée par le coef correspondant : 
		for(int i=1; i<coefficients.length; ++i) {
			res+=(d*coefficients[i]);
			
			// Puissance suivante
			d*=x;
		}
		
		// Renvoi le résultat :
		return res;
	}
	
	public Polynome sum(Polynome p) {
		double[] cfa;
		double[] cfb;
		// Plus petite liste dans cfa, clone de la plus grande dans cfb :
		if (this.coefficients.length<p.coefficients.length) {
			cfa=this.coefficients;
			cfb=p.coefficients.clone();
		} else {
			cfa=p.coefficients;
			cfb=this.coefficients.clone();
		}
		
		// Effectue la somme des coeeficient : 
		for(int i=0; i<cfa.length; ++i) {
			cfb[i]+=cfa[i];
		}
		
		// Renvoie le polynôme résultant :
		return new Polynome(cfb);
	}
	
	public Polynome prod(Polynome p) {
		// Ne pas coder cette méthode !
		// Code similaire à sum ...		
		throw new UnsupportedOperationException("Operation not implemented yet...");
	}
	
	
	public void plot(double x1, double x2, double stepx, WonderPlotCanvas canvas) {
		double x=x1;
		canvas.moveTo(x, computeValue(x));
		x+=stepx;
		while (x<x2) {
			canvas.lineTo(x, computeValue(x));			
			x+=stepx;
		}
	}
}
