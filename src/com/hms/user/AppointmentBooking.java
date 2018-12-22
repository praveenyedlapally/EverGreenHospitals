package com.hms.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.Random;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import org.apache.catalina.util.URLEncoder;

import com.hms.db.MysqlConnection;


/**
 * Servlet implementation class AppointmentBooking
 */
/**
 * @author praveen
 *
 */
@WebServlet("/AppointmentBooking")
public class AppointmentBooking extends HttpServlet {
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
		//Getting all the data from the jsp page
		String first_name=request.getParameter("first_name");
		String last_name=request.getParameter("last_name");
		String sex=request.getParameter("sex");
		String contact_no=request.getParameter("contact_no");
		String email_address=request.getParameter("email_address");
		String dateIn =  request.getParameter("datepicker");
		String location = request.getParameter("location");
		String department = request.getParameter("dept");
		String doctor = request.getParameter("doctor");
		
		
		String Address =  request.getParameter("address");
		Connection con=null;
		PreparedStatement ps =null;
		SimpleDateFormat sdf1 = new SimpleDateFormat("MM/dd/yyyy");
		Date utilDate = null;
		java.sql.Date date = null;
	//converting the normal date to sql date 
	try {
			utilDate = sdf1.parse(dateIn);
			date =  new java.sql.Date(utilDate.getTime());
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		String qry=null;
		int randNum =new Random().nextInt(1000);
		
		
		
		if(isValidEmailAddress(email_address))
		{
			con =MysqlConnection.getConnection();
			
			try {
				//storing into the database
				ps=con.prepareStatement("insert into appointment(first_name,last_name,sex,contact_no, email_address,date,location,department,doctor,address) values(?,?,?,?,?,?,?,?,?,?)");
			
				ps.setString(1,first_name);
				ps.setString(2,last_name);
				ps.setString(3, sex);
				ps.setString(4,contact_no);
				ps.setString(5, email_address);
				ps.setDate(6,date);
				ps.setString(7, location);
				ps.setString(8,department);
				ps.setString(9,doctor);
				ps.setString(10,Address);
				int result=ps.executeUpdate();
				ResultSet rs=null;
				if(result!=0)
				{
					//Getting the unique id which is created in the database
					ps =con.prepareStatement("select id_appointment from appointment where contact_no=? and first_name=? and last_name=?");
					ps.setString(1,contact_no);
					ps.setString(2,first_name);
					ps.setString(3,last_name);
					rs = ps.executeQuery();
					if(rs.next())
					{
						 String recipient = email_address;
					        String subject = "Appointment";
					        String content = "Your appointment id is "+rs.getString("id_appointment");
					 
					        String resultMessage = "";
					 
					        try {
					            EmailCustom.sendEmail(host, port, user, pass, recipient, subject,
					                    content);
					            
					        } catch (Exception ex) {
					            ex.printStackTrace();
					            resultMessage = "There were an error: " + ex.getMessage();
					        } 
						request.setAttribute("id",rs.getString("id_appointment"));
						// request.getRequestDispatcher("appointSubmit.jsp").include(request, response); 
			
						response.sendRedirect("appointSubmit.jsp?message="+java.net.URLEncoder.encode(rs.getString("id_appointment"), "UTF-8"));  
					}
				}
				else
				{
					request.getRequestDispatcher("welcome.jsp").include(request, response); 
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
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
		else
		{
			pw.println("enter valid email address");
		}
	}
	//checking whether the email is valid or not
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


