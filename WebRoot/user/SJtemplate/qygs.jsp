<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	import="com.xdylpg.ORM.CBInfo"
	import="com.xdylpg.ORM.BusAdmin"
	import="com.xdylpg.ORM.Category"
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	CBInfo model = null;
	Category toCategory = (Category)request.getAttribute("toCategory");
	Object obj = request.getAttribute("busObj");
	if(obj == null)
	{
		model = new CBInfo();
		BusAdmin ba = new BusAdmin();
		ba.setAdmtel("");
		ba.setAdmname("");
		model.setBusname("");
		model.setPinyinid("");
		model.setBusaddr("");
		model.setBusml("");
		model.setBusphone("");
		model.setWebtitle("");
		model.setSubtitle("");
		model.setContacts("");
		model.setEmail("");
		model.setIcpcode("");
		model.setWebdes("");
		model.setPostcode("");
		model.setBusAdmin(ba);
		model.setBusintr("");
	}else{
		model = (CBInfo)obj;
		toCategory = model.getCategory();
	}
%>

<html>
  <head>
  
  <script type="text/javascript" src="<%=basePath %>res/tp/uploadify/jquery.uploadify.js"></script>
  <link href="<%=basePath %>res/tp/uploadify/uploadify.css" rel="stylesheet" type="text/css" />
  		<style type="text/css">
  			#images ul{height:0px;}
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
	window.LIMIT = 2;
	$("#uploadify").uploadify({
		'swf'       : 'uploadify.swf',
		'uploader'       :'ul-li',
		'queueID'        : 'itemArea',
		'uploadLimit'    : window.LIMIT,
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
				                    alert("上传的文件数量已经超出系统限制的" + $('#uploadify').uploadify('settings', 'uploadLimit') + "个文件！");  
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
		'formData'       :{'id':'<%=model.getComnum()%>'},
		'onUploadSuccess' : function(file, data, response) {
			$("#images").css("display","block");
           $("#images ul").append(genImgItem(data,0)); 
        },
        'onUploadError' : function(file, errorCode, errorMsg, errorString) {
            alert('The file ' + file.name + ' could not be uploaded: ' + errorString);
        }
	});
	
	$("#busadmnum").focus(function(){
		// 加载管理员
		loadBusAdmin();
		$("#busadmnum").blur();
	});
	$("#close").click(function(){$("#admin-list").css("display","none");});
	
	
	
	//动态检查上传图片的显示数量
	var html = $('#images').html();
	uploadControl();
	setInterval(function(){
	 if($('#images').html() != html)
	 { 
	 	uploadControl();
   		
	 	html = $('#images').html() ;
	 } 
	 }, 1000);
	
/* 	 $("#images ul").bind('DOMNodeInserted', function(e) {
   		var liLen = $("#images ul li:visible").length;
   		if(liLen == 2)
   		{
   			$("#images").siblings("div.span12").hide();
   		}
	}); */

	
});

//隐藏显示 上传图片按钮

var uploadControl = function()
{
		var liLen = $("#images ul li:visible").length;
   		if(liLen == window.LIMIT)
   		{
   			$("#images").siblings("div.span12").hide();
   		}else if(liLen < window.LIMIT)
   			$("#images").siblings("div.span12").show();
};

