import myLib.*;

public class Appli {
	private LibStuff stuff;

	public void initApp() {
		// Info:"Initializing App..."
		// ... some code here
		stuff= new LibStuff();
		// Info:"Initialization done!"
	}

	public void closeApp() {
		// Info:"Closing app..."
		// ... some code here
		// Info:"Ressources freeed!"
	}

	public void run() {
		boolean errors=false;
		for(int i=0; i<10; ++i) {
			int action = (int)(100.0*Math.random());
			if (action<50) {
				stuff.doSomething(action);
			} else {
				// Error:"Invalide action : "+action
				errors=true;
			}
		}
		if (errors) {
			// Warning : some errors occured during processing.
		}
	}

	public static void main(String[] args) {
		Appli app=new Appli();
		app.initApp();
		app.run();
		app.closeApp();
	}
}