package com.hms.accessor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hms.cacheclass.StateParameter;
import com.hms.db.MysqlConnection;
/*
 * Implements IAccessor interface implements all the methods
 */
public class StateDataAccessorImpl implements IAccessor{
	String identifier=null;
	public StateDataAccessorImpl(String identifier) {
		
		this.identifier = identifier;
	}

	Connection con=null;
	PreparedStatement pstmt=null;

	 StateParameter stateParameter =null;
	 List<StateParameter> stateParameters =new ArrayList<>();
	
	Map<String,Object> lmap;

	@Override
	public Object getData() {
		lmap =new HashMap<>();
		try {
			con = MysqlConnection.getConnection();
			//Getting all the states from the database based on the countryname
		 pstmt = con.prepareStatement("select * from states where country_name=?");
			  pstmt.setString(1, identifier);
             ResultSet rs = pstmt.executeQuery();
             while (rs.next()) {
            	 //Setting the states data by creating the statesparameter object
            	 stateParameter =new StateParameter();
            	 stateParameter.setStateName(rs.getString("state_name"));
            	 stateParameter.setCountryName(rs.getString("country_name"));
            	 stateParameters.add(stateParameter);
             }
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return stateParameters;
	}

	@Override
	public String getIdentifier() {
		
		return identifier ;
	}

	
}
