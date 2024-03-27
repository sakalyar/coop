package shapes;
import java.awt.*;
import java.awt.geom.*;

public class Rectangle implements Drawable {
	private double x0, y0, x1, y1;
	private Color c;
	
	public Rectangle(double x0, double y0, double x1, double y1, Color c) {
		this.x0 = x0; this.y0 = y0;
		this.x1 = x1; this.y1 = y1;
		this.c = c;
	}
	
	// Méthodes propres à Rectangle :
	public double getWidth() { return Math.abs(x1-x0); }
	public double getHeight() { return Math.abs(y1-y0); }
	
	// Méthode de rendu :
	public void draw(Graphics2D screen) {
		screen.setColor(c);
		screen.draw(new Rectangle2D.Double(x0, y0, x1-x0, y1-y0));
	}
}



