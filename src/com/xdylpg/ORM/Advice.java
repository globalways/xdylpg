package com.xdylpg.ORM;

/**
 * Advice entity. @author MyEclipse Persistence T
 */

public class Advice implements java.io.Serializable {

	// Fields

	private Integer advnum;
	private String advcon;
	private Integer isread;
	private String adviser;
	private String advtel;
	private String advmai;

	// Constructors

	/** default constructor */
	public Advice() {
	}

	/** minimal constructor */
	public Advice(String advcon, Integer isread) {
		this.advcon = advcon;
		this.isread = isread;
	}

	/** full constructor */
	public Advice(String advcon, Integer isread, String adviser, String advtel,
			String advmai) {
		this.advcon = advcon;
		this.isread = isread;
		this.adviser = adviser;
		this.advtel = advtel;
		this.advmai = advmai;
	}

	// Property accessors

	public Integer getAdvnum() {
		return this.advnum;
	}

	public void setAdvnum(Integer advnum) {
		this.advnum = advnum;
	}

	public String getAdvcon() {
		return this.advcon;
	}

	public void setAdvcon(String advcon) {
		this.advcon = advcon;
	}

	public Integer getIsread() {
		return this.isread;
	}

	public void setIsread(Integer isread) {
		this.isread = isread;
	}

	public String getAdviser() {
		return this.adviser;
	}

	public void setAdviser(String adviser) {
		this.adviser = adviser;
	}

	public String getAdvtel() {
		return this.advtel;
	}

	public void setAdvtel(String advtel) {
		this.advtel = advtel;
	}

	public String getAdvmai() {
		return this.advmai;
	}

	public void setAdvmai(String advmai) {
		this.advmai = advmai;
	}

}