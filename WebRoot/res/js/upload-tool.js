function Uploader(jqobj,id,url,callback)
{
	this.target = jqobj;
	this.postid = id;
	this.successfun = callback;
	this.url = url;
	
	var file;
	var data;
	var response;
}
Uploader.prototype.init = function(){
	this.target.uploadify({
		'swf'       : 'uploadify.swf',
		'uploader'       : this.url,
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
}

Uploader.prototype.upload = function(){
	
}
Uploader.prototype.success = function(){
	this.successfun();
}



