package myLib;

public class LibStuff {
	public LibStuff() {
		// Info:"Creating a Stuff."
		// ...
	}

	public void doSomething(int action) {
		// Info:"Doing something on : "+this+" "+action
		// ...
		// Info:"Something done!"
	}

	public void finalize() {
		// Info:"This stuff is dying :"+this;
	}
}