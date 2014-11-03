<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	import="com.xdylpg.ORM.Shop"
	import="com.xdylpg.ORM.BusAdmin"
	import="com.xdylpg.ORM.Shoppro"
	import="com.xdylpg.ORM.Category"
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%

	Shop model = null;
	Category toCategory = (Category)request.getAttribute("toCategory");
	Object shop = request.getAttribute("busObj");
	if(shop == null)
	{
		model = new Shop();
		BusAdmin ba = new BusAdmin();
		ba.setAdmname("");
		ba.setAdmtel("");
		model.setBusname("");
		model.setPinyinid("");
		model.setBusaddr("");
		model.setBusml("");
		model.setBusphone("");
		model.setShoptem(toCategory.getBctem());
		model.setBusAdmin(ba);
		model.setBusintr("");
		model.setShopnews("");
	}else{
		model = (Shop)shop;
		toCategory = model.getCategory();
	}
 %>

<html>
  <head>
  
  <script type="text/javascript" src="<%=basePath %>res/tp/uploadify/jquery.uploadify.js"></script>
  <script src="<%=basePath %>res/tp/jqui/jquery-ui.custom.min.js"></script>
  <link href="<%=basePath %>res/tp/uploadify/uploadify.css" rel="stylesheet" type="text/css" />
  		<style type="text/css">
			#uploadify
			{
				float:left;margin-left: -37px;
			}
			#uploadify-notice
			{
				margin-left: 50px;
			}
			#uploadify-notice button
			{outline: none;cursor:text;}
			#images{display:none;}
			#images ul,li
			{
				margin:0px;
				
			}
			#images li
			{background-color: #f7f7f9;padding: 10px;}
			#admin-list td:hover
			{
				cursor:pointer;
				background-color:#f2dede;
			}
		</style>
<script type="text/javascript">

$(document).ready(function() {

	$("#uploadify").uploadify({
		'swf'       : 'uploadify.swf',
		'uploader'       :'ul-pro',
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
		'formData'       :{'id':'<%=model.getShopnum() %>'},
		'onUploadSuccess' : function(file, data, response) {
			$("#images").css("display","block");
           $("#images ul").append(genImgItem('',data,'','','','')); 
        }
	});
	
	$("#busadmnum").focus(function(){
		// 加载管理员
		loadBusAdmin();
		$("#busadmnum").blur();
	});
	$("#close").click(function(){$("#admin-list").css("display","none");});
	
});

//显示图片模板
var genImgItem = function(proID,imgAddr,imgDisc,proName,proPri,proNewPri)
{
	var str = "<li class='span12' style='margin-left:0px;'>"
	+"<div class='thumbnail span4'><img imgID='"+proID+"' src='"+imgAddr+"'></div><div class='span8'>"
	+"<p><span class='label'>商品信息:</span>"
	+"<a id='deleteImg' class='btn btn-small' href='javascript:void(0);' onclick=deletePro('"+proID+"',$(this)) style='float:right;'>删除图片</a></p>"
	+"<div class='form-inline' style='margin-top: 20px;margin-bottom: 5px;'>名称:<input type='text' value='"+proName+"' class='input-small span3 proName' style='margin-right: 19px;'>"
  	+"原价:<input type='text' value='"+proPri+"' class='input-small span3 proPri' style='margin-right: 19px;'>"
	+"现价:<input type='text' value='"+proNewPri+"' class='input-small span3 proNewPri'></div>"
	+"介绍:<textarea class='span11' style='height: 60px;'>"+imgDisc+"</textarea></div></li>";
    return str;
};

//管理员显示模板HTML

var genAdmin = function(obj)
{
	return "<td onclick=sm($(this),"+obj.busadmnum+")><strong class='adm-name'>"+obj.name+"</strong><br /><small class='adm-tel'>"+obj.tel+"</small> </td>";
};


//加载所有管理员
var loadBusAdmin = function()
{
	var listarea = $("#admin-list");
	var content = listarea.html().trim();
	if(!content)
	{
		$.getJSON("admin_loadBusAdmin",function(data){
			
			var str = "<a class='close' onclick=close_admlist() href='javascript:void(0);' >&times;</a><br /><br /><table class='table'>";
			var len = data.length;
			for(var i=0;i<len;i++)
			{
				var flag = i+1;
				if(flag%3==1)
					str+="<tr>"+genAdmin(data[i]);
				else if(flag%3==0)
					str+=genAdmin(data[i])+"</tr>";
				else
					str += genAdmin(data[i]);
			}
			str += "</table>";
			listarea.html(str).css("display","block");
			str = null;
		});
	}else{listarea.css("display","block");}
};
//提交表单
var submit = function()
{
	var jsonStr = "[";
	$("#images ul li").each(function(order){
		
		
		var proImgAddr = $(this).find("img").attr("src");
		var proNum = $(this).find("img").attr("imgID");
		var proDesc = $(this).find("textarea").val();
		var proName = $(this).find("input.proName").val();
		var proPri = $(this).find("input.proPri").val();
		var proNewPri = $(this).find("input.proNewPri").val();
		
		jsonStr += "{'proNum':'"+proNum+"','proImgAddr':'"+proImgAddr+"','proName':'"+proName+"','proDesc':'"+proDesc+"','proPri':'"+proPri+"','proNewPri':'"+proNewPri+"','proOrder':'"+(order+1)+"'},";
	
	});
	jsonStr +="]";
	
	if($("#status").is(":checked"))
	$("#status").val(1);
	else $("#status").val(0);
	$('form').attr("action","shop_addShop?proData="+jsonStr);
	//alert(jsonStr);
	//$('body').html(jsonStr);
	$('form').submit();
};
//选择管理员
var sm=function(obj,no)
{
	$("#busadmnum").val(obj.text());
	$("#busadmnum-h").val(no);
	close_admlist();
};
//管理员列表关闭按钮
var close_admlist = function()
{
	$("#admin-list").css("display","none");
};

//删除商品

var deletePro = function(id,obj)
{
		obj.parents("li").slideUp(300);
		if(id != '')
		{
			$.post("shop_delPro",{pronum:id},function(){
		 		//window.location.reload();
			});
		}
};




</script>
  </head>
  <body>
  <input type="hidden" name="nav" value='2-nav-1' />
    <form class="form-horizontal" action="" method="post">
    	      <input type="hidden" id="busadmnum-h" name="busAdmin.busadmnum" value='<%=model.getBusAdmin().getBusadmnum() %>'>
              <div class="control-group">
              	<label class="control-label" for="inputName">名称</label>
                <div class="controls">
                  <input type="text" id="inputName" name="busname" value='<%=model.getBusname() %>' />
                  <%
                  	if(model.getShopnum()!=null)
                  		out.print("<input type='hidden' id='id' name='shopnum' value='"+model.getShopnum()+"' />");
                   %>
<%System.out.println(toCategory==null); %>
                  <!-- <input type="hidden" name="busAdmin.busadmnum" value="1" /> -->
                  <input type="hidden" name="category.bcnum" value='<%=toCategory.getBcnum() %>' />
                 <!--  <input type="hidden" name="pinyinid" value="无" /> -->
                  <!-- <input type="hidden" name="status" value="1" /> -->
                  <input type="hidden" name="hits" value="0" />
                </div>
              </div>
              <!-- 字母ID -->
              <div class="control-group">
                <label class="control-label" for="pinyinID">字母ID</label>
                <div class="controls">
                  <input type="text" id="pinyinID" name="pinyinid" value='<%=model.getPinyinid() %>'>
                </div>
              </div>
              <!-- address -->
              <div class="control-group">
                <label class="control-label" for="inputAddress">店家地址</label>
                <div class="controls">
                  <input type="text" id="inputAddress" name="busaddr" value='<%=model.getBusaddr() %>'>
                </div>
              </div>
              <!-- baidu map location -->
              <div class="control-group">
                <label class="control-label" for="inputLocation">地图</label>
                <div class="controls input-append" style="display: flex;">
                  <input type="text" id="inputLocation" name="busml" class="uneditable-input" autocomplete="off" value='<%=model.getBusml() %>' />
                  <button class="btn" type="button" href="#mapModal" onclick="showMap()"><i class="icon-map-marker"></i></button>
                </div>
              </div>
              <!-- Tel -->
              <div class="control-group">
                <label class="control-label" for="inputTel">联系电话</label>
                <div class="controls">
                  <input type="text" id="inputTel" name="busphone" value='<%=model.getBusphone() %>'>
                </div>
              </div>
              <!-- template -->
              <div class="control-group">
                <label class="control-label" for="unitTempate">默认模板</label>
                <div class="controls">
                  <input type="text" id="unitTempate" name="shoptem" value='<%=model.getShoptem() %>' />
                </div>
              </div>
               <!-- admin -->
               
              <%--<div class="control-group">
                <label class="control-label" for="busadmnum">管理员</label>
                <div class="controls">
                  <input type="text" id="busadmnum" readonly="readonly" placeholder='<%=model.getBusAdmin().getAdmname()+" "+model.getBusAdmin().getAdmtel() %>'/>
                  <input type="hidden" id="busadmnum-h" name="busAdmin.busadmnum" value='1'>
                  <div class='well' id='admin-list' style="display:none;margin-top:2px;">
                  
                  </div>
                </div>
              </div>--%>
              
              <!-- introduce -->
              <div class="control-group">
                <label class="control-label" for="inputIntro">简介</label>
                <div class="controls">
                  <textarea rows="4" id="inputIntro" name="busintr"><%=model.getBusintr() %></textarea>
                </div>
              </div>
              
              <!-- news -->
              <div class="control-group">
                <label class="control-label" for="inputNews">最新活动</label>
                <div class="controls">
                  <textarea rows="4" id="inputNews" name="shopnews"><%=model.getShopnews() %></textarea>
                </div>
              </div>
              
              <!-- news -->
              <div class="control-group">
                <label class="control-label" for="inputLogo">Logo</label>
                <div class="controls">
                <script type="text/javascript">
                
                $(document).ready(function(){
            		$("#inputLogo").uploadify({
					'swf'       : 'uploadify.swf',
					'uploader'       :'ul-li',
					'queueID'        : 'itemArea',
					'fileTypeDesc'   : 'Image Files',
				          'fileTypeExts'   : '*.gif; *.jpg; *.png;',
					'progressData'   :'speed',
						'auto'           : true,
					'multi'          : true,
					'buttonText'	 : '选择LOGO文件',
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
					'formData'       :{'id':'<%=model.getShopnum() %>','sex':'male'},
					'onUploadSuccess' : function(file, data, response) {
				       $("#logo-img").attr("src",data);	
				       $("#logo").attr("value",data);
				       }
				});
            
            });
                </script>
                	<input id="logo" name="logo" type="hidden" value="<%=model.getLogo() %>" />
                  <input id="inputLogo"  />
                  <img id="logo-img" src="<%=model.getLogo() %>" />
                </div>
              </div>
              
              <div class="control-group">
                <label class="control-label" for="inputPromo">商品</label>
                <div class="controls">
		        <div id="images">
		        <script type="text/javascript">
				$(function() {
					$(".procontainer" ).sortable();
				});
				</script>
		        <ul class='thumbnails procontainer'>
		        <% 
		        	//加载商品
					if(model.getShoppros() != null)
					{
						Set<Shoppro> set = model.getShoppros();
						ArrayList<Shoppro> list = new ArrayList<Shoppro>(set);
						Collections.sort(list);
						
						
						//Iterator<Shoppro> shopi = set.iterator();
						for(Shoppro temp : list)
						{
							out.println("<script>$('#images').css('display','block'); $('#images ul').append(genImgItem('"+temp.getPronum()+"','"+temp.getProimg()+"','"+temp.getProintr()+"','"+temp.getProname()+"','"+temp.getPropri()+"','"+temp.getPronewpri()+"'));</script>");
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
				
		<!-- 		<a class='span1 offset2 btn' href="javascript:jQuery('#uploadify').uploadify('upload','*')">开始上传</a>&nbsp;
				<a class='span1 offset2 btn' href="javascript:$('#uploadify').uploadify('cancel', '*')">取消</a> -->
				
				</div>
		
                </div>
              </div>
              <div class="control-group">
                <!-- <label class="control-label" for="inputPassword">图片</label> -->
                <div class="controls">
                  <label class="checkbox">
			        <input id="status" type="checkbox" name="status" checked="checked"> 启用
			      </label>
                  <a class="btn btn-primary btn-large" style="width:100px;" href="javascript:submit()">保存</a>
                </div>
              </div>
            </form>
  </body>
</html>
