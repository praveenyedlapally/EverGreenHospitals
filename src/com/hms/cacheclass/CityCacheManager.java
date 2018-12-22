package com.hms.cacheclass;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hms.accessor.CityDataAccessorImpl;
import com.hms.accessor.IAccessor;

/**
 * @author praveen
 * This class is used for adding the city accessor data into the cache
 *
 */
public class CityCacheManager {

	private List<IAccessor> accessors = null;

	private Map<String, Object> lmap;

	public CityCacheManager(String identifier) {
		System.out.println("city data");
	   
		accessors = new ArrayList<>();
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
		//Loading the hashmap into the concurrenthashmap
		cache.load(lmap);
	}

	public void addAccessor(IAccessor accessor1) {
		accessors.add(accessor1);
	}
}
/*
 * CacheManager is patter where aggregate the data from mutiple accessors
 */