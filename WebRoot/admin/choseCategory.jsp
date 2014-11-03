<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	import="com.xdylpg.ORM.Category"
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html> 
  <body>
 <h4 class="muted"> 请选择要添加的分类：</h4>
  <%
  	List<Category> list = (List<Category>)request.getAttribute("list");
  	Iterator<Category> i = list.iterator() ;
  	while(i.hasNext())
  	{
  		Category c = i.next();
  		/* 使用ajax */
  		/* out.println("<a href=javascript:addSJ('"+c.getBcnum()+"')>"); */
  		out.println("<a class='btn btn-large btn-primary' href='add_SJ?type="+c.getBcnum()+"'>");
  		out.println(c.getBcname());
  		out.println("</a>");
  	}
   %>
  </body>
</html>
