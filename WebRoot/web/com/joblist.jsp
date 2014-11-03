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
			   %>
	          <div class="row-fluid">
	            <div class="span4">
	              <h2>Heading</h2>
	              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
	              <p><a class="btn" href="#">View details »</a></p>
	            </div><!--/span-->
	            <div class="span4">
	              <h2>Heading</h2>
	              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
	              <p><a class="btn" href="#">View details »</a></p>
	            </div><!--/span-->
	            <div class="span4">
	              <h2>Heading</h2>
	              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
	              <p><a class="btn" href="#">View details »</a></p>
	            </div><!--/span-->
	          </div><!--/row-->
	          <div class="row-fluid">
	            <div class="span4">
	              <h2>Heading</h2>
	              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
	              <p><a class="btn" href="#">View details »</a></p>
	            </div><!--/span-->
	            <div class="span4">
	              <h2>Heading</h2>
	              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
	              <p><a class="btn" href="#">View details »</a></p>
	            </div><!--/span-->
	            <div class="span4">
	              <h2>Heading</h2>
	              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
	              <p><a class="btn" href="#">View details »</a></p>
	            </div><!--/span-->
	          </div><!--/row-->
	        </div><!--/span-->
	    </div>

