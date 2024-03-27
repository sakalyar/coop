package client;
import java.awt.event.*;
import java.awt.image.*;
import java.awt.geom.*;
import java.awt.Color;
import java.util.*;

import shapes.*;
import viewer.GraphicViewer;

public class Test {
	public static java.util.List<Drawable> getDemo() {
		java.util.List<Drawable> ls=new ArrayList<Drawable>();
		ls.add(new Line(0, 500, 800, 500, Color.GREEN));
		ls.add(new Line(300, 0, 0, 300, Color.YELLOW));
		
		ls.add(new Line(30, 300, 180, 200, Color.BLUE));
		ls.add(new Line(330, 300, 180, 200, Color.BLUE));
		ls.add(new Rectangle(30, 300,330, 500, Color.RED));

		double sunX = 600;
		double sunY = 120;
		double sunRad = 60; 
		ls.add(new Circle(sunX, sunY, sunRad, Color.BLACK));
		int sunRay = 20;
		for (int i=0; i<sunRay; ++i) {
			double tau=i*2*Math.PI/sunRay;
			ls.add(new Line(sunX+(sunRad+5)*Math.cos(tau),
				sunY-(sunRad+5)*Math.sin(tau),  
				sunX+(1.5*sunRad+5)*Math.cos(tau),
				sunY-(1.5*sunRad+5)*Math.sin(tau),
				Color.BLACK));
		}

		double manX=600;
		double manY=450;
		ls.add(new Line(manX, manY-70, manX-40, manY-110, Color.RED));
		ls.add(new Line(manX, manY-70, manX+40, manY-110, Color.RED));
		ls.add(new Circle(manX, manY-120, 20, Color.GRAY));
		ls.add(new Line(manX, manY, manX, manY-100, Color.BLUE));
		ls.add(new Line(manX, manY, manX-20, manY+50, Color.BLACK));
		ls.add(new Line(manX, manY, manX+20, manY+50, Color.BLACK));		

		return ls;
	}
	
	public static void main(String[] args)  {
		GraphicViewer gv = new GraphicViewer();
		java.util.List<Drawable> demo=getDemo();
		gv.draw(demo);
	}
}
