$(document).ready(function(){
	$("#category-content").load("add_SJ_CC");
});

var addSJ=function(type)
{
	$.ajax({
		url:"add_SJ",
		type:"post",
		dataType:"json",
		contentType:"application/x-www-form-urlencoded;charset=UTF-8",
		data:{type:type},
		success:function(msg)
		{
			alert("success");
		},
		error:function (XMLHttpRequest, textStatus, errorThrown)
		{
			alert(textStatus+"-"+XMLHttpRequest.readyState+"-"+XMLHttpRequest.status);
		}
		
		
	});
	
};

