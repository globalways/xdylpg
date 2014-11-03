package com.xdylpg.ORM;

public interface Item {
	public int getID();
	public Category getCategory();
	public void setCategory(Category category);
	public BusAdmin getBusAdmin();
	public void setBusAdmin(BusAdmin busAdmin);
	public String getBusname();
	public void setBusname(String busname);
	public String getBusaddr();
	public void setBusaddr(String busaddr);
	public String getBusphone();
	public void setBusphone(String busphone);
	public String getBusml();
	public void setBusml(String busml);
	public String getBusintr();
	public void setBusintr(String busintr);
}
