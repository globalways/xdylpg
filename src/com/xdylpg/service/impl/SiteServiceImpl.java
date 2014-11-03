package com.xdylpg.service.impl;

import java.util.ArrayList;

import com.test.BaseDao;
import com.xdylpg.ORM.Category;
import com.xdylpg.ORM.Item;
import com.xdylpg.service.SiteService;

public class SiteServiceImpl implements SiteService {
	
	BaseDao dao;
	
	public ArrayList<Item> loadAllItems() {
		
		
		ArrayList<Item> result = new ArrayList<Item>();
		String[] columName = {"Shop","Psu","CBInfo"};
		StringBuilder sb = new StringBuilder();
		for(String t : columName)
		{
			String sql= sb.append("from ").append(t).toString();
System.out.println(sql);
			result.addAll(dao.query(sql));
			sb.setLength(0);
		}
		return result;
	}

	public ArrayList<Item> loadAllItems(Category c) {
		return null;
	}

	public ArrayList<Item> loadAllItems(int bcnum) {
		if(bcnum != 0)
		{
			ArrayList<Item> result = new ArrayList<Item>();
			String[] columName = {"Shop","Psu","CBInfo"};
			StringBuilder sb = new StringBuilder();
			for(String t : columName)
			{
				String sql= sb.append("from ").append(t).append(" as t where t.category.bcnum=").append(bcnum).toString();
System.out.println(sql);
				result.addAll(dao.query(sql));
				sb.setLength(0);
			}
			return result;
		}
		else return loadAllItems();
	}

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

}
