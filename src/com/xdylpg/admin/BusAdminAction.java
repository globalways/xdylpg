package com.xdylpg.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.xdylpg.ORM.BusAdmin;
import com.xdylpg.ORM.Vcode;
import com.xdylpg.res.S;
import com.xdylpg.service.BusAdminService;
import com.xdylpg.service.VcodeService;
import com.xdylpg.service.impl.VcodeServiceImpl;
import com.xdylpg.util.MD5;
import com.xdylpg.util.T;
import com.xdylpg.util.Validate;
import com.xdylpg.util.mail.MailSenderInfo;
import com.xdylpg.util.mail.SimpleMailSender;

/** 系统管理员处理控制器 */
@SuppressWarnings("serial")
public class BusAdminAction extends ActionSupport implements ModelDriven<BusAdmin>{
	/** 通过依赖注入BusAdminService组件实例 */
	BusAdminService service;
	VcodeService vs;
	
	/** 系统用户管理所有请求中常用的参数值 */
	private String rand; 		//随机验证码
	private String actionMsg;	//Action间传递的消息参数
	private List<BusAdmin> busAdminList;		//系统用户列表
	
	//采用模型驱动
	private BusAdmin model;//用于封装系统用户属性模型
	
	public BusAdmin getModel() {
		if(model==null)
			model=new BusAdmin();
		return model;
	}
	
	private HttpServletRequest req = ServletActionContext.getRequest();
	
	/** 处理登录请求 */
	public String login(){
		rand = (String) req.getParameter("captcha");
		if(!rand.equalsIgnoreCase((String)req.getSession().getAttribute(S.VALIDATE_CODE_KEY))){
			addActionError(getText("login_rand_error"));
			return "login";
		}else{
			BusAdmin tempBusAdmin = service.BusAdminLogin(model.getAdmacc(), MD5.MD5Encode(model.getAdmpw()));
			if(tempBusAdmin!=null){
req.getSession().setAttribute("admin",tempBusAdmin);
				return SUCCESS;
			}else{
				addActionError(getText("login_fail"));
				return "login";				
			}
		}
	}
	
	/** 处理注销请求 */
	public String logout(){		
		ServletActionContext.getRequest().getSession().invalidate();
		return SUCCESS;
	}
	
	/** 处理浏览系统用户请求 */
	public String browseBusAdmin(){
		int pageNo = Integer.parseInt(ServletActionContext.getRequest().getParameter("pageNo"));
		int pageSize = Integer.parseInt(ServletActionContext.getRequest().getParameter("pageSize"));
		int count = service.countItems();
		int pageNum = (int)Math.ceil((double)count/pageSize);
		if(pageNo<=0||pageNo>pageNum)
			pageNo=1;
		if(pageSize<=0)
			pageSize=10;
		
		req.setAttribute("busAdminList",service.browseBusAdmin(pageNo, pageSize));
		req.setAttribute("pageNo",pageNo);
		req.setAttribute("count",count);
		req.setAttribute("pageSize",pageSize);
		req.setAttribute("pageNum",pageNum);
		return SUCCESS;
	}
	
