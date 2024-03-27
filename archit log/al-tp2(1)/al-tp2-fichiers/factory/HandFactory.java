package factory;

import shapes.Drawable;

import java.util.List;

public class HandFactory implements DrawableFactory {
    private List<Drawable> drawables;

    public HandFactory(List<Drawable> drawables) {
        this.drawables = drawables;
    }

    @Override
    public Drawable makeCircle(double cx, double cy, double rad, Color c) {
        // Implement logic to create Circle manually or return it from the existing list
        // For simplicity, let's just return the first drawable from the list if available
        if (!drawables.isEmpty() && drawables.get(0) instanceof Circle) {
            return drawables.remove(0);
        }
        return null; // Return null if no circle is available
    }

    @Override
    public Drawable makeLine(double x0, double y0, double x1, double y1, Color c) {
        // Implement logic to create Line manually or return it from the existing list
        // For simplicity, let's just return the first drawable from the list if available
        if (!drawables.isEmpty() && drawables.get(0) instanceof Line) {
            return drawables.remove(0);
        }
        return null; // Return null if no line is available
    }

    @Override
    public Drawable makeRectangle(double x0, double y0, double x1, double y1, Color c) {
        // Implement logic to create Rectangle manually or return it from the existing list
        // For simplicity, let's just return the first drawable from the list if available
        if (!drawables.isEmpty() && drawables.get(0) instanceof Rectangle) {
            return drawables.remove(0);
        }
        return null; // Return null if no rectangle is available
    }
}
