package com.xdylpg.ORM;

import java.util.HashSet;
import java.util.Set;

/**
 * Shop entity. @author MyEclipse Persistence T
 */

public class Shop implements java.io.Serializable ,Item {

	// Fields

	private Integer shopnum;
	private Category category;
	private BusAdmin busAdmin;
	private String busname;
	private String pinyinid;
	private String busaddr;
	private String busphone;
	private String busintr;
	private String shopnews;
	private String busml;
	private String shoptem;
	private Integer hits;
	private Integer status;
	private String logo;
	private Set shoppros = new HashSet(0);

	// Constructors

	/** default constructor */
	public Shop() {
	}

	/** full constructor */
	public Shop(Category category, BusAdmin busAdmin, String busname,
			String pinyinid, String busaddr, String busphone, String busintr,
			String shopnews, String busml, String shoptem, Integer hits,
			Integer status, String logo, Set shoppros) {
		this.category = category;
		this.busAdmin = busAdmin;
		this.busname = busname;
		this.pinyinid = pinyinid;
		this.busaddr = busaddr;
		this.busphone = busphone;
		this.busintr = busintr;
		this.shopnews = shopnews;
		this.busml = busml;
		this.shoptem = shoptem;
		this.hits = hits;
		this.status = status;
		this.logo = logo;
		this.shoppros = shoppros;
	}

	// Property accessors

	public Integer getShopnum() {
		return this.shopnum;
	}

	public void setShopnum(Integer shopnum) {
		this.shopnum = shopnum;
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

	public String getPinyinid() {
		return this.pinyinid;
	}

	public void setPinyinid(String pinyinid) {
		this.pinyinid = pinyinid;
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

	public String getBusintr() {
		return this.busintr;
	}

	public void setBusintr(String busintr) {
		this.busintr = busintr;
	}

	public String getShopnews() {
		return this.shopnews;
	}

	public void setShopnews(String shopnews) {
		this.shopnews = shopnews;
	}

	public String getBusml() {
		return this.busml;
	}

	public void setBusml(String busml) {
		this.busml = busml;
	}

	public String getShoptem() {
		return this.shoptem;
	}

	public void setShoptem(String shoptem) {
		this.shoptem = shoptem;
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

	public String getLogo() {
		return this.logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public Set getShoppros() {
		return this.shoppros;
	}

	public void setShoppros(Set shoppros) {
		this.shoppros = shoppros;
	}

	@Override
	public int getID() {
		return getShopnum().intValue();
	}

}