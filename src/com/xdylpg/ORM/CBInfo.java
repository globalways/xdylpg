package com.xdylpg.ORM;

import java.util.HashSet;
import java.util.Set;

/**
 * CBInfo entity. @author MyEclipse Persistence T
 */

public class CBInfo implements java.io.Serializable,Item {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -8036835596231194760L;
	private Integer comnum;
	private Category category;
	private BusAdmin busAdmin;
	private String busname;
	private String busaddr;
	private String busphone;
	private String busml;
	private String busintr;
	private String pinyinid;
	private String webtitle;
	private String subtitle;
	private String logimg;
	private String icoimg;
	private String postcode;
	private String carousel;
	private String contacts;
	private String email;
	private String icpcode;
	private String webdes;
	private Integer hits;
	private Integer status;
	private Set cpcontents = new HashSet(0);

	// Constructors

	/** default constructor */
	public CBInfo() {
	}

	/** full constructor */
	public CBInfo(Category category, BusAdmin busAdmin, String busname,
			String busaddr, String busphone, String busml, String busintr,
			String pinyinid, String webtitle, String subtitle, String logimg,
			String icoimg, String postcode, String carousel, String contacts,
			String email, String icpcode, String webdes, Integer hits,
			Integer status, Set cpcontents) {
		this.category = category;
		this.busAdmin = busAdmin;
		this.busname = busname;
		this.busaddr = busaddr;
		this.busphone = busphone;
		this.busml = busml;
		this.busintr = busintr;
		this.pinyinid = pinyinid;
		this.webtitle = webtitle;
		this.subtitle = subtitle;
		this.logimg = logimg;
		this.icoimg = icoimg;
		this.postcode = postcode;
		this.carousel = carousel;
		this.contacts = contacts;
		this.email = email;
		this.icpcode = icpcode;
		this.webdes = webdes;
		this.hits = hits;
		this.status = status;
		this.cpcontents = cpcontents;
	}

	// Property accessors

	public Integer getComnum() {
		return this.comnum;
	}

	public void setComnum(Integer comnum) {
		this.comnum = comnum;
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

	public String getWebtitle() {
		return this.webtitle;
	}

	public void setWebtitle(String webtitle) {
		this.webtitle = webtitle;
	}

	public String getSubtitle() {
		return this.subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public String getLogimg() {
		return this.logimg;
	}

	public void setLogimg(String logimg) {
		this.logimg = logimg;
	}

	public String getIcoimg() {
		return this.icoimg;
	}

	public void setIcoimg(String icoimg) {
		this.icoimg = icoimg;
	}

	public String getPostcode() {
		return this.postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getCarousel() {
		return this.carousel;
	}

	public void setCarousel(String carousel) {
		this.carousel = carousel;
	}

	public String getContacts() {
		return this.contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIcpcode() {
		return this.icpcode;
	}

	public void setIcpcode(String icpcode) {
		this.icpcode = icpcode;
	}

	public String getWebdes() {
		return this.webdes;
	}

	public void setWebdes(String webdes) {
		this.webdes = webdes;
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

	public Set getCpcontents() {
		return this.cpcontents;
	}

	public void setCpcontents(Set cpcontents) {
		this.cpcontents = cpcontents;
	}

	@Override
	public int getID() {
		return this.comnum;
	}

}