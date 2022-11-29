package serie10;
import java.io.File;

import javax.swing.JComboBox;
import javax.swing.JFileChooser;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.SwingUtilities;

import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Observable;
import java.util.Observer;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class Splitter {

	private int CONFIG_CHANGE;
	private String FILE_CHANGE;
	
	private JTextField splitFileName;
	private JButton browse;
	private JComboBox splitFragmentsNb;
	private JTextField splitFragmentsSize;
	private JButton splitDescription;
	private JTextArea description;
	private JFrame frame;
	private final String initialDescription = 
			"Taille total du fichier: non défini\n\n"
			+ "Description des fragments: non défini\n\n"
			+ "Taille moyenne d\'un fragement: non défini"; 
	private String FILE_NAME;
	private SplitManager model;
	
	public Splitter() {
		createModel();
		createView();
		placeComponents();
		createController();
	}
	
	private void display() {
		refresh();
		frame.pack();
		frame.setLocationRelativeTo(null);
		frame.setVisible(true);
	}
	
	private void createModel() {
		model = new StdSplitManager();
		
	}
	
	private void createView() {
		splitFileName = new JTextField(16);
		browse = new JButton ("Parcourir");
		splitFragmentsNb = new JComboBox();
		splitFragmentsSize = new JTextField("");
		splitDescription = new JButton ("Fragmenter!");
		description = new JTextArea(initialDescription);
		frame = new JFrame();
		
		
		
	}
	/*fileLabel = new JLabel();
		fragmentsLabel = new JLabel();
		fragmentsLength = new JLabel();
		bytesLabel = new JLabel ();
		additionalInfo = new JLabel();*/
	private void placeComponents() {
		JPanel p = new JPanel();
		{ //--
			JLabel fileLabel = new JLabel("Fichier à fragmenter");
			p.add(fileLabel);
			p.add(splitFileName);
			p.add(browse);
		} //--
		frame.add(p, BorderLayout.NORTH);
		
		JScrollPane scrollPane = new JScrollPane();
		{ //--

			JTextArea description = new JTextArea(initialDescription);
			scrollPane.setViewportView(description);
		} //--
		frame.add(scrollPane, BorderLayout.CENTER);
		
		p = new JPanel(new GridLayout(2, 1));
		{ //--
			JPanel q = new JPanel(new BorderLayout());
			{ //--
				JPanel r = new JPanel(new GridLayout(2, 2));
				{
					JPanel s = new JPanel(new FlowLayout(FlowLayout.RIGHT));
					
				}
			} //--
		} //--

	}
	private void createController() {
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
        ((Observable) model).addObserver(new Observer() {
            @Override
            public void update(Observable o, Object arg) {
            	//???
            	if (arg instanceof Integer) {
            		if ((Integer)arg == CONFIG_CHANGE) {
            			refresh();
            		};
            	} else if (arg instanceof String) {
            		if ((String) arg == FILE_CHANGE) {
            			
            			if (model.canSplit()) {
            				refresh();
            			} else {
            				
            			}
            		};
            	}
            }
        });
	}
	
	public void refresh() {
		Container contentPane = frame.getContentPane();
		
		splitFragmentsSize.setText(model.getSplitsSizes() == null ? "0" : String.valueOf(model.getSplitsSizes()[0]));
		if (model.canSplit()) {
			splitDescription.setText(model.getDescription());			
		}
		
		splitFragmentsNb.setSelectedIndex(model.getMaxFragmentNb()-1);
	}
	
	public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                new Splitter().display();
            }
        });
    }
	
}
