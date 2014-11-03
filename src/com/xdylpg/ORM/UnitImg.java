package com.xdylpg.ORM;

/**
 * UnitImg entity. @author MyEclipse Persistence T
 */

public class UnitImg implements java.io.Serializable {

	// Fields

	private Integer imgnum;
	private Psu psu;
	private String imgpath;
	private String imgdisc;
	private String realpath;

	// Constructors

	/** default constructor */
	public UnitImg() {
	}

	/** full constructor */
	public UnitImg(Psu psu, String imgpath, String imgdisc, String realpath) {
		this.psu = psu;
		this.imgpath = imgpath;
		this.imgdisc = imgdisc;
		this.realpath = realpath;
	}

	// Property accessors

	public Integer getImgnum() {
		return this.imgnum;
	}

	public void setImgnum(Integer imgnum) {
		this.imgnum = imgnum;
	}

	public Psu getPsu() {
		return this.psu;
	}

	public void setPsu(Psu psu) {
		this.psu = psu;
	}

	public String getImgpath() {
		return this.imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}

	public String getImgdisc() {
		return this.imgdisc;
	}

	public void setImgdisc(String imgdisc) {
		this.imgdisc = imgdisc;
	}

	public String getRealpath() {
		return this.realpath;
	}

	public void setRealpath(String realpath) {
		this.realpath = realpath;
	}

}