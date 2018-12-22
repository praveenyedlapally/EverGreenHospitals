package com.hms.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.db.MysqlConnection;

/**
 * Servlet implementation class ResetPassword
 */

/**
 * @author praveen
 * This class is used for updating the password in the database
 *
 */
@WebServlet("/ResetPassword")
public class ResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	PrintWriter pw =response.getWriter();
		
		response.setContentType("text/html");
		
		String pwd =request.getParameter("pwd1");
		
		
		Connection con =null;
		PreparedStatement ps=null;

		

	
		con =MysqlConnection.getConnection();
		try {
			//Updating the password
			ps =con.prepareStatement("update loginCredentials set password=? where user_name =?");
			ps.setString(1, pwd);
			ps.setString(2, "praveen");
			int resultset =ps.executeUpdate();
			
			if(resultset!=0)
			{
				//Sending the request using request dispatcher
				request.getRequestDispatcher("Relogin2.jsp").forward(request, response);
			}
			else
			{
				//Sending the request using request dispatcher
				request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
			}
			
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
	}

}
