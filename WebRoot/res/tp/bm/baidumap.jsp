<%@ page  pageEncoding="UTF-8"%>
<!-- Modal -->
			<div id="mapModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display:none;" >
			  <div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			    <h3 id="myModalLabel">查看地图</h3>
			  </div>
			  <div class="modal-body" style="padding:0px;">
			  <div id="mapcontainer" style="height:400px;"></div>
			  </div>
			  <div class="modal-footer"><%--
			    <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
			    --%><button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">确定</button>
			  </div>
			</div>
			<script type="text/javascript"> 
			var mark; //Marker
			var center; //pointer
			var  infoWindow;
			function showMap(name,location,addr,phone)
			{
				var oldLocation = location;
				if(oldLocation != "" && oldLocation != null)
				{
					var loAr = new Array();
					loAr = oldLocation.split(",");
					center = new BMap.Point(loAr[0], loAr[1]);
					mark = new BMap.Marker(center);
					//mark.enableDragging();
					
					var licontent="<b>"+name+"</b><br>";
				       licontent+="<span><strong>地址：</strong>"+addr+"</span><br>";
				       licontent+="<span><strong>电话：</strong>"+phone+"</span><br>";
				       licontent+="<span class=\"input\"><strong></strong><input class=\"outset\" type=\"text\" name=\"origin\" value=\"成都\"/><br /><input class=\"outset-but btn\" type=\"button\" value=\"公交\" onclick=\"gotobaidu(1)\" /> <input class=\"outset-but btn\" type=\"button\" value=\"驾车\"  onclick=\"gotobaidu(2)\"/><a class=\"gotob\" href=\"url=\"http://api.map.baidu.com/direction?destination=latlng:"+mark.getPosition().lat+","+mark.getPosition().lng+"|name:"+name+"&output=html\" target=\"_blank\"></a></span>";
				       var hiddeninput="<input type=\"hidden\" value=\""+'成都'+"\" name=\"region\" /><input type=\"hidden\" value=\"html\" name=\"output\" /><input type=\"hidden\" value=\"driving\" name=\"mode\" /><input type=\"hidden\" value=\"latlng:"+mark.getPosition().lat+","+mark.getPosition().lng+"|name:"+name+"\" name=\"destination\" />";
				      var content1 ="<form id=\"gotobaiduform\" action=\"http://api.map.baidu.com/direction\" target=\"_blank\" method=\"get\">" + licontent +hiddeninput+"</form>";
				       var opts1 = { width: 300 };

				      infoWindow = new BMap.InfoWindow(content1, opts1);
				 mark.addEventListener('click',function(){ mark.openInfoWindow(infoWindow);});
					
				}
				else{
					alert('暂时没有地图');
					return;
				}
					$('#mapModal').modal('show');
			}
			
			function gotobaidu(type)
			{
			    if($.trim($("input[name=origin]").val())=="")
			    {
			        alert("请输入起点！");
			        return;
			    }else{
			        if(type==1)
			        {
			            $("input[name=mode]").val("transit");
			            $("#gotobaiduform")[0].submit();
			        }else if(type==2)
			        {
			            $("input[name=mode]").val("driving");
			            $("#gotobaiduform")[0].submit();
			        }
			    }
			}
			$(document).ready(function(){
				$('#mapModal').on('shown', function () {
					var map = new BMap.Map("mapcontainer"); 
					map.enableScrollWheelZoom();
					map.centerAndZoom(center,12 );
					map.addOverlay(mark); 
					mark.openInfoWindow(infoWindow);
				});
			});
			</script>

