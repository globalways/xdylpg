package com.xdylpg.struts.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.xdylpg.ORM.Advice;
import com.xdylpg.ORM.Application;
import com.xdylpg.service.AplctService;
import com.xdylpg.util.T;

public class AplctAction extends ActionSupport implements ModelDriven<Application> {

	Application model;
	AplctService aplctService;
	
	HttpServletRequest  req = ServletActionContext.getRequest();
	public String save()
	{
		if(aplctService.save(model))
			return NONE;
		else return ERROR;
	}
	
	public String list()
	{
		String pStr = req.getParameter("p");
		String psStr = req.getParameter("ps");
		int p = 1;
		int ps = 10;
		
		
		if(T.isNum(pStr))
			p = Integer.parseInt(pStr);
		if(T.isNum(psStr))
			ps = Integer.parseInt(psStr);
			
		ArrayList<Application> list = new ArrayList<Application>(aplctService.list(p, ps));
req.setAttribute("list", list);
req.setAttribute("p", p);
req.setAttribute("ps", ps);
req.setAttribute("pn", (int) Math.ceil((double)list.size()/ps));
		return SUCCESS;
	}
	
	public String del()
	{
		if(aplctService.del(model.getAppnum()))
			return "list";
		else return ERROR;
	}
	
	public String handle()
	{
		model.setIshandle(1);
		if(aplctService.save(model))
			return "list";
		else return ERROR;
	}
	
	
	
	public Application getModel() {
		if(model == null)
			model = new Application();
		return model;
	}




	public AplctService getAplctService() {
		return aplctService;
	}




	public void setAplctService(AplctService aplctService) {
		this.aplctService = aplctService;
	}

}
