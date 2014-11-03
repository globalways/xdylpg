<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Hello, World</title>  
    <style type="text/css">  
	 #mapcontainer{height:400px;}
	 #mapcontainer img{max-width: none;}
	</style>
	<link rel="stylesheet" type="text/css" href="<%=basePath %>res/tp/bs/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath %>res/tp/bs/css/bootstrap-responsive.min.css" />
	<script type="text/javascript" src="<%=basePath %>res/tp/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath %>res/tp/bs/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=2b866a6daac9014292432d81fe9b47e3"></script>
	<script type="text/javascript" src="<%=basePath %>res/tp/bm/MarkerTool_min.js"></script>  
  </head>
  
  <body>
    <div>
    
    	<a href="#mapModal" role="button" class="btn" data-toggle="modal">查看演示案例</a>
 
		<!-- Modal -->
		<div id="mapModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-header">
		    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		    <h3 id="myModalLabel">标记一个位置</h3>
		  </div>
		  <div class="modal-body" style="padding:0px;">
		  <div id="mapcontainer"></div>
		  </div>
		  <div class="modal-footer">
		    <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
		    <button class="btn btn-primary" onclick="getPos()">确定</button>
		  </div>
		</div>
    </div> 
	<script type="text/javascript"> 
	var mark;
	var map = new BMap.Map("mapcontainer"); 
	map.centerAndZoom(new BMap.Point(116.404, 39.915), 12);
	map.setZoom(12);
	map.setCenter("新都"); 
	map.enableScrollWheelZoom();
	
//var marker1 = new BMap.Marker(new BMap.Point(116.384, 38.915));  // 创建标注
//map.addOverlay(marker1);              // 将标注添加到地图中
	
	var mkrTool = new BMapLib.MarkerTool(map, {autoClose: true, followText: "标记一个点"});
	mkrTool.open();
	mkrTool.addEventListener("markend", function(e) { 
			e.marker.enableDragging();  
	       mark = e.marker;
	       });

	function getPos()
	{
		alert("您标注的位置：" +     mark.getPosition().lng + ", " +     mark.getPosition().lat);    
	}
	/* function getPixel()
	{
		var p = new BMap.Point(116.404, 38.915);
		alert(map.pointToPixel(p).x+" -- "+map.pointToPixel(p).y);
	} */
	</script> 
  </body>
</html>
