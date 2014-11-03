package com.xdylpg.struts.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.xdylpg.ORM.Advice;
import com.xdylpg.service.FbService;
import com.xdylpg.util.T;

public class FeedbackAction extends ActionSupport implements ModelDriven<Advice>{

	FbService fbService;
	Advice model;
	
	HttpServletRequest  req = ServletActionContext.getRequest();
	public String save()
	{
		if (fbService.save(model)) {
			return NONE;
		}else{
			return ERROR;
		}
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
			
		ArrayList<Advice> list = new ArrayList<Advice>(fbService.list(p, ps));
req.setAttribute("fblist", list);
req.setAttribute("p", p);
req.setAttribute("ps", ps);
req.setAttribute("pn", (int) Math.ceil((double)list.size()/ps));
		return SUCCESS;
	}
	
	public String del()
	{
		if(fbService.del(model.getAdvnum()))
			return "list";
		else return ERROR;
	}
	
	
	
	
	public Advice getModel() {
		if(model == null)
			 model = new Advice();
		return model;
	}


	public FbService getFbService() {
		return fbService;
	}


	public void setFbService(FbService fbService) {
		this.fbService = fbService;
	}
	
}
