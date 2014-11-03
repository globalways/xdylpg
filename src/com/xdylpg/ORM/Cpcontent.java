package com.xdylpg.ORM;

import java.util.Date;

/**
 * Cpcontent entity. @author MyEclipse Persistence T
 */

public class Cpcontent implements java.io.Serializable {

	// Fields

	private Integer contnum;
	private CBInfo CBInfo;
	private Comconsor comconsor;
	private String contit;
	private String ctcol;
	private Integer iolink;
	private String outlin;
	private String author;
	private String consou;
	private String contag;
	private String content;
	private Integer consta;
	private Integer istop;
	private Integer isrec;
	private Integer iinews;
	private Integer ihline;
	private Integer conord;
	private Integer isgen;
	private Integer visits;
	private long addtime;
	private long editim;
	private String indimg;
	private String dlurl;
	private String ptitle;
	private String pkeyw;
	private String pdesc;
	private String pfname;
	private Date timer;
	private Integer timsta;
	private String ppri;
	private String ptype;
	private String pcolor;
	private String pcat;
	private String sabout;
	private String poprice;

	// Constructors

	/** default constructor */
	public Cpcontent() {
	}

	/** full constructor */
	public Cpcontent(CBInfo CBInfo, Comconsor comconsor, String contit,
			String ctcol, Integer iolink, String outlin, String author,
			String consou, String contag, String content, Integer consta,
			Integer istop, Integer isrec, Integer iinews, Integer ihline,
			Integer conord, Integer isgen, Integer visits, long addtime,
			long editim, String indimg, String dlurl, String ptitle,
			String pkeyw, String pdesc, String pfname, Date timer,
			Integer timsta, String ppri, String ptype, String pcolor,
			String pcat, String sabout, String poprice) {
		this.CBInfo = CBInfo;
		this.comconsor = comconsor;
		this.contit = contit;
		this.ctcol = ctcol;
		this.iolink = iolink;
		this.outlin = outlin;
		this.author = author;
		this.consou = consou;
		this.contag = contag;
		this.content = content;
		this.consta = consta;
		this.istop = istop;
		this.isrec = isrec;
		this.iinews = iinews;
		this.ihline = ihline;
		this.conord = conord;
		this.isgen = isgen;
		this.visits = visits;
		this.addtime = addtime;
		this.editim = editim;
		this.indimg = indimg;
		this.dlurl = dlurl;
		this.ptitle = ptitle;
		this.pkeyw = pkeyw;
		this.pdesc = pdesc;
		this.pfname = pfname;
		this.timer = timer;
		this.timsta = timsta;
		this.ppri = ppri;
		this.ptype = ptype;
		this.pcolor = pcolor;
		this.pcat = pcat;
		this.sabout = sabout;
		this.poprice = poprice;
	}

	// Property accessors

	public Integer getContnum() {
		return this.contnum;
	}

	public void setContnum(Integer contnum) {
		this.contnum = contnum;
	}

	public CBInfo getCBInfo() {
		return this.CBInfo;
	}

	public void setCBInfo(CBInfo CBInfo) {
		this.CBInfo = CBInfo;
	}

	public Comconsor getComconsor() {
		return this.comconsor;
	}

	public void setComconsor(Comconsor comconsor) {
		this.comconsor = comconsor;
	}

	public String getContit() {
		return this.contit;
	}

	public void setContit(String contit) {
		this.contit = contit;
	}

	public String getCtcol() {
		return this.ctcol;
	}

	public void setCtcol(String ctcol) {
		this.ctcol = ctcol;
	}

	public Integer getIolink() {
		return this.iolink;
	}

	public void setIolink(Integer iolink) {
		this.iolink = iolink;
	}

	public String getOutlin() {
		return this.outlin;
	}

	public void setOutlin(String outlin) {
		this.outlin = outlin;
	}

	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getConsou() {
		return this.consou;
	}

	public void setConsou(String consou) {
		this.consou = consou;
	}

	public String getContag() {
		return this.contag;
	}

	public void setContag(String contag) {
		this.contag = contag;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getConsta() {
		return this.consta;
	}

	public void setConsta(Integer consta) {
		this.consta = consta;
	}

	public Integer getIstop() {
		return this.istop;
	}

	public void setIstop(Integer istop) {
		this.istop = istop;
	}

	public Integer getIsrec() {
		return this.isrec;
	}

	public void setIsrec(Integer isrec) {
		this.isrec = isrec;
	}

	public Integer getIinews() {
		return this.iinews;
	}

	public void setIinews(Integer iinews) {
		this.iinews = iinews;
	}

	public Integer getIhline() {
		return this.ihline;
	}

	public void setIhline(Integer ihline) {
		this.ihline = ihline;
	}

	public Integer getConord() {
		return this.conord;
	}

	public void setConord(Integer conord) {
		this.conord = conord;
	}

	public Integer getIsgen() {
		return this.isgen;
	}

	public void setIsgen(Integer isgen) {
		this.isgen = isgen;
	}

	public Integer getVisits() {
		return this.visits;
	}

	public void setVisits(Integer visits) {
		this.visits = visits;
	}

	public long getAddtime() {
		return this.addtime;
	}

	public void setAddtime(long addtime) {
		this.addtime = addtime;
	}

	public long getEditim() {
		return this.editim;
	}

	public void setEditim(long editim) {
		this.editim = editim;
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

	public String getPfname() {
		return this.pfname;
	}

	public void setPfname(String pfname) {
		this.pfname = pfname;
	}

	public Date getTimer() {
		return this.timer;
	}

	public void setTimer(Date timer) {
		this.timer = timer;
	}

	public Integer getTimsta() {
		return this.timsta;
	}

	public void setTimsta(Integer timsta) {
		this.timsta = timsta;
	}

	public String getPpri() {
		return this.ppri;
	}

	public void setPpri(String ppri) {
		this.ppri = ppri;
	}

	public String getPtype() {
		return this.ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	public String getPcolor() {
		return this.pcolor;
	}

	public void setPcolor(String pcolor) {
		this.pcolor = pcolor;
	}

	public String getPcat() {
		return this.pcat;
	}

	public void setPcat(String pcat) {
		this.pcat = pcat;
	}

	public String getSabout() {
		return this.sabout;
	}

	public void setSabout(String sabout) {
		this.sabout = sabout;
	}

	public String getPoprice() {
		return this.poprice;
	}

	public void setPoprice(String poprice) {
		this.poprice = poprice;
	}

}