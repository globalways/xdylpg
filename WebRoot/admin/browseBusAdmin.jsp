<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	import="com.xdylpg.ORM.Shop"
	import="com.xdylpg.ORM.BusAdmin"
	import="com.xdylpg.ORM.Auth"
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%

	List<BusAdmin> busAdminList = (List<BusAdmin>)request.getAttribute("busAdminList");
	Iterator<BusAdmin> i = busAdminList.iterator();
 %>
<!DOCTYPE html>
<html>
  <head>
    <title>账户列表</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" type="text/css" href="./css/my.css" />

    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	var busAdminNum;
        $("li.deleteAdmin").click(function(){
        	busAdminNum = $(this).parents("td").siblings("td.busadmnum").text();
    		$("#deleteAdmin .modal-body p").text($(this).parents("td").siblings("td.admname").text());
    	});
    	$("button.deleteQR").click(function(){
    		$.post("admin_delBusAdmin",{busadmnum:busAdminNum},function(){
	    		$("#deleteAdmin").modal('hide');
	    		window.location.reload();
    		});

    	});
    	$("li.invalidateBusAdmin").click(function(){
    		busAdminNum = $(this).parents("td").siblings("td.busadmnum").text();
    		$.get("admin_invalidateBusAdmin?busadmnum="+busAdminNum,function(){
    		window.location.reload();
    		});
    	});
    });
    </script>
  </head>
  <body>
  <input type="hidden" name="nav" value='3-nav-1' />
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
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>#</th>
                  <th>账户</th>
                  <th>真实姓名</th>
                  <th>电话</th>
                  <th>邮箱地址</th>
                  <th>账号类型</th>
                  <th style="padding-right:94px;">处理</th>
                </tr>
              </thead>
              <tbody>
              <%
              	while(i.hasNext())
              	{
              		BusAdmin tmp = i.next();
              %>
                <tr>
                  <td class="busadmnum"><%=tmp.getBusadmnum() %></td>
                  <td><%=tmp.getAdmacc() %></td>
                  <td class="admname"><%=tmp.getAdmname() %></td>
                  <td><%=tmp.getAdmtel() %></td>
                  <td><%=tmp.getAdmemail() %></td>
                  <td><%=tmp.getAuth().getAdname() %></td>
                  <td>
                    <div class="btn-group">
                      <a class="btn btn-primary" href="#showShopDetail" title="查看详细"><i class="icon-list-alt icon-white"></i></a>
                      <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
                      <br><ul class="dropdown-menu" style="min-width:140px;">
                      
                        <li><a href="<%=basePath%>admin/admin_viewBusAdmin?busadmnum=<%=tmp.getBusadmnum()%>"><i class="icon-pencil"></i> 编辑</a></li>
                        <li class="deleteAdmin"><a data-toggle="modal" href="#deleteAdmin"><i class="icon-trash" ></i> 删除</a></li>
                        <li class="invalidateBusAdmin"><a href="javascript:void(0);"><i class="icon-ban-circle"></i> 停用</a></li>
                        
                      </ul>
                    </div>
                    <div id="deleteAdmin" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
              		out.print("<li><a href='admin_browseBusAdmin?pageNo="+(pageNo-1)+"&pageSize="+pageSize+"'>Prev</a></li>");
              		
              		for(int temp=1;temp<=pageNum;temp++)
              		{
              			if(temp==pageNo)
              			out.print("<li class='active'><a href='#'>"+temp+"</a></li>");
              			else
              			out.print("<li><a href='admin_browseBusAdmin?pageNo="+temp+"&pageSize="+pageSize+"'>"+temp+"</a></li>");
              		}
              		if(pageNo==pageNum)
              		out.print("<li class='disabled'><a>Next</a></li>");
              		else
              		out.print("<li><a href='admin_browseBusAdmin?pageNo="+(pageNo+1)+"&pageSize="+pageSize+"'>Next</a></li>");
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