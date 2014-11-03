<%@ page language="java" pageEncoding="UTF-8"
	import="java.util.*" 
	import="com.xdylpg.ORM.Comconsor"
	import="com.xdylpg.ORM.Cpcontent"
%>


<%
	Cpcontent cpc = (Cpcontent)request.getAttribute("cpc");
 %>
      <!-- Example row of columns -->
		<div class="row-fluid">
	        <div class="span12">
	          <div>
	             <%--  <h2 class="text-center"><%=cpc.getContit() %></h2> --%>
	              <p><%=cpc.getContent() %></p>
	          </div><!--/row-->
	        </div><!--/span-->
	    </div>

