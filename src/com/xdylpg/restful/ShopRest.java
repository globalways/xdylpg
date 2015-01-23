package com.xdylpg.restful;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xdylpg.res.S;
import com.xdylpg.restful.API.Para;
import com.xdylpg.restful.API.Status;
import com.xdylpg.restful.OBJ.RShop;
import com.xdylpg.service.ShopService;
import com.xdylpg.service.impl.ShopServiceImpl;
import com.xdylpg.util.T;
import com.xdylpg.ORM.Shop;

@Controller
@RequestMapping("/v1")
public class ShopRest {

	
	JSONObject statusContent = new JSONObject();
	JSONObject bodyContent = new JSONObject();
	
	@Autowired
	private ShopServiceImpl shopService;
	@RequestMapping(value="/stores/{hongid}",method=RequestMethod.GET)
	public void get(HttpServletRequest request,HttpServletResponse response,@PathVariable Long hongid){
		
		String targetFieldsStr = request.getParameter(API.Para.FIELDS);
		
		// if there is no requirements for specify fields,then get all fields
		if(targetFieldsStr == null || targetFieldsStr.equals(""))
		{
			Shop shop = (Shop)shopService.loadByHongid(hongid);
			bodyContent
			.accumulate(RShop.shopnum, shop.getShopnum())
			.accumulate(RShop.busname, shop.getBusname())
			.accumulate(RShop.pinyinid, shop.getPinyinid())
			.accumulate(RShop.busintr, shop.getBusintr())
			.accumulate(RShop.busml, shop.getBusml())
			.accumulate(RShop.busaddr, shop.getBusaddr())
			.accumulate(RShop.busphone, shop.getBusphone())
			.accumulate(RShop.category, "12")
			.accumulate(RShop.logo, shop.getLogo())
			.accumulate(RShop.busAdmin, "23")
			.accumulate(RShop.owner, shop.getOwner())
			.accumulate(RShop.hotlimit, shop.getHotlimit())
			.accumulate(RShop.status, shop.getStatus())
			.accumulate(RShop.hits, shop.getHits())
			.accumulate(RShop.shopnews, shop.getShopnews());
			
		}else{
			// save parameter fields
			String[] targetFieldsArray = null;
			try {
				targetFieldsArray = targetFieldsStr.split(Para.SEPARATOR);
			} catch (JSONException e) {
				// get a wrong format of fields json
				printData(response,prepareData(bodyContent, API.generateStatus(Status.INVALIDREQUEST)));
				return;
			}
			String[] fields = new String[targetFieldsArray.length];
			HashMap<String, String> apitodatabaseMap = RShop.getValueNameMap();
			for(int i=0;i<targetFieldsArray.length;i++)
			{
				fields[i] = apitodatabaseMap.get(targetFieldsArray[i]);
			}
			
			//Shop shop = (Shop)shopService.loadObject(null, fields, hongid);
			Object[] resultObj = new Object[1];
			if(fields.length == 1)
			{
				resultObj[0] = shopService.loadObject(null,fields, hongid);
			}else{
				resultObj = (Object[]) shopService.loadObject(null,fields, hongid);
			}
			
			for (int j = 0; j < fields.length; j++) {
				bodyContent.accumulate(targetFieldsArray[j], resultObj[j]);
			}
		}
		// output json data
		printData(response,prepareData(bodyContent, API.generateStatusSuccess()));
	}
	
