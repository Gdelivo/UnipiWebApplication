package mainPackage;


public class Doctor{
	private String amka;
	private String password;
	private String name;
	private String surname;
	private String speciality;
	private String region;
	private String email;
	private String telephone;
	private Schedule schedule;
	
	public Doctor(String amka, String password, String name, String surname, String speciality, String region, String email, String telephone, Schedule schedule) {
		this.amka = amka;
		this.password = password;
		this.name = name;
		this.surname = surname;
		this.speciality = speciality;
		this.region = region;
		this.email = email;
		this.telephone = telephone;
		this.schedule = schedule;
	}	
	
	public String getAmka() {
		return amka;
	}

	public void setAmka(String amka) {
		this.amka = amka;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getSpeciality() {
		return speciality;
	}

	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public Schedule getSchedule() {
		return schedule;
	}

	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}	
}
