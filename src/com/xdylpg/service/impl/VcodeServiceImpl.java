package com.xdylpg.service.impl;

import java.util.Date;
import java.util.UUID;

import com.test.BaseDao;
import com.xdylpg.ORM.Vcode;
import com.xdylpg.service.VcodeService;

public class VcodeServiceImpl implements VcodeService {

	BaseDao dao;
	@Override
	public boolean AddVcode(Vcode v) {
		try {
			dao.saveOrUpdate(v);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	@Override
	public boolean DelVcode(String code) {
		try {
			String sql = new StringBuilder("from Vcode as v where v.code=").append(code).toString();
			Vcode v = (Vcode)dao.loadObject(sql);
			dao.delete(v);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	@Deprecated
	public Vcode loadVcodeByMail(String mail) {
		return null;
	}

	@Override
	public Vcode loadVcodeByCode(String code) {
		if(code == null)
			return null;
		else{
			String sql = new StringBuilder("from Vcode as v where v.code='").append(code).append("'").toString();
			return (Vcode)dao.loadObject(sql);
		}
	}

	@Override
	public boolean DelExpiration() {
		try {
			String nowDate = new Date().toLocaleString();
			String sql = new StringBuilder("delete from Vcode as v where v.experation<").append(nowDate).toString();
			dao.query(sql);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public String generateCode() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

}
