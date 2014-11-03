<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" 
	import="com.xdylpg.ORM.BusAdmin"
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
   BusAdmin admin = (BusAdmin)session.getAttribute("admin");
 %>
<!DOCTYPE html>
<html>
  <head>
    <title>欢迎</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="<%=basePath %>res/tp/bs/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <script src="<%=basePath %>res/tp/jquery.js"></script>
    <script src="<%=basePath %>res/tp/bs/js/bootstrap.min.js"></script>
     <link href="<%=basePath %>res/tp/bs/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>res/css/adm-pub.css" />
  </head>
  <body>
  <input type="hidden" name="nav" value='1-nav' />
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12">
        <div class="row-fluid">
          <div class="span3">

            <!-- 管理员信息 -->
            <%@include file="user_info_area.jsp" %>
            <!-- 分类列表 -->
            <%@include file="function_list.jsp" %>
          </div>

          <div class="span9">
            <!-- span12 占空行 -->
            <div class="span12"></div>
            <!-- 站点导航开始 -->
             <%@include file="nav.jsp" %>
            <!-- 站点导航结束 -->
                                                         
            <!-- 内容开始 -->
            welcome!
            

 			 <!-- 内容结束 -->

        </div>
      </div>
    </div>
  </div>
</div>
  </body>
</html>