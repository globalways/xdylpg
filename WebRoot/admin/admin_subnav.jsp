<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
$(document).ready(function(){
	var c2 = $("#fun-nav li.active").text();
	var c1 = $("#fun-nav div.in").siblings("div").text();
	$("#sub-1 a").text(c1);
	$("#sub-2").text(c2);
});
//-->
</script>
<ul class="breadcrumb">
    <li><a href="#">首页</a> <span class="divider">/</span></li>
    <li id="sub-1"><a href="#"></a> <span class="divider">/</span></li>
    <li id="sub-2" class="active"></li>
</ul>