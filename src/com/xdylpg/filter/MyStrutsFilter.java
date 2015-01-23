package com.xdylpg.filter;

import java.io.IOException;  
import javax.servlet.FilterChain;  
import javax.servlet.ServletException;  
import javax.servlet.ServletRequest;  
import javax.servlet.ServletResponse;  
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;  

import com.lowagie.text.pdf.codec.Base64;
import com.xdylpg.ORM.Auth;
import com.xdylpg.ORM.BusAdmin;
import com.xdylpg.util.T;
  
public class MyStrutsFilter extends StrutsPrepareAndExecuteFilter {  
    public void doFilter(ServletRequest req, ServletResponse res,FilterChain chain) throws IOException, ServletException {  
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
        
        //不过滤的url  
        String  url = request.getRequestURL().toString();  
        Cookie hasCookie = null;
        if (url.contains("/ueditor/jsp/") || url.contains("restful")) {  
            chain.doFilter(req, res);  
        }else if( (url.contains("/admin/")&&(!url.contains("login"))) || url.contains("/user/") ){
        	BusAdmin admin = (BusAdmin)request.getSession().getAttribute("admin");
        	if(null == admin)
        	{
        		response.sendRedirect(basePath+"/login");
        	}else{
        		Auth a = T.UrlAuthManage(url);
        		
        		if(admin.getAuth().getAuthnum() >= a.getAuthnum())
        		{
        			super.doFilter(req, res, chain);
        		}
        		else { response.sendRedirect(basePath+"/login"); }
        	}
		//super.doFilter(request, res, chain);
        }
        else{  
        
            super.doFilter(req, res, chain);  
        }  
    }  
}  

//try to get cookie
/*Cookie[] cs = request.getCookies();
if(null != cs)
for(Cookie tmp : cs)
{
	if(tmp.getName().equals("BB"))
	{
		hasCookie = tmp;
		break;
	}
}
if(null == hasCookie)	//是否有可用cookie
	response.sendRedirect("login.jsp");
else{
	//取得cookie
	response.sendRedirect("login.jsp");
	//do something....
	//super.doFilter(request, res, chain);
}


Cookie c = new Cookie("BB",admin.getAdmacc());
c.setMaxAge(24*60*60);
c.setDomain("127.0.0.1");
response.addCookie(c); */
