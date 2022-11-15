package serie08;

import java.awt.Dimension;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Observable;
import java.util.Observer;

import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.SwingUtilities;

import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.Container;
import serie07.Swelling;

public class Speedometer extends Observable {

	private JFrame mainFrame;
	private SpeedometerModel model;
	private JRadioButton radioButton1;
	private JRadioButton radioButton2;
	private JButton button1;
	private JButton button2;
	private JButton button3;
	private ButtonGroup group1;
	private ButtonGroup group2;
	private GraphicSpeedometer speedometer;
	
	public Speedometer() {
		createModel();
		createView();
		placeComponents();
		createController();
	}
	
	
	void display() {
		refresh();
		mainFrame.pack();
		mainFrame.setLocationRelativeTo(null);
		mainFrame.setVisible(true);
		JFrame wa = new JFrame();
		
	}
	
	void createModel() {
		model = new StdSpeedometerModel();
	}
	
	void createView() {
		int frameWidth = 300;
		int frameHeight = 300;
		
		mainFrame = new JFrame("Speedometer");
		mainFrame.setPreferredSize(new Dimension(frameWidth, frameHeight));
		
		radioButton1 = new JRadioButton("km / h");
		radioButton2 = new JRadioButton("mi / h");
		button1 = new JButton("-");
		button2 = new JButton("+");
		button3 = new JButton("TURN OFF");
		ButtonGroup group1 = new ButtonGroup();
		ButtonGroup group2 = new ButtonGroup();
		
		speedometer = new GraphicSpeedometer();
	}
	
	void placeComponents() {
		JPanel p = new JPanel(new GridLayout(0,1));
		{ //--
			JPanel q = new JPanel();
			{ //--
				JPanel h = new JPanel(new GridLayout(0, 1));
				{
					//--
					h.add(radioButton1);
					h.add(radioButton2);
				} //--
				q.add(h);
			} //--
			p.add(q);
			JPanel q2  = new JPanel();
			{ //--
				JPanel h2 = new JPanel(new GridLayout(1, 0));
				{ //--
					h2.add(button1);
					h2.add(button2);
				} //--
				q2.add(h2);
			} //--
			p.add(q2);
			JPanel q3  = new JPanel();
			{ //--
				q3.add(button3);
			} //--
			p.add(q3);
		} //--
		mainFrame.add(p, BorderLayout.WEST);
		mainFrame.add(speedometer, BorderLayout.CENTER);
		
	}
	
	void createController() {
mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
        ((Observable) model).addObserver(new Observer() {
            @Override
            public void update(Observable o, Object arg) {
                refresh();
            }
        });

        button1.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                speedometer.test();
            }
        });
	}
	
	void refresh() {
		Container contentPane = mainFrame.getContentPane();
		
	}
	
	public static void main(String[] args) {
		SwingUtilities.invokeLater(new Runnable() {
			@Override
			public void run() {
				new Speedometer().display();
			}
		});
	}

	
	
}
