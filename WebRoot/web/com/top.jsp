<%@ page pageEncoding="UTF-8"
	import="com.xdylpg.ORM.CBInfo"
%>

<%
	CBInfo com = (CBInfo)request.getSession().getAttribute("com");
 %>
<div class="container" id="top">
	<form class="form-search form-inline">
	  <!-- logo -->	
	  <img  src='../admin/<%=com.getLogimg() %>' />
	  <input type="text" class="input-medium search-query offset4">
	  <button type="submit" class="btn">Search</button>
	</form>
	
</div>
