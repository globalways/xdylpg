<%@ page language="java" pageEncoding="UTF-8"
	import="java.util.*" 
	import="com.xdylpg.ORM.Comconsor"
	import="com.xdylpg.ORM.Cpcontent"
%>


<%
	List<Comconsor> csl = (List<Comconsor>)request.getAttribute("childSortList");
	Cpcontent cpc = (Cpcontent)request.getAttribute("cpc");
	Comconsor parentsSort = (Comconsor)request.getAttribute("parentsSort");
 %>
      <!-- Example row of columns -->
		<div class="row-fluid">
	        <div class="span3">
	          <div class="well sidebar-nav">
	            <ul class="nav nav-list">
	              <li class="nav-header"><%=parentsSort.getSorname() %></li>
				  <li class="divider"></li>
				  <%
				  		for(Comconsor c : csl)
				  		{
				  			if(cpc.getComconsor().getSornum().equals(c.getSornum()))
				  			out.print("<li class='active'><a href='com-s?sort="+c.getSornum()+"'> "+c.getSorname()+" </a></li>");
				  			else out.print("<li><a href='com-s?sort="+c.getSornum()+"'> "+c.getSorname()+" </a></li>");
				  		}
				   %>
	            </ul>
	          </div><!--/.well -->
	        </div><!--/span-->
	        <div class="span9">
			  <div>
				<ul class="breadcrumb">
				  <li><a href="#">首页</a> <span class="divider">/</span></li>
				  <li><a href="#"><%=parentsSort.getSorname() %></a> <span class="divider">/</span></li>
				  <li class="active"><%=cpc.getComconsor().getSorname() %></li>
				</ul>
			  </div>
	          <div>
	              <h2 class="text-center"><%=cpc.getContit() %></h2>
	              <p><%=cpc.getContent() %></p>
	              <p><a class="btn" href="#">View details »</a></p>
	          </div><!--/row-->
	        </div><!--/span-->
	    </div>

