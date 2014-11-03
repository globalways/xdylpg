package com.xdylpg.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.TreeMap;

import com.test.BaseDao;
import com.xdylpg.ORM.Category;
import com.xdylpg.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {
	BaseDao dao;
	
	/** 浏览商家分类 */
	@SuppressWarnings("unchecked")
	public List<Category> browseCategory() {
		
		return dao.listAll("Category");
	}

	@SuppressWarnings("unchecked")
	public List<Category> listMainCategory() {
		return dao.query("from Category as c where c.bcpnum=0");
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> listChildCategory(Category category) {
		return dao.query("from Category as c where c.bcpnum="+category.getBcnum());
	}

	public Category loadCategory(Integer id) {
		return (Category)dao.loadById(Category.class, id);
	}

	public boolean delCategory(Integer id) {
		try {
			dao.delById(Category.class, id);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	@Override
	public boolean saveOrUpdateCategory(Category category) {
		boolean success = true;
		try {
			dao.saveOrUpdate(category);
		} catch (Exception e) {
			success = false;
		}
		return success;
	}
	
	public BaseDao getDao() {
		return dao;
	}
	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public TreeMap<Category, TreeMap<Category, ArrayList<Category>>> loadAllCategoryAsMap() {
		List<Category> mainList = listMainCategory();
		TreeMap<Category, TreeMap<Category, ArrayList<Category>>> map = new TreeMap<Category, TreeMap<Category, ArrayList<Category>>>();
		Collections.sort(mainList);
		for(Category c : mainList)
		{
			List<Category> sList = listChildCategory(c);
			Collections.sort(sList);
			TreeMap<Category, ArrayList<Category>> map2 = new TreeMap<Category, ArrayList<Category>>();
			for(Category c2 : sList)
			{
				List<Category> tList = listChildCategory(c2);
				Collections.sort(tList);
				map2.put(c2, (ArrayList<Category>)tList);
			}
			map.put(c, map2);
		}
		return map;
	}

	@Override
	public boolean updateOrder(Category c) {
		try {
			StringBuilder sb = new StringBuilder("update Category as c set c.bcorder='").append(c.getBcorder()).append("' where c.bcnum='").append(c.getBcnum()).append("'");
			dao.update(sb.toString());
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	public int findSuperCategory(Category c)
	{
		
		if(!c.getBcpnum().equals(0))
		{
			Category fc = loadCategory(c.getBcpnum());
			return findSuperCategory(fc);
		}
		else return c.getBcnum().intValue();
	}

}
