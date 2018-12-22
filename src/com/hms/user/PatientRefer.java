package com.hms.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.db.MysqlConnection;

/**
 * Servlet implementation class PatientRefer
 */

/**
 * @author praveen
 * This class is used to store the information of refer a patient form in the database
 *
 */
@WebServlet("/PatientRefer")
public class PatientRefer extends HttpServlet {
	
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw =response.getWriter();
		response.setContentType("text/html");
		
		Connection con =null;
		PreparedStatement ps=null;
		ResultSet rs =null;
		int result=0;
		String referer =request.getParameter("referer");
		String pName =request.getParameter("pName");
		String pDob =request.getParameter("pDob");
		String mobileNumber =request.getParameter("mobileNumber");
		String emailId =request.getParameter("emailId");
		String rName =request.getParameter("rName");
		String rMobile_number =request.getParameter("rMobile_number");
		String rEmail =request.getParameter("rEmail");
		String rAddress =request.getParameter("rAddress");
		
		con =MysqlConnection.getConnection();
		try {
			//storing into the database
			ps= con.prepareStatement("insert into patientreferrals(referer_type,patient_name,patient_dob,patient_mob,email_id,referer_name,"
					+ "referer_mob,referer_email,referer_address) values(?,?,?,?,?,?,?,?,?)");
			ps.setString(1, referer);
			ps.setString(2, pName);
			ps.setString(3, pDob);
			ps.setString(4, mobileNumber);
			ps.setString(5, emailId);	
			ps.setString(6, rName);
			ps.setString(7, rMobile_number);
			ps.setString(8, rEmail);
			ps.setString(9, rAddress);
			result =ps.executeUpdate();
			if(result!=0)
			{
				//Sending the request using request dispatcher
				//request.getRequestDispatcher("referalSubmit.jsp").forward(request, response);
				 response.sendRedirect("referalSubmit.jsp");
			}
			else
			{
				//Sending the request using request dispatcher
				request.getRequestDispatcher("welcome.jsp").include(request, response);
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		
	}

}
