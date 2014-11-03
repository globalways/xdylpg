var cur;
$(document).ready(function(){
	$("li").click(function(){
         if(cur == $(this)[0]) return false;
         if(cur!=null) cur.className = "";
         $(this)[0].className = "active";
         cur = $(this)[0];
	});
	$("ul.breadcrumb li:last")[0].className="active";
});
