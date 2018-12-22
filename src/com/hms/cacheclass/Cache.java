package com.hms.cacheclass;


import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author praveen
 * 
 * This class is single ton class only one object will be created for entire jvm and the same object will be returned
 *
 */
public class Cache {
	private static Cache instance;

private static Map<String,Object> dataMap;
private Cache()
{
	//Creating the ConcurrentHashMap for storing the data
	dataMap =new ConcurrentHashMap<String,Object>();
}
public static synchronized Cache getInstance()
{
	if(instance==null)
	{
		instance =new Cache();
	}
	return instance;
	//Returning the same cache object
}
/*
 * ConcurrentHashMap is for Synchronize environment whereas hashtable is also for the Synchronize But Hashtable will lock the total map To get the value,
 * And next key is accessed after another one only whereas ConcurrentHashMap will not lock the total map it will lock only the what ever the key it is accessing
 * and performance will not be degraded as like the HashTable.
 * 
 */
public Object getData(String key)
{
	System.out.println(key+"key");
	return  dataMap.get(key);
	
	
}
public void putData(String key,Object value)
{
	System.out.println("put data in cache");
	dataMap.put(key, value);
}
public boolean containsKey(String key)
{
	return dataMap.containsKey(key);
	
}
public synchronized void load(Map<String,Object> lmap)
{
	System.out.println("putting data");
	  dataMap.putAll(lmap);
	
}
/*
 * put all will load all the data at one time and will not remove the existing data
 */
}
