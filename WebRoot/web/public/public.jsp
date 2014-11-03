<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	import="com.xdylpg.ORM.Psu"
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Psu psu = (Psu)request.getAttribute("psu");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%= psu.getBusname()%></title>

<link type="text/css" rel="stylesheet" href="./base.css" />
<link type="text/css" rel="stylesheet" href="./public/public.css" />
<link type="text/css" rel="stylesheet" href="./public/styles.css" />

<script src="./public/jquery.js" type="text/javascript"></script>
<script src="./public/s3Slider.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
 $("#slider").s3Slider({timeOut:5000});
});
</script>
</head>

<body>
	<div class="wrapper">
    	<div id="head" class="container">
        	<h2><%= psu.getBusname() %></h2>
            <span id="addr">地址：<%=psu.getBusaddr() %></span>
            <span id="tel">电话：<%=psu.getBusphone() %></span>
        </div>
        <div id="slider">
        	<ul id="sliderContent">
              <li class="sliderImage">
               <img src="images/001.jpg" width="960" height="400" alt="懒人图库">
               <span class="bottom">董世建筑是一个充满设计激情与创造力、集先进设计施工理念，对客户了解入微并极其负责的团队。</span>
              </li>
              <li class="sliderImage">
               <img src="images/002.jpg" width="960" height="400" alt="懒人图库">
               <span class="bottom">公司的成员包括城市规划师，建筑师，室内设计师。</span>
              </li>
              <li class="sliderImage">
               <img src="images/003.jpg" width="960" height="400" alt="懒人图库">
               <span class="bottom">创造的激情是驱动我们向前的重要因素，它是我们想象力的原动力，帮助我们实现概念和构思。</span>
              </li>
              <div class="clear sliderImage"></div>
             </ul>
        </div>
        <div id="news" class="container">
        <span class="theme">简介</span><hr />
             <p>
               <%=psu.getBusintr() %>
            </p>
        </div>
        <div id="basic-intro" class="container">
        	<div class="text-intro">
            <span class="theme">详细信息</span><hr />
            	<p>
                 <%=psu.getBusintr() %>
               	</p>
            </div>
            <div class="img-map">
            	<img src="./shop-map.jpg" />
            </div>
            <div class="clear"></div>
        </div>
        
    </div>
</body>
</html>

