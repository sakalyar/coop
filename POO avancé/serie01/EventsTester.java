package tp1;

import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseWheelEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.SwingUtilities;

public class EventsTester {
	private int RAZ = 1;
	private JFrame mainFrame;
	private JFrame testFrame = null;
	private JButton btnNewTestFrame;
	JTextArea[] textArea;
	JScrollPane[] scrollableTextArea;
	
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
		mainFrame = new JFrame("Tests sur les evenements - Zone d4AFFICHAGE");
		btnNewTestFrame = new JButton("Nouvelle fenetre");
		
		textArea = new JTextArea[7];
		scrollableTextArea = new JScrollPane[7];
        
  
//        frame.getContentPane().add(scrollableTextArea);
		
	}
	
	private void placeComponents() {
		JPanel p = new JPanel();
		{ //--
			p.add(btnNewTestFrame);
			
		} //--
		mainFrame.add(p, BorderLayout.NORTH);
		p = new JPanel(new GridLayout(3, 3));
		{ //--
			for (int i = 0; i < 7; ++i) {
				textArea[i] = new JTextArea();
				scrollableTextArea[i] = new JScrollPane(textArea[i]);
				
		        scrollableTextArea[i].setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);  
		        scrollableTextArea[i].setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED);
		        p.add(scrollableTextArea[i]);
			}
		} //--
		mainFrame.add(p, BorderLayout.CENTER);
	}
	
	private void createTestFrame() {
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
				System.out.println("pressed");
			}
			
			@Override
			public void mouseReleased(MouseEvent e) {
				textArea[0].append(RAZ++ + " MOUSE_RELEASED\n");
				System.out.println("released");
			}
		});
		
		// WindoFocusListener
		
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
		
		testFrame.addMouseWheelListener(new MouseAdapter() {
			@Override
			public void mouseWheelMoved(MouseWheelEvent e) {
				textArea[5].append(RAZ++ + " MOUSE_WHEEL_MOVED\n");
				System.out.println("Wheel moved");
			}
		});
		
		
		
		
	}
	
	private void createController() {
		
		mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		btnNewTestFrame.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if (testFrame != null) {
					System.out.println("Frame exists: " + testFrame);
					testFrame.dispose(); // close window
					testFrame.setVisible(false); // hide window
					testFrame = null;
					RAZ++;
				} else {
					createTestFrame();
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
