<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=utf-8"
	import="com.xdylpg.ORM.Comconsor"
%>  

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	Comconsor ccs =  (Comconsor)request.getAttribute("ccs");
	String sortOptions = (String)request.getAttribute("sortOptions");
	String sortTypes = (String)request.getAttribute("sortTypes");
	if(ccs == null)
	ccs = new Comconsor();
%>

<!DOCTYPE HTML>
<html>
  <head>
    <title>添加商家</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="./css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" type="text/css" href="./css/my.css" />

    <script type="text/javascript" src="./js/jquery-1.8.0.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
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
                  <h4>管理员XX您好</h4>
                  <a href="#">sign out</a>
                 </p>
              </div>
            </div>
            <!-- 分类列表 -->
            <div class="accordion" id="accordion-969416">

              <!-- 第一组 -->
              <div class="accordion-group">
                <div class="accordion-heading">
                   <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-969416" href="#accordion-element-181694">
                    <i class="icon-briefcase pull-right"></i>系统设置</a>
                </div>
                <div id="accordion-element-181694" class="accordion-body collapse">
                  <div class="accordion-inner">
                 
                      <ul class="nav nav-list bs-docs-sidenav">
                        <li class="nav-header">系统信息</li> 
                        <li><a href="./liuyan.jsp"><i class="icon-chevron-right"></i>网站信息设置</a></li>
                        <li><a href="./shenqing.jsp"><i class="icon-chevron-right"></i>网站栏目管理</a></li>
                         <li class="divider"></li>
                         <li class="nav-header">业务处理</li> 
                       <li><a href="#dropdowns"><i class="icon-chevron-right"></i>网站业务处理</a></li>
                      </ul>
                  </div>
                </div>
              </div>

              <!-- 第二组 -->
              <div class="accordion-group">
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
              <!-- 第三组 -->
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
              </div>


            </div>
          </div>

          <div class="span9">
            <!-- span12 占空行 -->
            <div class="span12"></div>
            <!-- 站点导航开始 -->
            <ul class="breadcrumb">
              <li><a href="#">首页</a> <span class="divider">/</span></li>
              <li><a href="#">Library</a> <span class="divider">/</span></li>
              <li class="active">Data</li>
            </ul>
            <!-- 站点导航结束 -->
                                                         
            <!-- 内容开始 -->
				<form class="form-horizontal">
				
				  <!-- public form -->
				  <div class="control-group">
				    <label class="control-label" for="inputEmail">分类</label>
				    <div class="controls">
				      <input type="text" id="inputEmail" placeholder="Email">
				    </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="inputPassword">标题</label>
				    <div class="controls">
				      <input type="password" id="inputPassword" placeholder="Password">
				    </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="inputEmail">作者</label>
				    <div class="controls">
				      <input type="text" id="inputEmail" placeholder="Email">
				    </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="inputEmail">内容</label>
				    <div class="controls">
				      <input type="text" id="inputEmail" placeholder="Email">
				    </div>
				  </div>
				  <!-- public form end -->
				  
				  <!-- album & product start -->
				  <div class='img-up-load'>
					  <div class="control-group">
					    <label class="control-label" for="inputEmail">文章缩略图</label>
					    <div class="controls">
					      <input type="text" id="inputEmail" placeholder="Email">
					    </div>
					  </div>
					  <div class="control-group">
					    <label class="control-label" for="inputEmail">上传图片</label>
					    <div class="controls">
					      <input type="text" id="inputEmail" placeholder="Email">
					    </div>
					  </div>
				  </div>
				  <!-- album & product end -->
				  
				  <div class="control-group">
				    <div class="controls">
				      <label class="checkbox">
				        <input type="checkbox"> Remember me
				      </label>
				      <button type="submit" class="btn">Sign in</button>
				    </div>
				  </div>
				</form>

  			<!-- 内容结束 -->
        </div>
      </div>
    </div>
  </div>
</div>
  </body>
</html>
