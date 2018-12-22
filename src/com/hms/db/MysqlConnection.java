package com.hms.db;

import java.sql.DriverManager;
import java.sql.SQLException;

import java.sql.Connection;;

/**
 * @author praveen
 * This class is used to create the connection to database
 *
 */
public class MysqlConnection {
	    private static String driverName = "com.mysql.cj.jdbc.Driver";  
	    private static String url = "jdbc:mysql://localhost:3306/hms?useSSL=false";   
	    private static String username = "root";   
	    private static String password = "root";
	    private static Connection con;
        //By using this method every class where we required we can call this method
	    public static Connection getConnection() {
	        try {
	            Class.forName(driverName);
	            try {
	                con = DriverManager.getConnection(url, username, password);
	            } catch (SQLException ex) {
	                
	             ex.printStackTrace();
	            }
	        } catch (ClassNotFoundException ex) {
	          
	            System.out.println("Driver not found."); 
	        }
	        //returning the connection object
	        return con;
	    }
	}

