package shapes;
import java.awt.*;
import java.awt.geom.*;

public class Line implements Drawable {
	private double x0, y0, x1, y1;
	private Color c;
	
	public Line(double x0, double y0, double x1, double y1, Color c) {
		this.x0 = x0; this.y0 = y0;
		this.x1 = x1; this.y1 = y1;
		this.c = c;
	}

	// Méthodes propres à Line :
	public double getLength() {
		double dx=Math.abs(x1-x0);
		double dy=Math.abs(y1-y0);
		return Math.sqrt(dx*dx+dy*dy);
	}

	// Méthode de rendu :
	public void draw(Graphics2D screen) {
		screen.setColor(c);
		screen.draw(new Line2D.Double(x0, y0, x1, y1));
	}
}

