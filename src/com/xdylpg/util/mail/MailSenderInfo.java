package com.xdylpg.util.mail;


import java.util.Properties;


	   
	public class MailSenderInfo  {   
	    private String mailServerHost = "smtp.qq.com";   
	    private String mailServerPort = "25";   
	    private String fromAddress = "1007564224@qq.com";   
	    private String toAddress;   
	    private String userName = "1007564224@qq.com";   
	    private String password = "?kv%32784";   
	    private boolean validate = false;   
	    private String subject;   
	    private String content;   
	    private String[] attachFileNames; 
	    
	    public MailSenderInfo(){
	    	this.content="<html>xxURLxx</html>";
	    }
	    public MailSenderInfo(String email){
	    	setToAddress(email);
	    	this.content="<html>xx<a href='URL'>URL</a>xx</html>";
	    }
	    
	    public Properties getProperties(){   
	      Properties p = new Properties();   
	      p.put("mail.smtp.host", this.mailServerHost);   
	      p.put("mail.smtp.port", this.mailServerPort);   
	      p.put("mail.smtp.auth", validate ? "true" : "false");   
	      return p;   
	    }   
	    public String getMailServerHost() {   
	        return mailServerHost;   
	      }   
	      public void setMailServerHost(String mailServerHost) {   
	        this.mailServerHost = mailServerHost;   
	      }  
	      public String getMailServerPort() {   
	        return mailServerPort;   
	      }  
	      public void setMailServerPort(String mailServerPort) {   
	        this.mailServerPort = mailServerPort;   
	      }  
	      public boolean isValidate() {   
	        return validate;   
	      }  
	      public void setValidate(boolean validate) {   
	        this.validate = validate;   
	      }  
	      public String[] getAttachFileNames() {   
	        return attachFileNames;   
	      }  
	      public void setAttachFileNames(String[] fileNames) {   
	        this.attachFileNames = fileNames;   
	      }  
	      public String getFromAddress() {   
	        return fromAddress;   
	      }   
	      public void setFromAddress(String fromAddress) {   
	        this.fromAddress = fromAddress;   
	      }  
	      public String getPassword() {   
	        return password;   
	      }  
	      public void setPassword(String password) {   
	        this.password = password;   
	      }  
	      public String getToAddress() {   
	        return toAddress;   
	      }   
	      public void setToAddress(String toAddress) {   
	        this.toAddress = toAddress;   
	      }   
	      public String getUserName() {   
	        return userName;   
	      }  
	      public void setUserName(String userName) {   
	        this.userName = userName;   
	      }  
	      public String getSubject() {   
	        return subject;   
	      }  
	      public void setSubject(String subject) {   
	        this.subject = subject;   
	      }  
	      public String getContent() {   
	        return content;   
	      }  
	      public void setContent(String textContent) {   
	    	  
	        this.content = this.content.replaceAll("URL", textContent);   
	      }   
	      


}
	
