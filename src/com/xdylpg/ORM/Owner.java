package com.xdylpg.ORM;
// default package



/**
 * Owner entity. @author MyEclipse Persistence Tools
 */

public class Owner  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Long hongid;


    // Constructors

    /** default constructor */
    public Owner() {
    }

    
    /** full constructor */
    public Owner(Long hongid) {
        this.hongid = hongid;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Long getHongid() {
        return this.hongid;
    }
    
    public void setHongid(Long hongid) {
        this.hongid = hongid;
    }
   








}