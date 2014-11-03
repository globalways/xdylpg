package com.test;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Thing {
	private String name;
	private long weight;
	private int id;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getWeight() {
		return weight;
	}
	public void setWeight(long weight) {
		this.weight = weight;
	}
	
	public static void main(String args[]) throws InstantiationException, IllegalAccessException
	{
		String url = "http://127.0.0.1:8080/xdylpg/admin/com-cpc-index/ada.css";
		Pattern p = Pattern.compile(".*\\.[a-zA-Z]{1,3}");
		Matcher m = p.matcher(url);
		System.out.println(m.matches());
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