//显示图片模板
var genImgItem = function(imgAddr,type)
{	
	var str;
	if(type == 0) 
	str = "<li class='span12' style='margin-left:0px;'>"
	+"<div class='thumbnail span4'><img src='"+imgAddr+"'></div><div class='span8'>"
	+"<p><span class='label'>选择图片类型</span>"
	+"<a id='deleteImg' class='btn btn-small' href='javascript:void(0);' onclick=deleteImg($(this)) style='float:right;'>删除图片</a></p>"
	+"<form><label class='radio'><input type='radio' onclick=manageImg($(this)) name='radio-logo' value='logo'>"
  	+"LOGO</label>"
    +"<label class='radio'><input type='radio' onclick=manageImg($(this)) name='radio-icon' value='icon'>"
    +"ICON</label></form></div></li>";
    else if(type==1)
    str = "<li class='span12' style='margin-left:0px;'>"
	+"<div class='thumbnail span4'><img src='"+imgAddr+"'></div><div class='span8'>"
	+"<p><span class='label'>选择图片类型</span>"
	+"<a id='deleteImg' class='btn btn-small' href='javascript:void(0);' onclick=deleteImg($(this)) style='float:right;'>删除图片</a></p>"
	+"<form><label class='radio'><input type='radio' onclick=manageImg($(this)) name='radio-logo' value='logo' checked>"
  	+"LOGO</label>"
    +"<label class='radio'><input type='radio' onclick=manageImg($(this)) name='radio-icon' value='icon'>"
    +"ICON</label></form></div></li>";
    else if(type == 2)
    str = "<li class='span12' style='margin-left:0px;'>"
	+"<div class='thumbnail span4'><img src='"+imgAddr+"'></div><div class='span8'>"
	+"<p><span class='label'>选择图片类型</span>"
	+"<a id='deleteImg' class='btn btn-small' href='javascript:void(0);' onclick=deleteImg($(this)) style='float:right;'>删除图片</a></p>"
	+"<form><label class='radio'><input type='radio' onclick=manageImg($(this)) name='radio-logo' value='logo'>"
  	+"LOGO</label>"
    +"<label class='radio'><input type='radio' onclick=manageImg($(this)) name='radio-icon' value='icon' checked>"
    +"ICON</label></form></div></li>";
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
	$("#images ul li").each(function(){
		
		var imgAddr = $(this).find("img").attr("src");
		var imgID = $(this).find("img").attr("imgID");
		var imgDesc = $(this).find("textarea").val();
		jsonStr += "{'imgID':'"+imgID+"','imgAddr':'"+imgAddr+"','imgDesc':'"+imgDesc+"'},";
	
	});
	jsonStr +="]";
	
	//是否启用
	if($("#status").is(":checked"))
	$("#status").val(1);
	else $("#status").val(0);
	//LOGO ICON 选择
	
	$("#logimg").val($("input[name='radio-logo']:checked").parents("div").siblings("div").find("img").attr("src"));
	$("#icoimg").val($("input[name='radio-icon']:checked").parents("div").siblings("div").find("img").attr("src"));
	
	$('#main-form').attr("action","cbInfo_addCBInfo");
	
	//$('body').html(jsonStr);
	$('#main-form').submit();
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

//删除图片

var deleteImg = function(obj)
{
	obj.parents("li").slideUp(300);
	var name = obj.parent().siblings("form").find("input:checked").attr("name");
	if(name=="radio-logo")
 		$("#logimg").val("");
 	if(name=="radio-icon")
		$("#icoimg").val("");
};

var manageImg = function(obj)
{
	obj.attr("checked",true);	
	obj.parent().siblings().find("input").attr("checked",false);
	var name = obj.attr("name");
	
	var sibling = obj.parents("li").siblings().find("input[name='"+name+"']");
	
	sibling.attr("checked",false);
	sibling.parent().siblings().find("input").attr("checked",true);
};


</script>
  </head>
  <body>
  <input type="hidden" name="nav" value='2-nav-1' />
  	<a href="../admin/com-cpc-index?comnum=<%=model.getComnum()%>">管理我的网站</a>
    <form id="main-form" class="form-horizontal" action="" method="post">
              <div class="control-group">
                <label class="control-label" for="inputName">名称</label>
                <div class="controls">
                  <input type="text" id="inputName" name="busname" value='<%=model.getBusname() %>' />
                  <%
                  	if(model.getComnum()!=null)
                  		out.print("<input type='hidden' name='comnum' value='"+model.getComnum()+"' />");
                   %>
                  <!-- <input type="hidden" name="busAdmin.busadmnum" value="1" /> -->
                  
          <%--<%System.out.println(toCategory==null); %>
                  --%><input type="hidden" name="category.bcnum" value='<%=toCategory.getBcnum() %>' />
                  <input type="hidden" id="logimg" name="logimg" value=<%=model.getLogimg() %> />
                  <input type="hidden" id="icoimg" name="icoimg" value=<%=model.getIcoimg() %> />
                  <input type="hidden" id="carousel" name="carousel" value=<%=model.getCarousel() %> />
                 <!--  <input type="hidden" name="pinyinid" value="无" /> -->
                  <!-- <input type="hidden" name="status" value="1" /> -->
                  <input type="hidden" name="hits" value="0" />
                </div>
              </div>
              <!-- 字母ID -->
              <div class="control-group">
                <label class="control-label" for="pinyinID">字母ID</label>
                <div class="controls">
                  <input type="text" id="pinyinID" name="pinyinid" value='<%=model.getPinyinid() %>' />
                </div>
              </div>
              <!-- address -->
              <div class="control-group">
                <label class="control-label" for="inputAddress">店家地址</label>
                <div class="controls">
                  <input type="text" id="inputAddress" name="busaddr" value='<%=model.getBusaddr() %>' />
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
                  <input type="text" id="unitTempate" name="unittem" value='<%=model.getSubtitle() %>' />
                </div>
              </div>
               <!-- admin -->
              <div class="control-group">
                <label class="control-label" for="busadmnum">管理员</label>
                <div class="controls">
                  <input type="text" id="busadmnum" readonly="readonly" placeholder='<%=model.getBusAdmin().getAdmname()+" "+model.getBusAdmin().getAdmtel() %>'/>
                  <input type="hidden" id="busadmnum-h" name="busAdmin.busadmnum" value='1'>
                  <div class='well' id='admin-list' style="display:none;margin-top:2px;">
                  
                  </div>
                </div>
              </div>
              
              
              <!-- web title -->
              <div class="control-group">
                <label class="control-label" for="inputWebTitle">web title</label>
                <div class="controls">
                  <input type="text" id="inputWebTitle" name="webtitle" value='<%=model.getWebtitle() %>' />
                </div>
              </div>
              
              <!-- sub title -->
              <div class="control-group">
                <label class="control-label" for="inputSubTitle">sub title</label>
                <div class="controls">
                  <input type="text" id="inputSubTitle" name="subtitle" value='<%=model.getSubtitle() %>' />
                </div>
              </div>
              
              <!-- post code -->
              <div class="control-group">
                <label class="control-label" for="inputPostCode">post code</label>
                <div class="controls">
                  <input type="text" id="inputPostCode" name="postcode" value='<%=model.getPostcode() %>' />
                </div>
              </div>
              
              <!-- contacts -->
              <div class="control-group">
                <label class="control-label" for="inputContact">contacts</label>
                <div class="controls">
                  <input type="text" id="inputContact" name="contacts" value='<%=model.getContacts() %>' />
                </div>
              </div>
              
              <!-- email -->
              <div class="control-group">
                <label class="control-label" for="inputEmail">email</label>
                <div class="controls">
                  <input type="text" id="inputEmail" name="email" value='<%=model.getEmail() %>' />
                </div>
              </div>
              
              <!-- ICP code -->
              <div class="control-group">
                <label class="control-label" for="inputFilNum">ICP code</label>
                <div class="controls">
                  <input type="text" id="inputFilNum" name="filnum" value='<%=model.getIcpcode() %>' />
                </div>
              </div>
              
              <!-- web des -->
              <div class="control-group">
                <label class="control-label" for="inputWebDes">web des</label>
                <div class="controls">
                  <input type="text" id="inputWebDes" name="webdes" value='<%=model.getWebdes() %>' />
                </div>
              </div>
              
              <!-- introduce -->
              <div class="control-group">
                <label class="control-label" for="inputIntro">简介</label>
                <div class="controls">
                  <textarea rows="4" id="inputIntro" name="busintr"><%=model.getBusintr() %></textarea>
                </div>
              </div>
              <div class="control-group">
                <label class="control-label" for="inputPromo">LOGO ICO图片</label>
                <div class="controls">
		        <div id="images">
		        <ul class='thumbnails'>
		        <% 
		        	//加载图片
		        	if(model.getLogimg() != null && model.getLogimg() != "")
					out.println("<script>$('#images').css('display','block'); $('#images ul').append(genImgItem('"+model.getLogimg()+"',1));</script>");
					if(model.getIcoimg() != null&& model.getIcoimg() != "")
					out.println("<script> $('#images ul').append(genImgItem('"+model.getIcoimg()+"',2));</script>");
					if(model.getIcoimg() != null&&model.getLogimg() != null&& model.getIcoimg() != ""&& model.getLogimg() != "")
					out.println("<script> $('#images').siblings('div.span12').hide();</script>");
					
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
