<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=utf-8"
	import="com.xdylpg.ORM.Comconsor"
	 import="com.xdylpg.ORM.CBInfo"
%>  

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String sortList = (String)request.getAttribute("sortList");
	CBInfo o = (CBInfo)request.getSession().getAttribute("admin_currentCom");
%>


            <!-- 站点导航开始 -->
            <ul class="breadcrumb">
              <li><a href="com-cpc-index?comnum=<%=o.getComnum() %>"><%=o.getBusname() %></a> <span class="divider">/</span></li>
              <li><a href="#">栏目管理</a> <span class="divider">/</span></li>
              <li class="active">栏目列表</li>
              <li class="pull-right"><a href='com-ccs-form'>添加栏目</a></li>
            </ul>
            <!-- 站点导航结束 -->         
            
                                                
            <!-- 内容开始 -->
            
             <%
                	if(sortList == null || sortList.equals("") ) {
                %>
                <div class="alert alert-info">
				  <strong>提示！</strong> 暂时没有栏目，请<a href='com-ccs-form'>添加栏目</a>.
				</div>
				<% return;} %>
            
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>#</th>
                  <th>分类名称</th>
                  <th>类型</th>
                  <th>状态</th>
                  <th>排序</th>
                  <th style="padding-right:94px;">处理</th>
                </tr>
              </thead>
              <tbody>
                <%
                	if(sortList != null) out.print(sortList);
                	else{
                %>
                <div class="alert">
				  <strong>提示！</strong> 暂时没有栏目，请<a href='com-ccs-form'>添加栏目</a>.
				</div>
				<%} %>
                </tbody>
                </table>

  			<!-- 内容结束 -->

