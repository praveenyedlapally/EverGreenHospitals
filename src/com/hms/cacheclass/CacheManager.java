package com.hms.cacheclass;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hms.accessor.CityDataAccessorImpl;
import com.hms.accessor.IAccessor;
import com.hms.accessor.StateDataAccessorImpl;


/**
 * @author praveen
 * 
 *
 */
public class CacheManager {
	String identifier;
	
	private List<IAccessor> accessors = null;

	private Map<String, Object> lmap;

	public CacheManager() {
	  
		accessors = new ArrayList<>();
		//we can add as many accessors we want here
		   addAccessor(new StateDataAccessorImpl(identifier));
	       addAccessor(new CityDataAccessorImpl(identifier));
		Cache cache = Cache.getInstance();
		init(cache);
	      }

	public void init(Cache cache) {
    //By using the cache object we can load the data into it
		lmap = new HashMap<>();
		//we are using hashmap for storing the  accessor data by creating new hashmap
		for (IAccessor accessor : accessors) {
			try {
				lmap.put(accessor.getIdentifier(), accessor.getData());
				System.out.println("Hello this is praveen");
			} catch (Exception e) {
				System.out.println("Failed to load" + accessor.getIdentifier());
			}
		}
		cache.load(lmap);
	}

	public void addAccessor(IAccessor accessor1) {
		accessors.add(accessor1);
	}
}
/*
 * CacheManager is patter where aggregate the data from mutiple accessors
 */