package com.xdylpg.admin;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;


import com.googlecode.jtype.Types;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.xdylpg.ORM.Comconsor;
import com.xdylpg.service.ComConSortService;
import com.xdylpg.util.T;

public class CCSAction extends ActionSupport implements ModelDriven<Comconsor> {
	private static final long serialVersionUID = 1L;
	ComConSortService ccsService;
	Comconsor model = new Comconsor();
	
	
	
	HttpServletRequest req = ServletActionContext.getRequest();
	
	public String execute()
	{
		String action = req.getParameter("action");
		if(action==null)
			action = "";
		switch(action){
		case "add"  : addCCS();return SUCCESS;
		case "list" : listCCS();return "list";
		case "column" : loadAllCCS();return "main";
		default:loadCCS();return SUCCESS;
		}
	}
	
	public String form()
	{
		setContentUrl("gsqy_sort_form.jsp");
		loadSortNav();
		loadSorts(0);
		loadTypes(1);
		req.setAttribute("current_sort", 0);
		return SUCCESS;
	}
	
	public String detail()
	{
		setContentUrl("gsqy_sort.jsp");
		loadSortNav();
		if(model.getSornum() != null&&ccsService.loadCCS(model.getSornum()) != null)
		{
			Comconsor ccs = ccsService.loadCCS(model.getSornum());
			req.setAttribute("ccs", ccs);
			loadSorts(ccs.getFatnum());
			loadTypes(ccs.getSortype());
			req.setAttribute("current_sort", 0);
			return SUCCESS;
		}else return ERROR;
	}
	
	public String save()
	{
		if(ccsService.saveOrUpdateCCS(model))
		{
			return "toBrowseCCS";
		}else return ERROR;
	}
	
	public String browse()
	{
		setContentUrl("gsqy_sortlist.jsp");
		loadSortNav();
		listCCS();
		req.setAttribute("current_sort", 0);
		return SUCCESS;
	}
	
	public String delete()
	{
		if(ccsService.deleteCCS(model.getSornum()))
		{
			return "toBrowseCCS";
		}else return ERROR;
	}
	
	
	
	
	
	
	
	
	/**
	 * set content url for gsqy_main.jsp
	 * @param url
	 */
	private void setContentUrl(String url)
	{
		req.setAttribute("url", url);
	}
	private void loadSortNav()
	{
		loadAllCCS();
	}
	
	
	
	private void addCCS() {
		ccsService.saveOrUpdateCCS(model);
		
	}
	
	private void loadCCS()
	{
		String para = req.getParameter("sort");
		int sornum;
		if(T.isNum(para))
		{
			sornum = Integer.parseInt(para);
			Comconsor ccs = ccsService.loadCCS(sornum);
			loadSorts(ccs.getFatnum());
			loadTypes(ccs.getSortype());
			req.setAttribute("ccs", ccs);
		}else{
			loadSorts(0);
			loadTypes(1);
		}
	}
	
	/**
	 * load all ccs from db;
	 * put a map into requet;
	 */
	public  void loadAllCCS()
	{
		// session 中分类列表Map 是否更新。
		if(true){
			Map<Comconsor,Set<Comconsor>> allCCSMap = new TreeMap<Comconsor,Set<Comconsor>>();
			List<Comconsor> tempCCS =  ccsService.listParents();
			Collections.sort(tempCCS);
			
			Iterator<Comconsor> i = tempCCS.iterator();
			while(i.hasNext())
			{
				Comconsor temp = i.next();
				List<Comconsor> childList = ccsService.listChildCCS(temp);
				Iterator<Comconsor> childI = childList.iterator();
				
				Set<Comconsor> tempSet = new TreeSet<Comconsor>();
				while(childI.hasNext())
				{
					tempSet.add(childI.next());
				}
				allCCSMap.put(temp, tempSet);
			}
			req.getSession().setAttribute("allCCSMap", allCCSMap);
		}

	}
	
