package com.hms.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.regex.Pattern;


import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.db.MysqlConnection;


/**
 * Servlet implementation class Enquire
 */

/**
 * @author praveen
 * This class is used for storing the enquire form information
 *
 */
@WebServlet("/Enquire")
public class Enquire extends HttpServlet {
	 private String host;
	    private String port;
	    private String user;
	    private String pass;
	  //It will initiate all the data which is there in the web.xml file
	    public void init() {
	        // reads SMTP server setting from web.xml file
	        ServletContext context = getServletContext();
	        host = context.getInitParameter("host");
	        port = context.getInitParameter("port");
	        user = context.getInitParameter("user");
	        pass = context.getInitParameter("pass");
	    }
    
	
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw =response.getWriter();
		response.setContentType("text/html");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String contactNO = request.getParameter("contactNO");
		String country = request.getParameter("country");
		String state = request.getParameter("state");
		String city = request.getParameter("city");
		String speciality = request.getParameter("speciality");
		String comment =request.getParameter("comment");
		Connection con=null;
		PreparedStatement ps =null;
		int result=0;
		
			con =MysqlConnection.getConnection();
			try {
				//Storing the data in the database
				ps=con.prepareStatement("insert into enquire(name,email,contactNo,country,state,city,speciality,comment) values(?,?,?,?,?,?,?,?)");
				ps.setString(1, name);
				ps.setString(2, email);
				ps.setString(3, contactNO);
				ps.setString(4, country);
				ps.setString(5, state);
				ps.setString(6, city);
				ps.setString(7, speciality);
				
					ps.setString(8, comment);
			
				
				 result=ps.executeUpdate();
				 if(result!=0)
				 {
					 //creating the subject and content
					  String recipient = email;
				        String subject = "Enquire";
				        String content = "You will get a call shortly and thank you for contacting us";
				 
				        String resultMessage = "";
				 
				        try {
				        	//calling the method sendmail and sending the data
				            EmailCustom.sendEmail(host, port, user, pass, recipient, subject,
				                    content);
				            
				        } catch (Exception ex) {
				            ex.printStackTrace();
				            resultMessage = "There were an error: " + ex.getMessage();
				        } 
				      //Sending the request using request dispatcher
					//request.getRequestDispatcher("EnquirySubmit.jsp").forward(request, response);
				        response.sendRedirect("EnquirySubmit.jsp");
					
				 }
				 else
				 {
					//Sending the request using request dispatcher
					 request.getRequestDispatcher("welcome.jsp").forward(request, response); 
				 }
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			finally {
				try {
					ps.close();
					con.close();
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
		
	}
	public static boolean isValidEmailAddress(String email) {
		   boolean result = true;
		   String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."+ 
                "[a-zA-Z0-9_+&*-]+)*@" + 
                "(?:[a-zA-Z0-9-]+\\.)+[a-z" + 
                "A-Z]{2,7}$"; 
                  
				Pattern pat = Pattern.compile(emailRegex); 
				if (email == null) 
				   return false; 
				return pat.matcher(email).matches(); 
		}

}
