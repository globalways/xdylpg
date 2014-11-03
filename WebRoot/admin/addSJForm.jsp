<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=utf-8"%>  

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String template = (String)request.getAttribute("url");
%>

<!DOCTYPE HTML>
<html>
  <head>
    <title>添加商家</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="<%=basePath %>res/tp/bs/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>res/css/adm-pub.css" />
	<style type="text/css">  
	 #mapcontainer{height:400px;}
	 #mapcontainer img{max-width: none;}
	 #images ul{height: 0px;}
	</style>
    <script type="text/javascript" src="<%=basePath %>res/tp/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath %>res/tp/bs/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=2b866a6daac9014292432d81fe9b47e3"></script>
	<script type="text/javascript" src="<%=basePath %>res/tp/bm/MarkerTool_min.js"></script>
  </head>
  <body>
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12">
        <div class="row-fluid">
          <div class="span3">

            <!-- 管理员信息 -->
            <%@include file="admin_administrator.jsp" %>
            <!-- 分类列表 -->
            <%@include file="admin_nav.jsp" %>
          </div>

          <div class="span9">
            <!-- span12 占空行 -->
            <div class="span12"></div>
            <!-- 站点导航开始 -->
             <%@include file="admin_subnav.jsp" %>
            <!-- 站点导航结束 -->
                                                         
            <!-- 内容开始 -->
            <div id="category-content">
          	<%@include  file="baidumap.jsp"%> 
            <h4 class="muted"> 请填写相应资料：</h4>
           <%--  <%@include file="mapModal" %> --%>
            <jsp:include page="<%=template %>" />
            </div>
            
  			<!-- 内容结束 -->

        </div>
      </div>
    </div>
  </div>
</div>
  </body>
</html>
