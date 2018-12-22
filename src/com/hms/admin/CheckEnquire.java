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

import com.hms.custom.Appoinment;
import com.hms.custom.Enquire;
import com.hms.custom.Referal;
import com.hms.db.MysqlConnection;

/**
 * Servlet implementation class CheckEnquire
 * This class get the Enquiries available in the database
 */
@WebServlet("/CheckEnquire")
public class CheckEnquire extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw =response.getWriter();
		response.setContentType("text/html");
		
		Connection con =null;
		PreparedStatement ps=null;
		ResultSet rs =null;
		ArrayList<Enquire> enquires =new ArrayList<>();
		Enquire enquire =null;
		con =MysqlConnection.getConnection();
		try {
            //Getting all the enquiries available from the database
			ps =con.prepareStatement("select * from enquire");
			rs =ps.executeQuery();
			while(rs.next())
			{
				//Creating the enquire object for storing the temperary data
				enquire =new Enquire();
				enquire.setName(rs.getString("name"));
				enquire.setEmail(rs.getString("email"));
				enquire.setContactNo(rs.getString("contactNo"));
				enquire.setCountry(rs.getString("country"));
				enquire.setState(rs.getString("state"));
				enquire.setCity(rs.getString("city"));
				enquire.setSpeciality(rs.getString("speciality"));
			    enquire.setComments(rs.getString("comment"));
			    enquires.add(enquire);
				
				
			}
			//setting the appointments data in request scope
			request.setAttribute("enquires", enquires);
			HttpSession session = request.getSession(false);
			session.setAttribute("enquires", enquires);
			//Sending the request using requestdispatcher
			//request.getRequestDispatcher("enquiriesDisplay.jsp").forward(request, response);
			response.sendRedirect("enquiriesDisplay.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
