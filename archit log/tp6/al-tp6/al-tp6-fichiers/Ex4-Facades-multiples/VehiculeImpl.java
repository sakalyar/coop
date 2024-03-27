package tpfacade;



public class VehiculeImpl implements Vehicule {
	private int price;
	private String name;
	private String web_desc;
	private String print_doc;
	
	public VehiculeImpl(String n, int p, String w, String d) {
		name=n; price=p; web_desc=w; print_doc=d;
	}

	public int getPrice() { return price; }
	public String getName() { return name; }
	public String getWebDescription() { return web_desc; }
	public String getPrintableDocument() { return print_doc; }
}




