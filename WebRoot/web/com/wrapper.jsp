<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
CBInfo com_wrapper = (CBInfo)request.getSession().getAttribute("com");
 %>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="./res/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" type="text/css" href="./com/com.css" />
	<link rel="icon" href='../admin/<%=com_wrapper.getIcoimg() %>' type="image/x-icon" />
    <script src="./res/jquery-1.8.0.min.js"></script>
    <script src="./res/bootstrap.min.js"></script>
    <script type="text/javascript" src="./res/li-active.js"></script>
  </head>
<body>

    <div class="container">

      <div class="masthead">
		<%@include file="top.jsp" %>
        <%@include file="navbar.jsp" %>
      </div>

	  <%@include file="jumbotron.jsp" %>

			<%
                	String url;
       			    if(request.getAttribute("template") != null)
       			    	url = (String)request.getAttribute("template");
       			    else
       			    	url="default.jsp";
       			    
                	
                 %>
                <jsp:include page='<%=url %>' flush="true"  />
      <hr>
	  <%@include file="foot.jsp"  %>

    </div> <!-- /container -->
</body>
</html>
