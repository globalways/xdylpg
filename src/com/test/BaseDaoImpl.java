package com.test;

import java.io.Serializable;
import java.sql.Connection;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;


public class BaseDaoImpl extends HibernateDaoSupport implements BaseDao {
	@Resource
	HibernateTemplate hibernateTemplate;
	
	/** 统计指定类的所有持久化对象 */
	public int countAll(String clazz) {
		final String hql = "select count(*) from "+clazz+ " as a";
		Long count = (Long)hibernateTemplate.execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException{
				Query query = session.createQuery(hql);
				query.setMaxResults(1);
				return query.uniqueResult();
			}
		});	
		return count.intValue();
	}
	
	public void saveOrUpdate(Object obj) {
		
		try {
				hibernateTemplate.saveOrUpdate(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Connection getConnection() {
		return hibernateTemplate.getSessionFactory().getCurrentSession().connection();
	}

	/** 装载指定类的所有持久化对象 */
	public List listAll(String clazz) {
		return hibernateTemplate.find("from "+clazz+" as a");
	}
	
	/** 分页装载指定类的所有持久化对象 */
	public List listAll(String clazz, int pageNo, int pageSize) {
		final int pNo = pageNo;
		final int pSize = pageSize;
		final String hql = "from "+clazz;
		List list = hibernateTemplate.executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException{
				Query query = session.createQuery(hql);
				query.setMaxResults(pSize);
				query.setFirstResult((pNo-1)*pSize);
				List result = query.list();
				if (!Hibernate.isInitialized(result))Hibernate.initialize(result);
				return result;
			}
		});	
		return list;
	}
	
	/** 加载指定ID的持久化对象 */
	public Object loadById(Class clazz,Serializable id) {
		return hibernateTemplate.get(clazz, id);
	}

	/**加载满足条件的持久化对象*/
	public Object loadObject(String hql) {
		final String hql1 = hql;
		Object obj = null;
		try {
			List list = hibernateTemplate.executeFind(new HibernateCallback(){
				public Object doInHibernate(Session session) throws HibernateException{
					Query query = session.createQuery(hql1);
					return query.list();
				}
			});			
			if(list.size()>0)
			{
				obj=list.get(0);	
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return obj;
	}
	/** 查询指定类的满足条件的持久化对象 */
	public List query(String hql) {
		final String hql1 = hql;
		return hibernateTemplate.executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException{
				Query query = session.createQuery(hql1);
				return query.list();
			}
		});	
	}
	
	/** 分页查询指定类的满足条件的持久化对象 */
	public List query(String hql, int pageNo, int pageSize) {
		final int pNo = pageNo;
		final int pSize = pageSize;
		final String hql1 = hql;
		return hibernateTemplate.executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException{
				Query query = session.createQuery(hql1);
				query.setMaxResults(pSize);
				query.setFirstResult((pNo-1)*pSize);
				List result = query.list();
				if (!Hibernate.isInitialized(result))Hibernate.initialize(result);
				return result;
			}
		});	
	}
	/** 条件更新数据 */
	@SuppressWarnings("unchecked")
	public int update(String hql) {
		final String hql1 = hql; 
		return ((Integer)hibernateTemplate.execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException{
				Query query = session.createQuery(hql1);
				return query.executeUpdate();
			}
		})).intValue();	
	}

	/** 删除指定ID的持久化对象 */
	public void delById(Class clazz,Serializable id) {
		hibernateTemplate.delete(hibernateTemplate.load(clazz, id));
	}
	public void delete(Object obj){
		hibernateTemplate.delete(obj);
	}
}
