package tpfacade;
import java.util.*;

public interface Database {
	/* returns a vehicule by its name */
	public Vehicule getVehicule(String name);
	/* returns a list of vehicules by arange of prices */
	public List<Vehicule> getVehiculesByPrice(int low, int hi);
	/* add a vehicule into the database */
	public void addVehicule(Vehicule v);
}



class DatabaseImpl implements Database {
	private ArrayList<Vehicule> db;
	private static Database ctx=new DatabaseImpl();

	public DatabaseImpl() {
		db=new ArrayList<Vehicule>();
	}

	public static Database getContext() {
		return ctx;
	}

	public Vehicule getVehicule(String name) {
		Iterator<Vehicule> it=db.iterator();
		Vehicule cur;
		while (it.hasNext()) {
			cur=it.next();
			if (cur.getName().equals(name)) return cur;
		}
		return null;
	}

	public List<Vehicule> getVehiculesByPrice(int low, int hi) {
		ArrayList<Vehicule> sel=new ArrayList<Vehicule>();
		Iterator<Vehicule> it=db.iterator();
		while (it.hasNext()) {
			Vehicule cur=it.next();
			if (cur.getPrice()>=low && cur.getPrice()<=hi) sel.add(cur);
		}
		return sel;		
	}

	public void addVehicule(Vehicule v) {
		db.add(v);
	}
}




