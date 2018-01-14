package mainPackage;

import java.sql.Array;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DatabaseConnection {
	//connection
	protected static Connection conn = null;
	
	//credentials used for access
	String URL = "jdbc:postgresql://localhost:5432/HospitalDatabase";
	String USER = "postgres";
	String PASS = "mypass";
	
	//message for errors
	String errorMessage;
	
	public DatabaseConnection() {
		try {
			this.open();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	protected void finalize() throws Throwable
	{
	    this.close();
	}
	
	//open connection to database
	public void open() throws SQLException  {
	
		try {
	
			Class.forName("org.postgresql.Driver").newInstance(); //finding the database
	
		} catch (Exception e) {
	
			throw new SQLException();
		}
	
		try {
	
			conn = DriverManager.getConnection(URL,USER,PASS);  //connecting to the database
	
		} catch (Exception e) {
	
			errorMessage = "Could not establish connection with the Database Server: <br> "
			+ e.getMessage();
			conn = null;
			throw new SQLException(errorMessage);
		}	
	}
	
	//close connection,prepStatement and resultset
	public void close() throws SQLException {
	
		try {
	
	
	 	} catch (Exception e) {
	
	  		errorMessage = "Could not close connection with the Database Server: "
	      	+ e.getMessage();
	  		throw new SQLException(errorMessage);
		}
	
	}
	
	//add new user to database
	public User createUser(String amka, String password) throws Exception {

		try {
			String createUserQuery = " insert into users (amka, password, usertype)  values (?, ?, ?)";
			PreparedStatement stmt = conn.prepareStatement(createUserQuery);
			
			stmt.setString(1, amka);
			stmt.setString(2, password);
			stmt.setString(3, "user");

			stmt.executeUpdate();
			stmt.close();
			
			return new User(amka,password);
			} catch (Exception e) {
				throw new Exception(e.getMessage());

			}

	}
	
	//add new doctor to database
	public Doctor createDoctor(String amka, String password, String name, String surname, String speciality, String region, String email, String telephone) throws Exception {

		try {
			String createUserQuery = " insert into users (amka, password, usertype)  values (?, ?, ?)";
			PreparedStatement stmt = conn.prepareStatement(createUserQuery);
			
			stmt.setString(1, amka);
			stmt.setString(2, password);
			stmt.setString(3, "doctor");

			stmt.executeUpdate();
			stmt.close();
			
			String createDoctorQuery = "insert into doctors (amka, name, surname, speciality, region, email, telephone) values (?,?,?,?,?,?,?)";
			stmt = conn.prepareStatement(createDoctorQuery);
			
			stmt.setString(1, amka);
			stmt.setString(2, name);
			stmt.setString(3, surname);
			stmt.setString(4, speciality);
			stmt.setString(5, region);
			stmt.setString(6, email);
			stmt.setString(7, telephone);
			
			stmt.executeUpdate();
			stmt.close();
			
			return new Doctor(amka,password,name,surname,speciality,region,email,telephone, null);
			
			} catch (Exception e) {
				throw new Exception(e.getMessage());

			}
	}
	
	public User userLogIn(String amka, String password) throws Exception {
		try {
			String getUserQuery = "select * from users where amka = ? and password = ?";
			PreparedStatement stmt = conn.prepareStatement(getUserQuery);
			
			stmt.setString(1, amka);
			stmt.setString(2, password);
			
			ResultSet rs = stmt.executeQuery();
			
			rs.next();
			if(rs.getString(1) == null) {
				return null;
			}
			return new User(rs.getString(1),rs.getString(2));



		} catch (Exception e) {
			throw new Exception(e.getMessage());

		}
	}
	
	public Doctor doctorLogIn(String amka, String password) throws Exception {
		try {
			String getUserQuery = "select * from users where amka = ? and password = ?";
			PreparedStatement stmt = conn.prepareStatement(getUserQuery);
			
			stmt.setString(1, amka);
			stmt.setString(2, password);
			
			ResultSet rs = stmt.executeQuery();
			
			rs.next();
			if(rs.getString(1) != null) {
				String getDoctorQuery = "select * from doctors where amka = ?";
				stmt = conn.prepareStatement(getDoctorQuery);
				
				stmt.setString(1, amka);
				
				rs = stmt.executeQuery();
				
				rs.next();
				if(rs.getString(1) == null) {
					return null;
				}
				Doctor doc = new Doctor(rs.getString(1),password, rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7), null);
				Schedule schedule = this.getSchedule(doc.getAmka());
				doc.setSchedule(schedule);
				
				return doc;
			}
						
			return null;

		} catch (Exception e) {
			throw new Exception(e.getMessage());

		}
	}
	
	public void createSchedule(String amka, Schedule schedule) throws Exception {
		try {
			String createScheduleQuery = " insert into schedule (amka, monday, tuesday, wednesday, thursday, friday)  values (?, ?, ?, ? ,?, ?)";
			PreparedStatement stmt = conn.prepareStatement(createScheduleQuery);
			
			stmt.setString(1, amka);
			Array mondayArray = conn.createArrayOf("boolean", schedule.getMonday());
			stmt.setArray(2, mondayArray);
			Array tuesdayArray = conn.createArrayOf("boolean", schedule.getTuesday());
			stmt.setArray(3, tuesdayArray);
			Array wednesdayArray = conn.createArrayOf("boolean", schedule.getWednesday());
			stmt.setArray(4, wednesdayArray);
			Array thursdayArray = conn.createArrayOf("boolean", schedule.getThursday());
			stmt.setArray(5, thursdayArray);
			Array fridayArray = conn.createArrayOf("boolean", schedule.getFriday());
			stmt.setArray(6, fridayArray);		

			stmt.executeUpdate();
			stmt.close();
			
			} catch (Exception e) {
				throw new Exception(e.getMessage());

			}
	}
	
	public void updateSchedule(String amka, Schedule schedule) throws Exception{
		String updateScheduleQuery = " update schedule set monday = ?, tuesday= ?, wednesday = ?, thursday = ?, friday = ? where amka = ?";
		
		try {

			PreparedStatement stmt = conn.prepareStatement(updateScheduleQuery);
			Array mondayArray = conn.createArrayOf("boolean", schedule.getMonday());
			stmt.setArray(1, mondayArray);
			Array tuesdayArray = conn.createArrayOf("boolean", schedule.getTuesday());
			stmt.setArray(2, tuesdayArray);
			Array wednesdayArray = conn.createArrayOf("boolean", schedule.getWednesday());
			stmt.setArray(3, wednesdayArray);
			Array thursdayArray = conn.createArrayOf("boolean", schedule.getThursday());
			stmt.setArray(4, thursdayArray);
			Array fridayArray = conn.createArrayOf("boolean", schedule.getFriday());
			stmt.setArray(5, fridayArray);
			
			stmt.setString(6, amka);
			
			stmt.executeUpdate();
			stmt.close();
			} catch (Exception e) {
				throw new Exception(e.getMessage());

			}
	}
	
	public Schedule getSchedule(String amka) throws Exception{
		String getScheduleQuery = "select * from schedule where amka = ?";
		
		try {
			PreparedStatement stmt = conn.prepareStatement(getScheduleQuery);
			
			stmt.setString(1, amka);
			
			ResultSet rs = stmt.executeQuery();
			
			rs.next();
			if(rs.getArray(1) == null) {
				return null;
			}				
			rs.close();
			stmt.close();
			return new Schedule((Boolean[]) rs.getArray(2).getArray(),(Boolean[]) rs.getArray(3).getArray(), (Boolean[]) rs.getArray(4).getArray(), (Boolean[]) rs.getArray(5).getArray(), (Boolean[]) rs.getArray(6).getArray());
			
			
		}catch(Exception e) {
			throw new Exception(e.getMessage());
		}
	}
	
	public void createAppointment(String patientAmka, String doctorAmka, java.sql.Date date,java.sql.Time time) throws Exception{
		try{
			 String createAppointmentQuery= "INSERT INTO appointment (patientamka,doctoramka,date,time) VALUES(?,?,?,?)";			 
			 
			 PreparedStatement stmt = conn.prepareStatement(createAppointmentQuery);
			 
			 stmt.setString(1,patientAmka);
			 stmt.setString(2, doctorAmka);				 
			 stmt.setDate(3, date);
			 stmt.setTime(4, time);
			
			 stmt.executeUpdate();
			 
			 this.close();	
			 stmt.close();
		}
		
		catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
	
	public void deleteAppointment(String patientAmka, String doctorAmka, java.sql.Date date,java.sql.Time time) throws Exception{
		String deleteAppointmentQuery = " delete from appointment where patientamka = ? and doctoramka = ? and date = ? and time = ?";
		
		try {
			
			PreparedStatement stmt = conn.prepareStatement(deleteAppointmentQuery);
			stmt.setString(1, patientAmka);
			stmt.setString(2, doctorAmka);
			stmt.setDate(3, date);
			stmt.setTime(4, time);
			
			stmt.executeUpdate();			


			
			} catch (Exception e) {

				errorMessage = e.getMessage();
				throw new Exception(errorMessage);

			}
	}
	
	public Appointment[] getAppointments(String patientamka) throws Exception{
		List<Appointment> templist = new ArrayList<Appointment>();
		String getAppointmentsQuery = "select * from appointment where patientamka = ?";
		try {
			PreparedStatement stmt = conn.prepareStatement(getAppointmentsQuery);
			
			stmt.setString(1, patientamka);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){				
				
				templist.add(new Appointment(rs.getString(2),rs.getString(3),rs.getDate(4),rs.getTime(5)));
				
			}
			
			this.close();
			stmt.close();
			rs.close();
			
			Appointment[] tempapp =  new Appointment[templist.size()];		
			return templist.toArray(tempapp);
			
		} catch (SQLException e) {
			throw new Exception(e.getMessage());
		}
	}
}
