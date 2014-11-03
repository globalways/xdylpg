 <%@page pageEncoding="utf-8" 
 	import="com.xdylpg.ORM.Cpcontent"
 	import="java.util.List"
 	import="java.util.Date"
 	import="java.text.SimpleDateFormat"
 	import="com.xdylpg.ORM.CBInfo"
 	import="net.sf.json.JSONArray"
	import="net.sf.json.JSONObject"
 %>
 
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
 <%
 	 CBInfo o = (CBInfo)request.getSession().getAttribute("admin_currentCom");
 	 String sortName = (String)request.getAttribute("current_sortName");
  %>        
  
  			<head>
  				<title>轮播图片</title>
  				 <link rel="stylesheet" type="text/css" href="<%=basePath %>res/tp/uploadify/uploadify.css" />
  			</head>
  			<script type="text/javascript" src="<%=basePath %>res/tp/uploadify/jquery.uploadify.js"></script>
  			<script type="text/javascript">
  			$(document).ready(function() {

  				$("#uploadify").uploadify({
  					'swf'       : 'uploadify.swf',
  					'uploader'       :'upload',
  					'queueID'        : 'itemArea',
  					'fileTypeDesc'   : 'Image Files',
  			              'fileTypeExts'   : '*.gif; *.jpg; *.png;',
  					'progressData'   :'speed',
  						'auto'           : true,
  					'multi'          : true,
  					'buttonText'	 : '选择文件',
  					'buttonImage'    : 'img/btn.png',
  					'onSelectError': function (file, errorCode, errorMsg) {  
  							            switch (errorCode) {  
  							                case -100: 
  							                    alert("上传的文件数量已经超出系统限制的" + $('#uploadify').uploadify('settings', 'queueSizeLimit') + "个文件！");  
  							                    break;  
  							                case -110:  
  							                    alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#uploadify').uploadify('settings', 'fileSizeLimit') + "大小！");  
  							                    break;  
  							                case -120:  
  							                    alert("文件 [" + file.name + "] 大小异常！");  
  							                    break;  
  							                case -130:  
  							                    alert("文件 [" + file.name + "] 类型不正确！");  
  							                    break;  
  							            }  
  							            return false;  
  							        }, 
  				//	'formData'       :{'name':'wangyangping','sex':'male'},
  					'onUploadSuccess' : function(file, data, response) {
  						$("#images").css("display","block");
  			           $("#images ul").append(genImgItem(data,'')); 
  			        }
  				});
  			});
  			var genImgItem = function(imgAddr,imgDisc)
  			{
  				var str = "<li class='span12' style='margin-left:0px;'>"
  				+"<div class='thumbnail span4'><img imgID='' src='"+imgAddr+"'></div><div class='span8'>"
  				+"<p><span class='label'>图片说明:</span>"
  				+"<a id='deleteImg' class='btn btn-small' href='javascript:void(0);' onclick=deleteImg($(this)) style='float:right;'>删除图片</a></p>"
  				+"<textarea class='span12' style='height: 60px;'>"+imgDisc+"</textarea></div></li>";
  			    return str;
  			};
  		//提交表单
  			var submit = function()
  			{
  				var jsonStr = "[";
  				$("#images ul li").each(function(){
  					
  					var Addr = $(this).find("img").attr("src");
  					//var proNum = $(this).find("img").attr("imgID");
  					var Desc = $(this).find("textarea").val();
  					jsonStr += "{'addr':'"+Addr+"','desc':'"+Desc+"'},";
  				
  				});
  				jsonStr +="]";
  				
  				if($("#status").is(":checked"))
  				$("#status").val(1);
  				else $("#status").val(0);
  				$('form').attr("method","post");
  				$('form').attr("action","<%=basePath%>admin/com-cpc-carousel?save="+jsonStr);
  				//$('body').html(jsonStr);
  				$('form').submit();
  			};
  			//删除图片
  			var deleteImg = function(obj)
  			{
  					//obj.parents("li").slideUp(300);
  					obj.parents("li").remove();
					$.post("com-cpc-delcar",function(){
						submit();
				 		//window.location.reload();
					});
  			};
			</script>
  			
  			<!-- 站点导航开始 -->
            <ul class="breadcrumb">
              <li><a href="com-cpc-index?comnum=<%=o.getComnum() %>"><%=o.getBusname() %></a> <span class="divider">/</span></li>
              <li class='active'>轮播图片</li>
            </ul>
            <!-- 站点导航结束 -->                                 
            <!-- 内容开始 -->
            <%
            String carousel = o.getCarousel();
            
            boolean hasCarousel = true;
			if(carousel==null || carousel.equals(""))
			{%>
				<div class="alert alert-info">
				  <strong>提示！</strong> 暂时没有轮播内容，请添加图片.
				</div>
		
			<%		hasCarousel = false;
			}
			%>
			<div id="images">
		        <ul class='thumbnails'>
		        <% 	
		        if(hasCarousel)
		        {
	        		JSONArray ja = JSONArray.fromObject(carousel);
	        		for(int i=0;i<ja.size();i++)
	        		{
	        			JSONObject jo = ja.getJSONObject(i);
	        			out.println("<script>$('#images').css('display','block'); $('#images ul').append(genImgItem('"+jo.getString("addr")+"','"+jo.getString("desc")+"'));</script>");
	        		}
		        }
				%>
		        </ul>
				
				</div>
				
				<div id="itemArea">
				</div>
				
				<div class='span12'>
				<input  type="file" name="uploadify" id="uploadify" />
				<div id="uploadify-notice">
					<p type="button" class="btn btn-link">
								<span  class="text-center">图片最大5M，支持格式： png jpeg gif&nbsp;&nbsp;</span>
					<span class="label label-info">注意！</span>
					
					</p>
				</div>
				<form action=""></form>
				  <a class="btn btn-primary btn-large" style="width:100px;" href="javascript:submit()">保存</a>
				
		<!-- 		<a class='span1 offset2 btn' href="javascript:jQuery('#uploadify').uploadify('upload','*')">开始上传</a>&nbsp;
				<a class='span1 offset2 btn' href="javascript:$('#uploadify').uploadify('cancel', '*')">取消</a> -->
				
				</div>
  			<!-- 内容结束 -->
       