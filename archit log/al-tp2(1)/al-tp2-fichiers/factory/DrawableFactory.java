package factory;

import shapes.Drawable;

import java.awt.*;

public interface DrawableFactory {
    Drawable makeCircle(double cx, double cy, double rad, Color c);
    Drawable makeLine(double x0, double y0, double x1, double y1, Color c);
    Drawable makeRectangle(double x0, double y0, double x1, double y1, Color c);
}
