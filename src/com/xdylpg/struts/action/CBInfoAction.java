package com.xdylpg.struts.action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.xdylpg.ORM.BusAdmin;
import com.xdylpg.ORM.CBInfo;
import com.xdylpg.ORM.Comconsor;
import com.xdylpg.ORM.Cpcontent;
import com.xdylpg.service.BusAdminService;
import com.xdylpg.service.CPContentService;
import com.xdylpg.service.ComConSortService;
import com.xdylpg.service.ShopService;
import com.xdylpg.util.T;

public class CBInfoAction extends ActionSupport implements ModelDriven<CBInfo> {

	private static final long serialVersionUID = 1L;
	private CBInfo model;
	ShopService cbInfoService;
	ComConSortService ccsService;
	CPContentService service;
	
	BusAdminService busAdminService;
	
	private String actionMSG;
	
	
	private HttpServletRequest req = ServletActionContext.getRequest();
	public CBInfo getModel() {
		if(model==null)
			model = new CBInfo();
		return model;
	}
	public String addCBInfo()
	{
		cbInfoService.saveOrUpdate(getModel());
		this.model = null;
		// If "admin" is a user, return the user handle page.
		BusAdmin admin = (BusAdmin)req.getSession().getAttribute("admin");
		if(admin.getAuth().getAuthnum().equals(1))
		{
			req.getSession().setAttribute("admin",busAdminService.loadBusAdmin(admin.getBusadmnum()));
			return "toUserApp";
		}
		return "toBrowseCBInfo";
	}
	
	public String browseCBInfo()
	{
		int pageNo = Integer.parseInt(ServletActionContext.getRequest().getParameter("pageNo"));
		int pageSize = Integer.parseInt(ServletActionContext.getRequest().getParameter("pageSize"));
		int count = cbInfoService.countItems();
		int pageNum = (int)Math.ceil((double)count/pageSize);
		if(pageNo<=0||pageNo>pageNum)
			pageNo=1;
		if(pageSize<=0)
			pageSize=10;
		
		ServletActionContext.getRequest().setAttribute("cbInfoList",cbInfoService.browse(pageNo, pageSize));
		ServletActionContext.getRequest().setAttribute("pageNo",pageNo);
		ServletActionContext.getRequest().setAttribute("count",count);
		ServletActionContext.getRequest().setAttribute("pageSize",pageSize);
		ServletActionContext.getRequest().setAttribute("pageNum",pageNum);
		return SUCCESS;
	}
	
	public String viewCBInfo()
	{
		cbInfoService.loadById(model.getComnum());
		return SUCCESS;
	}
	public String invalidateCBInfo()
	{
		//System.out.println("shop_invalidateShop==============="+model.getShopnum());
		cbInfoService.invalidate(model.getComnum());
		return "toBrowseShop";
	}
	public String delCBInfo()
	{
		cbInfoService.delete(model.getComnum());
		return "toBrowseCBInfo";
	}
	public ShopService getCbInfoService() {
		return cbInfoService;
	}
	public void setCbInfoService(ShopService cbInfoService) {
		this.cbInfoService = cbInfoService;
	}

	//------------------------------ web -------------------------------------------
	
	public void setCcsService(ComConSortService ccsService) {
		this.ccsService = ccsService;
	}
	public void setService(CPContentService service) {
		this.service = service;
	}
	public String home()
	{
		CBInfo com = null;
		try {
			com = (CBInfo)cbInfoService.loadById(model.getComnum());
		} catch (Exception e) {
			return ERROR;
		}finally{
			if(com != null)
			{
				//current company
				req.getSession().setAttribute("com", com);
				loadNav();
			}
			else return ERROR;
				
		}
		return "home";
	}
	
	public String s()
	{
		int sortnum;
		Comparator<Cpcontent> comparator = new Comparator<Cpcontent>() {
			
			public int compare(Cpcontent o1, Cpcontent o2) {
				if(o1.getAddtime() <= o2.getAddtime())
					return 1;
				else return -1;
			}
		};
		List<Cpcontent> cpclist = new ArrayList<Cpcontent>();
		CBInfo com = (CBInfo)req.getSession().getAttribute("com");
		if(com == null)
		{
			actionMSG = "Unknown Company!";
			return ERROR;
		}
			
		String sortStr = req.getParameter("sort");
		if(T.isNum(sortStr))
			sortnum = Integer.parseInt(sortStr);
		else return ERROR;
		
		Comconsor parentsSort;
		Comconsor childSort = null;
		List<Comconsor> childSortList = null;
		Comconsor sort = ccsService.loadCCS(sortnum);
		if(sort == null)
			return ERROR;
		if(sort.getSortype().equals(1)) // 单篇
		{
			try {
				int tempsort = ccsService.listChildCCS(sortnum).get(0).getSornum();
				Cpcontent cpc = service.browseCPCWithType(tempsort,com.getComnum()).get(0);
				String template = cpc.getComconsor().getContem();
				loadNav();
req.setAttribute("cpc", cpc);
req.setAttribute("template", template);
				return SUCCESS;
			} catch (Exception e) {
				loadNav();
				req.setAttribute("template", null);
				return SUCCESS;
			}
		}
		
		if(sort.getFatnum() != 0)
		{
			childSort = sort;
			parentsSort = ccsService.loadCCS(sort.getFatnum());
			childSortList = ccsService.listChildCCS(parentsSort);
			cpclist = service.browseCPCWithTypePage(sortnum, com.getComnum(), 1, 10);
		}
		else
		{
			 parentsSort = sort;
			 childSortList = ccsService.listChildCCS(sort);
			 for(Comconsor c : childSortList)
			 {
				 cpclist.addAll(service.browseCPCWithTypePage(c.getSornum(), com.getComnum(), 1, 10));
			 }
		}
		
		loadNav();
		Collections.sort(cpclist, comparator);
		Collections.sort(childSortList);
		req.setAttribute("childSort", childSort);
		req.setAttribute("parentsSort", parentsSort);
		req.setAttribute("cpclist", cpclist);
		req.setAttribute("template", sort.getSortem());
		req.setAttribute("childSortList", childSortList);
		
		return SUCCESS;
	}
	public String c()
	{
		int cnum;
		String cnumStr = req.getParameter("cnum");
		if(T.isNum(cnumStr))
			cnum = Integer.parseInt(cnumStr);
		else{
			actionMSG = "No such content!";
			return ERROR;
		}
		
		
		Cpcontent cpc = service.loadCPC(cnum); // company page content
		Comconsor parentsSort = ccsService.loadCCS(cpc.getComconsor().getFatnum());
		List<Comconsor> childSortList = ccsService.listChildCCS(parentsSort);
		String template = cpc.getComconsor().getContem();
		loadNav();
		req.setAttribute("parentsSort", parentsSort);
		req.setAttribute("cpc", cpc);
		req.setAttribute("template", template);
		req.setAttribute("childSortList", childSortList);
		return SUCCESS;
	}
	
	private void loadNav()
	{
		List<Comconsor> ccsParentsList = ccsService.listParents();
		Collections.sort(ccsParentsList);
		req.setAttribute("ccsParentsList", ccsParentsList);
	}
	public String getActionMSG() {
		return actionMSG;
	}
	public void setActionMSG(String actionMSG) {
		this.actionMSG = actionMSG;
	}
	public void setBusAdminService(BusAdminService busAdminService) {
		this.busAdminService = busAdminService;
	}

}
