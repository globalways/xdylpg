package com.xdylpg.ORM;

import java.util.HashSet;
import java.util.Set;

/**
 * Psu entity. @author MyEclipse Persistence T
 */

public class Psu implements java.io.Serializable , Item {

	private static final long serialVersionUID = -4049947437571867985L;
	private Integer unitnum;
	private Category category;
	private BusAdmin busAdmin;
	private String busname;
	private String busaddr;
	private String busphone;
	private String busml;
	private String busintr;
	private String pinyinid;
	private String unitimg;
	private String unittem;
	private Integer hits;
	private Integer status;
	private Set unitImgs = new HashSet(0);

	// Constructors

	/** default constructor */
	public Psu() {
	}

	/** full constructor */
	public Psu(Category category, BusAdmin busAdmin, String busname,
			String busaddr, String busphone, String busml, String busintr,
			String pinyinid, String unitimg, String unittem, Integer hits,
			Integer status, Set unitImgs) {
		this.category = category;
		this.busAdmin = busAdmin;
		this.busname = busname;
		this.busaddr = busaddr;
		this.busphone = busphone;
		this.busml = busml;
		this.busintr = busintr;
		this.pinyinid = pinyinid;
		this.unitimg = unitimg;
		this.unittem = unittem;
		this.hits = hits;
		this.status = status;
		this.unitImgs = unitImgs;
	}

	// Property accessors

	public Integer getUnitnum() {
		return this.unitnum;
	}

	public void setUnitnum(Integer unitnum) {
		this.unitnum = unitnum;
	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public BusAdmin getBusAdmin() {
		return this.busAdmin;
	}

	public void setBusAdmin(BusAdmin busAdmin) {
		this.busAdmin = busAdmin;
	}

	public String getBusname() {
		return this.busname;
	}

	public void setBusname(String busname) {
		this.busname = busname;
	}

	public String getBusaddr() {
		return this.busaddr;
	}

	public void setBusaddr(String busaddr) {
		this.busaddr = busaddr;
	}

	public String getBusphone() {
		return this.busphone;
	}

	public void setBusphone(String busphone) {
		this.busphone = busphone;
	}

	public String getBusml() {
		return this.busml;
	}

	public void setBusml(String busml) {
		this.busml = busml;
	}

	public String getBusintr() {
		return this.busintr;
	}

	public void setBusintr(String busintr) {
		this.busintr = busintr;
	}

	public String getPinyinid() {
		return this.pinyinid;
	}

	public void setPinyinid(String pinyinid) {
		this.pinyinid = pinyinid;
	}

	public String getUnitimg() {
		return this.unitimg;
	}

	public void setUnitimg(String unitimg) {
		this.unitimg = unitimg;
	}

	public String getUnittem() {
		return this.unittem;
	}

	public void setUnittem(String unittem) {
		this.unittem = unittem;
	}

	public Integer getHits() {
		return this.hits;
	}

	public void setHits(Integer hits) {
		this.hits = hits;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Set getUnitImgs() {
		return this.unitImgs;
	}

	public void setUnitImgs(Set unitImgs) {
		this.unitImgs = unitImgs;
	}

	@Override
	public int getID() {
		return this.unitnum;
	}

}