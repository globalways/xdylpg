$(document).ready(function(){
	$("div.thumbnail img").click(function(){
		//alert($(this).siblings("div").html());
		var img_addr = $(this).attr("src");
		var img_desc = $(this).siblings("p.img-desc").text();
		var modalbody_content = "<div class='modal-header'><button type='button' class='close' data-dismiss='modal' aria-hidden='true'>×</button><h3 id='myModalLabel'>详细</h3></div><div class='modal-body'>"+
									"<img src='"+img_addr+"' /><input type='file' value='更换图片'/><textarea>"+img_desc+"</textarea>"+
                                  "</div><div class='modal-footer'><button class='btn' data-dismiss='modal' aria-hidden='true'>关闭</button><button class='btn btn-primary'>保存</button></div>";

		//$(this).siblings("div div.modalb-body").html(modalbody_content);
		$(this).siblings("div").html(modalbody_content);
		$(this).siblings("div").modal('show');
		// $('#myModal').modal({
  // 				object:"......"
		// });
	});

})