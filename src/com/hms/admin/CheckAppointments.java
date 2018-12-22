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
import com.hms.db.MysqlConnection;

/**
 * Servlet implementation class CheckAppointments
 * This class get the appoinments available in the database
 */
@WebServlet("/CheckAppointments")
public class CheckAppointments extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw =response.getWriter();
		response.setContentType("text/html");
		
		Connection con =null;
		PreparedStatement ps=null;
		ResultSet rs =null;
		ArrayList<Appoinment> appoinments =new ArrayList<>();
		Appoinment appointment =null;
		con =MysqlConnection.getConnection();
		try {
			//Getting the appoinments 
			ps =con.prepareStatement("select * from appointment");
			rs =ps.executeQuery();
			while(rs.next())
			{
				//Creating the appoinment object for storing the data
				appointment =new Appoinment();
				appointment.setAppointmentId(rs.getString("id_appointment"));
				appointment.setFirstName(rs.getString("first_name"));
				appointment.setLastName(rs.getString("last_name"));
				appointment.setSex(rs.getString("sex"));
				appointment.setContactNo(rs.getString("contact_no"));
				appointment.setEmail(rs.getString("email_address"));
				appointment.setDate(rs.getDate("date"));
				appointment.setLocation(rs.getString("location"));
				appointment.setDepartment(rs.getString("department"));
				appointment.setDoctor(rs.getString("doctor"));
				appoinments.add(appointment);
				
				
			}
			//setting the appointments data in request scope
			request.setAttribute("appointments", appoinments);
			
			HttpSession session = request.getSession(false);
			session.setAttribute("appointments", appoinments);
			//Sending the request using requestdispatcher
			//request.getRequestDispatcher("appointmentsDisplay.jsp").forward(request, response);
			
			response.sendRedirect("appointmentsDisplay.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
