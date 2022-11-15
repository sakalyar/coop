package serie08;

/**
 * Définit la notion de modèle pour les compteurs de vitesse à affichage
 *  en km/h ou en mi/h.
 * @inv <pre>
 *    0 <= getSpeed() <= getMaxSpeed()
 *    0 < getStep() <= getMaxSpeed()
 *    getUnit() != null
 *    !isOn() ==> getSpeed() == 0 </pre>
 * @cons <pre>
 * $DESC$ Un modèle de compteur pour lequel step et max sont donnés en km/h.
 * $ARGS$ double step, double max
 * $PRE$
 *     1 <= step <= max
 * $POST$
 *     getMaxSpeed() == max
 *     getUnit() == KMH
 *     !isOn()
 *     getStep() == step </pre>
 */
public interface SpeedometerModel {
    
    // REQUETES
    
    /**
     * Retourne la vitesse limite que peut indiquer ce compteur.
     * Rq. : si getUnit() == KMH, la vitesse est exprimée en km/h
     *       sinon elle est exprimée en mi/h.
     */
    double getMaxSpeed();
    
    /**
     * Retourne la vitesse instantanée de ce compteur.
     * Rq. : si getUnit() == KMH, la vitesse est exprimée en km/h
     *       sinon elle est exprimée en mi/h.
     */
    double getSpeed();
    
    /**
     * Retourne le pas de modification de la vitesse.
     * Rq. : si getUnit() == KMH, le pas de modification est exprimé en km/h
     *       sinon il est exprimé en mi/h.
     */
    double getStep();
    
    /**
     * Retourne l'unité de vitesse courante.
     */
    SpeedUnit getUnit();
    
    /**
     * Indique si le contact est mis ou pas.
     */
    boolean isOn();
    
    // COMMANDES
    
    /**
     * Fixe l'unité de vitesse.
     * @pre <pre>
     *    unit != null </pre>
     * @post <pre>
     *    getUnit() == unit
     *    getSpeed() / getUnit().getUnitPerKm()
     *        == old getSpeed() / getUnit().getUnitPerKm()
     *    getStep() / getUnit().getUnitPerKm()
     *        == old getStep() / getUnit().getUnitPerKm()
     *    getMaxSpeed() / getUnit().getUnitPerKm()
     *        == old getMaxSpeed() / getUnit().getUnitPerKm() </pre>
     */
    void setUnit(SpeedUnit unit);
    
    /**
     * Diminue la vitesse d'un pas de modification.
     * @pre <pre>
     *    isOn() </pre>
     * @post <pre>
     *    getSpeed() == max(0, old getSpeed() - getStep()) </pre>
     */
    void slowDown();
    
    /**
     * Augmente la vitesse d'un pas de modification.
     * @pre <pre>
     *    isOn() </pre>
     * @post <pre>
     *    getSpeed() == min(getMaxSpeed(), old getSpeed() + getStep()) </pre>
     */
    void speedUp();
    
    /**
     * Coupe le contact.
     * @pre <pre>
     *    isOn() </pre>
     * @post <pre>
     *    !isOn() </pre>
     */
    void turnOff();
    
    /**
     * Met le contact.
     * @pre <pre>
     *    !isOn() </pre>
     * @post <pre>
     *    isOn() </pre>
     */
    void turnOn();
    
    // TYPES IMBRIQUES
    
    enum SpeedUnit {
        KMH(1, "km / h"),
        MIH(0.62137, "mi / h");
        
        private final double unitPerKm;
        private final String abbreviation;
        
        SpeedUnit(double factor, String abbrev) {
            unitPerKm = factor;
            abbreviation = abbrev;
        }
        
        public double getUnitPerKm() {
            return unitPerKm;
        }
        
        @Override
        public String toString() {
            return abbreviation;
        }
    }
}
