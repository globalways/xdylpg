package com.xdylpg.restful;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xdylpg.ORM.Auth;
import com.xdylpg.ORM.BusAdmin;
import com.xdylpg.restful.API.Key;
import com.xdylpg.restful.API.Status;
import com.xdylpg.service.impl.BusAdminServiceImpl;
import com.xdylpg.service.impl.ShopServiceImpl;


@Controller
@RequestMapping("/v1")

public class BusAdminRest {

	JSONObject statusContent = new JSONObject();
	JSONObject bodyContent = new JSONObject();
	
	@Autowired
	private BusAdminServiceImpl service;
	@RequestMapping(value="/signin/{hongid}",method=RequestMethod.GET)
	public void get(HttpServletRequest request,HttpServletResponse response,@PathVariable String hongid){
		System.out.println(hongid);
		printData(response,new StringBuilder(hongid));
	}
	@RequestMapping(value="/signup/{hongid}/{role}",method=RequestMethod.GET)
	public void signup(HttpServletRequest request,HttpServletResponse response,@PathVariable Long hongid, @PathVariable String role){
		Auth auth = new Auth();
		auth.setAuthnum(3);
		BusAdmin admin = new BusAdmin(hongid, auth);
		service.saveOrUpdateBusAdmin(admin);
		printData(response,prepareData(bodyContent, API.generateStatus(Status.SUCCESS)));
	}
	
	
	/**
	 * prepare data for response,needs body and status information formatted as json object
	 * @param bodyContent
	 * @param statusContent
	 * @return array of data
	 */
	private StringBuilder prepareData(JSONObject bodyContent,JSONObject statusContent)
	{
		StringBuilder msg = new StringBuilder();
		JSONArray responseContent = new JSONArray();
		responseContent.add(new JSONObject().accumulate(Key.BODY, bodyContent));
		responseContent.add(new JSONObject().accumulate(Key.STATUS, statusContent));
		return msg.append(new JSONObject().accumulate(API.Key.JSON, responseContent));
	}
	private void printData(HttpServletResponse response,StringBuilder msg)
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
}
