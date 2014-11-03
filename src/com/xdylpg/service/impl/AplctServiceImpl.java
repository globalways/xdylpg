package com.xdylpg.service.impl;

import java.util.List;

import com.test.BaseDao;
import com.xdylpg.ORM.Application;
import com.xdylpg.service.AplctService;

public class AplctServiceImpl implements AplctService {

	BaseDao dao;
	public boolean save(Application a) {
		try {
			dao.saveOrUpdate(a);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean del(int id) {
		try {
			dao.delById(Application.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public List<Application> list(int p, int ps) {
		return dao.listAll("Application", p, ps);
	}

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

}
