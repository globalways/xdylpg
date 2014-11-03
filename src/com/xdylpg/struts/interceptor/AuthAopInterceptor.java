package com.xdylpg.struts.interceptor;

import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.aspectj.lang.JoinPoint;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.xdylpg.ORM.BusAdmin;

/** session过期、登录有效性及操作的权限验证拦截器 */
public class AuthAopInterceptor{

	public void auth(){
		
		Map<String,Object>  session = (Map<String,Object>)ActionContext.getContext().getSession();
		
		BusAdmin admin = (BusAdmin)session.get("admin"); 
		System.out.println("  ------------------------auth before--------");
		System.out.println(admin == null ? "no admin ": admin.getAuth().getAdname());
	}
}