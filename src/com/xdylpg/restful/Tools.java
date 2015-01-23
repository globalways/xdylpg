package com.xdylpg.restful;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class Tools {

	/**
	 * prepare data for response,needs body and status information formatted as json object
	 * @param bodyContent
	 * @param statusContent
	 * @return array of data
	 */
	public StringBuilder prepareData(JSONObject bodyContent,JSONObject statusContent)
	{
		StringBuilder msg = new StringBuilder();
		JSONObject responseContent = new JSONObject();
		responseContent.accumulate("body", bodyContent);
		responseContent.accumulate("status", statusContent);
		return msg.append(responseContent);
	}
	/**
	 * prepare data for response,needs body and status information formatted as json object
	 * @param bodyContent
	 * @param statusContent
	 * @return array of data
	 */
	public StringBuilder prepareData(JSONArray bodyContent,JSONObject statusContent)
	{
		StringBuilder msg = new StringBuilder();
//		responseContent.element(new JSONObject().accumulate("body", bodyContent))
		JSONObject responseContent = new JSONObject();
		responseContent.accumulate("body", bodyContent);
		responseContent.accumulate("status", statusContent);
		return msg.append(responseContent);
	}
	
	
	public void printData(HttpServletResponse response,StringBuilder msg)
	{
		try {
			response.setContentType("text/html;charset=utf-8");
            response.setCharacterEncoding("UTF-8");
			PrintWriter out = new PrintWriter(new OutputStreamWriter(response.getOutputStream(),"utf-8"));
			out.println(msg);
			out.close();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * caller must has a accessible {@linkplain clear} method 
	 * @param response
	 * @param msg
	 * @param obj current {@code Object}
	 */
	public void printData(HttpServletResponse response,StringBuilder msg,Object obj)
	{
		try {
			response.setContentType("text/html;charset=utf-8");
            response.setCharacterEncoding("UTF-8");
			PrintWriter out = new PrintWriter(new OutputStreamWriter(response.getOutputStream(),"utf-8"));
			out.println(msg);
			out.close();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			obj.getClass().getMethod("clear", null).invoke(obj, null);
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
