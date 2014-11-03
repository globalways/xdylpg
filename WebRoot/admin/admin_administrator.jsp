<%@ page language="java" pageEncoding="UTF-8"
	import="com.xdylpg.ORM.BusAdmin"
%>

<% 
	BusAdmin admin = (BusAdmin)session.getAttribute("admin");
%>

<div class="row-fluid">
     <div class="span12">
       <p  class="text-right">
         <h4><%=admin.getAdmacc() %></h4>
         <a href="#">注销</a>
        </p>
     </div>
</div>
