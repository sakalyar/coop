package client;

import factory.DrawableFactory;
import factory.StdFactory;
import java.awt.*;
import java.util.ArrayList;
import java.util.List;
import shapes.Drawable;
import viewer.GraphicViewer;

public class Test {
    public static List<Drawable> getDemo(DrawableFactory factory) {
        List<Drawable> ls = new ArrayList<>();
        ls.add(factory.makeCircle(600, 120, 60, Color.BLACK));
        ls.add(factory.makeLine(600, 450 - 70, 600 - 40, 450 - 110, Color.RED));
        ls.add(factory.makeLine(600, 450 - 70, 600 + 40, 450 - 110, Color.RED));
        ls.add(factory.makeCircle(600, 450 - 120, 20, Color.GRAY));
        ls.add(factory.makeLine(600, 450, 600, 450 - 100, Color.BLUE));
        ls.add(factory.makeLine(600, 450, 600 - 20, 450 + 50, Color.BLACK));
        ls.add(factory.makeLine(600, 450, 600 + 20, 450 + 50, Color.BLACK));
        return ls;
    }

    public static void main(String[] args) {
        GraphicViewer gv = new GraphicViewer();
        DrawableFactory stdFactory = new StdFactory();
        List<Drawable> demo = getDemo(stdFactory);
        gv.draw(demo);
    }
}
