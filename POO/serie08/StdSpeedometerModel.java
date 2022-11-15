package serie08;

import java.awt.Color;
import java.util.Observable;

public class StdSpeedometerModel extends Observable implements SpeedometerModel {

	// marge horizontale interne de part et d'autre du composant
    private static final int MARGIN = 40;
    // épaisseur de la ligne horizontale graduée
    private static final int THICK = 3;
    // demi-hauteur d'une graduation
    private static final int MARK = 5;
    // largeur de la base du triangle pour la tête de la flèche
    private static final int ARROW_BASE = 20;
    // épaisseur du corps de la flèche
    private static final int ARROW_THICK = 4;
    // hauteur du corps de la flèche
    private static final int ARROW_HEIGHT = 20;
    // hauteur préférée d'un GraphicSpeedometer
    private static final int PREFERRED_HEIGHT = 3 * (3 * MARK + ARROW_BASE / 2 + ARROW_HEIGHT);
    // facteur d'échelle pour l'espacement entre deux graduations
    private static final double ASPECT_RATIO = 1.25;
    // couleur bleu franc lorsque le moteur est allumé
    private static final Color BLUE = Color.BLUE;
    // couleur rouge franc lorsque le moteur est allumé
    private static final Color RED = Color.RED;
    // couleur bleu grisé lorsque le moteur est éteint
    private static final Color GRAYED_BLUE = new Color(0, 0, 255, 50);
    // couleur rouge grisé lorsque le moteur est éteint
    private static final Color GRAYED_RED = new Color(255, 0, 0, 50);
    // les vitesses affichées sont celles, entre 0 et model.getMaxSpeed(), qui sont les multiples de SPLIT_SIZE
    private static final int SPLIT_SIZE = 10;
    
	private double step;
	private double max;
	private double speed;
	private SpeedUnit unit;
	
    
    public StdSpeedometerModel(double step, double max) {
    	this.step = step;
    	this.max = max;
    }
	
    public StdSpeedometerModel() {}
	
	
	
	@Override
	public double getMaxSpeed() {
		return 0;
		//if (getUnit())
	}

	@Override
	public double getSpeed() {
		return speed;
	}

	@Override
	public double getStep() {
		return step;
	}

	@Override
	public SpeedUnit getUnit() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isOn() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void setUnit(SpeedUnit unit) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void slowDown() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void speedUp() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void turnOff() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void turnOn() {
		// TODO Auto-generated method stub
		
	}

}
