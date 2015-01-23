package com.xdylpg.util;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import com.xdylpg.ORM.Auth;
/**
 * Tools 
 * @author wang
 *
 */
public class T {
	/**
	 * a discriminant that return boolean;<br>
	 * true for str is a Integer;<BR>
	 * false for str is a NON;
	 * @param str
	 * @return boolean
	 */
	public static boolean isNum(String str)
	{
			try {
				Integer.parseInt(str);
			} catch (Exception e) {
				System.out.println("ERROR: String "+str+"can not transform to Ingeter");
				 return false;
			}
		return true;
	}
	/**
	 * according the specify url,this method return auth object <br />
	 * 1 stands for user <br />
	 * 2 stands for administrator <br />
	 * @param url
	 * @return Auth
	 */
	public static Auth UrlAuthManage(String url)
	{
		// category company administration board,like com-cpc-index...
		Pattern cca = Pattern.compile(".*com-[a-z]{3}-[a-z]+");
		// pattern for uri
		Pattern uri = Pattern.compile(".*\\.[a-zA-Z]{1,3}");
		
		Matcher m = cca.matcher(url);
		if(url.contains("admin") && !uri.matcher(url).matches())
		{
			if(m.matches())
				return new Auth(1,"");
			else
				return new Auth(2,"");
		}
		else return new Auth(1,"");
	}
	public static String getPath(HttpServletRequest request)
	{
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		return basePath;
	}
	
	/**
	 * return json object if src string is a legal json object.
	 * @param src
	 * @return
	 */
	public static JSONObject getJSON(String src)
	{
		JSONObject result = null;
		try {
			result = JSONObject.fromObject(src);
		} catch (JSONException e) {
			return null;
		}
		return result;
	}
	/**
	 * generate a object of to according to string src<br>
	 * return null if Class to has no available constructor for String
	 * @param to
	 * @param src
	 * @return Object
	 */
	public static Object cast(Class<?> to,String src)
    {
    	Constructor[] con = to.getConstructors();
    	Object result = null;
    	for(int i=0;i<con.length;i++)
    	{
    		try {
				result = con[i].newInstance(src);
			} catch (InstantiationException | IllegalAccessException
					| IllegalArgumentException | InvocationTargetException e) {
				continue;
			}
    	}
    	return result;
    }
}
