package com.xdylpg.ORM;

/**
 * Shoppro entity. @author MyEclipse Persistence T
 */

public class Shoppro implements java.io.Serializable , Comparable<Shoppro>{

	// Fields

	private Integer pronum;
	private Shop shop;
	private String proname;
	private String prointr;
	private String propri;
	private String pronewpri;
	private String proimg;
	private Integer proorder;

	// Constructors

	/** default constructor */
	public Shoppro() {
	}

	/** full constructor */
	public Shoppro(Shop shop, String proname, String prointr, String propri,
			String pronewpri, String proimg, Integer proorder) {
		this.shop = shop;
		this.proname = proname;
		this.prointr = prointr;
		this.propri = propri;
		this.pronewpri = pronewpri;
		this.proimg = proimg;
		this.proorder = proorder;
	}

	// Property accessors

	public Integer getPronum() {
		return this.pronum;
	}

	public void setPronum(Integer pronum) {
		this.pronum = pronum;
	}

	public Shop getShop() {
		return this.shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public String getProname() {
		return this.proname;
	}

	public void setProname(String proname) {
		this.proname = proname;
	}

	public String getProintr() {
		return this.prointr;
	}

	public void setProintr(String prointr) {
		this.prointr = prointr;
	}

	public String getPropri() {
		return this.propri;
	}

	public void setPropri(String propri) {
		this.propri = propri;
	}

	public String getPronewpri() {
		return this.pronewpri;
	}

	public void setPronewpri(String pronewpri) {
		this.pronewpri = pronewpri;
	}

	public String getProimg() {
		return this.proimg;
	}

	public void setProimg(String proimg) {
		this.proimg = proimg;
	}

	public Integer getProorder() {
		return this.proorder;
	}

	public void setProorder(Integer proorder) {
		this.proorder = proorder;
	}

	@Override
	public int compareTo(Shoppro o) {
		return this.getProorder().compareTo(o.getProorder());
	}

}