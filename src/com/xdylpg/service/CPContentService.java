package com.xdylpg.service;

import java.util.List;

import com.xdylpg.ORM.Cpcontent;


public interface CPContentService {
	
	/** load all cpc
	 * @param comnum company number.
	 * @return a list that contains the result;
	 */
	public List<Cpcontent> browseCPC(int comnum);
	
	
	/**
	 * load specific cpc with page size and page number<br>
	 * @param pageNO page number.
	 * @param PageSize pagesize.
	 * @param comnum company number
	 * @return a list that contains the result;
	 */
	public List<Cpcontent> browseCPCWithPage(int pageNO,int PageSize,int comnum);
	
	/**
	 * load cpc with a sort type and comnum<br>
	 * page size and page number is default
	 * @param type sort type
	 * @param comnum company number
	 * @return
	 */
	public List<Cpcontent> browseCPCWithType(int type , int comnum);
	
	/**
	 * 
	 * @param type sort type
	 * @param comnum company number
	 * @param pageNO page number
	 * @param pageSize page size
	 * @return a list of cpc
	 */
	public List<Cpcontent> browseCPCWithTypePage(int type , int comnum , int pageNO , int pageSize);
	public Cpcontent loadCPC(int id);
	public boolean deleteCPC(int id);
	public boolean saveOrUpdateCPC(Cpcontent ccs);
}
