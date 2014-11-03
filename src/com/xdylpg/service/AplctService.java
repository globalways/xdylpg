package com.xdylpg.service;

import java.util.List;

import com.xdylpg.ORM.Application;

public interface AplctService {
	public boolean save(Application a);
	public boolean del(int id);
	public List<Application> list(int p,int ps);
	
}
