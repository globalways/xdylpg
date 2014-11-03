package com.xdylpg.service;

import java.io.Serializable;
import java.util.List;


public interface ShopService {
	public boolean saveOrUpdate(Object obj);
	public boolean delete(int id);
	public List<Object> browse(int pageNo,int pageSize);
	public boolean invalidate(int id);
	public Object loadById(int id);
	/** 统计总数 */
	public int countItems();	
}
