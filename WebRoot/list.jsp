<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	import="com.xdylpg.ORM.Item"
	import="com.xdylpg.ORM.Category"
	import="com.xdylpg.ORM.Shop"
	import="com.xdylpg.ORM.Psu"
	import="java.lang.Math"
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	ArrayList<Item> itemList = (ArrayList<Item>)request.getSession().getAttribute("itemList");
	int p = (Integer)request.getAttribute("p");
	int ps = (Integer)request.getAttribute("ps");
 %>
<!DOCTYPE HTML>
<html>
  <head>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
     .hero-unit{
     	text-align: center;
     } 
     #appendedInput , #appendedButton{
     	padding: 11px;
     	outline: none;
     }
     div.sub-category-content {
		display: none;
	}
     
    </style>
	<link rel="stylesheet" type="text/css" href="<%=basePath %>res/tp/bs/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath %>res/tp/bs/css/bootstrap-responsive.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath %>res/css/list.css" />
	<script type="text/javascript" src="<%=basePath %>res/tp/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath %>res/tp/bs/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=2b866a6daac9014292432d81fe9b47e3"></script>
	<script type="text/javascript" src="<%=basePath %>res/tp/bm/MarkerTool_min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(e) {
		
		var next;
		var navarea = $("#nav-area");
		var cate = $(".bs-docs-sidenav li");
		var navpanel = $(".bs-docs-sidenav");
		
		navpanel.mouseenter(function(){
			navarea.css("display","block");
		}).mouseleave(function(){
			navarea.css("display","none");
		});
		
		
		
		$("body").mouseover(function(){
			next = $(this);
		});
	
		cate.mouseenter(function(){
			var pid = $(this).attr("id");
			
			navarea.html(($(this).find(".sub-category-content").html()));
			$(this).removeClass("nav-normal");
			$(this).addClass("nav-active");
			navarea.attr("pid",pid);
		});
		cate.mouseleave(function(){
			$(this).removeClass("nav-active");
			$(this).addClass("nav-normal");
		});
		navarea.hover(function(){
			var pid = $(this).attr("pid");
			$("#"+pid).removeClass("nav-normal");
			$("#"+pid).addClass("nav-active");
			$(this).css({display:"block"});
		},function(){
			var pid = $(this).attr("pid");
			$("#"+pid).removeClass("nav-active");
			$("#"+pid).addClass("nav-normal");
			$(this).css({display:"none"});
		});
	
		});
	</script>
  </head>
  
  <body>

    <%@include file="top.jsp" %>
    <div class="container">
	<%@include file="search.jsp" %>
	 <div class="container">
      <!-- Example row of columns -->
      <div class="row">
        <div class="span3 bs-docs-sidebar">
        <ul class="nav nav-list bs-docs-sidenav">
        	<%
     			TreeMap<Category, TreeMap<Category, ArrayList<Category>>> map = (TreeMap<Category, TreeMap<Category, ArrayList<Category>>>)session.getAttribute("CategorysMap");
     			
     			Iterator<Category> mi = map.keySet().iterator();
     			int liID = 0;
     			while(mi.hasNext())
     			{
     				liID++;
     				Category mc = mi.next();
     		%>
          <li id='c<%=liID%>' class='nav-normal'><a href="#overview"><i class="icon-chevron-right"></i><%=mc.getBcname() %></a>
          		<div class="sub-category-content">
          			<%
	            		TreeMap<Category, ArrayList<Category>> map2 = map.get(mc);
	            		Set<Category> sSet = map2.keySet();
	            		Iterator<Category> si = sSet.iterator();
	            		while(si.hasNext())
	            		{
	            			Category sc = si.next();
	            	 %>
          			<div class="sub-category">
			            <h4><%=sc.getBcname() %><small></small></h4>
			            <%
		            			ArrayList<Category> tl = map2.get(sc);
		            			if(tl != null)
		            			for(Category tc : tl)
		            			{
		            		 %>
			           	 <span><a href="<%=basePath %>list?type=<%=tc.getBcnum() %>"> <%=tc.getBcname() %></a></span>
			           	 <%} %>
			            <span style="border:0px;"><a href="#">其他>></a></span>
			         </div>
			          <%} %>
          		</div>
          </li>
           <%} %>
        </ul>
      </div>
      <div id="nav-area">
      </div>
      <div class="span6" id="list-area">
      
      <%@include  file="res/tp/bm/baidumap.jsp"%> 
		<ul class="thumbnails">
 <%
 	  if(itemList.size() != 0)
 	  for(int i=(p-1)*ps;i<=ps*p-1;i++)
 	  {
 	  	Item temp;
 	  	try{
 	  		temp = itemList.get(i);
 	  	}catch(IndexOutOfBoundsException e){
 	  		break;
 	  	}
 	  	
 	  StringBuilder homeUrl = new StringBuilder(basePath).append("web/com-home?comnum=");
 	  if(temp instanceof Shop)
 	  	homeUrl = new StringBuilder(basePath).append("web/shop-home?shopnum=");
 	  else if(temp instanceof Psu)
 	  	homeUrl = new StringBuilder(basePath).append("web/psu-home?unitnum=");
  %><li>
   <div class="thumbnail list-item">
    <div class="item-head">
    	 <h4><a href="<%=homeUrl.append(temp.getID())%>" target="_blank"><%=temp.getBusname() %></a></h4>
    </div>
    <div class="item-body">
	    <div class="pull-left item-logo"><img src="./res/img/logo-test.jpg"/></div>
	    <div class="pull-right item-intr"> <p><%=temp.getBusintr() %></p>
	    	<span class="label label-info">公共单位</span>
	    	<span class="label label-info">综合大学</span>
	    	<span class="label label-info">公共单位</span>
	    	<span class="label label-info">综合大学</span>
	    	<span class="label label-info">公共单位</span>
	    	<span class="label label-info">综合大学</span>
	    </div>
    </div>
    <div style="clear:both"></div>
    <div class="item-foot">
		  <a href="javascript:void(0);" onclick="showMap('<%=temp.getBusname() %>','<%=temp.getBusml() %>','<%=temp.getBusaddr() %>','<%=temp.getBusphone() %>')"><i class="icon-map-marker"></i>&nbsp;<%= temp.getBusaddr() %> &nbsp;&nbsp;</a>
		  <abbr title="Phone">电话</abbr> <%=temp.getBusphone() %>
    </div>
   </div>
 </li>
<%}else{ %>
	<li class="alert alert-info">
	  <strong>温馨提示!</strong> 暂时没有内容.
	</li>
<%} %>
</ul>

<div class="pagination agination-centered">
  <ul>
  	<%

 		int	maxPage = (int)Math.ceil(itemList.size()/ps) ;
 		System.out.println("maxPage:"+maxPage);
 		System.out.println("maxPage:"+itemList.size()/ps);
 		if(maxPage > 1)
 		{
 		%>
 		<li><a href="#">Prev</a></li>
 		<%
 		for(int tp=1;tp<=maxPage;tp++)
 		{
 			if(p==tp)
 			{
	 	 %>
	   <li class="active"><a href="#"><%=tp %></a></li>
	   <% }else {%>
	    <li><a href="#"><%=tp %></a></li>
	   <%}} %>
	   <li><a href="#">Next</a></li>
	   <%} %>
  </ul>
</div>
 	 </div>	
      <div	class="span3">
      	span3
      </div>
      </div>
      <hr>

      <footer>
        <p>© Company 2013</p>
      </footer>
	</div>	
</div> <!-- /container -->


  

</body>
</html>
