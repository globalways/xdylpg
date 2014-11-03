<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=utf-8"%>  

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <title>添加商家</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="./css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" type="text/css" href="./css/my.css" />

    <script type="text/javascript" src="./js/jquery-1.8.0.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
  </head>
  <body>
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12">
        <div class="row-fluid">
          <div class="span3">

            <!-- 管理员信息 -->
            <div class="row-fluid">
              <div class="span12">
                <p  class="text-right">
                  <h4>管理员XX您好</h4>
                  <a href="#">sign out</a>
                 </p>
              </div>
            </div>
            <!-- 分类列表 -->
            <div class="accordion" id="accordion-969416">

              <!-- 第一组 -->
              <div class="accordion-group">
                <div class="accordion-heading">
                   <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-969416" href="#accordion-element-181694">
                    <i class="icon-briefcase pull-right"></i>系统设置</a>
                </div>
                <div id="accordion-element-181694" class="accordion-body collapse">
                  <div class="accordion-inner">
                 
                      <ul class="nav nav-list bs-docs-sidenav">
                        <li class="nav-header">系统信息</li> 
                        <li><a href="./liuyan.jsp"><i class="icon-chevron-right"></i>网站信息设置</a></li>
                        <li><a href="./shenqing.jsp"><i class="icon-chevron-right"></i>网站栏目管理</a></li>
                         <li class="divider"></li>
                         <li class="nav-header">业务处理</li> 
                       <li><a href="#dropdowns"><i class="icon-chevron-right"></i>网站业务处理</a></li>
                      </ul>
                  </div>
                </div>
              </div>

              <!-- 第二组 -->
              <div class="accordion-group">
                <div class="accordion-heading">
                   <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-969416" href="#accordion-element-598597">
                    <i class="icon-tasks pull-right"></i>内容维护</a>
                </div>
                <div id="accordion-element-598597" class="accordion-body in collapse">
                  <div class="accordion-inner">
                      <ul class="nav nav-list bs-docs-sidenav">
                        
                        <li class="nav-header">内容管理</li>
                        <li><a href="./shangjialiebiao.jsp"><i class="icon-chevron-right"></i>全&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;部</a></li>
                        <li><a href="#overview"><i class="icon-chevron-right"></i>企业公司</a></li>
                        <li><a href="#transitions"><i class="icon-chevron-right"></i>商铺商店</a></li>
                        <li><a href="#modals"><i class="icon-chevron-right"></i> 生活服务</a></li>
                        <li><a href="#dropdowns"><i class="icon-chevron-right"></i> 公共单位</a></li>
                        <li class="active"><a href="#overview"><i class="icon-chevron-right"></i><i class="icon-plus pull-right"></i>添&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;加</a></li>
                        <li class="divider"></li>
                        <li class="nav-header">模板修改</li>
                        <li><a href="#scrollspy"><i class="icon-chevron-right"></i> 企业模板修改 </a></li>
                        <li><a href="#tabs"><i class="icon-chevron-right"></i> 生活服务&商铺</a></li>
                        <li><a href="#tabs"><i class="icon-chevron-right"></i> 公共单位 </a></li>
                        <li class="divider"></li>
                        <li><a href="#tabs"><i class="icon-chevron-right"></i> 回收站 </a></li>
                      </ul>
                  </div>
                </div>
              </div>
              <!-- 第三组 -->
              <div class="accordion-group">
                <div class="accordion-heading">
                   <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-969416" href="#accordion-element-598598">
                    <i class="icon-user pull-right"></i>栏目管理</a>
                </div>
                <div id="accordion-element-598598" class="accordion-body collapse">
                  <div class="accordion-inner">
                      <ul class="nav nav-list bs-docs-sidenav">
                        <li class="nav-header">商家账号</li>
                        <li class="active"><a href="#"><i class="icon-chevron-right"></i>账户列表</a></li>
                        <li><a href="#"><i class="icon-chevron-right"></i>添加账号</a></li>
                        <li class="divider"></li>
                        <li class="nav-header">个人信息</li> 
                        <li><a href="#tooltips"><i class="icon-chevron-right"></i> 资料修改</a></li>
                         <li class="divider"></li>
                        <li><a href="#tabs"><i class="icon-chevron-right"></i> 回收站 </a></li>
                      </ul>
                  </div>
                </div>
              </div>


            </div>
          </div>

          <div class="span9">
            <!-- span12 占空行 -->
            <div class="span12"></div>
            <!-- 站点导航开始 -->
            <ul class="breadcrumb">
              <li><a href="#">首页</a> <span class="divider">/</span></li>
              <li><a href="#">Library</a> <span class="divider">/</span></li>
              <li class="active">Data</li>
            </ul>
            <!-- 站点导航结束 -->
                                                         
            <!-- 内容开始 -->
            <div id="category-content">
			
			
			<table cellspacing="0" cellpadding="3" width="100%" align="center" border="0" id="listtable">
		  <tbody>
		  <tr class="list">
		    <td width="47" align="center" class="biaoti">选择</td>
		    <td width="46" align="center" class="biaoti">编号</td>
		    <td width="227" height="28" align="center" class="biaoti"><span class="searchzone">分类名称</span></td>
		    <td width="97" align="center" class="biaoti"><span class="searchzone">类型</span></td>
		    <td width="166" align="center" class="biaoti"><span class="searchzone">链接</span></td>
		    <td width="78" align="center" class="biaoti"><span class="searchzone">排序</span></td>
		    <td width="79" align="center" class="biaoti"><span class="searchzone">状态</span></td>
		    <td width="185" align="center" class="biaoti"><span class="searchzone">操作</span></td>
		    </tr>
			<tr><td colspan="8"><table cellspacing="0" cellpadding="0" width="100%" align="center" border="0" id="tab0"><tbody><tr bgcolor="#FFFFFF" align="center" onmouseover="this.bgColor='#CDE6FF'" onmouseout="this.bgColor='#FFFFFF'">
		<td width="47" height="25"><input type="checkbox" name="id" value="1" class="checkbox"><input type="hidden" name="SortIDs" value="1"></td>
		<td width="70">1</td>
		<td align="left" width="280"><a href="###" onclick="showHide('tab1','imgtab1');" target="_self"><img id="imgtab1" src="../../images/ico_4.gif"></a>&nbsp;&nbsp;<input name="SortNames" type="text" class="input" id="SortNames" value="新闻中心" maxlength="200" style="width:120px;"></td>
		<td>文章</td>
		<td width="225"><input name="SortUrls" type="text" id="SortUrls" value="" size="18" maxlength="255" class="input" style="width:90%"></td>
		<td width="90"><input name="SortOrders" type="text" class="input" id="SortOrders" value="1" size="3" maxlength="4" style="width:90%"></td>
		<td align="center"><a href="?action=off&amp;id=1" title="启用"><img src="../../images/toolbar_ok.gif"></a></td>
		<td width="225"><a href="AspCms_SortAdd.asp?id=1">添加子类</a> <a href="AspCms_SortEdit.asp?id=1">修改</a> </td></tr>
		<tr><td colspan="8"><table cellspacing="0" cellpadding="0" width="100%" align="center" border="0" id="tab1"><tbody><tr bgcolor="#FFFFFF" align="center" onmouseover="this.bgColor='#CDE6FF'" onmouseout="this.bgColor='#FFFFFF'">
		<td width="47" height="25"><input type="checkbox" name="id" value="2" class="checkbox"><input type="hidden" name="SortIDs" value="2"></td>
		<td width="70">2</td>
		<td align="left" width="280"><img src="../../images/01.gif"><img src="../../images/02.gif"><img src="../../images/kong.gif">&nbsp;&nbsp;<input name="SortNames" type="text" class="input" id="SortNames" value="公司新闻" maxlength="200" style="width:120px;"></td>
		<td>文章</td>
		<td width="225"><input name="SortUrls" type="text" id="SortUrls" value="" size="18" maxlength="255" class="input" style="width:90%"></td>
		<td width="90"><input name="SortOrders" type="text" class="input" id="SortOrders" value="1" size="3" maxlength="4" style="width:90%"></td>
		<td align="center"><a href="?action=off&amp;id=2" title="启用"><img src="../../images/toolbar_ok.gif"></a></td>
		<td width="225"><a href="AspCms_SortAdd.asp?id=2">添加子类</a> <a href="AspCms_SortEdit.asp?id=2">修改</a> </td></tr>
		<tr bgcolor="#FFFFFF" align="center" onmouseover="this.bgColor='#CDE6FF'" onmouseout="this.bgColor='#FFFFFF'">
		<td width="47" height="25"><input type="checkbox" name="id" value="3" class="checkbox"><input type="hidden" name="SortIDs" value="3"></td>
		<td width="70">3</td>
		<td align="left" width="280"><img src="../../images/01.gif"><img src="../../images/02.gif"><img src="../../images/kong.gif">&nbsp;&nbsp;<input name="SortNames" type="text" class="input" id="SortNames" value="公司公告" maxlength="200" style="width:120px;"></td>
		<td>文章</td>
		<td width="225"><input name="SortUrls" type="text" id="SortUrls" value="" size="18" maxlength="255" class="input" style="width:90%"></td>
		<td width="90"><input name="SortOrders" type="text" class="input" id="SortOrders" value="2" size="3" maxlength="4" style="width:90%"></td>
		<td align="center"><a href="?action=off&amp;id=3" title="启用"><img src="../../images/toolbar_ok.gif"></a></td>
		<td width="225"><a href="AspCms_SortAdd.asp?id=3">添加子类</a> <a href="AspCms_SortEdit.asp?id=3">修改</a> </td></tr>
		<tr bgcolor="#FFFFFF" align="center" onmouseover="this.bgColor='#CDE6FF'" onmouseout="this.bgColor='#FFFFFF'">
		<td width="47" height="25"><input type="checkbox" name="id" value="4" class="checkbox"><input type="hidden" name="SortIDs" value="4"></td>
		<td width="70">4</td>
		<td align="left" width="280"><img src="../../images/01.gif"><img src="../../images/02.gif"><img src="../../images/kong.gif">&nbsp;&nbsp;<input name="SortNames" type="text" class="input" id="SortNames" value="行业新闻" maxlength="200" style="width:120px;"></td>
		<td>文章</td>
		<td width="225"><input name="SortUrls" type="text" id="SortUrls" value="" size="18" maxlength="255" class="input" style="width:90%"></td>
		<td width="90"><input name="SortOrders" type="text" class="input" id="SortOrders" value="3" size="3" maxlength="4" style="width:90%"></td>
		<td align="center"><a href="?action=off&amp;id=4" title="启用"><img src="../../images/toolbar_ok.gif"></a></td>
		<td width="225"><a href="AspCms_SortAdd.asp?id=4">添加子类</a> <a href="AspCms_SortEdit.asp?id=4">修改</a> </td></tr>
		</tbody></table></td></tr><tr bgcolor="#ffffff" align="center" onmouseover="this.bgColor='#CDE6FF'" onmouseout="this.bgColor='#FFFFFF'">
		<td width="47" height="25"><input type="checkbox" name="id" value="5" class="checkbox"><input type="hidden" name="SortIDs" value="5"></td>
		<td width="70">5</td>
		<td align="left" width="280"><a href="###" onclick="showHide('tab5','imgtab5');" target="_self"><img id="imgtab5" src="../../images/ico_4.gif"></a>&nbsp;&nbsp;<input name="SortNames" type="text" class="input" id="SortNames" value="产品展示" maxlength="200" style="width:120px;"></td>
		<td>产品</td>
		<td width="225"><input name="SortUrls" type="text" id="SortUrls" value="" size="18" maxlength="255" class="input" style="width:90%"></td>
		<td width="90"><input name="SortOrders" type="text" class="input" id="SortOrders" value="2" size="3" maxlength="4" style="width:90%"></td>
		<td align="center"><a href="?action=off&amp;id=5" title="启用"><img src="../../images/toolbar_ok.gif"></a></td>
		<td width="225"><a href="AspCms_SortAdd.asp?id=5">添加子类</a> <a href="AspCms_SortEdit.asp?id=5">修改</a> </td></tr>
		<tr><td colspan="8"><table cellspacing="0" cellpadding="0" width="100%" align="center" border="0" id="tab5"><tbody><tr bgcolor="#FFFFFF" align="center" onmouseover="this.bgColor='#CDE6FF'" onmouseout="this.bgColor='#FFFFFF'">
		<td width="47" height="25"><input type="checkbox" name="id" value="6" class="checkbox"><input type="hidden" name="SortIDs" value="6"></td>
		<td width="70">6</td>
		<td align="left" width="280"><img src="../../images/01.gif"><img src="../../images/02.gif"><img src="../../images/kong.gif">&nbsp;&nbsp;<input name="SortNames" type="text" class="input" id="SortNames" value="实体产品" maxlength="200" style="width:120px;"></td>
		<td>产品</td>
		<td width="225"><input name="SortUrls" type="text" id="SortUrls" value="" size="18" maxlength="255" class="input" style="width:90%"></td>
		<td width="90"><input name="SortOrders" type="text" class="input" id="SortOrders" value="2" size="3" maxlength="4" style="width:90%"></td>
		<td align="center"><a href="?action=off&amp;id=6" title="启用"><img src="../../images/toolbar_ok.gif"></a></td>
		<td width="225"><a href="AspCms_SortAdd.asp?id=6">添加子类</a> <a href="AspCms_SortEdit.asp?id=6">修改</a> </td></tr>
		<tr bgcolor="#FFFFFF" align="center" onmouseover="this.bgColor='#CDE6FF'" onmouseout="this.bgColor='#FFFFFF'">
		<td width="47" height="25"><input type="checkbox" name="id" value="7" class="checkbox"><input type="hidden" name="SortIDs" value="7"></td>
		<td width="70">7</td>
		<td align="left" width="280"><img src="../../images/01.gif"><img src="../../images/02.gif"><img src="../../images/kong.gif">&nbsp;&nbsp;<input name="SortNames" type="text" class="input" id="SortNames" value="创意概念" maxlength="200" style="width:120px;"></td>
		<td>产品</td>
		<td width="225"><input name="SortUrls" type="text" id="SortUrls" value="" size="18" maxlength="255" class="input" style="width:90%"></td>
		<td width="90"><input name="SortOrders" type="text" class="input" id="SortOrders" value="3" size="3" maxlength="4" style="width:90%"></td>
		<td align="center"><a href="?action=off&amp;id=7" title="启用"><img src="../../images/toolbar_ok.gif"></a></td>
		<td width="225"><a href="AspCms_SortAdd.asp?id=7">添加子类</a> <a href="AspCms_SortEdit.asp?id=7">修改</a> </td></tr>
		<tr bgcolor="#FFFFFF" align="center" onmouseover="this.bgColor='#CDE6FF'" onmouseout="this.bgColor='#FFFFFF'">
		<td width="47" height="25"><input type="checkbox" name="id" value="20" class="checkbox"><input type="hidden" name="SortIDs" value="20"></td>
		<td width="70">20</td>
		<td align="left" width="280"><img src="../../images/01.gif"><img src="../../images/02.gif"><img src="../../images/kong.gif">&nbsp;&nbsp;<input name="SortNames" type="text" class="input" id="SortNames" value="促销产品" maxlength="200" style="width:120px;"></td>
		<td>产品</td>
		<td width="225"><input name="SortUrls" type="text" id="SortUrls" value="" size="18" maxlength="255" class="input" style="width:90%"></td>
		<td width="90"><input name="SortOrders" type="text" class="input" id="SortOrders" value="99" size="3" maxlength="4" style="width:90%"></td>
		<td align="center"><a href="?action=off&amp;id=20" title="启用"><img src="../../images/toolbar_ok.gif"></a></td>
		<td width="225"><a href="AspCms_SortAdd.asp?id=20">添加子类</a> <a href="AspCms_SortEdit.asp?id=20">修改</a> </td></tr>
		</tbody></table></td></tr><tr bgcolor="#FFFFFF" align="center" onmouseover="this.bgColor='#CDE6FF'" onmouseout="this.bgColor='#FFFFFF'">
		<td width="47" height="25"><input type="checkbox" name="id" value="8" class="checkbox"><input type="hidden" name="SortIDs" value="8"></td>
		<td width="70">8</td>
		<td align="left" width="280"><a href="###" onclick="showHide('tab8','imgtab8');" target="_self"><img id="imgtab8" src="../../images/ico_4.gif"></a>&nbsp;&nbsp;<input name="SortNames" type="text" class="input" id="SortNames" value="资料下载" maxlength="200" style="width:120px;"></td>
		<td>下载</td>
		<td width="225"><input name="SortUrls" type="text" id="SortUrls" value="" size="18" maxlength="255" class="input" style="width:90%"></td>
		<td width="90"><input name="SortOrders" type="text" class="input" id="SortOrders" value="3" size="3" maxlength="4" style="width:90%"></td>
		<td align="center"><a href="?action=off&amp;id=8" title="启用"><img src="../../images/toolbar_ok.gif"></a></td>
		<td width="225"><a href="AspCms_SortAdd.asp?id=8">添加子类</a> <a href="AspCms_SortEdit.asp?id=8">修改</a> </td></tr>
		<tr><td colspan="8"><table cellspacing="0" cellpadding="0" width="100%" align="center" border="0" id="tab8"><tbody><tr bgcolor="#FFFFFF" align="center" onmouseover="this.bgColor='#CDE6FF'" onmouseout="this.bgColor='#FFFFFF'">
		<td width="47" height="25"><input type="checkbox" name="id" value="10" class="checkbox"><input type="hidden" name="SortIDs" value="10"></td>
		<td width="70">10</td>
		<td align="left" width="280"><img src="../../images/01.gif"><img src="../../images/02.gif"><img src="../../images/kong.gif">&nbsp;&nbsp;<input name="SortNames" type="text" class="input" id="SortNames" value="合同下载" maxlength="200" style="width:120px;"></td>
		<td>下载</td>
		<td width="225"><input name="SortUrls" type="text" id="SortUrls" value="" size="18" maxlength="255" class="input" style="width:90%"></td>
		<td width="90"><input name="SortOrders" type="text" class="input" id="SortOrders" value="3" size="3" maxlength="4" style="width:90%"></td>
		<td align="center"><a href="?action=off&amp;id=10" title="启用"><img src="../../images/toolbar_ok.gif"></a></td>
		<td width="225"><a href="AspCms_SortAdd.asp?id=10">添加子类</a> <a href="AspCms_SortEdit.asp?id=10">修改</a> </td></tr>
		<tr bgcolor="#FFFFFF" align="center" onmouseover="this.bgColor='#CDE6FF'" onmouseout="this.bgColor='#FFFFFF'">
		<td width="47" height="25"><input type="checkbox" name="id" value="9" class="checkbox"><input type="hidden" name="SortIDs" value="9"></td>
		<td width="70">9</td>
		<td align="left" width="280"><img src="../../images/01.gif"><img src="../../images/02.gif"><img src="../../images/kong.gif">&nbsp;&nbsp;<input name="SortNames" type="text" class="input" id="SortNames" value="工具软件" maxlength="200" style="width:120px;"></td>
		<td>下载</td>
		<td width="225"><input name="SortUrls" type="text" id="SortUrls" value="" size="18" maxlength="255" class="input" style="width:90%"></td>
		<td width="90"><input name="SortOrders" type="text" class="input" id="SortOrders" value="4" size="3" maxlength="4" style="width:90%"></td>
		<td align="center"><a href="?action=off&amp;id=9" title="启用"><img src="../../images/toolbar_ok.gif"></a></td>
		<td width="225"><a href="AspCms_SortAdd.asp?id=9">添加子类</a> <a href="AspCms_SortEdit.asp?id=9">修改</a> </td></tr>
		</tbody></table></td></tr><tr bgcolor="#FFFFFF" align="center" onmouseover="this.bgColor='#CDE6FF'" onmouseout="this.bgColor='#FFFFFF'">
		<td width="47" height="25"><input type="checkbox" name="id" value="11" class="checkbox"><input type="hidden" name="SortIDs" value="11"></td>
		<td width="70">11</td>
		<td align="left" width="280"><a href="###" onclick="showHide('tab11','imgtab11');" target="_self"><img id="imgtab11" src="../../images/ico_4.gif"></a>&nbsp;&nbsp;<input name="SortNames" type="text" class="input" id="SortNames" value="招聘信息" maxlength="200" style="width:120px;"></td>
		<td>招聘</td>
		<td width="225"><input name="SortUrls" type="text" id="SortUrls" value="" size="18" maxlength="255" class="input" style="width:90%"></td>
		<td width="90"><input name="SortOrders" type="text" class="input" id="SortOrders" value="4" size="3" maxlength="4" style="width:90%"></td>
		<td align="center"><a href="?action=off&amp;id=11" title="启用"><img src="../../images/toolbar_ok.gif"></a></td>
		<td width="225"><a href="AspCms_SortAdd.asp?id=11">添加子类</a> <a href="AspCms_SortEdit.asp?id=11">修改</a> </td></tr>
		<tr><td colspan="8"><table cellspacing="0" cellpadding="0" width="100%" align="center" border="0" id="tab11"><tbody><tr bgcolor="#FFFFFF" align="center" onmouseover="this.bgColor='#CDE6FF'" onmouseout="this.bgColor='#FFFFFF'">
		<td width="47" height="25"><input type="checkbox" name="id" value="12" class="checkbox"><input type="hidden" name="SortIDs" value="12"></td>
		<td width="70">12</td>
		<td align="left" width="280"><img src="../../images/01.gif"><img src="../../images/02.gif"><img src="../../images/kong.gif">&nbsp;&nbsp;<input name="SortNames" type="text" class="input" id="SortNames" value="全职岗位" maxlength="200" style="width:120px;"></td>
		<td>招聘</td>
		<td width="225"><input name="SortUrls" type="text" id="SortUrls" value="" size="18" maxlength="255" class="input" style="width:90%"></td>
		<td width="90"><input name="SortOrders" type="text" class="input" id="SortOrders" value="4" size="3" maxlength="4" style="width:90%"></td>
		<td align="center"><a href="?action=off&amp;id=12" title="启用"><img src="../../images/toolbar_ok.gif"></a></td>
		<td width="225"><a href="AspCms_SortAdd.asp?id=12">添加子类</a> <a href="AspCms_SortEdit.asp?id=12">修改</a> </td></tr>
		<tr bgcolor="#FFFFFF" align="center" onmouseover="this.bgColor='#CDE6FF'" onmouseout="this.bgColor='#FFFFFF'">
		<td width="47" height="25"><input type="checkbox" name="id" value="13" class="checkbox"><input type="hidden" name="SortIDs" value="13"></td>
		<td width="70">13</td>
		<td align="left" width="280"><img src="../../images/01.gif"><img src="../../images/02.gif"><img src="../../images/kong.gif">&nbsp;&nbsp;<input name="SortNames" type="text" class="input" id="SortNames" value="兼职岗位" maxlength="200" style="width:120px;"></td>
		<td>招聘</td>
		<td width="225"><input name="SortUrls" type="text" id="SortUrls" value="" size="18" maxlength="255" class="input" style="width:90%"></td>
		<td width="90"><input name="SortOrders" type="text" class="input" id="SortOrders" value="5" size="3" maxlength="4" style="width:90%"></td>
		<td align="center"><a href="?action=off&amp;id=13" title="启用"><img src="../../images/toolbar_ok.gif"></a></td>
		<td width="225"><a href="AspCms_SortAdd.asp?id=13">添加子类</a> <a href="AspCms_SortEdit.asp?id=13">修改</a> </td></tr>
		<tr bgcolor="#FFFFFF" align="center" onmouseover="this.bgColor='#CDE6FF'" onmouseout="this.bgColor='#FFFFFF'">
		<td width="47" height="25"><input type="checkbox" name="id" value="14" class="checkbox"><input type="hidden" name="SortIDs" value="14"></td>
		<td width="70">14</td>
		<td align="left" width="280"><img src="../../images/01.gif"><img src="../../images/02.gif"><img src="../../images/kong.gif">&nbsp;&nbsp;<input name="SortNames" type="text" class="input" id="SortNames" value="实习岗位" maxlength="200" style="width:120px;"></td>
		<td>招聘</td>
		<td width="225"><input name="SortUrls" type="text" id="SortUrls" value="" size="18" maxlength="255" class="input" style="width:90%"></td>
		<td width="90"><input name="SortOrders" type="text" class="input" id="SortOrders" value="6" size="3" maxlength="4" style="width:90%"></td>
		<td align="center"><a href="?action=off&amp;id=14" title="启用"><img src="../../images/toolbar_ok.gif"></a></td>
		<td width="225"><a href="AspCms_SortAdd.asp?id=14">添加子类</a> <a href="AspCms_SortEdit.asp?id=14">修改</a> </td></tr>
		</tbody></table></td></tr><tr bgcolor="#FFFFFF" align="center" onmouseover="this.bgColor='#CDE6FF'" onmouseout="this.bgColor='#FFFFFF'">
		<td width="47" height="25"><input type="checkbox" name="id" value="15" class="checkbox"><input type="hidden" name="SortIDs" value="15"></td>
		<td width="70">15</td>
		<td align="left" width="280"><a href="###" onclick="showHide('tab15','imgtab15');" target="_self"><img id="imgtab15" src="../../images/ico_4.gif"></a>&nbsp;&nbsp;<input name="SortNames" type="text" class="input" id="SortNames" value="公司相册" maxlength="200" style="width:120px;"></td>
		<td>相册</td>
		<td width="225"><input name="SortUrls" type="text" id="SortUrls" value="" size="18" maxlength="255" class="input" style="width:90%"></td>
		<td width="90"><input name="SortOrders" type="text" class="input" id="SortOrders" value="5" size="3" maxlength="4" style="width:90%"></td>
		<td align="center"><a href="?action=off&amp;id=15" title="启用"><img src="../../images/toolbar_ok.gif"></a></td>
		<td width="225"><a href="AspCms_SortAdd.asp?id=15">添加子类</a> <a href="AspCms_SortEdit.asp?id=15">修改</a> </td></tr>
		<tr><td colspan="8"><table cellspacing="0" cellpadding="0" width="100%" align="center" border="0" id="tab15"><tbody><tr bgcolor="#ffffff" align="center" onmouseover="this.bgColor='#CDE6FF'" onmouseout="this.bgColor='#FFFFFF'">
		<td width="47" height="25"><input type="checkbox" name="id" value="16" class="checkbox"><input type="hidden" name="SortIDs" value="16"></td>
		<td width="70">16</td>
		<td align="left" width="280"><img src="../../images/01.gif"><img src="../../images/02.gif"><img src="../../images/kong.gif">&nbsp;&nbsp;<input name="SortNames" type="text" class="input" id="SortNames" value="公司场景" maxlength="200" style="width:120px;"></td>
		<td>相册</td>
		<td width="225"><input name="SortUrls" type="text" id="SortUrls" value="" size="18" maxlength="255" class="input" style="width:90%"></td>
		<td width="90"><input name="SortOrders" type="text" class="input" id="SortOrders" value="5" size="3" maxlength="4" style="width:90%"></td>
		<td align="center"><a href="?action=off&amp;id=16" title="启用"><img src="../../images/toolbar_ok.gif"></a></td>
		<td width="225"><a href="AspCms_SortAdd.asp?id=16">添加子类</a> <a href="AspCms_SortEdit.asp?id=16">修改</a> </td></tr>
		<tr bgcolor="#ffffff" align="center" onmouseover="this.bgColor='#CDE6FF'" onmouseout="this.bgColor='#FFFFFF'">
		<td width="47" height="25"><input type="checkbox" name="id" value="17" class="checkbox"><input type="hidden" name="SortIDs" value="17"></td>
		<td width="70">17</td>
		<td align="left" width="280"><img src="../../images/01.gif"><img src="../../images/02.gif"><img src="../../images/kong.gif">&nbsp;&nbsp;<input name="SortNames" type="text" class="input" id="SortNames" value="公司活动" maxlength="200" style="width:120px;"></td>
		<td>相册</td>
		<td width="225"><input name="SortUrls" type="text" id="SortUrls" value="" size="18" maxlength="255" class="input" style="width:90%"></td>
		<td width="90"><input name="SortOrders" type="text" class="input" id="SortOrders" value="6" size="3" maxlength="4" style="width:90%"></td>
		<td align="center"><a href="?action=off&amp;id=17" title="启用"><img src="../../images/toolbar_ok.gif"></a></td>
		<td width="225"><a href="AspCms_SortAdd.asp?id=17">添加子类</a> <a href="AspCms_SortEdit.asp?id=17">修改</a> </td></tr>
		</tbody></table></td></tr><tr bgcolor="#ffffff" align="center" onmouseover="this.bgColor='#CDE6FF'" onmouseout="this.bgColor='#FFFFFF'">
		<td width="47" height="25"><input type="checkbox" name="id" value="18" class="checkbox"><input type="hidden" name="SortIDs" value="18"></td>
		<td width="70">18</td>
		<td align="left" width="280"><img src="../../images/kong.gif">&nbsp;&nbsp;<input name="SortNames" type="text" class="input" id="SortNames" value="在线留言" maxlength="200" style="width:120px;"></td>
		<td>链接</td>
		<td width="225"><input name="SortUrls" type="text" id="SortUrls" value="/gbook/" size="18" maxlength="255" class="input" style="width:90%"></td>
		<td width="90"><input name="SortOrders" type="text" class="input" id="SortOrders" value="6" size="3" maxlength="4" style="width:90%"></td>
		<td align="center"><a href="?action=off&amp;id=18" title="启用"><img src="../../images/toolbar_ok.gif"></a></td>
		<td width="225"><a href="AspCms_SortAdd.asp?id=18">添加子类</a> <a href="AspCms_SortEdit.asp?id=18">修改</a> </td></tr>
		<tr bgcolor="#ffffff" align="center" onmouseover="this.bgColor='#CDE6FF'" onmouseout="this.bgColor='#FFFFFF'">
		<td width="47" height="25"><input type="checkbox" name="id" value="19" class="checkbox"><input type="hidden" name="SortIDs" value="19"></td>
		<td width="70">19</td>
		<td align="left" width="280"><img src="../../images/kong.gif">&nbsp;&nbsp;<input name="SortNames" type="text" class="input" id="SortNames" value="关于我们" maxlength="200" style="width:120px;"></td>
		<td>单篇</td>
		<td width="225"><input name="SortUrls" type="text" id="SortUrls" value="" size="18" maxlength="255" class="input" style="width:90%"></td>
		<td width="90"><input name="SortOrders" type="text" class="input" id="SortOrders" value="7" size="3" maxlength="4" style="width:90%"></td>
		<td align="center"><a href="?action=off&amp;id=19" title="启用"><img src="../../images/toolbar_ok.gif"></a></td>
		<td width="225"><a href="AspCms_SortAdd.asp?id=19">添加子类</a> <a href="AspCms_SortEdit.asp?id=19">修改</a> </td></tr>
		<tr bgcolor="#ffffff" align="center" onmouseover="this.bgColor='#CDE6FF'" onmouseout="this.bgColor='#FFFFFF'">
		<td width="47" height="25"><input type="checkbox" name="id" value="107" class="checkbox"><input type="hidden" name="SortIDs" value="107"></td>
		<td width="70">107</td>
		<td align="left" width="280"><img src="../../images/kong.gif">&nbsp;&nbsp;<input name="SortNames" type="text" class="input" id="SortNames" value="啦啦" maxlength="200" style="width:120px;"></td>
		<td>文章</td>
		<td width="225"><input name="SortUrls" type="text" id="SortUrls" value="" size="18" maxlength="255" class="input" style="width:90%"></td>
		<td width="90"><input name="SortOrders" type="text" class="input" id="SortOrders" value="8" size="3" maxlength="4" style="width:90%"></td>
		<td align="center"><a href="?action=off&amp;id=107" title="启用"><img src="../../images/toolbar_ok.gif"></a></td>
		<td width="225"><a href="AspCms_SortAdd.asp?id=107">添加子类</a> <a href="AspCms_SortEdit.asp?id=107">修改</a> <a href="?action=del&amp;id=107" onclick="return confirm('确定要删除吗')">删除</a></td>
		</tr>
		<tr bgcolor="#ffffff" align="center" onmouseover="this.bgColor='#CDE6FF'" onmouseout="this.bgColor='#FFFFFF'">
		<td width="47" height="25"><input type="checkbox" name="id" value="101" class="checkbox"><input type="hidden" name="SortIDs" value="101"></td>
		<td width="70">101</td>
		<td align="left" width="280"><a href="###" onclick="showHide('tab101','imgtab101');" target="_self"><img id="imgtab101" src="../../images/ico_4.gif"></a>&nbsp;&nbsp;<input name="SortNames" type="text" class="input" id="SortNames" value="在线视频" maxlength="200" style="width:120px;"></td>
		<td>视频</td>
		<td width="225"><input name="SortUrls" type="text" id="SortUrls" value="" size="18" maxlength="255" class="input" style="width:90%"></td>
		<td width="90"><input name="SortOrders" type="text" class="input" id="SortOrders" value="9" size="3" maxlength="4" style="width:90%"></td>
		<td align="center"><a href="?action=off&amp;id=101" title="启用"><img src="../../images/toolbar_ok.gif"></a></td>
		<td width="225"><a href="AspCms_SortAdd.asp?id=101">添加子类</a> <a href="AspCms_SortEdit.asp?id=101">修改</a> <a href="?action=del&amp;id=101" onclick="return confirm('确定要删除吗')">删除</a></td>
		</tr>
		<tr><td colspan="8"><table cellspacing="0" cellpadding="0" width="100%" align="center" border="0" id="tab101"><tbody><tr bgcolor="#ffffff" align="center" onmouseover="this.bgColor='#CDE6FF'" onmouseout="this.bgColor='#FFFFFF'">
		<td width="47" height="25"><input type="checkbox" name="id" value="105" class="checkbox"><input type="hidden" name="SortIDs" value="105"></td>
		<td width="70">105</td>
		<td align="left" width="280"><img src="../../images/01.gif"><img src="../../images/02.gif"><img src="../../images/kong.gif">&nbsp;&nbsp;<input name="SortNames" type="text" class="input" id="SortNames" value="上谷学堂" maxlength="200" style="width:120px;"></td>
		<td>视频</td>
		<td width="225"><input name="SortUrls" type="text" id="SortUrls" value="" size="18" maxlength="255" class="input" style="width:90%"></td>
		<td width="90"><input name="SortOrders" type="text" class="input" id="SortOrders" value="10" size="3" maxlength="4" style="width:90%"></td>
		<td align="center"><a href="?action=off&amp;id=105" title="启用"><img src="../../images/toolbar_ok.gif"></a></td>
		<td width="225"><a href="AspCms_SortAdd.asp?id=105">添加子类</a> <a href="AspCms_SortEdit.asp?id=105">修改</a> <a href="?action=del&amp;id=105" onclick="return confirm('确定要删除吗')">删除</a></td>
		</tr>
		</tbody></table></td></tr></tbody></table></td></tr>
		    </tbody></table>
			
			
			
            </div>
            
  			<!-- 内容结束 -->

        </div>
      </div>
    </div>
  </div>
</div>
  </body>
</html>
