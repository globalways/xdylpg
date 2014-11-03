package com.xdylpg.struts.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.lowagie.text.List;
import com.opensymphony.xwork2.ActionSupport;
import com.xdylpg.ORM.Category;
import com.xdylpg.ORM.Item;
import com.xdylpg.service.CategoryService;
import com.xdylpg.service.ShopService;
import com.xdylpg.service.SiteService;
import com.xdylpg.service.impl.PsuServiceImpl;

public class SiteAction extends ActionSupport {

	private static final long serialVersionUID = 389236583426138959L;
	private String actionMSG = "no messages!";
	SiteService siteService;
	CategoryService categoryService;
	
	
	
	private HttpServletRequest req = ServletActionContext.getRequest();
	
	public String execute()
	{
		//do something
		return SUCCESS;
		
	}
	
	public String list()
	{
		
		loadAllCategoryAsMap();
		
		int type;
		int p = 1;
		int ps = 10;
		
		ArrayList<Item> list = null;
		try {
			type = req.getParameter("type")==null?0:Integer.parseInt(req.getParameter("type"));
			p = req.getParameter("p")==null?1:Integer.parseInt(req.getParameter("p"));
			ps = req.getParameter("ps")==null?10:Integer.parseInt(req.getParameter("ps"));
		} catch (NumberFormatException e) {
			actionMSG = "Wrong Parameter!@SiteAction";
			return ERROR;
		}finally{
			if(ps<1)
			{
				actionMSG = "Wrong page size! @SiteAction 58";
				return ERROR;
			}
		}
		
		// try to get list from session
		//if(req.getSession().getAttribute("itemList") != null)
		//{
		//	list = (ArrayList<Item>)req.getSession().getAttribute("itemList");
		//}else{
			list = siteService.loadAllItems(type);
		//}
			
			
		int maxPage = 1;
		if(list.size() != 0)
		{
			maxPage = (int) Math.ceil((double)list.size()/ps);
			if( p<1 || p>maxPage)
			{
				actionMSG = "Wrong page number!@SiteAction";
				return ERROR;
			}
		}
req.getSession().setAttribute("itemList",list);			
req.setAttribute("p", p); // current page 
req.setAttribute("ps", ps); //page size
		return SUCCESS;
	}
	
	/**
	 *分类列表
	 */
	public void loadAllCategoryAsMap()
	{
			TreeMap<Category, TreeMap<Category, ArrayList<Category>>> map = categoryService.loadAllCategoryAsMap();
			req.getSession().setAttribute("CategorysMap", map);
	}
	
	
	
	//----------------------------- seter & geter -----------------------------------------

	public SiteService getSiteService() {
		return siteService;
	}

	public void setSiteService(SiteService siteService) {
		this.siteService = siteService;
	}

	public String getActionMSG() {
		return actionMSG;
	}

	public void setActionMSG(String actionMSG) {
		this.actionMSG = actionMSG;
	}

	public CategoryService getCategoryService() {
		return categoryService;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
}
