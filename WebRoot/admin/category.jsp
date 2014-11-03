<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	import="com.xdylpg.ORM.CBInfo"
	import="com.xdylpg.ORM.BusAdmin"
	import="com.xdylpg.ORM.Category"
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%!
	public String subStr(String to)
	{
		return new StringBuilder(to.substring(0, 3)).append("..").toString();
	}
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
    <script src="<%=basePath %>res/tp/jqui/jquery-ui.custom.min.js"></script>
    <script src="<%=basePath %>res/tp/jquery.json-2.2.min.js"></script>
    <script>
	$(function() {
		$(".tc-container" ).sortable();
		$(".sc-container").sortable({
			start: function(event, ui ){
				$(".sc").css("border","none");
				ui.item.css("border","1px solid #ddd");
				ui.item.css("background-color", "#f7f7f9");
			},
  			stop: function( event, ui ) {
  				ui.item.css("border","none");
  				ui.item.css("background-color", "#fff");
  				$(".sc").css("border-bottom","1px solid #ddd");
  				$(".sc:last").css("border","none");
  			}
		});
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
		
		
		
		
		$(".label i").hover(function(){
			$(this).addClass("icon-white");
		},function(){
			$(this).removeClass("icon-white");
		});
		
		$(".label-plus").hover(function(){
			$(this).find("i").addClass("icon-white");
		},function(){
			$(this).find("i").removeClass("icon-white");
		});
		
		// 配置图标指令对话框参数
		var i = $("i");
		i.each(function(){
			var className = $(this).attr("class");
			var isAction = true;
			if(className == "icon-plus")
				$(this).attr("ac","add");
			else if(className == "icon-edit")
				$(this).attr("ac","edit");
			else if(className == "icon-trash")
				$(this).attr("ac","del");
			else isAction = false;
			if(isAction)
			{
				$(this).addClass("action");
				$(this).parent("a").attr("href","#cate-dialog");
				$(this).parent("a").attr("data-toggle","modal");
			}
			
		});
		// END 配置图标指令对话框参数
		
			
		
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
	}
	.sc:hover{
	}
	.sc span.sc-label{padding: 5px 15px 0 0;}
	.sc span.sc-label:hover{
		cursor:all-scroll;
	}
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
		background-color: #e6e6e6;
		opacity: .65;
		filter: alpha(opacity=65);
		border: 1px solid #ccc;
	}
	.cate-label a
	{
		color: #333;
		text-decoration: none;
		text-shadow: none;
	}
	.label-plus {
		line-height:20px;
		width:80%;
		background: none;
		border: 1px solid #ddd;
		text-align: center;
	}
	.label-plus:hover {
		opacity: .65;
		filter: alpha(opacity=65);
		-webkit-box-shadow: none;
		-moz-box-shadow: none;
		box-shadow: none;
		background-color: #04c;
	}
	li.span2 {
	padding: 2px 0px;
	}
    </style>
  </head>
  <body>
  <input type="hidden" name="nav" value='2-nav-6' />
  <!-- dialog -->
  <script type="text/javascript">
  $(document).ready(function(){
  	$("i.action").click(function(){
  	
  	
  	
  		
  	
  		var siblingsSpanObj = $(this).parents("ul").siblings("span");
  		var pSpanObj = $(this).parents("span");
  		var ac = $(this).attr("ac");
  		
  		if(ac == "add")
  		{
  			var newOrder = $(this).parents("div.mc").find("div.sc").length+1;
  			var parent = pSpanObj;
  			if(parent.attr("bcnum") == null)
  			{parent = siblingsSpanObj;newOrder = $(this).parents("ul.tc-container").find("li").length;}
  			
  			$("#cate-dialog form").attr("action","<%=basePath%>admin/category-save");
  			$(".modal-header h3").text("新增分类");
  			$("#bcpnum span").text(parent.attr("bcname"));
  			$("#bcpnum input").val(parent.attr("bcnum"));
  			$("#bctem span").html(parent.attr("bctem"));
  			$("#bctem input").val(parent.attr("bctem"));
  			$("#bcorder").val(newOrder);
  		}else if(ac == "edit")
  		{
  			$("#cate-dialog form").attr("action","<%=basePath%>admin/category-save");
  			$(".modal-header h3").text("修改分类");
  			var current = pSpanObj;
  			var parent = $("<span>",{bcnum:'0',bcname:'无'});
  			if(current.attr("class").indexOf("tc-label")>0)
  				parent = siblingsSpanObj;
  			else if(current.attr("class").indexOf("sc-label")>0)
  				parent = $(this).parents("div.mc").find("span.mc-label");
  			$("#bcname input").val(current.attr("bcname")); //
  			$("#bcnum input").val(current.attr("bcnum"));
  			$("#bcpnum span").text(parent.attr("bcname"));
  			$("#bcpnum input").val(parent.attr("bcnum"));
  			$("#bctem span").html(current.attr("bctem"));
  			$("#bctem input").val(current.attr("bctem"));
  			$("#bcorder").val(current.attr("order"));
  		}else if(ac == "del")
  		{
  			var current = pSpanObj;
  			$("#cate-dialog form").attr("action","<%=basePath%>admin/category-del");
  			$(".modal-header h3").text("删除分类 - "+current.attr("bcname"));
  			$(".modal-footer button[type='submit']").text("确定");
  			$(".modal-body").html("<input type='hidden' value="+current.attr("bcnum")+" name='bcnum'><p>确定删除吗？</p>");
  		}
  		
  	});
  	
  	$(".close-dialog").click(function(){
  		$("div.modal-body input").val("");$("div.modal-body span").text("");
  	});
  });
  </script>
  <div id="cate-dialog" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  
	  <form class="form-horizontal" action="<%=basePath%>admin/category-save" method="post">
	  <div class="modal-header">
	    <button type="button" class="close close-dialog" data-dismiss="modal" aria-hidden="true">×</button>
	    <h3>Modal header</h3>
	  </div>
	  <div class="modal-body">
		  <div class="control-group" id="bcname">
		    <label class="control-label">分类名称</label>
		    <div class="controls">
		      <input type="text" name="bcname" />
		    </div>
		  </div>
		  <div class="control-group" id="bcpnum">
		    <label class="control-label" >上级分类</label>
		    <div class="controls">
		      <span class="input uneditable-input"></span>
		      <input type="hidden" name="bcpnum"   />
		    </div>
		  </div>
		  <div class="control-group" id="bctem" >
		    <label class="control-label" >模板</label>
		    <div class="controls">
		      <span class="input uneditable-input"></span>
		      <input type="hidden" name="bctem" />
		    </div>
		  </div>
		  <div id="bcnum" class="control-group">
		    <div class="controls">
		      <input type="hidden" name="bcnum"  /> 
		    </div>
		  </div>
		  <input type="hidden" name="bcorder" id="bcorder" />
		
	  </div>
	  <div class="modal-footer">
	    <button class="btn close-dialog" data-dismiss="modal" aria-hidden="true">关闭</button>
	    <button type="submit" class="btn btn-primary">保存</button>
	  </div>
	  </form>
  </div>
  
  
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
	            	<span class="mc-label cat-item" fid=<%=mc.getBcpnum() %> bcnum=<%=mc.getBcnum() %> bcname=<%=mc.getBcname() %> bctem=<%=mc.getBctem() %> order=<%=mc.getBcorder() %>>
	            			<%=mc.getBcname() %>
	            		<a href="#cate-dialog" data-toggle="modal"><i class="icon-plus action" ac="add"></i></a>
	       				<a href="#cate-dialog"  data-toggle="modal"><i class="icon-trash action" ac="del"></i></a>
	       				<a href="#cate-dialog"  data-toggle="modal"><i class="icon-edit action" ac="edit"></i></a>
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
		            	<span class="span2 cat-item sc-label" order=<%=sc.getBcorder() %>  bcnum=<%=sc.getBcnum() %> bcname=<%=sc.getBcname() %> bctem=<%=sc.getBctem()  %> >
		            				<i class="icon-resize-vertical"></i>
		              				<%=sc.getBcname().length()<=4? sc.getBcname() : subStr(sc.getBcname()) %>
		              				<a href="#"><i class="icon-trash"></i></a>
		              				<a href="#"><i class="icon-edit"></i></a>
		              				
		              	</span>
		            	<ul class="unstyled span10 tc-container" >
		            		<%
		            			ArrayList<Category> tl = map2.get(sc);
		            			if(tl != null)
		            			for(Category tc : tl)
		            			{
		            		 %>
		              		<li class="span2">
		              			<span class="label tc-label cat-item cate-label label-info"  title="<%=tc.getBcname() %>"  order=<%=tc.getBcorder() %> fid=<%=tc.getBcpnum() %> bcnum=<%=tc.getBcnum() %> bcname=<%=tc.getBcname() %> bctem=<%=tc.getBctem() %>>
		              				<a href="#"><%=tc.getBcname().length()<=4? tc.getBcname() : subStr(tc.getBcname()) %></a>
		              				<a href="#"><i class="icon-trash"></i></a>
		              				<a href="#"><i class="icon-edit"></i></a>
		              			</span>
		              		</li>
		              		<%} %>
		              		<li class="span2">
		              			<span class="label label-plus">
		              				<a href="#"><i class="icon-plus"></i></a>
		              			</span>
		              		</li>
		              	</ul>
	            	</div> <!-- end sc -->
	            	<%} %>
	            </div>
	        </div> <!-- end mc -->
            <%} %>
            <div style="text-align: center;margin: 19px 0 20px 0;">
            <button id="save-order" type="submit" data-loading-text='正在保存' class="btn btn-primary" autocomplete="off" style="padding-left: 30px;padding-right: 30px; ">保存顺序</button>
            </div>
            <!-- 保存处理 -->
            <script type="text/javascript">
            	$("#save-order").click(function(){
            		$(this).button('loading');
            	
            		$(".mc").each(function(i){
            			$(this).find(".mc-label").attr("order",i+1);
            			$(this).find(".sc").each(function(j){
            					$(this).find(".sc-label").attr("order",j+1);
            					$(this).find(".tc-label").each(function(k){
            						$(this).attr("order",k+1); 
            					});
            					
            				});
            		});
            		
            		var items  =  $(".cat-item");
            		var result = new Array();
            		
            		items.each(function(){
            			var temp = {
            				'bcnum':$(this).attr("bcnum"),
            				'bcorder':$(this).attr("order")
            			};
            			result.push(temp);
            		});
            		$.post('<%=basePath%>admin/category-order',{"orders":$.toJSON(result)},
                    			function(){
                    				$("#save-order").button('reset');
                    			});
            	});
            </script>
  			<!-- 内容结束 -->

        </div>
      </div>
    </div>
  </div>
</div>
  </body>
</html>