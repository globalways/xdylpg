<%@page import="java.awt.image.ConvolveOp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=utf-8"
	import="com.xdylpg.ORM.Comconsor"
	import="java.util.Date"
	 import="com.xdylpg.ORM.CBInfo"
%>  

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	@SuppressWarnings("unchecked")
	Map<Comconsor,TreeSet<Comconsor>> allCCSMap = (TreeMap<Comconsor,TreeSet<Comconsor>>)session.getAttribute("allCCSMap");
	int current_sort = Integer.parseInt(request.getAttribute("current_sort").toString());
%>
<%
CBInfo com_main = (CBInfo)request.getSession().getAttribute("admin_currentCom");
 %>
<!DOCTYPE HTML>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="./css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" type="text/css" href="./css/my.css" />
	<link rel="icon" href='../admin/<%=com_main.getIcoimg() %>' type="image/x-icon" />
    <script type="text/javascript" src="./js/jquery-1.8.0.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
    $(document).ready(function(){
    $("li.active").parents("div.accordion-body").addClass("in");
    });
    </script>
  </head>
  <body>
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12">
        <div class="row-fluid">
          <div class="span3">

            <!-- 管理员信息 -->
            <div class="row-fluid">
              <div class="span12">
                <p  class="text-right">
                  <h4>管理员XXX您好</h4>
                  <a href="#">sign out</a>
                 </p>
              </div>
            </div>
            <!-- 分类列表 -->
            <div class="accordion" id="accordion-969416">
			<%
				if(allCCSMap != null)
				{
					Set<Comconsor> pSet = allCCSMap.keySet();
					Iterator<Comconsor> fIter = pSet.iterator();
					while(fIter.hasNext())
					{
						Comconsor pCCS = fIter.next();
						
/* 						if(pCCS.getSortype().equals(1))
						{
							out.print("<a href='www.baidu.com'><div class='accordion-group'><div class='accordion-heading'><a class='accordion-toggle' data-toggle='collapse' data-parent='#accordion-969416' href='com-cpc-browse?sort="+pCCS.getSornum()+"'><i class='icon-briefcase pull-right'></i>"+pCCS.getSorname()+"</a></div></a>");
							//continue;
						}else */
						//head
						out.print("<div class='accordion-group'><div class='accordion-heading'><a class='accordion-toggle' data-toggle='collapse' data-parent='#accordion-969416' href='#accordion-element-"+pCCS.getSornum()+"'><i class='icon-briefcase pull-right'></i>"+pCCS.getSorname()+"</a></div>");
						//element start
						out.print("<div id='accordion-element-"+pCCS.getSornum()+"' class='accordion-body collapse'><div class='accordion-inner'><ul class='nav nav-list bs-docs-sidenav'>");
						
						TreeSet<Comconsor> cSet = allCCSMap.get(pCCS);
						Iterator<Comconsor> cIter = cSet.iterator();
						while(cIter.hasNext())
						{
							Comconsor cCCS = cIter.next();
							if(current_sort == cCCS.getSornum().intValue())
							out.print("<li class='active'><a href='com-cpc-browse?sort="+cCCS.getSornum()+"'><i class='icon-chevron-right'></i>"+cCCS.getSorname()+"</a></li>");
							else out.print("<li><a href='com-cpc-browse?sort="+cCCS.getSornum()+"'><i class='icon-chevron-right'></i>"+cCCS.getSorname()+"</a></li>");
						}
						//end
						out.print("</ul></div></div></div>");
					}
				}
			
			 %>
			
			
              <!-- 第一组 -->
              <div class="accordion-group">
                <div class="accordion-heading">
                   <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-969416" href="#accordion-element-181694">
                    <i class="icon-briefcase pull-right"></i>其他设置</a>
                </div>
                <div id="accordion-element-181694" class="accordion-body collapse">
                  <div class="accordion-inner">
                 
                      <ul class="nav nav-list bs-docs-sidenav">
                        <li class="nav-header">系统信息</li> 
                        <li class='<%=current_sort == -2 ? "active" : "" %>'><a href="com-cpc-carousel"><i class="icon-chevron-right"></i>网站信息设置</a></li>
                        <li class='<%=current_sort == 0 ? "active" : "" %>'><a href="com-ccs-browse"><i class="icon-chevron-right"></i>网站栏目管理</a></li>
                         <li class="divider"></li>
                         <li class="nav-header">业务处理</li> 
                       <li><a href="#dropdowns"><i class="icon-chevron-right"></i>网站业务处理</a></li>
                      </ul>
                  </div>
                </div>
              </div>

              <!-- 第二组 -->
<!--               <div class="accordion-group">
                <div class="accordion-heading">
                   <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-969416" href="#accordion-element-598597">
                    <i class="icon-tasks pull-right"></i>内容维护</a>
                </div>
                <div id="accordion-element-598597" class="accordion-body in collapse">
                  <div class="accordion-inner">
                      <ul class="nav nav-list bs-docs-sidenav">
                        
                        <li class="nav-header">内容管理</li>
                        <li><a href="./shangjialiebiao.jsp"><i class="icon-chevron-right"></i>全&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;部</a></li>
                        <li><a href="#overview"><i class="icon-chevron-right"></i>企业公司</a></li>
                        <li><a href="#transitions"><i class="icon-chevron-right"></i>商铺商店</a></li>
                        <li><a href="#modals"><i class="icon-chevron-right"></i> 生活服务</a></li>
                        <li><a href="#dropdowns"><i class="icon-chevron-right"></i> 公共单位</a></li>
                        <li class="active"><a href="#overview"><i class="icon-chevron-right"></i><i class="icon-plus pull-right"></i>添&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;加</a></li>
                        <li class="divider"></li>
                        <li class="nav-header">模板修改</li>
                        <li><a href="#scrollspy"><i class="icon-chevron-right"></i> 企业模板修改 </a></li>
                        <li><a href="#tabs"><i class="icon-chevron-right"></i> 生活服务&商铺</a></li>
                        <li><a href="#tabs"><i class="icon-chevron-right"></i> 公共单位 </a></li>
                        <li class="divider"></li>
                        <li><a href="#tabs"><i class="icon-chevron-right"></i> 回收站 </a></li>
                      </ul>
                  </div>
                </div>
              </div>
              第三组
              <div class="accordion-group">
                <div class="accordion-heading">
                   <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-969416" href="#accordion-element-598598">
                    <i class="icon-user pull-right"></i>栏目管理</a>
                </div>
                <div id="accordion-element-598598" class="accordion-body collapse">
                  <div class="accordion-inner">
                      <ul class="nav nav-list bs-docs-sidenav">
                        <li class="nav-header">商家账号</li>
                        <li class="active"><a href="#"><i class="icon-chevron-right"></i>账户列表</a></li>
                        <li><a href="#"><i class="icon-chevron-right"></i>添加账号</a></li>
                        <li class="divider"></li>
                        <li class="nav-header">个人信息</li> 
                        <li><a href="#tooltips"> 资料修改</a></li><li><a href="#tabs"><i class="icon-chevron-right"></i> 回收站 </a></li>
                      </ul>
                  </div>
                </div>
              </div> -->


            </div>
          </div>

          <div class="span9">
            <!-- span12 占空行 -->
            <div class="span12"></div>
                <%
                	String url;
       			    if(request.getAttribute("url") != null)
       			    	url = (String)request.getAttribute("url");
       			    else
       			    	url="gsqy_main_default.jsp";
       			    
                	
                 %>
                <jsp:include page='<%=url %>' flush="true"  />


        </div>
      </div>
    </div>
  </div>
</div>
  </body>
</html>
