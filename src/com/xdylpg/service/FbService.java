package com.xdylpg.service;

import java.util.List;

import com.xdylpg.ORM.Advice;

public interface FbService {
	public boolean save(Advice fb);
	public boolean del(int id);
	public List<Advice> list(int page,int ps);
}
