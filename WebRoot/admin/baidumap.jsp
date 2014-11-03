<%@ page  pageEncoding="UTF-8"%>
<!-- Modal -->
			<div id="mapModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display:none;" >
			  <div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			    <h3 id="myModalLabel">标记一个位置</h3>
			  </div>
			  <div class="modal-body" style="padding:0px;">
			  <div id="mapcontainer" ></div>
			  </div>
			  <div class="modal-footer">
			    <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
			    <button class="btn btn-primary" onclick="getPos()">确定</button>
			  </div>
			</div>
			<script type="text/javascript"> 
			var mark;
			var map = new BMap.Map("mapcontainer"); 
			//map.centerAndZoom("成都",12);
			//map.setZoom(12);
			//map.setCenter("新都"); 
			map.enableScrollWheelZoom();
			
		//var marker1 = new BMap.Marker(new BMap.Point(116.384, 38.915));  // 创建标注
		//map.addOverlay(marker1);              // 将标注添加到地图中
			
			var mkrTool = new BMapLib.MarkerTool(map, {autoClose: true, followText: "标记一个点"});
			mkrTool.open();
			mkrTool.addEventListener("markend", function(e) { 
					e.marker.enableDragging();  
			       mark = e.marker;
			       });
			var tempP;
			function getPos()
			{
				$("#inputLocation").val(mark.getPosition().lng + "," +     mark.getPosition().lat);
				$('#mapModal').modal('hide');
				//$('#mapModal').removeAttr("style");
				//$("#mapModal").css("visibility","hidden");
				//alert("您标注的位置：" +     mark.getPosition().lng + ", " +     mark.getPosition().lat);    
			}
			function showMap()
			{
				var oldLocation = $("#inputLocation").val();
				if(oldLocation != "" && oldLocation != null)
				{
					var loAr = new Array();
					loAr = oldLocation.split(",");
					tempP = new BMap.Point(loAr[0], loAr[1]);
					if(mark == null)
					{
						mark = new BMap.Marker(tempP);
						mark.enableDragging();
						map.addOverlay(mark); 
						mkrTool.close(); 
					}else mark.setPosition(tempP);
					
				}
					$('#mapModal').modal('show');
			}
			$(document).ready(function(){
				$('#mapModal').on('shown', function () {
					if(tempP != null) //有坐标的情况
					{
						map.centerAndZoom(tempP,12 );
					}
					else
						map.centerAndZoom("成都",12);
				});
			});
			</script>

