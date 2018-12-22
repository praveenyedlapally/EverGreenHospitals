package com.hms.accessor;
/*
 * Implements IAccessor interface implements all the methods
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hms.cacheclass.CityParameter;
import com.hms.db.MysqlConnection;

public class CityDataAccessorImpl implements IAccessor{
	String identifier=null;
	
	


	public CityDataAccessorImpl(String identifier) {
		this.identifier = identifier;
	}

	Connection con=null;
	PreparedStatement pstmt=null;

	 CityParameter cityParameter =null;
	 List<CityParameter> cityParameters =new ArrayList<>();
	
	Map<String,Object> lmap;

	@Override
	public Object getData() {
		lmap =new HashMap<>();
		try {
			//Getting all the cities from the database based on the state
			con = MysqlConnection.getConnection();
		 pstmt = con.prepareStatement("select * from hms.cities where state_name=?");
			  pstmt.setString(1, identifier);
             ResultSet rs = pstmt.executeQuery();
             while (rs.next()) {
            	//Setting the cities data by creating the cityParameter object
            	 cityParameter =new CityParameter();
            	 cityParameter.setCityName(rs.getString("city_name"));
            	 cityParameter.setStateName(rs.getString("state_name"));
            	 cityParameters.add(cityParameter);
             }
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return cityParameters;
	}

	@Override
	public String getIdentifier() {
		
		return identifier;
	}



}