	@RequestMapping(value="/stores",method=RequestMethod.POST)
	public void add(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		// get parameter
		String shopInfo = request.getParameter(API.Para.DATA);
		// invalid parameter
		if(shopInfo == null || shopInfo.equals("") || T.getJSON(shopInfo) == null)
		{
			statusContent.accumulate(Status.CODE,Status.INVALIDREQUEST).accumulate(Status.MSG, API.getMsg(Status.INVALIDREQUEST));
			printData(response,prepareData(bodyContent, statusContent));
			clear();
			return;
		}
		// format parameter
		shopInfo = URLDecoder.decode(shopInfo,"UTF-8");
		JSONObject shopInfoJSON = T.getJSON(shopInfo);
		Shop shop = new Shop();
		Iterator shopInfoIterator = shopInfoJSON.keys();
		HashMap<String, String> map = RShop.getValueNameMap();
		while(shopInfoIterator.hasNext())
		{
			String key = (String)shopInfoIterator.next();
			String field = map.get(key);
			try {
				PropertyDescriptor pd = new PropertyDescriptor(field, Shop.class);
				Method wM = pd.getWriteMethod();
				// invoke set method
				Object tmp = T.cast(wM.getParameterTypes()[0],shopInfoJSON.getString(key));
				if(tmp == null)
				{
					statusContent.accumulate(Status.CODE,Status.INVALIDREQUEST).accumulate(Status.MSG, API.getMsg(Status.INVALIDREQUEST));
					printData(response,prepareData(bodyContent, statusContent));
					return;
				}else
					wM.invoke(shop,tmp);
			} catch (Exception e) {
				statusContent.accumulate(Status.CODE,Status.SERVERERROR).accumulate(Status.MSG, API.getMsg(Status.SERVERERROR));
				printData(response,prepareData(bodyContent, statusContent));
				return;
			} 
		}
		shopService.saveOrUpdate(shop);
		
		statusContent.accumulate(Status.CODE, Status.SUCCESS).accumulate(Status.MSG, API.getMsg(Status.SUCCESS));
		printData(response,prepareData(bodyContent, statusContent));
		clear();
	}
	
	@RequestMapping(value="/stores/{hongid}",method=RequestMethod.PUT)
	public void update(@PathVariable Long hongid,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		// get parameter
				String shopInfo = request.getParameter(API.Para.DATA);
				// invalid parameter
				if(shopInfo == null || shopInfo.equals("") || T.getJSON(shopInfo) == null)
				{
					printData(response,prepareData(bodyContent, API.generateStatus(Status.INVALIDREQUEST)));
					return;
				}
				JSONObject shopInfoJSON = T.getJSON(shopInfo);
				// load shop
				Shop shop = (Shop)shopService.loadByHongid(hongid);
				shopInfo = URLDecoder.decode(shopInfo,"UTF-8");
				
				Iterator shopInfoIterator = shopInfoJSON.keys();
				HashMap<String, String> map = RShop.getValueNameMap();
				while(shopInfoIterator.hasNext())
				{
					String key = (String)shopInfoIterator.next();
					String field = map.get(key);
					try {
						PropertyDescriptor pd = new PropertyDescriptor(field, Shop.class);
						Method wM = pd.getWriteMethod();
						// invoke set method
						Object tmp = T.cast(wM.getParameterTypes()[0],shopInfoJSON.getString(key));
						if(tmp == null)
						{
							statusContent.accumulate(Status.CODE,Status.INVALIDREQUEST).accumulate(Status.MSG, API.getMsg(Status.INVALIDREQUEST));
							printData(response,prepareData(bodyContent, statusContent));
							return;
						}else
							wM.invoke(shop,tmp);
					} catch (Exception e) {
						statusContent.accumulate(Status.CODE,Status.SERVERERROR).accumulate(Status.MSG, API.getMsg(Status.SERVERERROR));
						printData(response,prepareData(bodyContent, statusContent));
						return;
					} 
				}
				shopService.saveOrUpdate(shop);
				
				printData(response,prepareData(bodyContent, API.generateStatusSuccess()));
	}
	
