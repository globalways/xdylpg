package com.xdylpg.struts.action;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Uploader extends ActionSupport {
	
	private static final long serialVersionUID = 8926877150056328150L;
	/** 文件对象 */
	private List<File> Filedata;
	/** 文件名 */
	private List<String> FiledataFileName;
	/** 文件内容类型 */
	private List<String> FiledataContentType;
	
	ActionContext ac=ActionContext.getContext();
	HttpServletRequest request = ServletActionContext.getRequest();
	ServletContext sc = (ServletContext) ac.get(ServletActionContext.SERVLET_CONTEXT);
	String savePath = sc.getRealPath("/");
	HttpServletResponse response = ServletActionContext.getResponse();
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	/**
	 * 产品图片
	 * @return
	 */
	public String pro()
	{
		uploads("ul/u/some_id/pro/");
		
		return NONE;
	}
	
	/**
	 * logo&icon
	 * @return
	 */
	public String li()
	{
		uploads("ul/u/some_id/li/");
		return NONE;
	}
	/**
	 * 轮播图片
	 * @return
	 */
	public String carousel()
	{
		uploads("ul/u/some_id/carousel");
		return NONE;
	}
	
	
	
	
	
	
	
	/**
	 * 上传公共方法
	 * @param relativePath
	 * @param id
	 * @return
	 */
	public String uploads(String relativePath )
	{
			String id = ServletActionContext.getRequest().getParameter("id");
			relativePath = relativePath.replaceAll("some_id", id);
			savePath = savePath + relativePath;
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
			try {
				response.getWriter().print(basePath+relativePath+name + extName);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return NONE;
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
}
