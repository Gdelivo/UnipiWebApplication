package mainPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	//connection
	protected static Connection conn = null;
	
	//credentials used for access
	String URL = "jdbc:postgresql://localhost:5432/HospitalDatabase";
	String USER = "hospital";
	String PASS = "doctorsandpats";
	
	//message for errors
	String errorMessage;
	
	public DatabaseConnection() {
		try {
			this.open();
		} catch (SQLException e) {
			e.printStackTrace();
		}
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
}
