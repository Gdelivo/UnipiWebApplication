package mainPackage;


public class Doctor extends User{
	
	private String speciality;
	private String area;
	private int telephone;
	private String name;
	private String lastName;
	
	public Doctor(String amka, String password, String name, String lastName, String speciality, String area, int telephone) {
		super(amka,password);
		this.name = name;
		this.lastName = lastName;
		this.speciality = speciality;
		this.area = area;
		this.telephone = telephone;
	}

}
