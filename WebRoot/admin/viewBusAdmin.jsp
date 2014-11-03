<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" 
	import="com.xdylpg.ORM.BusAdmin"
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <title>管理员详情</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="<%=basePath %>res/tp/bs/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <script src="<%=basePath %>res/tp/jquery.js"></script>
    <script src="<%=basePath %>res/tp/bs/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>admin/css/my.css" />
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
            <%
            	BusAdmin ba = (BusAdmin)request.getAttribute("ba");
            %>
            <form class="form-horizontal" action="<%=basePath%>admin/admin_updateBusAdmin" method="post">
			  
			  <input type="hidden" name="busadmnum"  value="<%=ba.getBusadmnum() %>" />
			  <div class="control-group">
			    <label class="control-label">账号</label>
			    <div class="controls">
			      <input type="text" id="admacc" name="admacc" value="<%=ba.getAdmacc()%>"/>
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" >密码</label>
			    <div class="controls">
			      <input type="password" name="admpw" id="admpw" value="<%=ba.getAdmpw()%>" />
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" >管理员名字</label>
			    <div class="controls">
			      <input type="text" name="admname" id="admname" value="<%=ba.getAdmname()%>" />
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" >电话</label>
			    <div class="controls">
			      <input type="text"name="admtel" id="admtel" value="<%=ba.getAdmtel()%>"   />
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" >邮箱</label>
			    <div class="controls">
			      <input type="text" name="admemail" id="admemail" value="<%=ba.getAdmemail()%>"   />
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" >账户类型</label>
			    <div class="controls">
			     <label class="radio">
					  <input type="radio" name="auth.authnum" id="auth-option2" val="2">
					  系统账户
					</label>
					<label class="radio">
					  <input type="radio" name="auth.authnum" id="auth-option1" val="1">
					 商户账户
					</label>
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" >停/启用</label>
			    <div class="controls">
			      <input type="checkbox" name="status"  value="<%=ba.getStatus() %>" checked  />
			    </div>
			  </div>
			  <div class="control-group">
			    <div class="controls">
			      <a class="btn" href="javascript:void(0);" onclick="submit()">保存</a>
			    </div>
			  </div>
			</form>
			
<script type="text/javascript">
	$(document).ready(function(){
		$("#auth-option<%=ba.getAuth().getAuthnum()%>").attr("checked",true);
		var orginal = $(":checkbox").val();
		if(orginal == 1)
			$(":checkbox").attr("checked",true);
		else $(":checkbox").attr("checked",false);
	});
	var submit = function()
	{
		var auth = $(":radio:checked").attr("val");
		$("input[name='auth.authnum']").val(auth);
		$(":checkbox").val(0);
		$(":checkbox:checked").val(1);
		$("form").submit();
	};
</script>
            

  <!-- 内容结束 -->

        </div>
      </div>
    </div>
  </div>
</div>
  </body>
</html>