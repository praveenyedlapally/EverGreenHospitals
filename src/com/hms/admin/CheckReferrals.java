package com.hms.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.custom.Enquire;
import com.hms.custom.Referal;
import com.hms.db.MysqlConnection;

/**
 * Servlet implementation class CheckReferrals
 * This class get the referrals available in the database
 */
@WebServlet("/CheckReferrals")
public class CheckReferrals extends HttpServlet {
	
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw =response.getWriter();
		response.setContentType("text/html");
		
		Connection con =null;
		PreparedStatement ps=null;
		ResultSet rs =null;
		ArrayList<Referal> referals =new ArrayList<>();
		Referal referal =null;
		con =MysqlConnection.getConnection();
		try {
			//Getting all the referrals available from the database
			ps =con.prepareStatement("select * from patientreferrals");
			rs =ps.executeQuery();
			while(rs.next())
			{
				//Creating the referal object for storing the temperary data
				referal =new Referal();
			     referal.setPatientRefNo(rs.getString("patientRefNo"));
			     referal.setReferer_type(rs.getString("referer_type"));
			     referal.setPatient_name(rs.getString("patient_name"));
			     referal.setPatient_dob(rs.getString("patient_dob"));
			     referal.setPatient_mob(rs.getString("patient_mob"));
			     referal.setEmail_id(rs.getString("email_id"));
			     referal.setReferer_name(rs.getString("referer_name"));
			     referal.setReferer_mob(rs.getString("referer_mob"));
			     referal.setReferer_email(rs.getString("referer_email"));
			     referal.setReferer_address(rs.getString("referer_address"));
			     referals.add(referal);
			     System.out.println("data");
				
				
			}
			//setting the appointments data in request scope
			request.setAttribute("referals", referals);
			HttpSession session = request.getSession(false);
			session.setAttribute("referals", referals);
			//Sending the request using requestdispatcher
			//request.getRequestDispatcher("referralDisplay.jsp").forward(request, response);
			response.sendRedirect("referralDisplay.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/**/
	
	}

}
