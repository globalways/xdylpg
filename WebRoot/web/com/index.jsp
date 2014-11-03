<%@ page language="java"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
CBInfo com_index = (CBInfo)request.getSession().getAttribute("com");
 %>
<!DOCTYPE html>
<html>
  <head>
    <title><%=com_index.getWebtitle() %></title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="./res/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" type="text/css" href="./com/com.css" />
	<link rel="icon" href='../admin/<%=com_index.getIcoimg() %>' type="image/x-icon" />
    <script src="./res/jquery-1.8.0.min.js"></script>
    <script src="./res/bootstrap.min.js"></script>
  </head>
<body>

    <div class="container">

      <div class="masthead">
		<%@include file="top.jsp" %>
        <%@include file="navbar.jsp" %>
      </div>

	  <%@include file="jumbotron.jsp" %>

      <hr>

      <!-- Example row of columns -->
      <div class="row-fluid">
        <div class="span4">
          <h2>Heading</h2>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn" href="#">View details »</a></p>
        </div>
        <div class="span4">
          <h2>Heading</h2>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn" href="#">View details »</a></p>
       </div>
        <div class="span4">
          <h2>Heading</h2>
          <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa.</p>
          <p><a class="btn" href="#">View details »</a></p>
        </div>
      </div>

      <hr>
	  <%@include file="foot.jsp"  %>

    </div> <!-- /container -->
</body>
</html>
