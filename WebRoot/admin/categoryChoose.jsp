<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	import="com.xdylpg.ORM.CBInfo"
	import="com.xdylpg.ORM.BusAdmin"
	import="com.xdylpg.ORM.Category"
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
    <title>商家列表</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="<%=basePath %>res/tp/bs/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" type="text/css" href="./css/my.css" />

    <script src="<%=basePath %>res/tp/jquery.js"></script>
    <script src="<%=basePath %>res/tp/bs/js/bootstrap.min.js"></script>
    <script>
	$(function() {
		// 最后个二级分类块无下划线
		$(".mc").each(function(){
			$(this).find(".sc:last").css("border","none");
		});
		
		// 动态设置heigth属性
		$(".sc").each(function(){
			var tcnum = $(this).find("li").length;
			var height = Math.ceil(tcnum/6)*28;
			$(this).css("height",height+"px");
		});
	});
	</script>
    
    <style type="text/css">
    
    .mc {
		position: relative;
		margin: 35px 0 0 1px;
		padding-top: 15px;
		background-color: #f7f7f9;
		border: 1px solid #e3e3e3;
		-webkit-border-radius: 4px;
		-moz-border-radius: 4px;
		border-radius: 4px;
	}
	.mc-label-div{padding:0 10px 10px 10px;}
	.mc-label i {float:right;margin: 3px 0 0 3px;}
	.sc{
		border-bottom:1px solid #ddd;
		margin-bottom:9px;
		padding-bottom:9px;
		min-height: 28px;
	}
	.sc:hover{
	}
	.sc span.sc-label{padding: 5px 15px 0 0;}
	.sc-container{
		background-color: #fff;
	}
	.sc-container.well
	{
		margin-left: 0px;
		padding: 9px;
		margin-bottom:0px;
		border:none;
	}
	.row-fluid [class*="span"] {
		margin-left: 0;
		min-height:0px;
	}
	.icon-edit,.icon-trash{
		float:right;
		margin-top: 3px;
	}
	.cate-label
	{
		line-height: 20px;
		width: 80%;
		opacity: .65;
		filter: alpha(opacity=65);
		text-align: center;
	}
	.cate-label a
	{
		color: #333;
		text-decoration: none;
		text-shadow: none;
	}
	li.span2 {
	padding: 2px 0px;
	}
    </style>
  </head>
  <body>
  
   <input type="hidden" name="nav" value='2-nav-5' />
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12">
        <div class="row-fluid">
          <div class="span3">

            <!-- 管理员信息 -->
            <%@include file="admin_administrator.jsp" %>
            <!-- 分类列表 -->
            <%@include file="admin_nav.jsp" %>
          </div>

          <div class="span9">
            <!-- span12 占空行 -->
            <div class="span12"></div>
            
            <!-- 站点导航开始 -->
            <%@include file="admin_subnav.jsp" %>
            <!-- 站点导航结束 -->
             <h4>请选择一个分类<small>只能选择带蓝色的分类</small></h4>                                            
            <!-- 内容开始 -->
     		<%
     			TreeMap<Category, TreeMap<Category, ArrayList<Category>>> map = (TreeMap<Category, TreeMap<Category, ArrayList<Category>>>)session.getAttribute("CategorysMap");
     			
     			Iterator<Category> mi = map.keySet().iterator();
     			while(mi.hasNext())
     			{
     				Category mc = mi.next();
     		 %>
            <div class="mc">
            	<div class="mc-label-div">
	            	<span class="mc-label cat-item" >
	            			<%=mc.getBcname() %>
	       			</span>
            	</div>
	            <div class="well row sc-container">
	            	<%
	            		TreeMap<Category, ArrayList<Category>> map2 = map.get(mc);
	            		Set<Category> sSet = map2.keySet();
	            		Iterator<Category> si = sSet.iterator();
	            		while(si.hasNext())
	            		{
	            			Category sc = si.next();
	            	 %>
	            	<div class="sc">
		            	<span class="span2 cat-item sc-label"  >
		              				<%=sc.getBcname() %>
		              				
		              	</span>
		            	<ul class="unstyled span10 tc-container" >
		            		<%
		            			ArrayList<Category> tl = map2.get(sc);
		            			if(tl != null)
		            			for(Category tc : tl)
		            			{
		            		 %>
		              		<li class="span2">
		              			<a href="<%=basePath %>admin/l_f?c=<%=tc.getBcnum() %>" target="_blank" title="<%=tc.getBcname() %>">
		              			<span class="label tc-label cat-item cate-label label-info" >
		              				<%=tc.getBcname().length()<8?tc.getBcname() : subStr(tc.getBcname())  %>
		              			</span>
		              			</a>
		              		</li>
		              		<%} %>
		              	</ul>
	            	</div> <!-- end sc -->
	            	<%} %>
	            </div>
	        </div> <!-- end mc -->
            <%} %>
  			<!-- 内容结束 -->
			<%!
		public String subStr(String to)
		{
			return new StringBuilder(to.substring(0, 6)).append("..").toString();
		}
	 %>
        </div>
      </div>
    </div>
  </div>
</div>
  </body>
</html>