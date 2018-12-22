package com.hms.cachestatescities;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.accessor.SettingCacheParameters;
import com.hms.cacheclass.Cache;
import com.hms.cacheclass.CacheManager;
import com.hms.cacheclass.StateCacheManager;
import com.hms.cacheclass.StateParameter;
import com.hms.db.MysqlConnection;

/**
 * Servlet implementation class StatesNameRetrieval
 * 
 * This servlet class is used for getting the states data from the cache and append to the jsp page
 */
@WebServlet("/StatesNameRetrieval")
public class StatesNameRetrieval extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
			 
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw =response.getWriter();
		response.setContentType("text/html");
		String country_id =request.getParameter("country_id");
     
     
		StateParameter stateParameter =null;
		
		List<StateParameter> stateParameters =new ArrayList<StateParameter>();
		Cache cache =Cache.getInstance();
		//By using the cache getting the states data
		stateParameters =  (List<StateParameter>) cache.getData(country_id);
		if(stateParameters==null)
		{
			//Sending the countryname as identifier 
			StateCacheManager cacheManager = new StateCacheManager(country_id);
			stateParameters =  (List<StateParameter>) cache.getData(country_id);
			
			System.out.println("state cache");
		}
		
		
			//Appending it to the jsp page
		pw.println("<select class='form-control' name='state' id='state'>");
		pw.println("<option>Select State</option>");
		
		 for(int i=0 ; i<stateParameters.size();i++)
		 { 
			 stateParameter =stateParameters.get(i);
			 
			 
			 pw.println("<option value="+stateParameter.getStateName()+">"+stateParameter.getStateName()+"</option>");
			 System.out.println("hello");
			
			
		 }
		
		 
		
       
		pw.println("</select>");
		
	/*	else
		{
			//If the data is not loaded in time the normal way the data gets reloaded from the database
			StateCacheManager cacheManager1 = new StateCacheManager(country_id);
			pw.println("<select class='form-control' name='state' id='state'>");
            pw.println("<option>Select State</option>");
        

               
                Connection con = MysqlConnection.getConnection();
                Statement st = null;
				try {
					st = con.createStatement();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                ResultSet rs = null;
				try {
					rs = st.executeQuery("select * from states where country_name='"+ country_id+"'");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                try {
					while (rs.next()) {
         
                 pw.println("<option value="+rs.getString("state_name")+">"+rs.getString("state_name")+"></option>"); 
         
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            
       pw.println("</select>"); 
		}*/
		pw.println("<script src='/EverGreenHospitals/statejs.js' type='text/javascript'></script>");

		
		
	}

}
