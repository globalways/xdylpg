$(document).ready(function() {
	
	window.LIMIT = 2;
	$("#uploadify").uploadify({
		'swf'       : 'uploadify.swf',
		'uploader'       :'upload',
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
		'formData'       :{'name':'wangyangping','sex':'male'},
		'onUploadSuccess' : function(file, data, response) {
			$("#images").css("display","block");
           $("#images ul").append(genImgItem(data,0)); 
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
		$.getJSON("admin_loadUsers",function(data){
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
		}).fail(function(){alert("获取管理员失败请联系技术人员！");});
		
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
