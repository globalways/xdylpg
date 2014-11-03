<%@ page  pageEncoding="UTF-8"
	import="com.xdylpg.ORM.Auth" 
%>
<% 
	int auth = admin.getAuth().getAuthnum().intValue();
%>

<script type="text/javascript">
$(document).ready(function(){
	var nav = $("input[name=nav]").val();
	var target = $("#"+nav);
	target.parents("div.accordion-body").addClass("in");
	target.addClass("active");
});
</script>

<div class="accordion" id="fun-nav">

              <!-- 第一组 -->
              <%
              	if(2 == auth)
              	{
              %>
              <div class="accordion-group" id='1-nav'>
                <div class="accordion-heading">
                   <a class="accordion-toggle" data-toggle="collapse" data-parent="#fun-nav" href="#1-nav-e">
                    <i class="icon-briefcase pull-right"></i>网站管理</a>
                </div>
                <div id="1-nav-e" class="accordion-body collapse">
                  <div class="accordion-inner">
                 
                      <ul class="nav nav-list bs-docs-sidenav">
                        <li class="nav-header">用户信息</li> 
                        <%--<li id='1-nav-1'><a href="#overview"><i class="icon-chevron-right"></i>留言管理</a></li>
                        --%>
                        <li id='1-nav-2'><a href="aplct-list"><i class="icon-chevron-right"></i> 入驻申请</a></li>
                        <li id='1-nav-3' ><a href="fb-list"><i class="icon-chevron-right"></i> 意见反馈</a></li>
                         <li class="divider"></li>
                         <li class="nav-header">系统信息</li> 
                       <li id='1-nav-4'><a href="#dropdowns"><i class="icon-chevron-right"></i> 系统设置</a></li>
                      </ul>
                  </div>
                </div>
              </div>
				<%} %>
              <!-- 第二组 -->
              <div class="accordion-group" id='2-nav'>
                <div class="accordion-heading">
                   <a class="accordion-toggle" data-toggle="collapse" data-parent="#fun-nav" href="#2-nav-e">
                    <i class="icon-tasks pull-right"></i><%=2 == auth?"商铺管理":"我的商铺" %></a>
                </div>
                <div id="2-nav-e" class="accordion-body collapse">
                  <div class="accordion-inner">
                      <ul class="nav nav-list bs-docs-sidenav">
                        
                        <li class="nav-header">内容管理</li>
                        <li id='2-nav-1'><a href="cbInfo_browseCBInfo?pageNo=1&pageSize=10"><i class="icon-chevron-right"></i>企业公司</a></li>
                        <li id='2-nav-2'><a href="shop_browseShop?pageNo=1&pageSize=10"><i class="icon-chevron-right"></i>商铺商店</a></li>
                        <li id='2-nav-3'><a href="shop_browseShop?pageNo=1&pageSize=10"><i class="icon-chevron-right"></i> 生活服务</a></li>
                        <li id='2-nav-4'><a href="psu_browsePsu?pageNo=1&pageSize=10"><i class="icon-chevron-right"></i> 公共单位</a></li>
                        <%if(2 == auth) {%>
                        <li id='2-nav-5'><a href="category-choose"><i class="icon-plus pull-right"></i>添&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;加</a></li>
                        <li class="nav-header">分类&标签管理</li>
                        <li id='2-nav-6'><a href="category-index"><i class="icon-chevron-right"></i>分类管理</a></li>
                        <li id='2-nav-7'><a href="psu_browsePsu?pageNo=1&pageSize=10"><i class="icon-chevron-right"></i>标签管理</a></li>
                        <li class="divider"></li>
                        <li class="nav-header">模板修改</li>
                        <li id='2-nav-8'><a href="#scrollspy"><i class="icon-chevron-right"></i> 企业模板修改 </a></li>
                        <li id='2-nav-9'><a href="#tabs"><i class="icon-chevron-right"></i> 生活服务&商铺</a></li>
                        <li id='2-nav-10'><a href="#tabs"><i class="icon-chevron-right"></i> 公共单位 </a></li>
                        <li class="divider"></li>
                        <li id='2-nav-11'><a href="#tabs"><i class="icon-chevron-right"></i> 回收站 </a></li>
                        <%} %>
                      </ul>
                  </div>
                </div>
              </div>
              <!-- 第三组 -->
              <div class="accordion-group" id='3-nav'>
                <div class="accordion-heading">
                   <a class="accordion-toggle" data-toggle="collapse" data-parent="#fun-nav" href="#3-nav-e">
                    <i class="icon-user pull-right"></i><%=2==auth?"账户管理":"我的资料" %></a>
                </div>
                <div id="3-nav-e" class="accordion-body collapse">
                  <div class="accordion-inner">
                      <ul class="nav nav-list bs-docs-sidenav">
                        <%if(1 == auth){ %>
                        <li id='3-nav-2'><a href="BusAdminAdd.jsp"><i class="icon-chevron-right"></i>个人信息</a></li>
                        <%}else{ %>
                        <li class="nav-header">商家账号</li>
                        <li id='3-nav-1' ><a href="admin_browseBusAdmin?pageNo=1&pageSize=10"><i class="icon-chevron-right"></i>账户列表</a></li>
                        <li id='3-nav-2'><a href="BusAdminAdd.jsp"><i class="icon-chevron-right"></i>添加账号</a></li>
                        <li class="divider"></li>
                        <li class="nav-header">个人信息</li> 
                        <li id='3-nav-3'><a href="#tooltips"><i class="icon-chevron-right"></i> 资料修改</a></li>
                         <li class="divider"></li>
                        <li id='3-nav-4'><a href="#tabs"><i class="icon-chevron-right"></i> 回收站 </a></li>
                        <%} %>
                      </ul>
                  </div>
                </div>
              </div>


            </div>
