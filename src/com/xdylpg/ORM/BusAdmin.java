package com.xdylpg.ORM;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/**
 * BusAdmin entity. @author MyEclipse Persistence T
 */

public class BusAdmin implements java.io.Serializable {

	// Fields

	private Integer busadmnum;
	private Long hongid;
	private Auth auth;
	private String admacc;
	private String admpw;
	private String admname;
	private String admtel;
	private String admemail;
	private Integer status;
	private Set psus = new HashSet(0);
	private Set shops = new HashSet(0);
	private Set CBInfos = new HashSet(0);

	// Constructors

	/** default constructor */
	public BusAdmin() {
	}

	public BusAdmin(Long hongid)
	{
		this.hongid = hongid;
	}
	public BusAdmin(Long hongid,Auth auth)
	{
		this.hongid = hongid;
		this.auth = auth;
	}
	/** full constructor */
	public BusAdmin(Long hongid,Auth auth, String admacc, String admpw, String admname,
			String admtel, String admemail, Integer status, Set psus,
			Set shops, Set CBInfos) {
		this.auth = auth;
		this.hongid = hongid;
		this.admacc = admacc;
		this.admpw = admpw;
		this.admname = admname;
		this.admtel = admtel;
		this.admemail = admemail;
		this.status = status;
		this.psus = psus;
		this.shops = shops;
		this.CBInfos = CBInfos;
	}

	/**
	 * 获取当前用户所管理的商铺Item
	 * @return 商铺Item
	 */
	public Item getItem()
	{
		Set[] set = {getCBInfos(),getPsus(),getShops()};
		for(Set tmp : set)
		{
			if(tmp.size() != 0)
			{
				Iterator i = tmp.iterator();
				while(i.hasNext())
				{
//System.out.println(i.next().getClass()+"   ============================== class");
					return  (Item)i.next();
				}
			}
		}
		return null;
	}
	
	public Object getObj()
	{
		Set[] set = {getCBInfos(),getPsus(),getShops()};
		for(Set tmp : set)
		{
			if(tmp.size() != 0)
			{
				Iterator i = tmp.iterator();
				while(i.hasNext())
				{
					return  i.next();
				}
			}
		}
		return null;
	}
	
	// Property accessors

	public Integer getBusadmnum() {
		return this.busadmnum;
	}

	public void setBusadmnum(Integer busadmnum) {
		this.busadmnum = busadmnum;
	}

	public Auth getAuth() {
		return this.auth;
	}

	public void setAuth(Auth auth) {
		this.auth = auth;
	}

	public String getAdmacc() {
		return this.admacc;
	}

	public void setAdmacc(String admacc) {
		this.admacc = admacc;
	}

	public String getAdmpw() {
		return this.admpw;
	}

	public void setAdmpw(String admpw) {
		this.admpw = admpw;
	}

	public String getAdmname() {
		return this.admname;
	}

	public void setAdmname(String admname) {
		this.admname = admname;
	}

	public String getAdmtel() {
		return this.admtel;
	}

	public void setAdmtel(String admtel) {
		this.admtel = admtel;
	}

	public String getAdmemail() {
		return this.admemail;
	}

	public void setAdmemail(String admemail) {
		this.admemail = admemail;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Set getPsus() {
		return this.psus;
	}

	public void setPsus(Set psus) {
		this.psus = psus;
	}

	public Set getShops() {
		return this.shops;
	}

	public void setShops(Set shops) {
		this.shops = shops;
	}

	public Set getCBInfos() {
		return this.CBInfos;
	}

	public void setCBInfos(Set CBInfos) {
		this.CBInfos = CBInfos;
	}

	public Long getHongid() {
		return hongid;
	}

	public void setHongid(Long hongid) {
		this.hongid = hongid;
	}

}