package com.xdylpg.restful.OBJ;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import com.xdylpg.ORM.BusAdmin;
import com.xdylpg.ORM.Category;
import com.xdylpg.ORM.Owner;

public class RShop {
	public static final String busname="storename";
	public static final String busphone="storephone";
	
	public static String shopnum = "storeid";
	public static String category = "industryid";
	public static String hongid = "hongid";
	public static String busAdmin = "administratorid";
	public static String owner = "ownerid";
	public static String pinyinid="storealias";
	public static String busaddr = "storeaddress";
	public static String busintr="storedesc";
	public static String shopnews="storenews";
	public static String busml = "storegps";
	public static String shoptem="";
	public static String hits = "hit";
	public static String hotlimit = "producthotlimit";
	public static String status = "status";
	public static String logo = "avatar";
	/**
	 * get a map that key stands for api fields,value stands for database fields.
	 * @return HashMap
	 */
	public static HashMap<String,String> getValueNameMap(){
		HashMap<String, String> result = new HashMap<String, String>();
		try {
			Class clazz = Class.forName(new RShop().getClass().getName());
			Field[] fields = clazz.getDeclaredFields();
			for(int i=0;i<fields.length;i++)
			{
				if(Modifier.isStatic(fields[i].getModifiers()))
				{
					result.put(fields[i].get(null).toString(), fields[i].getName());
				}
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return result;
	}
}
