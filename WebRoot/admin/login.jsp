<%@ page language="java"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>登录</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>res/tp/bs/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath %>res/tp/bs/css/bootstrap-responsive.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath %>res/css/list.css" />
	<script type="text/javascript" src="<%=basePath %>res/tp/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath %>res/tp/bs/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	function changeImage(){
	    var imgcode = document.getElementById("captcha");
	    imgcode.src="<%=basePath %>/vd.png?"+new Date();
	}
	</script>
	
	<style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }

    </style>
  </head>
  <body>
  
  <div class="container">
			
      <form class="form-signin" action="<%=basePath %>admin/login" method="post">
        <h2 class="form-signin-heading">请登录 <small><a href="<%=basePath %>forgotpassword">忘记密码？</a></small></h2>
        <input type="text" class="input-block-level" placeholder="账户名/邮箱" name="admacc" />
        <input type="password" class="input-block-level" placeholder="密码" name="admpw">
        <%
			String msg = (String)request.getParameter("r");
        	if(msg != null)
        	{
		%>
        <div class="alert alert-error">
		  	用户名或密码错误！
		</div>
		<%} %>
		<input type="text" class="input-block-level" placeholder="验证码 点击图片可更换" name="captcha" />
		<img id="captcha" src="<%=basePath %>vd.png" onclick="changeImage()" />
        <%--<label class="checkbox">
          <input type="checkbox" value="remember-me" name=""> 下次自动登录
        </label>
        --%><button class="btn btn-large btn-primary" type="submit">登录</button>
      </form>

    </div>
  </body>
</html>
