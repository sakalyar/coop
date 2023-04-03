package layouts;

import java.awt.BorderLayout;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.swing.GroupLayout;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.SwingUtilities;

public class GroupDistrib extends Distrib {
    
    // ATTRIBUTS
    
    private Map<JButton, JLabel> cmds;
    private GroupLayout lmp;
    
    // CONSTRUCTEURS

    public GroupDistrib() {
        super("GroupDistrib de boissons");
    }

    // OUTILS

    @Override
    protected void createView(String title) {
        super.createView(title);
        cmds = createCmds();
    }
    
    private Map<JButton, JLabel> createCmds() {
        Map<JButton, JLabel> r = new LinkedHashMap<JButton, JLabel>();
        r.put(jb(B_ORANGE), jl(L_ORANGE));
        r.put(jb(B_CHOCO), jl(L_CHOCO));
        r.put(jb(B_COFFEE), jl(L_COFFEE));
        return r;
    }
    
    @Override
    protected void placeComponents() {
        /*****************/
        /** A COMPLETER **/
        /*****************/
    }

    // POINT D'ENTREE

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                new GroupDistrib().display();
            }
        });
    }
}
