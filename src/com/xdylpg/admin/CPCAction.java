package com.xdylpg.admin;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.xdylpg.ORM.CBInfo;
import com.xdylpg.ORM.Comconsor;
import com.xdylpg.ORM.Cpcontent;
import com.xdylpg.service.CPContentService;
import com.xdylpg.service.ShopService;
import com.xdylpg.service.impl.CBInfoServiceImpl;
import com.xdylpg.util.T;

public class CPCAction extends ActionSupport implements ModelDriven<Cpcontent> {

	private static final long serialVersionUID = 1863730544889123084L;
	HttpServletRequest req = ServletActionContext.getRequest();
	CPContentService service;
	ShopService s;  // cbinfoservice
	CCSAction ccs;
	Cpcontent model;
	private String actionMSG = null;
	int browseSort = 0;
	
	public Cpcontent getModel() {
		if(model == null)
			model = new Cpcontent();
		return model;
	}
	
	/**
	 * the index of company content management<br>
	 * @return
	 */
	public String index()
	{
		String comnumStr = req.getParameter("comnum");
		int comnum;
		if(T.isNum(comnumStr))
		{
			comnum = Integer.parseInt(comnumStr);
			Object o = s.loadById(comnum);
			if(o == null) 
			{
				actionMSG = "没有该公司";
				return ERROR;
			}
			else req.getSession().setAttribute("admin_currentCom", o);
		}
		else
		{
			actionMSG = "不合法的参数值!";
			return ERROR;
		}
		loadSortNav();
		req.setAttribute("current_sort", -1);
		return SUCCESS;
	}
	
	public String save()
	{
/*		String path = req.getSession().getServletContext().getRealPath("/");
		String file;
		if(model.getContnum() == null)
			file = UUID.randomUUID().toString();
		else file = model.*/
		model.setAddtime(new Date().getTime());
/*		File f = new File(path+file);
		try {
			FileWriter fw = new FileWriter(f);
			fw.write(model.getContent());
			fw.close();
			model.setContent(path+file);
		} catch (IOException e) {
			e.printStackTrace();
		}*/
		if(model.getConsta() == null)
			model.setConsta(0);
		if(service.saveOrUpdateCPC(model))
		{
			setBrowseSort(model.getComconsor().getSornum());
			return "toBrowseCPC";
		}else return ERROR;
	}
	
