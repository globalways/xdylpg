package com.xdylpg.ORM;

import java.util.Comparator;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Comconsor entity. @author MyEclipse Persistence T
 */

public class Comconsor implements java.io.Serializable,Comparable<Comconsor> {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 2587967879036963059L;
	private Integer sornum;
	private Integer fatnum;
	private Integer sorord;
	private Integer sortype;
	private String sorname;
	private String sorurl;
	private String addtime;
	private String ptitle;
	private String pkeyw;
	private String pdesc;
	private String sorpath;
	private String sortem;
	private String contem;
	private String sorfol;
	private String confol;
	private String sfname;
	private String cfname;
	private Integer sorsta;
	private Integer tsnum;
	private String sorcon;
	private Date editim;
	private String imgpat;
	private String indimg;
	private String dlurl;
	private String icopat;
	private String icoimg;
	private Integer isdisplay;
	private Set cpcontents = new HashSet(0);

	// Constructors

	/** default constructor */
	public Comconsor() {
		this.sornum = 0;
	}

	/** full constructor */
	public Comconsor(Integer fatnum, Integer sorord, Integer sortype,
			String sorname, String sorurl, String addtime, String ptitle,
			String pkeyw, String pdesc, String sorpath, String sortem,
			String contem, String sorfol, String confol, String sfname,
			String cfname, Integer sorsta, Integer tsnum, String sorcon,
			Date editim, String imgpat, String indimg, String dlurl,
			String icopat, String icoimg, Integer isdisplay, Set cpcontents) {
		this.fatnum = fatnum;
		this.sorord = sorord;
		this.sortype = sortype;
		this.sorname = sorname;
		this.sorurl = sorurl;
		this.addtime = addtime;
		this.ptitle = ptitle;
		this.pkeyw = pkeyw;
		this.pdesc = pdesc;
		this.sorpath = sorpath;
		this.sortem = sortem;
		this.contem = contem;
		this.sorfol = sorfol;
		this.confol = confol;
		this.sfname = sfname;
		this.cfname = cfname;
		this.sorsta = sorsta;
		this.tsnum = tsnum;
		this.sorcon = sorcon;
		this.editim = editim;
		this.imgpat = imgpat;
		this.indimg = indimg;
		this.dlurl = dlurl;
		this.icopat = icopat;
		this.icoimg = icoimg;
		this.isdisplay = isdisplay;
		this.cpcontents = cpcontents;
	}

	// Property accessors

	public Integer getSornum() {
		return this.sornum;
	}

	public void setSornum(Integer sornum) {
		this.sornum = sornum;
	}

	public Integer getFatnum() {
		return this.fatnum;
	}

	public void setFatnum(Integer fatnum) {
		this.fatnum = fatnum;
	}

	public Integer getSorord() {
		return this.sorord;
	}

	public void setSorord(Integer sorord) {
		this.sorord = sorord;
	}

	public Integer getSortype() {
		return this.sortype;
	}

	public void setSortype(Integer sortype) {
		this.sortype = sortype;
	}

	public String getSorname() {
		return this.sorname;
	}

	public void setSorname(String sorname) {
		this.sorname = sorname;
	}

	public String getSorurl() {
		return this.sorurl;
	}

	public void setSorurl(String sorurl) {
		this.sorurl = sorurl;
	}

	public String getAddtime() {
		return this.addtime;
	}

	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}

	public String getPtitle() {
		return this.ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public String getPkeyw() {
		return this.pkeyw;
	}

	public void setPkeyw(String pkeyw) {
		this.pkeyw = pkeyw;
	}

	public String getPdesc() {
		return this.pdesc;
	}

	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}

	public String getSorpath() {
		return this.sorpath;
	}

	public void setSorpath(String sorpath) {
		this.sorpath = sorpath;
	}

	public String getSortem() {
		return this.sortem;
	}

	public void setSortem(String sortem) {
		this.sortem = sortem;
	}

	public String getContem() {
		return this.contem;
	}

	public void setContem(String contem) {
		this.contem = contem;
	}

	public String getSorfol() {
		return this.sorfol;
	}

	public void setSorfol(String sorfol) {
		this.sorfol = sorfol;
	}

	public String getConfol() {
		return this.confol;
	}

	public void setConfol(String confol) {
		this.confol = confol;
	}

	public String getSfname() {
		return this.sfname;
	}

	public void setSfname(String sfname) {
		this.sfname = sfname;
	}

	public String getCfname() {
		return this.cfname;
	}

	public void setCfname(String cfname) {
		this.cfname = cfname;
	}

	public Integer getSorsta() {
		return this.sorsta;
	}

	public void setSorsta(Integer sorsta) {
		this.sorsta = sorsta;
	}

	public Integer getTsnum() {
		return this.tsnum;
	}

	public void setTsnum(Integer tsnum) {
		this.tsnum = tsnum;
	}

	public String getSorcon() {
		return this.sorcon;
	}

	public void setSorcon(String sorcon) {
		this.sorcon = sorcon;
	}

	public Date getEditim() {
		return this.editim;
	}

	public void setEditim(Date editim) {
		this.editim = editim;
	}

	public String getImgpat() {
		return this.imgpat;
	}

	public void setImgpat(String imgpat) {
		this.imgpat = imgpat;
	}

	public String getIndimg() {
		return this.indimg;
	}

	public void setIndimg(String indimg) {
		this.indimg = indimg;
	}

	public String getDlurl() {
		return this.dlurl;
	}

	public void setDlurl(String dlurl) {
		this.dlurl = dlurl;
	}

	public String getIcopat() {
		return this.icopat;
	}

	public void setIcopat(String icopat) {
		this.icopat = icopat;
	}

	public String getIcoimg() {
		return this.icoimg;
	}

	public void setIcoimg(String icoimg) {
		this.icoimg = icoimg;
	}

	public Integer getIsdisplay() {
		return this.isdisplay;
	}

	public void setIsdisplay(Integer isdisplay) {
		this.isdisplay = isdisplay;
	}

	public Set getCpcontents() {
		return this.cpcontents;
	}

	public void setCpcontents(Set cpcontents) {
		this.cpcontents = cpcontents;
	}

	@Override
	public int compareTo(Comconsor o) {
		return this.sorord.compareTo(o.getSorord());
	}

}