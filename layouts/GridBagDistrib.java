package layouts;

import java.awt.BorderLayout;
import java.awt.GridBagLayout;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.swing.JComponent;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.SwingUtilities;

public class GridBagDistrib extends Distrib {
    
    // CONSTANTES DE CLASSE

    private static final int INT_SMALL = 3;
    private static final int INT_MED = 6;
    private static final int INT_BIG = 12;
    private static final int EXT_BIG = 12;
    
    // ATTRIBUTS
    
    private Map<JComponent, GBC> constraints;
    
    // CONSTRUCTEURS

    public GridBagDistrib() {
        super("GridBagDistrib de boisson");
    }

    // OUTILS

    private Map<JComponent, GBC> createConstraints() {
    	constraints = new HashMap<JComponent, GBC>()
    	 {
    	     {
    	    	 put(jl(L_INFO), new GBC(0, 0, 7, 1).fill(GBC.VERTICAL));
    	    	 
    	    	 put(jl(L_CREDIT), new GBC(0, 1, 7, 1).fill(GBC.CENTER));
    	    	 
    	    	 put(jb(B_ORANGE), new GBC(0, 2, 2, 1).fill(GBC.BOTH).insets(10, 15, 10, 15));
    	    	 put(jl(L_ORANGE), new GBC(2, 2, 1, 1).fill(GBC.BOTH).weight(0.5, 0));
    	    	 put(jb(B_INSERT), new GBC(3, 2, 2, 1).fill(GBC.BOTH).insets(10, 15, 10, 15));
    	    	 put(jtf(F_INSERT), new GBC(5, 2, 1, 1).fill(GBC.HORIZONTAL).weight(0.5, 0));
    	    	 put(jl(L_INSERT), new GBC(6, 2, 1, 1).fill(GBC.CENTER));
    	    	 
    	    	 put(jb(B_CHOCO), new GBC(0, 3, 2, 1).fill(GBC.BOTH).insets(10, 15, 10, 15));
    	    	 put(jl(L_CHOCO), new GBC(2, 3, 1, 1).fill(GBC.BOTH));
    	    	 put(jb(B_CANCEL), new GBC(3, 3, 2, 1).fill(GBC.BOTH).insets(10, 15, 10, 15));
    	    	 
    	    	 put(jb(B_COFFEE), new GBC(0, 4, 2, 1).fill(GBC.BOTH).insets(10, 15, 10, 15));
    	    	 put(jl(L_COFFEE), new GBC(2, 4, 1, 1).fill(GBC.BOTH));

    	    	 put(jl(L_DRINK), new GBC(0, 5, 1, 1).fill(GBC.CENTER));
    	    	 put(jtf(F_DRINK), new GBC(1, 5, 2, 1).fill(GBC.HORIZONTAL));
    	    	 put(jl(L_BACK_PRE), new GBC(3, 5, 1, 1).fill(GBC.CENTER));
    	    	 put(jtf(F_BACK), new GBC(4, 5, 2, 1).fill(GBC.HORIZONTAL));
    	    	 put(jl(L_BACK_POST), new GBC(6, 5, 2, 1).fill(GBC.CENTER));
    	    	 
    	    	 put(jb(B_TAKE), new GBC(0, 6, 7, 1).insets(10, 15, 10, 15).weight(0,  1).anchor(GBC.NORTH));
    	     }
    	 };
    	 return constraints;
    }
    
    @Override
    protected void placeComponents() {
        constraints = createConstraints();
        JPanel p = new JPanel(new GridBagLayout());
        { //--
            for (Entry<JComponent, GBC> e : constraints.entrySet()) {
                p.add(e.getKey(), e.getValue());
            }
        } //--
        frame().add(p, BorderLayout.CENTER);
    }

    // POINT D'ENTREE

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                new GridBagDistrib().display();
            }
        });
    }
}
