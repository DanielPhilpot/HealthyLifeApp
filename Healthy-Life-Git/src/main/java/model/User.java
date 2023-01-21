package model;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;

public class User {
	
	private Connection connection=null;
	private String username;
	private String sex;
	
	private String dietReqs[] = new String[7];
	private boolean isVegiterian = false;
	private boolean isVegan = false;
	private boolean isLactoseInt = false;
	private boolean isGlutenInt = false;
	private boolean isNutAlerg = false;
	private boolean isKosher = false;
	private boolean isHalal = false;
	
	private int gymDistance;
	private int parkDistance;
	
	
	String connectionURL = "jdbc:mysql://localhost:3306/healthy_life";
	
	public User(){
		try {

            // Load the database driver
            Class.forName("com.mysql.jdbc.Driver");

            // Get a Connection to the database
            // TODO 1 put in your own password.
            connection = DriverManager.getConnection(connectionURL, "root", "#Bebo123");
            
            }catch(Exception e){

                System.out.println("Exception is ;"+e + ": message is " + e.getMessage());
            }
	}
	
	public void cleanUp() {
        try {
            connection.close(); 
            connection = null;
        }catch(Exception e){
                System.out.println("Exception is ;"+e + ": message is " + e.getMessage());
        }
    }
	
	public boolean validateUser(String username, String password) {
		try {
			String query = "SELECT username, password, sex, dietReqs, gymDistance, parkDistance FROM users WHERE username = '" + username + "';";
			
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            if (rs.next()) { 
            	String dbUser = rs.getString(1);
            	String dbPass = rs.getString(2);
            	String dbSex = rs.getString(3);
            	String dbDiet = rs.getString(4);
            	String dbGym = rs.getString(5);
            	String dbPark = rs.getString(6);
            	
            	if(dbPass.equals(password)){
            		
            		//Debugging
            		System.out.println(dbUser + " ---> " + dbPass);
            		
            		this.username = username;
            		sex = dbSex;
            		this.setDietReqs(dbDiet);
            		
            		return true;
            		
            	} else {
            		
            		//Debugging
            		System.out.println("login failed");
            		System.out.println(username);
            		System.out.println(dbUser);
            		System.out.println(password);
            		System.out.println(dbPass);
            		
            		return false;
            		
            	}
            } 
		}
        catch(SQLException e) {
        System.out.println("Exception is ;"+e + ": message is " + e.getMessage());
        }
		
		return false;
	}
	
	public String getUsername() {
		return username;
	}
	
	public String getSex() {
		if(sex.equals("f")) {
			String x = "Female";
			return x;
		} else {
			String x = "Male";
			return x;
		}
	}
	
	public int getGymDistance() {
		return gymDistance;
	}
	
	public int getParkDistance() {
		return parkDistance;
	}
	
	
	
	
	
	
	//----------DIETARY REQUIRMENTS CODE -----------------
	
	public void setDietReqs(String reqs) {
		isVegiterian = false;
		isVegan = false;
		isLactoseInt = false;
		isGlutenInt = false;
		isNutAlerg = false;
		isKosher = false;
		isHalal = false;
		
		//System.out.println(reqs);
		
		dietReqs = reqs.split(",");		
		
		for(int i = 0; i < dietReqs.length; i++) {
			switch(dietReqs[i]) {
				case "V":
					isVegiterian = true;
					break;
				case "VV":
					isVegan = true;
					break;
				case "L":
					isLactoseInt = true;
					break;
				case "G":
					isGlutenInt = true;
					break;
				case "N":
					isNutAlerg = true;
					break;
				case "K":
					isKosher = true;
					break;
				case "H":
					isHalal = true;
					break;
			}
			
		}
	}
	
	public String[] getDietRqs() {
		return dietReqs;
	}
	

	
	public void submitDietReqs(String dietReqString) {
		try {
			String update = "UPDATE healthy_life.users SET dietReqs = '" + dietReqString + "' WHERE username = '" + username + "'";
			//System.out.println(update);
			
            Statement stmt = connection.createStatement();
            stmt.executeUpdate(update);
            
            this.setDietReqs(dietReqString);
            
		} catch(SQLException e) {
			System.out.println("Exception is ;"+e + ": message is " + e.getMessage());
        }
	}
	
	public boolean getIsVegiterian() {
		if(isVegiterian) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean getIsVegan() {
		if(isVegan) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean getIsLactoseInt() {
		if(isLactoseInt) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean getIsGlutenInt() {
		if(isGlutenInt) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean getIsNutAlerg() {
		if(isNutAlerg) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean getIsKosher() {
		if(isKosher) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean getIsHalal() {
		if(isHalal) {
			return true;
		} else {
			return false;
		}
	}
}
