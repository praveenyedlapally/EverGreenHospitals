package com.hms.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.custom.DoctorsDetails;
import com.hms.db.MysqlConnection;

/**
 * Servlet implementation class DisplayDoctors
 */

/**
 * @author praveen
 * 
 * This class used to get the doctors from the database and send to the jsp
 *
 */
@WebServlet("/DisplayDoctors")
public class DisplayDoctors extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw =response.getWriter();
		response.setContentType("text/html");
		
		Connection con =null;
		PreparedStatement ps=null;
		ResultSet rs =null;
		
	 
		String department =request.getParameter("dept");
		DoctorsDetails  doctorsDetails =null;
		ArrayList<DoctorsDetails> doctorsInfo =new ArrayList<>();
		con =MysqlConnection.getConnection();
		try {
			ps = con.prepareStatement("select * from doctor where department_name=?");
			ps.setString(1, department);
			rs =ps.executeQuery();
			while(rs.next())
			{
				//Creating the doctorsDetails object and storing the data in it
				doctorsDetails =new DoctorsDetails();
				doctorsDetails.setDoctorName(rs.getString("doctor_name"));
				doctorsDetails.setQualification(rs.getString("qualification"));
				doctorsDetails.setExperience(rs.getString("experience"));
				doctorsDetails.setLocation(rs.getString("location"));
				
			   doctorsInfo.add(doctorsDetails);
			}
			//Setting the data in request scope
			request.setAttribute("doctorsInfo", doctorsInfo);
			HttpSession session = request.getSession(false);
			session.setAttribute("doctorsInfo", doctorsInfo);
			//Sending she request using request dispatcher
			//request.getRequestDispatcher("doctors.jsp").forward(request, response);
		     response.sendRedirect("doctors.jsp");
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
	}

}
