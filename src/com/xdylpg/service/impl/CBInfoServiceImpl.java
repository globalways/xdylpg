package com.xdylpg.service.impl;

import java.io.Serializable;
import java.util.List;

import com.test.BaseDao;
import com.xdylpg.ORM.CBInfo;
import com.xdylpg.service.ShopService;

public class CBInfoServiceImpl implements ShopService {

	BaseDao dao;
	
	public boolean saveOrUpdate(Object obj) {
		boolean status = true;
		try {
			dao.saveOrUpdate((CBInfo)obj);
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}
		return status;
	}

	public boolean delete(int id) {
		boolean status = true;
		try {
			dao.delById(CBInfo.class, id);
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}
		return status;
	}

	public List<Object> browse(int pageNo, int pageSize) {
		return dao.listAll("CBInfo",pageNo,pageSize);
	}
	/**查找指定用户下的商铺单位
	 * @param pageNo
	 * @param pageSize
	 * @param busadmnum
	 * @return
	 */
	public List<Object> browse(int pageNo,int pageSize,int busadmnum)
	{
		return dao.query("from CBInfo as c where c.busAdmin.busadmnum="+busadmnum, pageNo, pageSize);
	}
	
	public boolean invalidate(int id) {
		CBInfo c = (CBInfo)loadById(id);
		c.setStatus(0);
		saveOrUpdate(c);
		return false;
	}

	public Object loadById(int id) {
		return dao.loadById(CBInfo.class, id);
	}

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	@Override
	public int countItems() {
		return dao.countAll("CBInfo");
	}

	@Override
	public Object loadObject(String hql) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object loadObject(String hql, String[] fields) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object loadObject(String hql, String[] fields, Long hongid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object loadByHongid(Long hongid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteByHonid(Long hongid) {
		// TODO Auto-generated method stub
		return false;
	}

}
