<%@ page language="java" pageEncoding="UTF-8"
	import="java.util.*" 
	import="com.xdylpg.ORM.Comconsor"
	import="com.xdylpg.ORM.Cpcontent"
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
			  <%
/* 			  		out.print("<ul class='thumbnails'>");
			  		for(Cpcontent c : cpclist)
			  		{
			  			out.print("<li class='span4'><div class='thumbnail'>");
			  			out.print("<img src='"+c.getIndimg()+"' alt=''>");
			  			out.print("<h3>"+c.getContit()+"</h3>");
			  			//out.print("<p>Thumbnail caption...</p>");
			  			out.print("<p><a class='btn' href='com-c?cnum="+c.getContnum()+"'>view details</a></p>");
			  			out.print("</div></li>");
			  		}
			  		out.print("</ul>"); */
			  		
			  		
			  		int i = 0;
			  		for(;i<cpclist.size();i++)
			  		{
			  			if(i%3 == 0)
			  			out.print("<div class='row-fluid'><ul class='thumbnails'>");
			  			out.print("<li class='span4'><div class='thumbnail'>");
			  			out.print("<img src='"+cpclist.get(i).getIndimg()+"' alt=''>");
			  			out.print("<h3>"+cpclist.get(i).getContit()+"</h3>");
			  			//out.print("<p>Thumbnail caption...</p>");
			  			out.print("<p><a class='btn' href='com-c?cnum="+cpclist.get(i).getContnum()+"'>view details</a></p>");
			  			out.print("</div></li>");
			  			
			  			if(i%3 == 2)
			  			out.print("</ul></div>");
			  		}
			  		
			  		
/* 			  		int i = 0;
			  		for(;i<cpclist.size();i++)
			  		{
			  			if(i%3 == 0)
			  			out.print("<div class='row-fluid'>");
			  			out.print("<div class='span4'>");
			  			out.print("<img src="+cpclist.get(i).getIndimg()+" />");
			  			out.print("<h5>");
			  			out.print(cpclist.get(i).getContit());
			  			out.print("</h5>");
			  			out.print("<p><a class='btn' href='com-c?cnum="+cpclist.get(i).getContnum()+"'>view details</a></p></div>");
			  			if(i%3 == 2)
			  			out.print("</div>");
			  		} */
			   %>
	        </div><!--/span-->
	    </div>

