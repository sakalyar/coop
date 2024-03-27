package tpfacade;

public interface Vehicule {
	/* returns the price of the vehicule */
	public int getPrice();
	/* returns the name of the vehicule */
	public String getName();
	/* gives an html description of the vehicule */
	public String getWebDescription();
	/* gives a text description for printing */
	public String getPrintableDocument();
}


