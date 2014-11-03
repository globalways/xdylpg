package com.xdylpg.struts.action;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.xdylpg.ORM.Psu;
import com.xdylpg.ORM.UnitImg;
import com.xdylpg.service.impl.PsuServiceImpl;
import com.xdylpg.service.impl.UnitImgServiceImpl;
import com.xdylpg.util.T;


public class PsuAction extends ActionSupport implements ModelDriven<Psu> {

	/** public service unit service*/
	PsuServiceImpl psuService;
	/** 图片管理service*/
	UnitImgServiceImpl unitImgService;
	
	
	/** 文件对象 */
	private List<File> Filedata;
	/** 文件名 */
	private List<String> FiledataFileName;
	/** 文件内容类型 */
	private List<String> FiledataContentType;
	
	private HttpServletRequest  req = ServletActionContext.getRequest();
	
	Psu model;
	public Psu getModel() {
		if(model==null)
			model = new Psu();
		return model;
	}
	

	public void setPsuService(PsuServiceImpl psuService) {
		this.psuService = psuService;
	}

	public String addPsu()
	{
		
			String s = ServletActionContext.getRequest().getParameter("json");
			ActionContext ac=ActionContext.getContext();
			ServletContext sc = (ServletContext) ac.get(ServletActionContext.SERVLET_CONTEXT);
			String realPath = sc.getRealPath("/admin");
			
			JSONArray ja = JSONArray.fromObject(s);
			
			Set<UnitImg> imgSet = this.model.getUnitImgs(); 
		    for( int i = 0 ; i<ja.size();i++)
		    {
		    	JSONObject jo = JSONObject.fromObject(ja.getString(i));
		    	UnitImg temp = new UnitImg();
		    	if(T.isNum(jo.get("imgID").toString()))
		    		temp.setImgnum(Integer.parseInt(jo.get("imgID").toString()));
		    	temp.setImgdisc(jo.get("imgDesc").toString());
		    	temp.setImgpath(jo.get("imgAddr").toString());
		    	temp.setPsu(model);
		    	temp.setRealpath(realPath+"/"+jo.get("imgAddr").toString());
		    	//psuService.saveOrUpdatePsuImg(temp);
		    	imgSet.add(temp);
		     }  
		    
		this.model.setUnitImgs(imgSet);
		if(this.model.getStatus()==null)
			this.model.setStatus(0);
		psuService.saveOrUpdate(getModel());
		this.model = null;
		
		return "toBrowsePsu";
	}
	
	public String browsePsu()
	{
		int pageNo = Integer.parseInt(ServletActionContext.getRequest().getParameter("pageNo"));
		int pageSize = Integer.parseInt(ServletActionContext.getRequest().getParameter("pageSize"));
		int count = psuService.countItems();
		int pageNum = (int)Math.ceil((double)count/pageSize);
		if(pageNo<=0||pageNo>pageNum)
			pageNo=1;
		if(pageSize<=0)
			pageSize=10;
		
		ServletActionContext.getRequest().setAttribute("psuList",psuService.browse(pageNo, pageSize));
		ServletActionContext.getRequest().setAttribute("pageNo",pageNo);
		ServletActionContext.getRequest().setAttribute("count",count);
		ServletActionContext.getRequest().setAttribute("pageSize",pageSize);
		ServletActionContext.getRequest().setAttribute("pageNum",pageNum);
		return SUCCESS;
	}
	public String viewPsu()
	{
		Psu psu = psuService.loadById(model.getUnitnum());
		req.setAttribute("psu",psu);
		return "edit";
	}
	public String invalidatePsu()
	{
		psuService.invalidate(model.getUnitnum());
		return NONE;
	}
	public String delPsu()
	{
System.out.println(model.getUnitnum()+"delPsu");
		psuService.delete(model.getUnitnum());
		return NONE;
	}
	
	public String deleteImg()
	{
		HttpServletRequest req = ServletActionContext.getRequest();
		int imgnum;
		String imgaddr = req.getParameter("imgaddr");
		
		ActionContext ac=ActionContext.getContext();
		ServletContext sc = (ServletContext) ac.get(ServletActionContext.SERVLET_CONTEXT);
		String realPath = sc.getRealPath("/admin");
		//删除文件
		File f = new File(realPath+"/"+imgaddr);
		f.delete();
		
		//删除数据库记录
		if(T.isNum(req.getParameter("imgnum")))
		{
			imgnum = Integer.parseInt(req.getParameter("imgnum"));
			unitImgService.deleteImg(imgnum);
		}
			
		return NONE;
	}
	
	public String uploadImg()
	{
		ActionContext ac=ActionContext.getContext();
		HttpServletRequest request = ServletActionContext.getRequest();
System.out.println(request.getParameter("id"));
//System.out.println(req.getParameter("name"));
		ServletContext sc = (ServletContext) ac
				.get(ServletActionContext.SERVLET_CONTEXT);
		String savePath = sc.getRealPath("/");
		savePath = savePath + "admin/uploads/";
		File f1 = new File(savePath);
		if (!f1.exists()) {
			f1.mkdirs();
		}
		int size = Filedata.size();
		if (size == 0)
			return ERROR;
		String extName = null;
		String name = null;
		for (int i = 0; i < size; i++) {
System.out.println(FiledataContentType.get(i));
			extName = FiledataFileName.get(i).substring(
					FiledataFileName.get(i).lastIndexOf("."));
			name = UUID.randomUUID().toString();
			File file = new File(savePath + name + extName);
			try {
				FileUtils.copyFile(Filedata.get(i), file);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
			response.getWriter().print(basePath+"admin/uploads/"+name + extName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//****************************** web *****************************
	public String home()
	{
		Psu psu = null;
		try {
			psu = psuService.loadById(model.getUnitnum());
		} catch (Exception e) {
			return "error";
		}finally{
			if(psu != null)
				req.setAttribute("psu",psu);
			else return ERROR;
		}
		return SUCCESS;
	}


	public List<File> getFiledata() {
		return Filedata;
	}


	public void setFiledata(List<File> filedata) {
		Filedata = filedata;
	}


	public List<String> getFiledataFileName() {
		return FiledataFileName;
	}


	public void setFiledataFileName(List<String> filedataFileName) {
		FiledataFileName = filedataFileName;
	}


	public List<String> getFiledataContentType() {
		return FiledataContentType;
	}


	public void setFiledataContentType(List<String> filedataContentType) {
		FiledataContentType = filedataContentType;
	}


	public void setUnitImgService(UnitImgServiceImpl unitImgService) {
		this.unitImgService = unitImgService;
	}	



}