	public String form()
	{
		CBInfo currentCom = (CBInfo)req.getSession().getAttribute("admin_currentCom");
		if(currentCom == null)
		{
			actionMSG = "No company found!";
			return ERROR;
		}
		setContentUrl("gsqy_cpc_form.jsp");
		loadSortNav();
		if(model.getComconsor() != null)
		{
			ccs.loadSorts(model.getComconsor().getSornum());
		}
		else
		{
			ccs.loadSorts(0);
		}
		req.setAttribute("current_sort", 0);//当前显示类别 
		return SUCCESS;
	}
	public String detail()
	{
		setContentUrl("gsqy_cpc_detail.jsp");
		loadSortNav();
		Cpcontent cpc = null;
		if(model.getContnum() != null)
		{
			cpc = service.loadCPC(model.getContnum());
			if(cpc != null)
			{
				ccs.loadSorts(cpc.getComconsor().getSornum());
				req.setAttribute("cpc", cpc);
				req.setAttribute("current_sort", 0);//当前显示类别
				return SUCCESS;
			}else
			return ERROR;
		}
		else return ERROR;
	}
	public String browse()
	{
		setContentUrl("gsqy_cpclist.jsp");
		loadSortNav();
		try {
			browseCPC();
		} catch (Exception e) {
			actionMSG = "获取列表错误@CPCAction : 146";
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String delete()
	{
		if(service.deleteCPC(model.getContnum()))
		{
			setBrowseSort(model.getComconsor().getSornum());
			return "toBrowseCPC";
		}else return ERROR;
	}
	
	
	private void loadSortNav()
	{
		ccs.loadAllCCS();
	}
	
	/**
	 * set content url for gsqy_main.jsp
	 * @param url
	 */
	private void setContentUrl(String url)
	{
		req.setAttribute("url", url);
	}
	
	private void browseCPC()
	{
		String sortStr = req.getParameter("sort");
		String pageNoStr = req.getParameter("pageNo");
		String pageSizeStr = req.getParameter("pageSize");
		
		
		
		CBInfo currentCom = (CBInfo)req.getSession().getAttribute("admin_currentCom");
		if(currentCom == null)
			actionMSG = "no company found!";
		int pageNO=1;
		int pageSize=10;
		
		if(T.isNum(sortStr))
			browseSort = Integer.parseInt(sortStr);
		if(T.isNum(pageNoStr))
			pageNO = Integer.parseInt(pageNoStr);
		if(T.isNum(pageSizeStr))
			pageSize = Integer.parseInt(pageSizeStr);
		
		 Comconsor current_sort = ccs.ccsService.loadCCS(browseSort);
		List<Cpcontent> temp = service.browseCPCWithTypePage(browseSort,currentCom.getComnum(), pageNO, pageSize);
req.setAttribute("cpcList", temp);
req.setAttribute("current_sort", current_sort.getSornum());
req.setAttribute("current_sortName", current_sort.getSorname());
	}
	private void browseCPC(int sort)
	{
		CBInfo currentCom = (CBInfo)req.getSession().getAttribute("com");
		List<Cpcontent> temp = service.browseCPCWithType(sort,currentCom.getComnum());
		req.setAttribute("cpcList", temp);
		req.setAttribute("url", "gsqy_cpclist.jsp");
	}
	
	//------------------- ueditor ---------------------------------------------
	public String delimg()
	{
		boolean isSuccess = true;
		JSONArray ja = JSONArray.fromObject(req.getParameter("img"));
		String realPath = req.getServletContext().getRealPath("/");
		for(int i=0;i<ja.size();i++)
		{
			String file = ja.getString(i).split("/xdylpg/")[1];
			File temp = new File(realPath+file);
			isSuccess = temp.delete()&&isSuccess;
			if(temp.getParentFile().listFiles().length == 0)
				temp.getParentFile().delete();
			
		}
		if(!isSuccess)
		{
			
			actionMSG = "删除错误，请联系技术人员";
			return ERROR;
		}
		return NONE;
	}
	
	//---------------------------- web infos methods -------------------------
	
	/**
	 * 轮播图片处理
	 * @return
	 */
	public String carousel()
	{
		if(getCom() == null)
		{
			actionMSG = "没有公司";
			return ERROR;
		}
		String saveStr = req.getParameter("save");//获取轮播图片参数
		if(saveStr != null && !saveStr.equals(""))
		{
			CBInfo currentCom = (CBInfo)req.getSession().getAttribute("admin_currentCom");
			currentCom.setCarousel(saveStr);
			s.saveOrUpdate(currentCom);
			req.getSession().setAttribute("admin_currentCom", currentCom);
			return "carousel";
		}else{
			loadSortNav();
			req.setAttribute("current_sort", -2);
			setContentUrl("gsqy_carousel.jsp");
			return SUCCESS;
		}
	}
	/**
	 * 删除一张图片 删除文件
	 * @return String
	 */
	public String delcar()
	{
		return "carousel";
	}
	
	/**
	 * 获取CBInfo
	 * @return
	 */
	private CBInfo getCom()
	{
		return (CBInfo)req.getSession().getAttribute("admin_currentCom");
	}
	
	
	public CPContentService getService() {
		return service;
	}
	public void setService(CPContentService service) {
		this.service = service;
	}
	public CCSAction getCcs() {
		return ccs;
	}
	public void setCcs(CCSAction ccs) {
		this.ccs = ccs;
	}
	public int getBrowseSort() {
		return browseSort;
	}
	public void setBrowseSort(int browseSort) {
		this.browseSort = browseSort;
	}
	public void setS(ShopService s) {
		this.s = s;
	}

	public String getActionMSG() {
		return actionMSG;
	}

	public void setActionMSG(String actionMSG) {
		this.actionMSG = actionMSG;
	}
	
/*	public static void main(String args[])
	{
		File f = new File("A:/Workspaces/MyEclipse10/xdylpg/WebRoot/admin/ueditor/jsp/211139261/upload1/20140417/35751397737879194.jpg");
		f.delete();
System.out.println(f.getParentFile().listFiles().length);
	}
*/
}
