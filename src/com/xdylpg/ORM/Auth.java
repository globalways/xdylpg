package com.xdylpg.ORM;

import java.util.HashSet;
import java.util.Set;

/**
 * Auth entity. @author MyEclipse Persistence T
 */

public class Auth implements java.io.Serializable {

	// Fields

	private Integer authnum;
	private String adname;
	private Set busAdmins = new HashSet(0);

	// Constructors

	/** default constructor */
	public Auth() {
	}

	/** minimal constructor */
	public Auth(String adname) {
		this.adname = adname;
	}

	/** full constructor */
	public Auth(String adname, Set busAdmins) {
		this.adname = adname;
		this.busAdmins = busAdmins;
	}
	
	/** id constructor */
	public Auth(int authnum , String adname)
	{
		this.authnum = authnum;
		this.adname = "";
	}
	
	// Property accessors

	public Integer getAuthnum() {
		return this.authnum;
	}

	public void setAuthnum(Integer authnum) {
		this.authnum = authnum;
	}

	public String getAdname() {
		return this.adname;
	}

	public void setAdname(String adname) {
		this.adname = adname;
	}

	public Set getBusAdmins() {
		return this.busAdmins;
	}

	public void setBusAdmins(Set busAdmins) {
		this.busAdmins = busAdmins;
	}

}