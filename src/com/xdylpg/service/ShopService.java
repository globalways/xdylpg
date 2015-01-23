package com.xdylpg.service;

import java.io.Serializable;
import java.util.List;

import com.xdylpg.ORM.Shop;


public interface ShopService {
	public boolean saveOrUpdate(Object obj);
	public boolean delete(int id);
	public boolean deleteByHonid(Long hongid);
	public List<Object> browse(int pageNo,int pageSize);
	public boolean invalidate(int id);
	public Object loadById(int id);
	public Object loadByHongid(Long hongid);
	/**
	 * load object by specify hql
	 * @param hql
	 * @return object
	 */
	public Object loadObject(String hql);
	
	/**
	 *load object by hql or given fields<br/>can not both be null. 
	 */
	public Object loadObject(String hql,String[] fields);
	
	/**
	 * load specify {@code Object} by hongid and given fields.
	 * @param hql
	 * @param fields
	 * @param hongid
	 * @return
	 */
	public Object loadObject(String hql,String[] fields,Long hongid);
	/** 统计总数 */
	public int countItems();	
}
