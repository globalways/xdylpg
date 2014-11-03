package com.xdylpg.service;

import java.util.List;
import java.util.TreeMap;
import java.util.ArrayList;
import com.xdylpg.ORM.Category;

public interface CategoryService {
	/** 浏览商家分类 */
	public List<Category> browseCategory();
	/** 一级商家分类列表 */
	public List<Category> listMainCategory();	
	/** 下级商家分类列表 */
	public List<Category> listChildCategory(Category category);		
	/** 装载指定的商家分类 */	
	public Category loadCategory(Integer id);
	public TreeMap<Category,TreeMap<Category,ArrayList<Category>>> loadAllCategoryAsMap();
	/** 删除指定的商家分类 */	
	public boolean delCategory(Integer id);	
	/** 新增或修改商家分类 */
	public boolean saveOrUpdateCategory(Category category);
	/** 更新分类顺序 */
	public boolean updateOrder(Category c);
	
	/**
	 * find super category
	 * @param c
	 * @return
	 */
	public int findSuperCategory(Category c);
}
