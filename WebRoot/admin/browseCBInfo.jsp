<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	import="com.xdylpg.ORM.CBInfo"
	import="com.xdylpg.ORM.BusAdmin"
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
    <title>公司企业列表</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="<%=basePath %>res/tp/bs/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" type="text/css" href="./css/my.css" />

    <script src="<%=basePath %>res/tp/jquery.js"></script>
    <script src="<%=basePath %>res/tp/bs/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	var comnum;
        $("li.deleteCBInfo").click(function(){
        	comnum = $(this).parents("td").siblings("td.comnum").text();
    		$("#deleteCBInfo .modal-body p").text($(this).parents("td").siblings("td.busname").text());
    	});
    	$("button.deleteQR").click(function(){
    		$.post("cbInfo_delCBInfo",{comnum:comnum},function(){
	    		$("#deleteCBInfo").modal('hide');
	    		window.location.reload();
    		});

    	});
    	$("li.invalidateCBInfo").click(function(){
    		comnum = $(this).parents("td").siblings("td.comnum").text();
    		$.get("cbInfo_invalidateCBInfo?comnum="+comnum,function(){
    		window.location.reload();
    		});
    	});
    });
    </script>
  </head>
  <body>
  <input type="hidden" name="nav" value='2-nav-1' />
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
            <%@include file="admin_subnav.jsp" %>
            <!-- 站点导航结束 -->
                                                         
            <!-- 内容开始 -->
            <%
				List<CBInfo> shopList = (List<CBInfo>)request.getAttribute("cbInfoList");
				Iterator<CBInfo> i = shopList.iterator();
			 %>
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
              <%for(CBInfo c : shopList)
              	{
               %>
                <tr>
                  <td class="comnum"><%=c.getComnum() %></td>
                  <td class="busname"><%=c.getBusname() %></td>
                  <td><%=c.getPinyinid() %></td>
                  <td><%=c.getBusAdmin().getAdmname() %></td>
                  <td><%=c.getBusphone() %></td>
                  <td><%=c.getBusaddr() %></td>
                  <td>
                    <div class="btn-group">
                      <a class="btn btn-primary" href="#showShopDetail" title="查看详细"><i class="icon-list-alt icon-white"></i></a>
                      <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
                      <br><ul class="dropdown-menu" style="min-width:140px;">
                      
                        <li><a href="#">预览</a></li>
                        <li><a target='_blank' href='com-cpc-index?comnum=<%=c.getComnum() %>'>进入内容管理</a></li>
                        <li class="divider" />
                        <li><a href='l_f?c=<%=c.getCategory().getBcnum() %>&b=<%=c.getComnum() %>'><i class='icon-pencil'></i> 编辑</a></li>
                        <li class="deleteCBInfo"><a data-toggle="modal" href="#deleteCBInfo"><i class="icon-trash" ></i> 删除</a></li>
                        <li><a href="#invalidateCBInfo"><i class="icon-ban-circle"></i> 停用</a></li>
                        
                      </ul>
                    </div>
                    <div id="deleteCBInfo" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h5 id="myModalLabel">确认删除吗？</h5>
                      </div>
                      <div class="modal-body">
                        <p>打发的说法的算法第三方</p>
                      </div>
                      <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
                        <button class="btn btn-primary deleteQR">确认</button>
                      </div>
                    </div>
                  </td>
                </tr>
                <%} %>
              </tbody>
            </table>

            <!-- fenye -->
            <div class="pagination pagination-centered">
              <ul>
              <%
              		int pageNo = (Integer)request.getAttribute("pageNo");
              		int count = (Integer)request.getAttribute("count");
              		int pageSize = (Integer)request.getAttribute("pageSize");
              		int pageNum = (Integer)request.getAttribute("pageNum");
              		
              		
              		
              		if(pageNo==1)
              		out.print("<li class='disabled'><a>Prev</a></li>");
              		else
              		out.print("<li><a href='cbInfo_browseCBInfo?pageNo="+(pageNo-1)+"&pageSize="+pageSize+"'>Prev</a></li>");
              		
              		for(int temp=1;temp<=pageNum;temp++)
              		{
              			if(temp==pageNo)
              			out.print("<li class='active'><a href='#'>"+temp+"</a></li>");
              			else
              			out.print("<li><a href='cbInfo_browseCBInfo?pageNo="+temp+"&pageSize="+pageSize+"'>"+temp+"</a></li>");
              		}
              		if(pageNo==pageNum)
              		out.print("<li class='disabled'><a>Next</a></li>");
              		else
              		out.print("<li><a href='cbInfo_browseCBInfo?pageNo="+(pageNo+1)+"&pageSize="+pageSize+"'>Next</a></li>");
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