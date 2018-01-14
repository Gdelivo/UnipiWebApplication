package mainPackage;

import java.sql.Date;
import java.sql.Time;

public class Main {
	private static String amka = "1234567890";
	private static String password = "lolre";
	private static String name = "Giannis";
	private static String surname = "Adetokoumpo";
	private static String speciality = "shrink";
	private static String region = "Athens";
	private static String email = "a@hotm.com";
	private static String telephone = "6929194934";
	private static Boolean [] monday = {true,true,true,true,true,true,true,true,true,true,true,true};
	private static Boolean [] tuesday = {false,true,true,true,true,true,true,true,true,true,true,true};
	private static Boolean [] wednesday = {true,true,true,true,true,true,true,true,true,true,true,true};
	private static Boolean [] thursday = {true,true,true,true,true,true,true,true,true,true,true,true};
	private static Boolean [] friday = {true,true,true,true,true,true,true,true,true,true,true,true};
	
	public static void main(String[] args) {		
		
		try {
		DatabaseConnection db = new DatabaseConnection();
		java.sql.Date date = new Date(118,2,1);
		java.sql.Time time = new Time(8, 0, 0);
		db.deleteAppointment(amka, amka, date, time);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
