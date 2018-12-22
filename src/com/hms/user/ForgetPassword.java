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
 * Servlet implementation class ForgetPassword
 */

/**
 * @author praveen
 * This class will checks the username correct or not if its correct password will be resetted otherwise send request to another jsp
 *
 */
@WebServlet("/ForgetPassword")
public class ForgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter pw =response.getWriter();
		
		response.setContentType("text/html");
		
		String uname =request.getParameter("uName");
		
		Connection con =null;
		PreparedStatement ps=null;
		ResultSet rs =null;
		
		String userName=null;
		String password =null;
		
		con =MysqlConnection.getConnection();
		try {
			ps =con.prepareStatement("select * from loginCredentials");
			
			rs =ps.executeQuery();
			
			while(rs.next())
			{
				userName =rs.getString("user_name");
				//Checking the username
				if(uname.equals(userName))
				{
					//Sending the request using request dispatcher
					request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
				}
				else
				{
					//Sending the request using request dispatcher
					request.getRequestDispatcher("forgetPassword2.jsp").forward(request, response);
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
		
		
	}
