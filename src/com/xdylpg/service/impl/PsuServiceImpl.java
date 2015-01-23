package com.xdylpg.service.impl;

import java.util.List;

import com.test.BaseDao;
import com.xdylpg.ORM.Psu;
import com.xdylpg.ORM.UnitImg;
import com.xdylpg.service.ShopService;

public class PsuServiceImpl implements ShopService {

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	BaseDao dao;

	public boolean saveOrUpdate(Object obj) {
		boolean status = false;
		try {
			dao.saveOrUpdate((Psu) obj);
			status = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	/** 接口中没有定义：保存公共单位图片 */
	public boolean saveOrUpdatePsuImg(UnitImg obj) {
		boolean status = false;
		try {
			dao.saveOrUpdate(obj);
			status = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public boolean delete(int id) {
		boolean status = true;
		try {
			dao.delById(Psu.class, id);
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}
		return status;
	}

	public List<Object> browse(int pageNo, int pageSize) {
		return dao.listAll("Psu", pageNo, pageSize);
	}

	public boolean invalidate(int id) {
		Psu p = loadById(id);
		p.setStatus(0);
		saveOrUpdate(p);
		return false;
	}

	public Psu loadById(int id) {
		return (Psu) dao.loadById(Psu.class, id);
	}

	@Override
	public int countItems() {
		return dao.countAll("Psu");
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