	@RequestMapping(value="/stores/{hongid}",method=RequestMethod.DELETE)
	public void delete(HttpServletRequest request,HttpServletResponse response,@PathVariable Long hongid){
		shopService.deleteByHonid(hongid);
		printData(response,prepareData(bodyContent, API.generateStatusSuccess()));
	}
	
	
	@RequestMapping(value="/stores/list/{hongid}",method=RequestMethod.GET)
	public void list(HttpServletRequest request,HttpServletResponse response,@PathVariable Long hongid){
		
		String targetFieldsStr = request.getParameter(API.Para.FIELDS);
		String pageStr = request.getParameter(Para.PAGE);
		String pagesizeStr = request.getParameter(Para.PAGESIZE);
		Integer page = null;
		Integer pagesize = null;
		if(pagesizeStr != null && pageStr != null)
		{
			try {
				page = Integer.parseInt(pageStr);
				pagesize = Integer.parseInt(pagesizeStr);
			} catch (NumberFormatException e) {
				printData(response,prepareData(bodyContent, API.generateStatus(Status.INVALIDREQUEST)));
				return;
			}
		}
		
		JSONArray bodyArrayContent = new JSONArray();
		// if there is no requirements for specify fields,then get all fields
		if(targetFieldsStr == null || targetFieldsStr.isEmpty())
		{
			@SuppressWarnings("unchecked")
			ArrayList<Shop> list = (ArrayList<Shop>) shopService.loadSpecifyOwnerObjects(null, hongid,page,pagesize);
			for(Shop shop : list)
			{
				JSONObject tmp = new JSONObject();
				tmp
				.accumulate(RShop.shopnum, shop.getShopnum())
				.accumulate(RShop.busname, shop.getBusname())
				.accumulate(RShop.pinyinid, shop.getPinyinid())
				.accumulate(RShop.busintr, shop.getBusintr())
				.accumulate(RShop.busml, shop.getBusml())
				.accumulate(RShop.busaddr, shop.getBusaddr())
				.accumulate(RShop.busphone, shop.getBusphone())
				.accumulate(RShop.category, "12")
				.accumulate(RShop.logo, shop.getLogo())
				.accumulate(RShop.busAdmin, "23")
				.accumulate(RShop.owner, shop.getOwner())
				.accumulate(RShop.hotlimit, shop.getHotlimit())
				.accumulate(RShop.status, shop.getStatus())
				.accumulate(RShop.hits, shop.getHits())
				.accumulate(RShop.shopnews, shop.getShopnews());
				bodyArrayContent.add(tmp);
			}
			
		}else{
			
			// save parameter fields
			String[] targetfieldsArray = null;
			try {
				targetfieldsArray = targetFieldsStr.split(",");
			} catch (JSONException e) {
				// get a wrong format of fields json
				printData(response,prepareData(bodyContent, API.generateStatus(Status.INVALIDREQUEST)));
				return;
			}
			String[] fields = new String[targetfieldsArray.length];
			HashMap<String, String> apitodatabaseMap = RShop.getValueNameMap();
			for(int i=0;i<targetfieldsArray.length;i++)
			{
				fields[i] = apitodatabaseMap.get(targetfieldsArray[i]);
			}
			ArrayList<Object> resultList = shopService.loadSpecifyOwnerObjects(fields, hongid,page,pagesize);
			for(Object object : resultList)
			{
				Object[] resultObj = new Object[1];
				if(fields.length == 1)
				{
					resultObj[0] = object;
				}else{
					resultObj = (Object[]) object;
				}
				JSONObject tmp = new JSONObject();
				for (int j = 0; j < fields.length; j++) {
					tmp.accumulate(targetfieldsArray[j], resultObj[j]);
				}
				bodyArrayContent.add(tmp);
			}
			
		}
		// output json data
		printData(response,prepareData(bodyArrayContent, API.generateStatus(Status.SUCCESS)));
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
	private StringBuilder prepareData(JSONArray bodyContent,JSONObject statusContent)
	{
		StringBuilder msg = new StringBuilder();
//		responseContent.element(new JSONObject().accumulate("body", bodyContent))
		JSONObject responseContent = new JSONObject();
		responseContent.accumulate("body", bodyContent);
		responseContent.accumulate("status", statusContent);
		return msg.append(responseContent);
	}
	
	/**
	 * clear body and status data
	 */
	private void clear()
	{
		this.bodyContent.clear();
		this.statusContent.clear();
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
		clear();
	}
}
