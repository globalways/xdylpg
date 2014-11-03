package com.xdylpg.service.impl;

import java.util.List;

import com.test.BaseDao;
import com.xdylpg.ORM.BusAdmin;
import com.xdylpg.service.BusAdminService;

/** 系统用户管理业务逻辑接口实现 */
public class BusAdminServiceImpl implements BusAdminService {
	/** 通过依赖注入DAO组件实例 */
	BaseDao dao;

	/** 系统管理员登录 */
	public BusAdmin BusAdminLogin(String loginName, String loginPwd){
		String hql = "from BusAdmin as a where a.admacc='"+loginName+"' and a.admpw='"+loginPwd+"'";
		return (BusAdmin)dao.loadObject(hql);
	}

	/** 新增或修改管理员 */	
	public boolean saveOrUpdateBusAdmin(BusAdmin BusAdmin){
		boolean status = false;
		try{
			dao.saveOrUpdate(BusAdmin);
			status = true;
		}catch(Exception ex){
			ex.printStackTrace();
		}	
		return status;
	}

	/** 分页浏览管理员 */
	@SuppressWarnings("unchecked")
	public List<BusAdmin> browseBusAdmin(int pageNo,int pageSize){
		return dao.listAll("BusAdmin",pageNo,pageSize);
	}
	
	/** 检索所有管理员*/
	@SuppressWarnings("unchecked")
	public List<BusAdmin> browseBusAdmin() {
		return dao.listAll("BusAdmin");
	}

	/** 删除指定的管理员 */
	public boolean delBusAdmin(Integer id){
		boolean status = false;
		try{
			dao.delById(BusAdmin.class, id);
			status = true;
		}catch(Exception ex){
			ex.printStackTrace();
		}	
		return status;
	}
	
	public void resetpw(String email , String generatedpw)
	{
		String hql = new StringBuilder("update BusAdmin as a set a.admpw='").append(generatedpw)
					 .append("' where a.admemail='").append(email).append("'").toString();
		dao.update(hql);
		
	}
	
	/** 装载指定的管理员 */
	public BusAdmin loadBusAdmin(Integer id){
		return (BusAdmin)dao.loadById(BusAdmin.class, id);
	}
		
	public int countItems() {
		return dao.countAll("BusAdmin");
	}

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	@Override
	public BusAdmin loadBusAdmin(String email) {
	String hql = new StringBuilder("select busadmnum from BusAdmin as a where a.admemail='").append(email).append("'").toString();
		return (BusAdmin)dao.loadObject(hql);
	}
	public Integer getBusAdminID(String email){
		String hql = new StringBuilder("select busadmnum from BusAdmin as a where a.admemail='").append(email).append("'").toString();
		return (int) dao.loadObject(hql);
	}


}