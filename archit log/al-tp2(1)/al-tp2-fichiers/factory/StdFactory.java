package factory;

import shapes.*;

import java.awt.*;
import java.util.Random;

public class StdFactory implements DrawableFactory {
    private Random random;

    public StdFactory() {
        random = new Random();
    }

    @Override
    public Drawable makeCircle(double cx, double cy, double rad, Color c) {
        return new Circle(cx, cy, rad, c);
    }

    @Override
    public Drawable makeLine(double x0, double y0, double x1, double y1, Color c) {
        return new Line(x0, y0, x1, y1, c);
    }

    @Override
    public Drawable makeRectangle(double x0, double y0, double x1, double y1, Color c) {
        return new Rectangle(x0, y0, x1, y1, c);
    }
}
