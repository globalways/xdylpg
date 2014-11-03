<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	import="com.xdylpg.ORM.Shop"
	import="com.xdylpg.ORM.BusAdmin"
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%

	List<Shop> shopList = (List)request.getAttribute("shopList");
	Iterator<Shop> i = shopList.iterator();
 %>
<!DOCTYPE html>
<html>
  <head>
    <title>商家列表</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" type="text/css" href="./css/my.css" />

    <script type="text/javascript" src="<%=basePath %>res/tp/jquery.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	var shopNum;
        $("li.deleteShop").click(function(){
        	shopNum = $(this).parents("td").siblings("td.shopNum").text();
    		$("#deleteShop .modal-body p").text($(this).parents("td").siblings("td.shopName").text());
    	});
    	$("button.deleteQR").click(function(){
    		$.post("shop_delShop",{shopNum:shopNum},function(){
	    		$("#deleteShop").modal('hide');
	    		window.location.reload();
    		});

    	});
    	$("li.invalidateShop").click(function(){
    		shopNum = $(this).parents("td").siblings("td.shopNum").text();
    		$.post("shop_invalidateShop?shopnum="+shopNum,function(){
    		window.location.reload();
    		});
    	});
    });
    </script>
  </head>
  <body>
  <input type="hidden" name="nav" value='2-nav-2' />
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12">
        <div class="row-fluid">
          <div class="span3">

            <!-- 管理员信息 -->
            <%@include file="admin_administrator.jsp" %>
            <!-- 分类列表 -->
             <%@include file="admin_nav.jsp" %>
          </div>

          <div class="span9">
            <!-- span12 占空行 -->
            <div class="span12"></div>
            
            <!-- 站点导航开始 -->
            <ul class="breadcrumb">
              <li><a href="#">首页</a> <span class="divider">/</span></li>
              <li><a href="#">商家管理</a> <span class="divider">/</span></li>
              <li class="active">商铺商店</li>
            </ul>
            <!-- 站点导航结束 -->
                                                         
            <!-- 内容开始 -->
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>#</th>
                  <th>名称</th>
                  <th>字母ID</th>
                  <th>负责人</th>
                  <th>电话</th>
                  <th>地址</th>
                  <th style="padding-right:94px;">处理</th>
                </tr>
              </thead>
              <tbody>
                <%
                	while(i.hasNext())
                	{
                		Shop tempShop = i.next();
                		out.print("<tr><td class='shopNum'>");
                		out.print(tempShop.getShopnum());
                		out.print("</td><td class='shopName'>");
                		out.print(tempShop.getBusname());
                		out.print("</td><td>");
                		out.print(tempShop.getPinyinid());
                		out.print("</td><td>");
                		out.print(tempShop.getBusAdmin().getAdmname());
                		out.print("</td><td>");
                		out.print(tempShop.getBusphone());
                		out.print("</td><td>");
                		out.print(tempShop.getBusaddr());
                		out.print("</td><td>");
                		
                		out.print("<div class='btn-group'>"+
                      "<a class='btn btn-primary' href='#showShopDetail' title='查看详细'><i class='icon-list-alt icon-white'></i></a>"+
                      "<a class='btn btn-primary dropdown-toggle' data-toggle='dropdown' href='#'><span class='caret'></span></a>"+
                      "<br><ul class='dropdown-menu' style='min-width:140px;'>"+
                        "<li><a href='#'>预览</a></li>"+
                        "<li class='divider' />"+
                        "<li><a href='l_f?c=2&b="+tempShop.getShopnum()+"'><i class='icon-pencil'></i> 编辑</a></li>"+
                        "<li class='deleteShop'><a data-toggle='modal' href='#deleteShop'><i class='icon-trash' ></i> 删除</a></li>"+
                        "<li class='invalidateShop'><a href><i class='icon-ban-circle'></i> 停用</a></li>"+
                      "</ul>"+
                    "</div>");
                		
                		
                		out.print("</td></tr>");
                	}
                 %>
              </tbody>
            </table>

            <!-- fenye -->
            <div class="pagination pagination-large pagination-centered">
              <ul>
              <%
              		int pageNo = (Integer)request.getAttribute("pageNo");
              		int count = (Integer)request.getAttribute("count");
              		int pageSize = (Integer)request.getAttribute("pageSize");
              		int pageNum = (Integer)request.getAttribute("pageNum");
              		
              		
              		
              		if(pageNo==1)
              		out.print("<li class='disabled'><a>Prev</a></li>");
              		else
              		out.print("<li><a href='shop_browseShop?pageNo="+(pageNo-1)+"&pageSize="+pageSize+"'>Prev</a></li>");
              		
              		for(int temp=1;temp<=pageNum;temp++)
              		{
              			if(temp==pageNo)
              			out.print("<li class='active'><a href='#'>"+temp+"</a></li>");
              			else
              			out.print("<li><a href='shop_browseShop?pageNo="+temp+"&pageSize="+pageSize+"'>"+temp+"</a></li>");
              		}
              		if(pageNo==pageNum)
              		out.print("<li class='disabled'><a>Next</a></li>");
              		else
              		out.print("<li><a href='shop_browseShop?pageNo="+(pageNo+1)+"&pageSize="+pageSize+"'>Next</a></li>");
               %>
              </ul>
            </div>
  <!-- 内容结束 -->

        </div>
      </div>
    </div>
  </div>
</div>
  </body>
</html>