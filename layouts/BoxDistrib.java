package layouts;

import static java.awt.Component.CENTER_ALIGNMENT;

import java.awt.BorderLayout;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.SwingUtilities;

public class BoxDistrib extends Distrib {
    
    // CONSTANTES DE CLASSE

    private static final int EXTRA_SPACE = 38;
    private static final int BIG_SPACE = 12;
    private static final int SMALL_SPACE = 6;
    
    // ATTRIBUTS
    
    // Association entre les boutons de boisson et les labels qui les suivent
    private Map<JButton, JLabel> cmds;

    // CONSTRUCTEURS

    public BoxDistrib() {
        super("BoxDistrib de boisson");
    }

    // OUTILS

    @Override
    protected void createView(String title) {
        super.createView(title);
        cmds = createCmds();
        config();
    }
    
    /**
     * Construction de la map qui associe un label à chaque bouton de boisson.
     */
    private Map<JButton, JLabel> createCmds() {
        Map<JButton, JLabel> r = new LinkedHashMap<JButton, JLabel>();
        r.put(jb(B_ORANGE), jl(L_ORANGE));
        r.put(jb(B_CHOCO), jl(L_CHOCO));
        r.put(jb(B_COFFEE), jl(L_COFFEE));
        return r;
    }
    
    /**
     * Adapte la taille de certains composants :
     * - les boutons de boisson ont tous la largeur du plus large d'entre eux
     * - les boutons d'action (insert et cancel) ont la même largeur
     * 
     * - la largeur max des champs de texte reste infinie horizontalement,
     *   mais leur hauteur max est ramenée à leur hauteur préférée
     * 
     * - le bouton take sera horizontalement centré dans sa box verticale
     * - le label d'information sur le rendu de monnaie tout au nord
     *   sera horizontalement centré dans sa box verticale
     * - le label d'information sur le crédit actuel juste au dessous
     *   sera horizontalement centré dans sa box verticale.
     */
    private void config() {
        linkButtonSizes(jb(B_ORANGE), jb(B_CHOCO), jb(B_COFFEE));
        linkButtonSizes(jb(B_INSERT), jb(B_CANCEL));
        
        for (JTextField tf : jtfs()) {
            setHorizontallyExpandableOnly(tf);
        }
        
        setHorizontallyCentered(jb(B_TAKE), jl(L_INFO), jl(L_CREDIT));
    }

    /**
     * Tous les boutons passés en paramètre adoptent la largeur du plus large
     *  d'entre eux.
     */
    private static void linkButtonSizes(JButton... buttons) {
        /*****************/
        /** A COMPLETER **/
        /*****************/
    }
    
    /**
     * La largeur maximale de tf reste la même (l'infini), mais sa hauteur
     *  maximale est ramenée à sa hauteur préférée.
     */
    private static void setHorizontallyExpandableOnly(JTextField tf) {
        /*****************/
        /** A COMPLETER **/
        /*****************/
    }
    
    /**
     * Tous les composants passés en paramètre sont configurés pour se centrer
     *  horizontalement dans une boite verticale.
     */
    private static void setHorizontallyCentered(JComponent... comps) {
        /*****************/
        /** A COMPLETER **/
        /*****************/
    }

    @Override
    protected void placeComponents() {
    	Box v = Box.createVerticalBox();
    	{ //--
    		v.add(jl(L_INFO));
    		v.add(jl(F_DRINK));
	    	
    		Box h = Box.createHorizontalBox();
    		{ //--
    			Box v2 = Box.createVerticalBox();
    			{ //--
    				Box h1 = Box.createHorizontalBox();
    				{
    					h1.add(jb(B_ORANGE));
//    					rigidarea
    					h1.add(jl(L_ORANGE));
//    					la cole
    				}
    				v2.add(h1);
    				h1 = Box.createHorizontalBox();
    				{
    					h1.add(jb(B_CHOCO));
    					h1.add(jl(L_CHOCO));
    				}
    				v2.add(h1);
    				h1 = Box.createHorizontalBox();
    				{
    					h1.add(jb(B_COFFEE));
    					h1.add(jl(L_COFFEE));
    				}
    				v2.add(h1);
    				h1 = Box.createHorizontalBox();
    				{
    					h1.add(jl(L_DRINK));
    					h1.add(jtf(F_DRINK));
    				}
    				v2.add(h1);
    			}
    			h.add(v2);
	    	} //--
    		
	    	v.add(h);
	    	v.add(jb(B_TAKE));
    	} //--
    	frame().add(v, BorderLayout.CENTER);
    }

    // POINT D'ENTREE

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                new BoxDistrib().display();
            }
        });
    }
}
