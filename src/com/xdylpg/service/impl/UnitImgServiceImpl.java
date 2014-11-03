package com.xdylpg.service.impl;


import com.test.BaseDao;
import com.xdylpg.ORM.UnitImg;
import com.xdylpg.service.UnitImgService;

public class UnitImgServiceImpl implements UnitImgService {

	BaseDao dao;
	
	public boolean deleteImg(int id) {
		try {
			dao.delById(UnitImg.class, id);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	public boolean saveOrUpdate(UnitImg unitImg) {
		try {
			dao.saveOrUpdate(unitImg);
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
