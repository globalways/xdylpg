package com.xdylpg.ORM;
// default package



/**
 * Vcode entity. @author MyEclipse Persistence T
 */

public class Vcode  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private String code;
     private String experation;
     private Integer user;


    // Constructors

    /** default constructor */
    public Vcode() {
    }

	/** minimal constructor */
    public Vcode(String code) {
        this.code = code;
    }
    
    /** full constructor */
    public Vcode(String code, String experation, Integer user) {
        this.code = code;
        this.experation = experation;
        this.user = user;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return this.code;
    }
    
    public void setCode(String code) {
        this.code = code;
    }

    public String getExperation() {
        return this.experation;
    }
    
    public void setExperation(String experation) {
        this.experation = experation;
    }

    public Integer getUser() {
        return this.user;
    }
    
    public void setUser(Integer user) {
        this.user = user;
    }
   








}