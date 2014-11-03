package com.test;

import java.io.Serializable;
import java.sql.Connection;
import java.util.List;

import com.xdylpg.ORM.BusAdmin;

public interface BaseDao {
	public void saveOrUpdate(Object obj);
	public Connection getConnection();
	public List listAll(String clazz);
	public List listAll(String clazz,int pageNo,int pageSize);
	public Object loadById(Class clazz,Serializable id);
	public Object loadObject(String hql);
	public List query(String hql);
	public List query(String hql, int pageNo, int pageSize);
	public void delById(Class clazz, Serializable id);
	public void delete(Object obj);
	public int update(String hql);
	/** 统计指定类的所有持久化对象 */
	public int countAll(String clazz);
	

}
