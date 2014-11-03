<%@ page language="java" pageEncoding="UTF-8"
	import="com.xdylpg.ORM.BusAdmin"
%>

<div class="row-fluid">
     <div class="span12">
       <p  class="text-right">
         <h4><%=admin.getAdmacc() %></h4>
         <a href="<%= basePath%>logout">注销</a>
        </p>
     </div>
</div>
