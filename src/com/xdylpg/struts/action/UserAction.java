package com.xdylpg.struts.action;

import java.util.Date;
import java.util.Iterator;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.xdylpg.ORM.BusAdmin;
import com.xdylpg.ORM.CBInfo;
import com.xdylpg.ORM.Category;
import com.xdylpg.ORM.Item;
import com.xdylpg.admin.CategoryAction;
import com.xdylpg.util.mail.MailSenderInfo;
import com.xdylpg.util.mail.SimpleMailSender;

public class UserAction extends ActionSupport {
	
	private HttpServletRequest req = ServletActionContext.getRequest();
	
	/**
	 * 分类ID
	 */
	int cid;
	/**
	 * 商铺ID
	 */
	int bid;
	
	
	public String home()
	{
		return "home";
	}
	
	public String app()
	{
		BusAdmin admin = (BusAdmin)req.getSession().getAttribute("admin");
		Object o = admin.getObj();
		Item Iobj = (Item)o;
		req.setAttribute("url",Iobj.getCategory().getBctem());
		req.setAttribute("busObj",o);
		return "app";
	}
	
	public String profile()
	{
		return "profile";
	}

	public String update()
	{
		
		elevatedprivileges();
		req.setAttribute("chain", true);
		return "toUpdateBusAdmin";
	}
	
	public String shop_addShop()
	{
		return "shopsave";
	}
	public String cbInfo_addCBInfo()
	{
		return "cbinfosave";
	}
	
	public String reset()
	{
		String mail = req.getParameter("mail");
		String verify_code = req.getParameter("verify");

		if ( mail.equals(null) && verify_code.equals(null)) {
			return "toGetInfoPage";
		}
//		generate verify code & send email
		else if ( !mail.equals(null) && verify_code.equals(null)) {
			MailSenderInfo mailInfo = new MailSenderInfo();   
		     mailInfo.setMailServerHost("smtp.qq.com");   
		     mailInfo.setMailServerPort("25");   
		     mailInfo.setValidate(true);   
		     mailInfo.setToAddress(mail);
		     
		     String regid = UUID.randomUUID().toString().replaceAll("-","");
		     String content = "<html><head>mail</head>" +
			      		"<body>" +
			     		 "<font size='15' color='red'>http://localhost:8080/mailback?id="+regid+"&email="+mailInfo.getToAddress()+new Date().toLocaleString()+"</font></body></html>";
			     mailInfo.setContent("<h1>dsfsdfsd</h1>"); 
		     mailInfo.setSubject("fsdfsdf");   
		     mailInfo.setContent(content);   
		     SimpleMailSender sms = new SimpleMailSender();  
		        // sms.sendTextMail(mailInfo);ʽ   
		         sms.sendHtmlMail(mailInfo);
		         
			return "toMailSuccess";
		}
		else if ( mail.equals(null) && !verify_code.equals(null)) { 
			return "toResetPw";
		}
		else{
			return "NONE";
		}
		
	}
	
	/**
	 * 提升权限
	 */
	private void elevatedprivileges()
	{
		BusAdmin admin = (BusAdmin)req.getSession().getAttribute("admin");
		admin.getAuth().setAuthnum(2);
		req.getSession().setAttribute("admin", admin);
	}
	
	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}
}
