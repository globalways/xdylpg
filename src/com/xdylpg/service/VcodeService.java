package com.xdylpg.service;

import com.xdylpg.ORM.Vcode;

public interface VcodeService {
	/**
	 * add a record of new vcode 
	 * @param v 
	 * <br> a new vcode object add to database
	 * @return Boolean <br>true if success
	 */
	public boolean AddVcode(Vcode v);
	
	
	/**
	 * delete vcode by given code;
	 * @param code
	 * @return Boolean
	 */
	public boolean DelVcode(String code);
	
	/**
	 * load specify vcode by given code<BR>
	 * @param mail
	 * @return Vcode
	 */
	public Vcode loadVcodeByMail(String mail);
	
	/**
	 * load the specify code<br>
	 * return a Vcode otherwise return null
	 * @param code
	 * @return Vcode
	 */
	public Vcode loadVcodeByCode(String code);
	
	/**
	 * delete all of the expiration<br>
	 * return ture if success 
	 * @return Boolean
	 */
	public boolean DelExpiration();
	
	/**
	 * generate verify code 
	 * @return code String 
	 */
	public String generateCode();
}
