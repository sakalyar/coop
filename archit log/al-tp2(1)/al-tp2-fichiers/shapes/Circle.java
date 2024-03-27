package shapes;
import java.awt.*;
import java.awt.geom.*;

public class Circle implements Drawable {
	private double cx, cy, rad;
	private Color c;
	
	public Circle(double cx, double cy, double rad, Color c) {
		this.cx = cx; this.cy = cy; this.rad = rad;
		this.c = c;
	}
	
	// Méthodes propres à Circle :
	public double getRadius() { return rad; }
	
	// Méthode de rendu :
	public void draw(Graphics2D screen) {
		screen.setColor(c);
		screen.draw(new Ellipse2D.Double(cx-rad, cy-rad, rad*2, rad*2));
	}
}


