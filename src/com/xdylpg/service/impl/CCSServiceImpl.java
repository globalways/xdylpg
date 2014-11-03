package com.xdylpg.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.test.BaseDao;
import com.xdylpg.ORM.Comconsor;
import com.xdylpg.service.ComConSortService;

public class CCSServiceImpl implements ComConSortService {

	BaseDao dao;
	@SuppressWarnings("unchecked")
	public List<Comconsor> browseCCS() {
		return dao.listAll("Comconsor");
	}

	@SuppressWarnings("unchecked")
	public List<Comconsor> listChildCCS(Comconsor ccs) {
		return dao.query("from Comconsor as c where c.fatnum="+ccs.getSornum());
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<Comconsor> listChildCCS(int fid)
	{
		return (ArrayList<Comconsor>) dao.query("from Comconsor as c where c.fatnum="+fid);
	}
	@SuppressWarnings("unchecked")
	public List<Comconsor> listParents()
	{
		return dao.query("from Comconsor as c where c.fatnum=0");
	}
	public Comconsor loadParentCCS(int id) {
		return null;
	}
	
	/** load company content sort */
	public Comconsor loadCCS(int id) {
		return  (Comconsor) dao.loadById(Comconsor.class, id);
	}

	public boolean deleteCCS(int id) {
		try {
			dao.delById(Comconsor.class, id);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public boolean saveOrUpdateCCS(Comconsor ccs) {
		try {
			dao.saveOrUpdate(ccs);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public BaseDao getDao() {
		return dao;
	}

}