	/** 处理加载所有管理员为Json请求*/
	public String loadBusAdmin()
	{
		List<BusAdmin> list = service.browseBusAdmin();
		PrintWriter out=null;
		try {
			 HttpServletResponse res = ServletActionContext.getResponse();
			 res.setContentType("text/javascript;charset=UTF-8");
			 res.setCharacterEncoding("utf-8");
			 out = res.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Iterator<BusAdmin> i = list.iterator();
		
		JSONArray ja = new JSONArray();
		BusAdmin temp = null;
		while(i.hasNext())
		{
			JSONObject obj = new JSONObject();
			temp = i.next();
			obj.put("name", temp.getAdmname());
			obj.put("tel", temp.getAdmtel());
			obj.put("busadmnum", temp.getBusadmnum());
			ja.add(obj);
		}
		out.print(ja);
		out.flush();
		return NONE;
	}
	
	/** 加载User管理员为Json*/
	public String loadUsers()
	{
		List<BusAdmin> list = service.browseBusAdmin();
		PrintWriter out=null;
		try {
			 HttpServletResponse res = ServletActionContext.getResponse();
			 res.setCharacterEncoding("utf-8");
			 out = res.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Iterator<BusAdmin> i = list.iterator();
		
		JSONArray ja = new JSONArray();
		BusAdmin temp = null;
		while(i.hasNext())
		{
			JSONObject obj = new JSONObject();
			temp = i.next();
			if( 1 != temp.getAuth().getAuthnum())  // is a user?
				continue;
			obj.put("name", temp.getAdmname());
			obj.put("tel", temp.getAdmtel());
			obj.put("busadmnum", temp.getBusadmnum());
			ja.add(obj);
		}
		out.print(ja);
		out.flush();
		return NONE;
		
	}
	
	/** 处理新增系统用户请求 */
	public String addBusAdmin(){
		model.setAdmpw(MD5.MD5Encode(model.getAdmpw()));
		if (service.saveOrUpdateBusAdmin(model)){
			model=null;
			//addActionMessage(getText("admin_add_succ"));
		}else{
			addActionMessage(getText("admin_add_fail"));
		}
		if(req.getParameter("appnum") != null && !req.getParameter("appnum").equals(""))
		{
			return "handleaplct";
		}
			
		return "toBrowseBusAdmin";
	}
	
	/** 处理删除系统用户请求 */
	public String delBusAdmin(){
		if (model.getBusadmnum()!=null){
			if (service.delBusAdmin(model.getBusadmnum())){
				actionMsg = getText("admin_del_succ");
			}else{
				actionMsg = getText("admin_del_fail");
			}			
		}else{
			actionMsg = getText("admin_del_fail");
		}
		actionMsg = java.net.URLEncoder.encode(actionMsg);
		return "toBrowseBusAdmin";
	}
	
	/** 处理查看系统用户请求 */
	public String viewBusAdmin(){
		if (model.getBusadmnum()!=null){
			BusAdmin tempBusAdmin = service.loadBusAdmin(model.getBusadmnum());
			if (tempBusAdmin!=null){
req.setAttribute("ba", tempBusAdmin);
				return SUCCESS;
			}else{
				actionMsg = getText("admin_view_fail");
				actionMsg = java.net.URLEncoder.encode(actionMsg);
				return "toBrowseBusBusAdmin";
			}	
		}else{
			actionMsg = getText("admin_view_fail");
			actionMsg = java.net.URLEncoder.encode(actionMsg);
			return "toBrowseBusAdmin";
		}		
	}
	
	/** 处理装载系统用户请求 */
	public String editBusAdmin(){
		if (model.getBusadmnum()!=null){
			BusAdmin tempBusAdmin = service.loadBusAdmin(model.getBusadmnum());
			if (tempBusAdmin!=null){
				model.setAdmacc(tempBusAdmin.getAdmacc());
				model.setAuth(tempBusAdmin.getAuth());				
				return SUCCESS;
			}else{
				actionMsg = getText("admin_edit_fail");
				actionMsg = java.net.URLEncoder.encode(actionMsg);
				return "toBrowseBusAdmin";
			}	
		}else{
			actionMsg = getText("admin_edit_fail");
			actionMsg = java.net.URLEncoder.encode(actionMsg);
			return "toBrowseBusAdmin";
		}		
	}
	
	/** 处理更新系统用户请求 */
	public String updateBusAdmin(){		
		
		boolean isChain = (boolean)req.getAttribute("chain");
		BusAdmin admin = null;
		//由UserAction发出的修改用户请求
		if(isChain)
		{
			admin = (BusAdmin)req.getSession().getAttribute("admin");
			admin.getAuth().setAuthnum(1);
			model.setAuth(admin.getAuth());
		}
		
		if (model.getAdmpw()!=null&&model.getAdmpw().length()>0){
			model.setAdmpw(MD5.MD5Encode(model.getAdmpw()));
		}
		if (service.saveOrUpdateBusAdmin(model)){
			model=null;
			addActionMessage(getText("admin_edit_succ"));
		}else{
			addActionMessage(getText("admin_edit_fail"));
		}
		// If "admin" is a user, return the user handle page.
		
		if( isChain )
		{
			req.getSession().setAttribute("admin", service.loadBusAdmin(admin.getBusadmnum()));
			return "toUserProfile";
		}
		return "toBrowseBusAdmin";		
	}	
	public String invalidateBusAdmin()
	{
		if (model.getBusadmnum()!=null){
			BusAdmin tempBusAdmin = service.loadBusAdmin(model.getBusadmnum());
			tempBusAdmin.setStatus(0);
			service.saveOrUpdateBusAdmin(tempBusAdmin);
		}else{
			actionMsg = getText("admin_invalidate_fail");
		}
		actionMsg = java.net.URLEncoder.encode(actionMsg);
		return "toBrowseBusAdmin";
	}
	
	public String resetPassword()
	{
		// MD5 code of password
		String pw_md5 = req.getParameter(S.NEWPWD);
		if(pw_md5 == null)
			return ERROR;
		String email  = service.loadBusAdmin((int)req.getSession().getAttribute(S.SESSION_RESETPWUSER)).getAdmemail();
		service.resetpw(email, MD5.MD5Encode(pw_md5));
		req.getSession().removeAttribute(S.SESSION_RESETPWUSER);
		return SUCCESS;
	}
	
	/**
	 *  handle email & verify code 
	 * @return
	 */
	public String vcode_getemail()
	{
		String email = req.getParameter(S.VCODE_EMAIL);
		String verifyCode = req.getParameter(S.VERIFYCODE);
		
		if(verifyCode.equals(req.getSession().getAttribute(S.VALIDATE_CODE_KEY)))
		{
			// attempt to get busadmin by specify email
			Integer busadmnum = service.getBusAdminID(email);
			if(busadmnum != null)
			{
				String code = vs.generateCode();
				String url = T.getPath(req) +  "mailback?v="+code;
				if(vs.AddVcode(new Vcode(code, new Date().toLocaleString(),busadmnum )))
				{
					MailSenderInfo msi = new MailSenderInfo(email);
					msi.setValidate(true);
					msi.setContent(url);
					SimpleMailSender sms = new SimpleMailSender();
					sms.sendHtmlMail(msi);
				}
				
				return SUCCESS;
			}else return ERROR;
		}else return ERROR;
		
	}
	
	public String vcode_mailback()
	{
		String verifyCode = req.getParameter(S.VCODE_MAILBACK);
		Vcode code = vs.loadVcodeByCode(verifyCode);
		if(code != null)
		{
			req.getSession().setAttribute(S.SESSION_RESETPWUSER,code.getUser() );
			return "toResetPw";
		}
		return "notfound";
	}
	
	/**
	 * get back password page
	 * @return SUCCESS
	 */
	public String forgotpassword()
	{
		return SUCCESS;
	}
	
	public String getRand() {
		return rand;
	}
	public void setRand(String rand) {
		this.rand = rand;
	}
	public BusAdminService getService() {
		return service;
	}
	public void setService(BusAdminService service) {
		this.service = service;
	}
	public String getActionMsg() {
		return actionMsg;
	}

	public void setActionMsg(String actionMsg) {
		this.actionMsg = actionMsg;
	}
	
	public List<BusAdmin> getBusAdminList() {
		return busAdminList;
	}
	
	public void setBusAdminList(List<BusAdmin> adminList) {
		this.busAdminList = adminList;
	}

	public void setVs(VcodeService vs) {
		this.vs = vs;
	}

}
