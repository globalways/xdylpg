package com.xdylpg.util;

import java.io.Serializable;
import java.util.Random;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.hibernate.HibernateException;
import org.hibernate.engine.SessionImplementor;
import org.hibernate.id.IdentifierGenerator;

public class ShopIDGenerator implements IdentifierGenerator {

	@Override
	public Serializable generate(SessionImplementor arg0, Object arg1)
			throws HibernateException {
		return (int)Math.round(Math.random()*899999999+100000000);
	}
	public static void main(String args[])
	{
		Random r = new Random();
		
		
		String s = "[{'imgAddr':'./uploads/15a2be01-9de1-49f2-b76c-1f76acf02da4.jpg','imgDesc':'w'},{'imgAddr':'./uploads/0d31611c-fb3b-4721-b104-43260e5d6d02.jpg','imgDesc':'d'},]";
		
		//JSONObject j = new JSONObject();
		//JSONArray jsonArray = JSONArray.fromObject(s);  
		//j.fromObject(s);
		getStringArray4Json(s);
	}
	
	public static void getStringArray4Json(String jsonString){  
        
	    JSONArray jsonArray = JSONArray.fromObject(jsonString);  
	    for( int i = 0 ; i<jsonArray.size();i++)
	    {
	    	JSONObject jo = JSONObject.fromObject(jsonArray.getString(i)) ; 
	        System.out.println(jo.get("imgAddr"));
	        System.out.println(jo.get("imgDesc"));
	          
	     }  
	      
	 } 

}
