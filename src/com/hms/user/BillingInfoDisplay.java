package com.hms.user;

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

import com.hms.custom.Billing;
import com.hms.db.MysqlConnection;


/**
 * @author praveen
 * It will get the billing data which is there in the database
 *
 */
@WebServlet("/BillingInfoDisplay")
public class BillingInfoDisplay extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw =response.getWriter();
		response.setContentType("text/html");
		
		Connection con =null;
		PreparedStatement ps=null;
		ResultSet rs =null;
		ArrayList<Billing> billings =new ArrayList<>();
		//Creating the Billing object and storing the data in it
		Billing billing =null;
		con =MysqlConnection.getConnection();
		try {
			ps =con.prepareStatement("select * from billinginfo");
			rs =ps.executeQuery();
			while(rs.next())
			{
				billing =new Billing();
				billing.setSno(rs.getString("sno"));
				billing.setServiceOffered(rs.getString("serviceOffered"));
				billing.setPrice(rs.getString("price"));
			   billings.add(billing);
			    
				
				
			}
			//Setting the data in request scope
			request.setAttribute("billings", billings);
			//Sending the request using request dispatcher
			request.getRequestDispatcher("billingInfoDisplay.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
