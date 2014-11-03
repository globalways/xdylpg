package com.xdylpg.service.impl;

import java.util.List;

import com.test.BaseDao;
import com.xdylpg.ORM.Shop;
import com.xdylpg.service.ShopService;

public class ShopServiceImpl implements ShopService {

	BaseDao dao;
	
	/**
	 * 保存更新商家、生活服务类
	 * @param Shop
	 * @author wang
	 * @return boolean
	 */
	public boolean saveOrUpdate(Object shop) {
		
		boolean status = true;
		try {
			Shop temp = (Shop)shop;
			dao.saveOrUpdate((Shop)shop);
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}
		return status;
	}
	
	/**
	 * 删除商家
	 */
	public boolean delete(int id) {
		boolean status = true;
		try {
			dao.delById(Shop.class, id);
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}
		return status;
	}

	public List browse(int pageNo, int pageSize) {
		return dao.listAll("Shop",pageNo,pageSize);
	}

	/** 将指定条目放入回收站 */
	public boolean invalidate(int id) {
		Shop s = (Shop)loadById(id);
		s.setStatus(0);
		saveOrUpdate(s);
		return false;
	}

	public Object loadById(int id) {
		return dao.loadById(Shop.class, id);
	}

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	@Override
	public int countItems() {
		return dao.countAll("Shop");
	}

}
