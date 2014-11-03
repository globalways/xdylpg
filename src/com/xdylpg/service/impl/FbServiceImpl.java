package com.xdylpg.service.impl;

import java.util.List;

import com.test.BaseDao;
import com.xdylpg.ORM.Advice;
import com.xdylpg.service.FbService;

public class FbServiceImpl implements FbService {

	BaseDao dao;
	public boolean save(Advice fb) {
		try {
			dao.saveOrUpdate(fb);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean del(int id) {
		try {
			dao.delById(Advice.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public List<Advice> list(int page, int ps) {
		return dao.listAll("Advice", page, ps);
	}

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

}
