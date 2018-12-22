package com.hms.cachestatescities;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.accessor.SettingCacheParameters;
import com.hms.cacheclass.Cache;
import com.hms.cacheclass.CacheManager;
import com.hms.cacheclass.CityCacheManager;
import com.hms.cacheclass.CityParameter;


/**
 * Servlet implementation class CityNameRetrieval
 * 
 * This servlet class is used for getting the cities data from the cache and append to the jsp page
 */
@WebServlet("/CityNameRetrieval")
public class CityNameRetrieval extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw =response.getWriter();
		response.setContentType("text/html");
		String state_name =request.getParameter("state_name");
     
		 
	      
		CityParameter cityParameter =null;
		//Sending the statename as identifier 
	
		List<CityParameter> cityParameters =new ArrayList<CityParameter>();
		Cache cache =Cache.getInstance();
	//By using the cache getting the cities data
		cityParameters =  (List<CityParameter>) cache.getData(state_name);
			   if(cityParameters==null)
			   {
				  
					CityCacheManager cacheManager = new CityCacheManager(state_name);
					//By using the cache getting the cities data
					cityParameters =  (List<CityParameter>) cache.getData(state_name);
					System.out.println("city cache");
			   }
			//Appending it to the jsp page
		pw.println("<select class='form-control' name='city' id='city'>");
		pw.println("<option>Select City</option>");
		 for(int i=0 ; i<cityParameters.size();i++)
		 { 
			 cityParameter =cityParameters.get(i);
			 
			 
			 pw.println("<option value="+cityParameter.getCityName()+">"+cityParameter.getCityName()+"</option>");
			 System.out.println("hello");
			
			
		 }
		
		 
		
       
		pw.println("</select>");
		}
	
	

		
		
	}
 