	/**
	 * list comconsors; 
	 * return html str 'sortList'
	 */
	private void listCCS()
	{
		StringBuilder sortList = new StringBuilder();
		List<Comconsor> tempCCS =  ccsService.listParents();
		if(tempCCS.size() == 0)
		{
			sortList.append("");
req.setAttribute("sortList",sortList.toString());
			return;
		}
		Collections.sort(tempCCS);
		Iterator<Comconsor> i = tempCCS.iterator();
		while(i.hasNext())
		{
			Comconsor temp = i.next();
			sortList.append(CCSListHtml(temp));
			List<Comconsor> childList = ccsService.listChildCCS(temp);
			Iterator<Comconsor> childI = childList.iterator();
			while(childI.hasNext())
			{
				Comconsor temp2 = childI.next();
				sortList.append(CCSListHtml(temp2));
			}
			
		}
		req.setAttribute("sortList",sortList.toString());
	}
	
	/**
	 * make html str per comconsor for gsqy_SortList.jsp
	 * @param c
	 * @return html str
	 */
	private String CCSListHtml(Comconsor c)
	{
		StringBuilder s = new StringBuilder();
		s.append("<tr><td>"+c.getSornum()+"</td><td>");
		if(c.getFatnum() != 0)
			s.append("┃┝ "+c.getSorname()+"</td><td>");
		else s.append(c.getSorname()+"</td><td>");
		s.append(getTypeName(c.getSortype())+"</td><td>");
		s.append(c.getSorsta()+"</td><td>");
		s.append(c.getSorord()+"</td><td>");
		s.append("<a class='btn' href='com-ccs-detail?sornum="+c.getSornum()+"'><i class='icon-pencil'></i> 编辑</a> ");
        s.append("<a class='btn' data-toggle='modal' href='com-ccs-delete?sornum="+c.getSornum()+"'><i class='icon-trash' ></i> 删除</a> ");
        s.append("<button class='btn'><i class='icon-ban-circle'></i> 停用</button></td></tr>");
        
        return s.toString();
	}
	
	
	/** load all sorts,and change into html string;<br>
	 * selected sort decides by parameter;
	 * @param selectedid father id */
	public void loadSorts(int selectedid)
	{
		StringBuilder sortOptions = new StringBuilder();
		List<Comconsor> tempCCS =  ccsService.listParents();
		Iterator<Comconsor> i = tempCCS.iterator();
		sortOptions.append("<option value='0'>顶级分类</option>");
		while(i.hasNext())
		{
			Comconsor temp = i.next();
			if(temp.getSornum() == selectedid) sortOptions.append("<option value='"+temp.getSornum()+"' selected='selected'>"+temp.getSorname()+"</option>");
			else sortOptions.append("<option value='"+temp.getSornum()+"'>"+temp.getSorname()+"</option>");
			List<Comconsor> childList = ccsService.listChildCCS(temp);
			Iterator<Comconsor> childI = childList.iterator();
			while(childI.hasNext())
			{
				Comconsor temp2 = childI.next();
				if(temp2.getSornum() == selectedid) sortOptions.append("<option value='"+temp2.getSornum()+"' selected='selected'>┃┝"+temp2.getSorname()+"</option>");
				else sortOptions.append("<option value='"+temp2.getSornum()+"'>┃┝"+temp2.getSorname()+"</option>");
			}
			
		}
		req.setAttribute("sortOptions",sortOptions.toString());
	}
	
	/** load types 
	 * @param ct 
	 * 		  current type*/
	public void loadTypes(int ct)
	{
		String sortTypes = "单篇,文章,产品,下载,招聘,相册,链接";
		String[] types = sortTypes.split(",");
		StringBuilder typesStr = new StringBuilder();
		for (int i=0;i<types.length;i++)
			if(ct == i+1)
				typesStr.append( "<option value='"+(i+1)+"' selected='selected'>"+types[i]+"</option>");
			else typesStr.append( "<option value='"+(i+1)+"'>"+types[i]+"</option>");
		ServletActionContext.getRequest().setAttribute("sortTypes",typesStr.toString());
	}
	
	/**
	 * get type name by type number
	 * @param Integer type number
	 * @return String type name
	 */
	private String getTypeName(int type)
	{
		String name = new String();
		String sortTypes = "单篇,文章,产品,下载,招聘,相册,链接";
		String[] types = sortTypes.split(",");
		for (int i=0;i<types.length;i++)
			if(type == i+1)
			{
				name = types[i];
				break;
			}
		return name;
	}
	
	
	public void setCcsService(ComConSortService ccsService) {
		this.ccsService = ccsService;
	}

	public ComConSortService getCcsService() {
		return ccsService;
	}

	@Override
	public Comconsor getModel() {
		return model;
	}

	public void setModel(Comconsor model) {
		this.model = model;
	}
}
