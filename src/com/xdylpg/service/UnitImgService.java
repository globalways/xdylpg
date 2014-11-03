package com.xdylpg.service;

import com.xdylpg.ORM.UnitImg;


public interface UnitImgService {
	public boolean deleteImg(int id);
	public boolean saveOrUpdate(UnitImg unitImg);
}
