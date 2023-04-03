package layouts;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

abstract class Distrib {
    
    // CONSTANTES DE CLASSE

    private static final int MIN_FIELD_SIZE = 10;
    
    static final int B_ORANGE = 0; // bouton "Jus d'orange"
    static final int B_CHOCO = 1;  // bouton "Chocolat"
    static final int B_COFFEE = 2; // bouton "Café"
    static final int B_INSERT = 3; // bouton "Insérer"
    static final int B_CANCEL = 4; // bouton "Annuler"
    static final int B_TAKE = 5;   // bouton "Prenez votre boisson..."
    
    static final int F_INSERT = 0; // champ d'insertion de pièces
    static final int F_DRINK = 1;  // champ de rendu de boisson
    static final int F_BACK = 2;   // champ de rendu de monnaie
    
    static final int L_INFO = 0;      // label "Cet appareil rend la monnaie"
    static final int L_CREDIT = 1;    // label "Vous disposez d'un crédit..."
    static final int L_ORANGE = 2;    // label "110 cents"
    static final int L_CHOCO = 3;     // label "45 cents"
    static final int L_COFFEE = 4;    // label "30 cents"
    static final int L_INSERT = 5;    // label "cents" de l'insertion
    static final int L_DRINK = 6;     // label "Boisson :"
    static final int L_BACK_PRE = 7;  // label "Monnaie :"
    static final int L_BACK_POST = 8; // label "cents" du rendu de monnaie
    
    // ATTRIBUTS
    
    private JFrame frame;
    private JButton[] jbs;
    private JTextField[] jtfs;
    private JLabel[] jls;
    
    // CONSTRUCTEURS

    Distrib(String title) {
        createView(title);
        placeComponents();
        createController();
    }
    
    // REQUETES
    
    protected JButton jb(int i) {
        return jbs[i];
    }
    
    protected JTextField jtf(int i) {
        return jtfs[i];
    }
    
    protected JTextField[] jtfs() {
        JTextField[] r = new JTextField[jtfs.length];
        System.arraycopy(jtfs, 0, r, 0, jtfs.length);
        return r;
    }
    
    protected JLabel jl(int i) {
        return jls[i];
    }
    
    protected JFrame frame() {
        return frame;
    }

    // COMMANDES

    void display() {
        frame.pack();
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }

    // OUTILS

    protected void createView(String title) {
        frame = new JFrame(title);
        jbs = new JButton[] {
                // B_ORANGE
                new JButton("Jus d'orange"),
                // B_CHOCO
                new JButton("Chocolat"),
                // B_COFFEE
                new JButton("Café"),
                // B_INSERT
                new JButton("Insérer"),
                // B_CANCEL
                new JButton("Annuler"),
                // B_TAKE
                new JButton("Prenez votre boisson et/ou votre monnaie")
        };
        jtfs = new JTextField[] {
                // F_INSERT
                new JTextField(MIN_FIELD_SIZE),
                // F_DRINK
                new JTextField(),
                // F_BACK
                new JTextField()
        };
        jls = new JLabel[] {
                // L_INFO
                new JLabel("Cet appareil rend la monnaie"),
                // L_CREDIT
                new JLabel("Vous disposez d'un crédit de 0 cents"),
                // L_ORANGE
                new JLabel("110 cents"),
                // L_CHOCO
                new JLabel("45 cents"),
                // L_COFFEE
                new JLabel("30 cents"),
                // L_INSERT
                new JLabel("cents"),
                // L_DRINK
                new JLabel("Boisson :"),
                // L_BACK_PRE
                new JLabel("Monnaie :"),
                // L_BACK_POST
                new JLabel("cents")
        };
    }
    
    protected abstract void placeComponents();

    protected void createController() {
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }
}
