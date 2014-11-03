package com.xdylpg.ORM;

import java.util.HashSet;
import java.util.Set;

/**
 * Category entity. @author MyEclipse Persistence T
 */

public class Category implements java.io.Serializable , Comparable<Category> {

	// Fields

	private Integer bcnum;
	private String bcname;
	private String bctem;
	private Integer bcpnum;
	private Integer bcorder;
	private Set psus = new HashSet(0);
	private Set CBInfos = new HashSet(0);
	private Set shops = new HashSet(0);

	// Constructors

	/** default constructor */
	public Category() {
	}

	/** full constructor */
	public Category(String bcname, String bctem, Integer bcpnum,
			Integer bcorder, Set psus, Set CBInfos, Set shops) {
		this.bcname = bcname;
		this.bctem = bctem;
		this.bcpnum = bcpnum;
		this.bcorder = bcorder;
		this.psus = psus;
		this.CBInfos = CBInfos;
		this.shops = shops;
	}

	// Property accessors

	
	public Integer getBcnum() {
		return this.bcnum;
	}

	public void setBcnum(Integer bcnum) {
		this.bcnum = bcnum;
	}

	public String getBcname() {
		return this.bcname;
	}

	public void setBcname(String bcname) {
		this.bcname = bcname;
	}

	public String getBctem() {
		return this.bctem;
	}

	public void setBctem(String bctem) {
		this.bctem = bctem;
	}

	public Integer getBcpnum() {
		return this.bcpnum;
	}

	public void setBcpnum(Integer bcpnum) {
		this.bcpnum = bcpnum;
	}

	public Integer getBcorder() {
		return this.bcorder;
	}

	public void setBcorder(Integer bcorder) {
		this.bcorder = bcorder;
	}

	public Set getPsus() {
		return this.psus;
	}

	public void setPsus(Set psus) {
		this.psus = psus;
	}

	public Set getCBInfos() {
		return this.CBInfos;
	}

	public void setCBInfos(Set CBInfos) {
		this.CBInfos = CBInfos;
	}

	public Set getShops() {
		return this.shops;
	}

	public void setShops(Set shops) {
		this.shops = shops;
	}

	@Override
	public int compareTo(Category o) {
		return this.getBcorder().compareTo(o.getBcorder());
	}

}