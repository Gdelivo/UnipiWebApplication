package mainPackage;

public class Appointment {
	private String patientAmka;
	private String doctorAmka;
	private java.sql.Date date;
	private java.sql.Time time;
	
	public Appointment(String patientAmka, String doctorAmka, java.sql.Date date, java.sql.Time time) {
		this.patientAmka = patientAmka;
		this.doctorAmka = doctorAmka;
		this.date = date;
		this.time = time;
	}

	public String getPatientAmka() {
		return patientAmka;
	}

	public void setPatientAmka(String patientAmka) {
		this.patientAmka = patientAmka;
	}

	public String getDoctorAmka() {
		return doctorAmka;
	}

	public void setDoctorAmka(String doctorAmka) {
		this.doctorAmka = doctorAmka;
	}

	public java.sql.Date getDate() {
		return date;
	}

	public void setDate(java.sql.Date date) {
		this.date = date;
	}

	public java.sql.Time getTime() {
		return time;
	}

	public void setTime(java.sql.Time time) {
		this.time = time;
	}
	
	
}
