package com.xdylpg.service;

import java.util.List;

import com.xdylpg.ORM.BusAdmin;


/** 系统用户管理业务逻辑接口 */
public interface BusAdminService {
	/** 系统管理员登录 */
	public BusAdmin BusAdminLogin(String loginName,String loginPwd);	
	/** 浏览管理员 */
	public List<BusAdmin> browseBusAdmin(int pageNo,int pageSize);	
	public List<BusAdmin> browseBusAdmin();	
	
	/**
	 * load BusAdmin by email
	 * @param email
	 * @return null if no such BusAdmin exist
	 */
	public BusAdmin loadBusAdmin(String email);
	public Integer getBusAdminID(String email);
	/** 装载指定的管理员 */	
	public BusAdmin loadBusAdmin(Integer id);	
	/** 删除指定的管理员 */	
	public boolean delBusAdmin(Integer id);	
	/** 新增或修改管理员 */
	public boolean saveOrUpdateBusAdmin(BusAdmin admin);
	
	/**
	 * reset password by given email address and generated password
	 * @param email <br>the email address of target account
	 * @param generatedpw <br>encode String of real password
	 */
	public void resetpw(String email , String generatedpw);
	public int countItems();
}
