package com.xdylpg.service;

import java.util.ArrayList;

import com.xdylpg.ORM.Category;
import com.xdylpg.ORM.Item;

public interface SiteService {
	public ArrayList<Item> loadAllItems();
	public ArrayList<Item> loadAllItems(Category c);
	/**
	 * load all items(shop psu cbinfo) 
	 * @return ArrayList
	 */
	public ArrayList<Item> loadAllItems(int bcnum);
}
