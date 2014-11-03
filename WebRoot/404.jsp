<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>404</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>res/tp/bs/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath %>res/tp/bs/css/bootstrap-responsive.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath %>res/css/list.css" />
	<script type="text/javascript" src="<%=basePath %>res/tp/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath %>res/tp/bs/js/bootstrap.min.js"></script>
	
  </head>
  <body>
  
  <div class="container">

     page not found

    </div>
  </body>
</html>
