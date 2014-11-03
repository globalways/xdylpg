<%@ page language="java" pageEncoding="UTF-8"
	import="java.util.*" 
	import="com.xdylpg.ORM.Comconsor"
	import="com.xdylpg.ORM.Cpcontent"
	import="java.text.SimpleDateFormat"
%>


<%
	List<Comconsor> csl = (List<Comconsor>)request.getAttribute("childSortList");
	List<Cpcontent> cpclist = (List<Cpcontent>)request.getAttribute("cpclist");
	Comconsor parentsSort = (Comconsor)request.getAttribute("parentsSort");
	Comconsor childSort = (Comconsor)request.getAttribute("childSort");
 %>
 	  <title><%=childSort == null ? parentsSort.getPtitle() : childSort.getPtitle() %></title>
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
				  			if(childSort != null && childSort.getSornum().equals(c.getSornum()))
				  				out.print("<li class='active'><a href='com-s?sort="+c.getSornum()+"'> "+c.getSorname()+" </a></li>");
				  			else
				  				out.print("<li><a href='com-s?sort="+c.getSornum()+"'> "+c.getSorname()+" </a></li>");
				  		}
				   %>
	            </ul>
	          </div><!--/.well -->
	        </div><!--/span-->
	        <div class="span9">
			  <div>
				<ul class="breadcrumb">
				  <li><a href="#">首页</a> <span class="divider">/</span></li>
				  <%
				   if(childSort != null)
				 	 {
				 	 	out.print("<li><a href=''>"+parentsSort.getSorname()+"</a> <span class='divider'>/</span></li>");
				  		out.print("<li>"+childSort.getSorname()+"</li>");
				 	 }
				 	 else
				 	 {
				 	 	out.print("<li>"+parentsSort.getSorname()+"</li>");
				 	 }
				  		
				   %>
				</ul>
			  </div>
<%-- 			  <%
			  		int i = 0;
			  		for(;i<cpclist.size();i++)
			  		{
			  			if(i%3 == 0)
			  			out.print("<div class='row-fluid'>");
			  			out.print("<div class='span4'><h2>");
			  			out.print(cpclist.get(i).getContit());
			  			out.print("</h2><p>");
			  			out.print(cpclist.get(i).getContent());
			  			out.print("</p><p><a class='btn' href='com-c?cnum="+cpclist.get(i).getContnum()+"'>view details</a></p></div>");
			  			if(i%3 == 2)
			  			out.print("</div>");
			  		}
			   %> --%>
				<ul class='unstyled'>
				  <%
				  		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
				  		for(Cpcontent c : cpclist)
				  		{
				  			out.print("<li style='border-bottom:#ddd 1px dashed'><h5>["+c.getComconsor().getSorname()+"]&nbsp;&nbsp;<a href='com-c?cnum="+c.getContnum()+"'>"+c.getContit()+"</a><span style='float:right;'><small>"+sdf.format(new Date(c.getAddtime()))+"</small></span></h5></li>");
				  		}
				   %>
				</ul>
	        </div><!--/span-->
	    </div>

