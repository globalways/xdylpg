package com.xdylpg.struts.interceptor;

import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.xdylpg.ORM.BusAdmin;

/** session过期、登录有效性及操作的权限验证拦截器 */
public class LoginedCheckInterceptor extends AbstractInterceptor {

	/** 拦截请求并进行登录有效性验证 */
	public String intercept(ActionInvocation ai) throws Exception {
		//取得请求的URL
		String url = ServletActionContext.getRequest().getRequestURL().toString();
		String prim = null;
		BusAdmin admin = null;
		
		/**
		 * 权限标识
		 */
		int auth = 0;
		//验证Session是否过期
		if(!ServletActionContext.getRequest().isRequestedSessionIdValid()){
			//session过期,转向session过期提示页,最终跳转至登录页面
			return "tologin";
		}else{
			System.out.println(url);
			//对登录与注销请求直接放行,不予拦截
			if (url.indexOf("/login")!=-1 || url.indexOf("admin_logout.action")!=-1){
System.out.println("login");
				return ai.invoke();
			}else{
				admin = (BusAdmin)ServletActionContext.getRequest().getSession().getAttribute("admin");
				//验证是否已经登录
				if (admin==null){
					//尚未登录,跳转至登录页面
					return "tologin";
				}else{
					/*//功能模块与权限位映射,部分可能与前台请求重名的请求加上命名空间"/admin"以示区别
					if (url.indexOf("/admin/")!=-1){//系统用户管理
						auth = 2; //权限位为2
					}else if (url.indexOf("/columns_")!=-1 || url.indexOf("/updateColumns")!=-1){//新闻栏目管理
						auth = 3; //权限位为3
					}
					//取得当前用户的操作权限 1商户账户；2为系统账户
					prim = admin.getAuth().toString();
					//进行权限验证
					if (auth>0){
						if (prim.substring(0,1).equals("1") || prim.substring(auth-1,auth).equals("1")){
							//验证通过,放行
							return ai.invoke();
						}else{
							//验证失败,转向权限验证失败提示页
							return "noprim";
						}
					}else{
						//其它不需要权限验证的请求直接放行
						return ai.invoke();
					}	*/	
					return ai.invoke(); 
				}				
			}			
		}
	}
}