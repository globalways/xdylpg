package com.xdylpg.service.impl;

import java.util.ArrayList;
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
	@Override
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
	@Override
	public boolean deleteByHonid(Long hongid) {
		boolean status = true;
		try {
			dao.delete(loadByHongid(hongid));
		} catch (Exception e) {
			status = true;
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
	
	@Override
	public Object loadByHongid(Long hongid) {
		return dao.loadObject("from Shop as s where s.hongid="+hongid);
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

	@Override
	public Object loadObject(String hql,String[] fields,Long hongid){
		Object result = null;
		if(hql !=null)
		{
			result = dao.loadObject(hql);
		}else if(fields != null && fields.length != 0){
			StringBuilder tmp  = new StringBuilder("select ");
			for(int i=0;i<fields.length;i++)
			{
				tmp.append("s.");
				tmp.append(fields[i]);
				if(i != fields.length-1)
					tmp.append(",");
			}
			tmp.append(" from Shop s where s.hongid=").append(hongid);
			result = dao.loadObject(tmp.toString().trim());
		}
		return result;
	}
	
	/**
	 * load shops related to someone(owner or administrator) by custom fields
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList loadSpecifyOwnerObjects(String[] fields,long whos)
	{
		ArrayList<Shop> result = new ArrayList<Shop>();
		StringBuilder tmp  = new StringBuilder();
		if(fields != null && fields.length != 0){
			tmp.append("select ");
			for(int i=0;i<fields.length;i++)
			{
				tmp.append("s.");
				tmp.append(fields[i]);
				if(i != fields.length-1)
					tmp.append(",");
			}
		}
		tmp.append(" from Shop s where s.busAdmin.hongid=").append(whos)
			.append(" or s.owner.hongid=").append(whos);
		result = (ArrayList<Shop>) dao.query(tmp.toString().trim());
		return result;
	}
	/**
	 * load shops related to someone(owner or administrator) by custom fields
	 * <br>
	 * with page information
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList loadSpecifyOwnerObjects(String[] fields,long whos,Integer page,Integer pageSize)
	{
		ArrayList<Shop> result = new ArrayList<Shop>();
		StringBuilder tmp  = new StringBuilder();
		if(fields != null && fields.length != 0){
			tmp.append("select ");
			for(int i=0;i<fields.length;i++)
			{
				tmp.append("s.");
				tmp.append(fields[i]);
				if(i != fields.length-1)
					tmp.append(",");
			}
		}
		tmp.append(" from Shop s where s.busAdmin.hongid=").append(whos)
			.append(" or s.owner.hongid=").append(whos);
		if(page == null || pageSize == null)
		{
			result = (ArrayList<Shop>) dao.query(tmp.toString().trim());
		}
		else
		{
			result = (ArrayList<Shop>) dao.query(tmp.toString().trim(),page,pageSize);
		}
		return result;
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



}
