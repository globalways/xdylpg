package com.xdylpg.struts.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.xdylpg.ORM.BusAdmin;
import com.xdylpg.ORM.Vcode;
import com.xdylpg.res.S;
import com.xdylpg.service.BusAdminService;
import com.xdylpg.service.VcodeService;
import com.xdylpg.util.mail.MailSenderInfo;
import com.xdylpg.util.mail.SimpleMailSender;

public class VcodeAction extends ActionSupport {
	
	private HttpServletRequest  req = ServletActionContext.getRequest();
	public BusAdminService bas = null;
	public VcodeService vs = null;
}
