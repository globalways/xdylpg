package com.xdylpg.service.impl;

import com.test.BaseDao;
import com.xdylpg.ORM.Shoppro;
import com.xdylpg.service.ProService;

public class ProServiceImpl implements ProService {

	BaseDao dao;
	public boolean delPro(int id) {
		try {
			dao.delById(Shoppro.class, id);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	public BaseDao getDao() {
		return dao;
	}
	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

}
