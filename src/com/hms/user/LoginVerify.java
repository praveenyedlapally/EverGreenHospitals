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
 * Servlet implementation class LoginVerify
 */

/**
 * @author praveen
 * This class is used for checking the username and password for the admin login
 *
 */
@WebServlet("/LoginVerify")
public class LoginVerify extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw =response.getWriter();
		response.setContentType("text/html");
		
		Connection con =null;
		PreparedStatement ps=null;
		ResultSet rs =null;
		
		String uname =request.getParameter("uname");

		String pwd =request.getParameter("pwd");
		
		String userName=null;
		String password =null;
		
		con =MysqlConnection.getConnection();
		try {
			
			ps =con.prepareStatement("select * from loginCredentials");
			
			rs =ps.executeQuery();
			
			while(rs.next())
			{
				userName =rs.getString("user_name");
				password =rs.getString("password");
				//Checking the username and password if its matches send the request to another jsp
				if(uname.equals(userName) && pwd.equals(password))
				{
					//Sending the request using request dispatcher
					request.getRequestDispatcher("adminPage.jsp").forward(request, response);
				}
				else
				{
					//Sending the request using request dispatcher
					request.getRequestDispatcher("Relogin.jsp").forward(request, response);
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
