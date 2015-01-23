package com.test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.xdylpg.ORM.Auth;

public class Tester {
	private String public_name;
	private String public_addr;
	public String getPublic_name() {
		return public_name;
	}
	public void setPublic_name(String public_name) {
		this.public_name = public_name;
	}
	public String getPublic_addr() {
		return public_addr;
	}
	public void setPublic_addr(String public_addr) {
		this.public_addr = public_addr;
	}
	
	public static void mian(String args[])
	{
		/*String url = "127.0.0.1:8080/xdylpg/admin/com-cpc-index";
		Pattern p = Pattern.compile("*com-[a-z]{3}-[a-z]{3}");
		Matcher m = p.matcher(url);
		System.out.println(m.matches());*/
		int a = 2;
		int b = 1;
		
		System.out.println(a&b);
	}

} 