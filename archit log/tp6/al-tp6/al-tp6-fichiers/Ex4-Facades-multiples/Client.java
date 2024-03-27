package tpfacade;

public class Client {
	public static void main(String[] args) {
		System.out.println("Debut client");

		FacadeAdmin admin=new FacadeAdminImpl();
		admin.addVehicule("Berline 5 portes", 6000, 
		   "Compact 3 portes<br>Moteur diesel<br>Neuve<br>", 
		   "Compact 3 portes\nMoteur diesel\nNeuve");
		admin.addVehicule("Espace 5 portes", 8000, 
		   "Espace 5 portes<br>Moteur essence<br>Neuve<br>", 
		   "Espace 5 portes\nMoteur essance\nNeuve");
		admin.addVehicule("Coupe 2 portes", 3000, 
		   "Utilitaire 3 portes<br>Moteur diesel<br>Occasion<br>", 
		   "Utilitaire 3 portes\nMoteur diesel\nOccasion");

		FacadeWeb web=new FacadeWebImpl();
		System.out.println("requete espace 5 portes:\n" + 
		   web.findVehicule("Espace 5 portes"));
		System.out.println("requete vehicule a moins de 7000 euros:\n" +
		   web.findVehiculeByPrice(0, 7000));

		System.out.println("Demande de documentation:\n" + 
		   web.orderVehiculeDoc("Berline 5 portes", 
		   "Avenue de l'universite, 76800, Saint Etienne-du-Rouvray"));
		System.out.println("Demande de documentation:\n" + 
		   web.orderVehiculeDoc("Coupe 2 portes", 
		   "Avenue de l'universite, 76800, Saint Etienne-du-Rouvray"));
		System.out.println("Fin client");
	}
}


