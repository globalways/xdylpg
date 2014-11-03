<%@ page  pageEncoding="UTF-8"
	import="com.xdylpg.ORM.Auth" 
	import="com.xdylpg.ORM.Item"
%>
<% 
	int auth = admin.getAuth().getAuthnum().intValue();                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
	String busname = admin.getItem().getBusname();
%>

<script type="text/javascript">
$(document).ready(function(){
	var nav = $("input[name=nav]").val();
	var target = $("#"+nav);
	var subnavReg = /[1-9]-nav-[1-9]/g;
	if(subnavReg.test(nav))
		{
			target.parents("div.accordion-body").addClass("in");
			target.addClass("active");
		}
	else{
		target.children("div.accordion-body").addClass("in");
	}
});
</script>

<div class="accordion" id="fun-nav">

              <!-- 第一组 -->
              <div class="accordion-group" id='1-nav'>
                <div  class="accordion-heading">
                   <a class="accordion-toggle" data-toggle="collapse" data-parent="#fun-nav" href="#1-nav-e">
                    <i class="icon-briefcase pull-right"></i>欢迎 - 功能一览</a>
                </div>
                <div id="1-nav-e" class="accordion-body collapse">
                  <div class="accordion-inner">
                 
                      <ul class="nav nav-list bs-docs-sidenav">
                        <li class="nav-header">个人信息</li> 
                        <li id='1-nav-1'><a href="profile"><i class="icon-chevron-right"></i> 个人资料</a></li>
                         <li class="divider"></li>
                         <li class="nav-header">网站信息</li> 
                       <li id='1-nav-2'><a href="app"><i class="icon-chevron-right"></i> 基本信息</a></li>
                       <li id='1-nav-3'><a href="#dropdowns"><i class="icon-chevron-right"></i> 统计数据</a></li>
                      </ul>
                  </div>
                </div>
              </div>
              <!-- 第二组 -->
              <div class="accordion-group" id='2-nav'>
                <div class="accordion-heading">
                   <a class="accordion-toggle" data-toggle="collapse" data-parent="#fun-nav" href="#2-nav-e">
                    <i class="icon-tasks pull-right"></i>我的网站</a>
                </div>
                <div id="2-nav-e" class="accordion-body collapse">
                  <div class="accordion-inner">
                      <ul class="nav nav-list bs-docs-sidenav">
                        
                        <li class="nav-header"><%=busname %></li>
                        <li id='2-nav-1'><a href="app"><i class="icon-chevron-right"></i>基本信息</a></li>
                        <li id='2-nav-2'><a href="#"><i class="icon-chevron-right"></i>统计数据</a></li>
                      </ul>
                  </div>
                </div>
              </div>
              <!-- 第三组 -->
              <div class="accordion-group" id='3-nav'>
                <div class="accordion-heading">
                   <a class="accordion-toggle" data-toggle="collapse" data-parent="#fun-nav" href="#3-nav-e">
                    <i class="icon-user pull-right"></i>我的资料</a>
                </div>
                <div id="3-nav-e" class="accordion-body collapse">
                  <div class="accordion-inner">
                      <ul class="nav nav-list bs-docs-sidenav">
                        <li id='3-nav-1'><a href="profile"><i class="icon-chevron-right"></i>个人信息</a></li>
                      </ul>
                  </div>
                </div>
              </div>


            </div>
