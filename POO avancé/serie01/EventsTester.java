package tp1;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ComponentAdapter;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.awt.event.MouseWheelEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.awt.event.WindowStateListener;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.SwingUtilities;
import javax.swing.border.Border;

public class EventsTester {
	private int RAZ = 1;
	private JFrame mainFrame;
	private JFrame testFrame = null;
	private JButton btnNewTestFrame;
	private JButton btnRAZ;
	private JTextArea[] textArea;
	private JScrollPane[] scrollableTextArea;
	
	private static String[] titles = {
		"MouseListener", "WindowFocusListener", "WindowListener",
		"KeyListener", "WindowStateListener", "MouseWheelListener",
		"MouseMotionListener"
	};
	
	EventsTester() {
		createView();
		placeComponents();
		createController();
	}
	
	private void display() {
		mainFrame.pack();
		mainFrame.setSize(700, 400);
		mainFrame.setLocationRelativeTo(null);
		mainFrame.setVisible(true);
	}
	
	
	private void createView() {
		mainFrame = new JFrame("Tests sur les événements - Zone d'AFFICHAGE");
		btnNewTestFrame = new JButton("Nouvelle fenetre");
		btnRAZ = new JButton("RAZ");
		textArea = new JTextArea[7];
		scrollableTextArea = new JScrollPane[7];
	}
	
	private void placeComponents() {
		JPanel p = new JPanel();
		{ //--
			p.add(btnNewTestFrame);
			p.add(btnRAZ);
		} //--
		mainFrame.add(p, BorderLayout.NORTH);
		p = new JPanel(new GridLayout(3, 3));
		{ //--
			for (int i = 0; i < 7; ++i) {
				textArea[i] = new JTextArea();

				scrollableTextArea[i] = new JScrollPane(textArea[i]);
				Border border = BorderFactory.createLineBorder(Color.BLACK, 1);
				scrollableTextArea[i].setBorder(BorderFactory.createTitledBorder(border, titles[i]));
				scrollableTextArea[i].setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);  
		        scrollableTextArea[i].setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED);
		        
		        p.add(scrollableTextArea[i]);
			}
		} //--
		mainFrame.add(p, BorderLayout.CENTER);
	}
	
	private void createNewTestFrame() {
		testFrame = new JFrame();
		testFrame.pack();
		testFrame.setSize(200, 100);
		testFrame.setLocationRelativeTo(null);
		testFrame.setVisible(true);
		
		// MouseListener
		testFrame.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				textArea[0].append(RAZ++ + " MOUSE_PRESSED\n");
			}
			
			@Override
			public void mouseReleased(MouseEvent e) {
				textArea[0].append(RAZ++ + " MOUSE_RELEASED\n");
			}
			
			@Override
			public void mouseEntered(MouseEvent e) {
				textArea[0].append(RAZ++ + " MOUSE_ENTERED\n");
			}
			
			@Override
			public void mouseExited(MouseEvent e) {
				textArea[0].append(RAZ++ + " MOUSE_EXITED\n");				
			}
		});
		
		// WindowFocusListener
		testFrame.addWindowFocusListener(new WindowAdapter() {
			@Override
			public void windowGainedFocus(WindowEvent e) {
				textArea[1].append(RAZ++ + " WINDOW_GAINED_FOCUS\n");
			}
			
			@Override
			public void windowLostFocus(WindowEvent e) {
				textArea[1].append(RAZ++ + " WINDOW_LOST_FOCUS\n");
			}
		});
		
		// WindowListener
		testFrame.addWindowListener(new WindowAdapter() {
			@Override
			public void windowActivated(WindowEvent e) {
				textArea[2].append(RAZ++ + " WINDOW_ACTIVATED\n");
			}
			
			@Override
			public void windowDeactivated(WindowEvent e) {
				textArea[2].append(RAZ++ + " WINDOW_DEACTIVATED\n");
			}
			
			@Override
			public void windowOpened(WindowEvent e) {
				textArea[2].append(RAZ++ + " WINDOW_OPENED\n");
			}
		});
		
		// KeyListener
		testFrame.addKeyListener(new KeyAdapter () {
			@Override
			public void keyPressed(KeyEvent e) {
				textArea[3].append(RAZ++ + " KEY_PRESSED\n");
			}
			
			@Override
			public void keyReleased(KeyEvent e) {
				textArea[3].append(RAZ++ + " KEY_RELEASED\n");
			}
			
			@Override
			public void keyTyped(KeyEvent e) {
				textArea[3].append(RAZ++ + " KEY_TYPED\n");
			}
		});
		
		// WindowStateListener
		testFrame.addWindowStateListener(new WindowStateListener() {
			@Override
			public void windowStateChanged(WindowEvent e) {
				textArea[4].append(RAZ++ + " WINDOW_STATE_CHANGED\n");
			}
		});
		
		//MouseWheelListener
		testFrame.addMouseWheelListener(new MouseAdapter() {
			@Override
			public void mouseWheelMoved(MouseWheelEvent e) {
				textArea[5].append(RAZ++ + " MOUSE_WHEEL_MOVED\n");
			}
		});
		
		// MouseMotionListener
		testFrame.addMouseMotionListener(new MouseMotionListener() {
			@Override
			public void mouseDragged(MouseEvent e) {
				textArea[6].append(RAZ++ + " MOUSE_DRAGGED\n");				
			}
			@Override
			public void mouseMoved(MouseEvent e) {
				textArea[6].append(RAZ++ + " MOUSE_MOVED\n");
			}
			
		});
		
		
	}
	
	private void createController() {
		mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		// Ajoute une nouvelle fenetre test
		btnNewTestFrame.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {				
				if (testFrame != null) {
					int input = JOptionPane.showConfirmDialog(null, 
			                "Voulez-vous fermer et reouvrir la fenetre courante?", "Fermeture d'une fenetre", 
			                 JOptionPane.YES_NO_CANCEL_OPTION);
					if (input == 0) {
						clear();					
						createNewTestFrame();
					}
				} else {
					createNewTestFrame();
				}
			}

			private void clear() {
				testFrame.dispose(); // close window
				testFrame.setVisible(false); // hide window
				testFrame = null;
				for (int i = textArea.length; i > 0;) {
					textArea[--i].setText("");
				}
				RAZ = 1;
			}
		});
		
		btnRAZ.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				RAZ = 1;
				for (int i = textArea.length; i > 0; ) {
					textArea[--i].append("-----RAZ-----\n");
				}
			}
		});
		
	}
	
	public static void main(String[] args) {
		SwingUtilities.invokeLater(new Runnable() {
			public void run() {
				new EventsTester().display();
			}
		});
	}
	
}