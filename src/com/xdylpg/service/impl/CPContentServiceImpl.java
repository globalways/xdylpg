package com.xdylpg.service.impl;

import java.util.List;

import com.test.BaseDao;
import com.xdylpg.ORM.Cpcontent;
import com.xdylpg.service.CPContentService;

public class CPContentServiceImpl implements CPContentService{

	BaseDao dao;
	public List<Cpcontent> browseCPC(int comnum) {
		return dao.query("from Cpcontent as c where c.CBInfo.comnum="+comnum);
	}

	public Cpcontent loadCPC(int id) {
		return (Cpcontent) dao.loadById(Cpcontent.class, id);
	}

	public boolean deleteCPC(int id) {
		try {
			dao.delById(Cpcontent.class, id);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public boolean saveOrUpdateCPC(Cpcontent ccs) {
		try {
			dao.saveOrUpdate(ccs);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}


	public List<Cpcontent> browseCPCWithPage(int pageNO, int PageSize ,int comnum) {
		return dao.listAll("from Cpcontent as c where c.CBInfo.comnum="+comnum, pageNO, PageSize);
	}
	public List<Cpcontent> browseCPCWithType(int type,int comnum) {
		return dao.query("from Cpcontent as c where c.comconsor.sornum="+type+"and c.CBInfo.comnum="+comnum,1,10);
	}

	public List<Cpcontent> browseCPCWithTypePage(int type,int comnum, int pageNO,int pageSize) {
		return dao.query("from Cpcontent as c where c.comconsor.sornum="+type+"and c.CBInfo.comnum="+comnum, pageNO, pageSize);
	}

}
