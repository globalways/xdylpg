package com.xdylpg.struts.action;

import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.xdylpg.ORM.BusAdmin;
import com.xdylpg.ORM.Shop;
import com.xdylpg.ORM.Shoppro;
import com.xdylpg.ORM.UnitImg;
import com.xdylpg.service.BusAdminService;
import com.xdylpg.service.ProService;
import com.xdylpg.service.ShopService;
import com.xdylpg.service.impl.BusAdminServiceImpl;
import com.xdylpg.util.T;

public class ShopAction extends ActionSupport implements ModelDriven<Shop> {


	private static final long serialVersionUID = 1L;
	
	private Shop model;
	ShopService shopService;
	ProService proService;
	
	BusAdminService busAdminService;
	
	private HttpServletRequest req = ServletActionContext.getRequest();
	
	public Shop getModel() {
		if(model == null)
			 model = new Shop();
		return model;
	}
	
	public String addShop()
	{
		String s = ServletActionContext.getRequest().getParameter("proData");
		ActionContext ac=ActionContext.getContext();
		ServletContext sc = (ServletContext) ac.get(ServletActionContext.SERVLET_CONTEXT);
		String realPath = sc.getRealPath("/admin");
		
		JSONArray ja = JSONArray.fromObject(s);
		
		Set<Shoppro> proSet = this.model.getShoppros(); 
	    for( int i = 0 ; i<ja.size();i++)
	    {
	    	JSONObject jo = JSONObject.fromObject(ja.getString(i));
	    	Shoppro temp = new Shoppro();
	    	if(T.isNum(jo.get("proNum").toString()))
	    		temp.setPronum(Integer.parseInt(jo.get("proNum").toString()));
	    	temp.setProname(jo.get("proName").toString());
	    	temp.setProimg(jo.get("proImgAddr").toString());
	 
	    	temp.setPropri(jo.getString("proPri"));
	    	temp.setPronewpri(jo.getString("proNewPri"));
	    	temp.setProintr(jo.getString("proDesc"));
	    	temp.setProorder(Integer.parseInt(jo.getString("proOrder")));
	    	temp.setShop(model);
	    	//temp.setRealpath(realPath+"/"+jo.get("imgAddr").toString());
	    	//psuService.saveOrUpdatePsuImg(temp);
//System.out.println(temp.getProimg());
	    	proSet.add(temp);
	     } 
		
	    this.model.setShoppros(proSet);
		shopService.saveOrUpdate(getModel());
		
		this.model = null;
		
		// If "admin" is a user, return the user handle page.
		BusAdmin admin = (BusAdmin)req.getSession().getAttribute("admin");
		if(admin.getAuth().getAuthnum().equals(1))
		{
			req.getSession().setAttribute("admin",busAdminService.loadBusAdmin(admin.getBusadmnum()));
			return "toUserApp";
		}
			
		return "toBrowseShop";
	}
	public String browseShop()
	{
		int pageNo = Integer.parseInt(ServletActionContext.getRequest().getParameter("pageNo"));
		int pageSize = Integer.parseInt(ServletActionContext.getRequest().getParameter("pageSize"));
		int count = shopService.countItems();
		int pageNum = (int)Math.ceil((double)count/pageSize);
		if(pageNo<=0||pageNo>pageNum)
			pageNo=1;
		if(pageSize<=0)
			pageSize=10;
		
		ServletActionContext.getRequest().setAttribute("shopList",shopService.browse(pageNo, pageSize));
		ServletActionContext.getRequest().setAttribute("pageNo",pageNo);
		ServletActionContext.getRequest().setAttribute("count",count);
		ServletActionContext.getRequest().setAttribute("pageSize",pageSize);
		ServletActionContext.getRequest().setAttribute("pageNum",pageNum);
		return SUCCESS;
	}
	public String viewShop()
	{
		shopService.loadById(model.getShopnum());
		return SUCCESS;
	}
	public String invalidateShop()
	{
		shopService.invalidate(model.getShopnum());
		return "toBrowseShop";
	}
	public String delShop()
	{
		int shopNum = Integer.parseInt(ServletActionContext.getRequest().getParameter("shopNum"));
		shopService.delete(shopNum);
		return "toBrowseShop";
	}
	
	public String delPro()
	{
		HttpServletRequest req = ServletActionContext.getRequest();
		if(T.isNum(req.getParameter("pronum")))
			proService.delPro(Integer.parseInt(req.getParameter("pronum")));
		return NONE;
	}
	
	//-----------------------------  web---------------------------------
	public String home()
	{
		Shop shop = null;
		try {
			shop = (Shop)shopService.loadById(model.getShopnum());
		} catch (Exception e) {
			return ERROR;
		}finally{
			if(shop != null)
				req.setAttribute("shop", shop);
			else return ERROR;
				
		}
		return SUCCESS;
	}
	
	
	public ShopService getShopService() {
		return shopService;
	}

	public void setShopService(ShopService shopService) {
		this.shopService = shopService;
	}

	public void setProService(ProService proService) {
		this.proService = proService;
	}

	public void setBusAdminService(BusAdminService busAdminService) {
		this.busAdminService = busAdminService;
	}
	

}
