<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	import="com.xdylpg.ORM.Advice"
	import="com.xdylpg.ORM.BusAdmin"
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
    <title>反馈列表</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="<%=basePath %>res/tp/bs/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" type="text/css" href="./css/my.css" />

    <script src="<%=basePath %>res/tp/jquery.js"></script>
    <script src="<%=basePath %>res/tp/bs/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	var id;
        $("li.delete").click(function(){
        	id = $(this).parents("td").siblings("td.id").text();
    		$("#delete .modal-body p").text($(this).parents("td").siblings("td.adviser").text());
    	});
    	$("button.deleteQR").click(function(){
    		$.post("fb-del",{advnum:id},function(){
	    		$("#delete").modal('hide');
	    		window.location.reload();
    		});

    	});
    });
    </script>
  </head>
  <body>
  <input type="hidden" name="nav" value='1-nav-3' />
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
				ArrayList<Advice> fbList = (ArrayList<Advice>)request.getAttribute("fblist");
            	if(fbList.size() == 0)
            		return;
				Iterator<Advice> i = fbList.iterator();
			 %>
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>#</th>
                  <th>姓名</th>
                  <th>电话</th>
                  <th>邮箱</th>
                  <th>内容</th>
                  <th>状态</th>
                  <th style="padding-right:94px;">处理</th>
                </tr>
              </thead>
              <tbody>
              <%for(Advice c : fbList)
              	{
               %>
                <tr>
               	  <td class="id"><%=c.getAdvnum() %></td>
                  <td class="adviser"><%=c.getAdviser() %></td>
                  <td><%=c.getAdvtel() %></td>
                  <td><%=c.getAdvmai() %></td>
                  <td><%=c.getAdvcon() %></td>
                  <td><%=c.getIsread() %></td>
                  <td>
                    <div class="btn-group">
                      <a class="btn btn-primary" data-toggle="modal" href="#fbdetail" title="查看详细"><i class="icon-search icon-white"></i></a>
                      <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
                      <br><ul class="dropdown-menu" style="min-width:140px;">
                      
                        <li class="delete"><a data-toggle="modal" href="#delete"><i class="icon-trash" ></i> 删除</a></li>
                      </ul>
                    </div>
                    
                    <div id="fbdetail" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h5 id="myModalLabel">来自<%=c.getAdviser() %>的建议:</h5>
                      </div>
                      <div class="modal-body">
                        <p><%=c.getAdvcon() %></p>
                      </div>
                      <div class="modal-footer">
                        <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">确认</button>
                      </div>
                    </div>
                    
                    
                    <div id="delete" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                <%}%>
              </tbody>
            </table>

            <!-- fenye -->
            <div class="pagination pagination-centered">
              <ul>
              <%
              		String action = "fb-list";
              		int p = (Integer)request.getAttribute("p");
              		int count = (Integer)request.getAttribute("count");
              		int ps = (Integer)request.getAttribute("ps");
              		int pn = (Integer)request.getAttribute("pn");
              		
              		
              		
              		if(p==1)
              		out.print("<li class='disabled'><a>Prev</a></li>");
              		else
              		out.print("<li><a href='"+action+"?p="+(p-1)+"&ps="+ps+"'>Prev</a></li>");
              		
              		for(int temp=1;temp<=pn;temp++)
              		{
              			if(temp==p)
              			out.print("<li class='active'><a href='#'>"+temp+"</a></li>");
              			else
              			out.print("<li><a href='"+action+"?p="+temp+"&ps="+ps+"'>"+temp+"</a></li>");
              		}
              		if(p==pn)
              		out.print("<li class='disabled'><a>Next</a></li>");
              		else
              		out.print("<li><a href='"+action+"?p="+(p+1)+"&ps="+ps+"'>Next</a></li>");
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