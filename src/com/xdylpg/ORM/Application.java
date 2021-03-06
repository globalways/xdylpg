package com.xdylpg.ORM;

/**
 * Application entity. @author MyEclipse Persistence T
 */

public class Application implements java.io.Serializable {

	// Fields

	private Integer appnum;
	private String admname;
	private String admtel;
	private String admemail;
	private Integer ishandle;

	// Constructors

	/** default constructor */
	public Application() {
	}

	/** minimal constructor */
	public Application(String admacc, String admpw, Integer admauth,
			String admname, String admpho, String admtel, Integer ishandle) {
		this.admname = admname;
		this.admtel = admtel;
		this.ishandle = ishandle;
	}

	/** full constructor */
	public Application(String admacc, String admpw, Integer admauth,
			String admname, String admpho, String admtel, String admemail,
			Integer ishandle) {
		this.admname = admname;
		this.admtel = admtel;
		this.admemail = admemail;
		this.ishandle = ishandle;
	}

	// Property accessors

	public Integer getAppnum() {
		return this.appnum;
	}

	public void setAppnum(Integer appnum) {
		this.appnum = appnum;
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

	public Integer getIshandle() {
		return this.ishandle;
	}

	public void setIshandle(Integer ishandle) {
		this.ishandle = ishandle;
	}

}