package com.xdylpg.restful;

import net.sf.json.JSONObject;

public class API {
	
	
	public static final String getMsg(int code)
	{
		String msg = "";
		switch (code) {
		case 200:msg = "服务器成功返回用户请求的数据";break;
		
		case 201:msg = "用户新建或修改数据成功";break;
		case 204:msg = "用户删除数据成功";break;
		case 400:msg = "用户发出的请求有错误，服务器没有进行新建或修改数据的操作";break;
		case 403:msg = "禁止访问";break;
		case 404:msg = "不存在的请求地址";break;
		case 410:msg = "资源不存在";break;
		case 500:msg = "服务器内部错误";break;
			
		default:msg = "未知信息";
			break;
		}
		return msg;
	}
	
	public static JSONObject generateStatus(int code)
	{
		return new JSONObject().accumulate(Status.CODE,code).accumulate(Status.MSG, API.getMsg(code));
	}
	public static JSONObject generateStatusSuccess()
	{
		return generateStatus(API.Status.SUCCESS);
	}
	
	class Status{
		
		// 返回字符串名称 
		public static final String CODE = "code";
		public static final String MSG = "msg";
		
		// status code
		/**
		 * 服务器成功返回用户请求的数据
		 */
		public static final int SUCCESS=200;
		
		/**
		 * [POST/PUT]：用户新建或修改数据成功
		 */
		public static final int CREATED=201;
		
		/**
		 * [DELETE]：用户删除数据成功
		 */
		public static final int NOCONTENT=204;
		
		/**
		 * [POST/PUT]用户发出的请求有错误，服务器没有进行新建或修改数据的操作
		 */
		public static final int INVALIDREQUEST=400;
		
		/**
		 * 表示用户没有权限
		 */
		public static final int FORBIDDEN=403;
		/**
		 * 用户发出的请求针对的是不存在的记录，服务器没有进行操作
		 */
		public static final int NOTFOUND=404;
		/**
		 * [GET]：用户请求的资源被永久删除，且不会再得到的
		 */
		public static final int GONE=410;
		/**
		 * 服务器发生错误，用户将无法判断发出的请求是否成功
		 */
		public static final int SERVERERROR=500;
		
	}
	
	class Key{
		public static final String BODY = "body";
		public static final String STATUS = "status";
		public static final String JSON = "json";
	}
	
	class Para{
		public static final String FIELDS = "fields";
		public static final String DATA = "body";
		public static final String PAGE = "page";
		public static final String PAGESIZE = "pagesize";
		public static final int DEFAULTPAGE = 1;
		public static final int DEFAULTPAGESIZE = 10;
		/**
		 * request parameter separator
		 */
		public static final String SEPARATOR = ",";
	}
	
	
}
