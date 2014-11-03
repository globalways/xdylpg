<%@ page language="java"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>reset password</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>res/tp/bs/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath %>res/tp/bs/css/bootstrap-responsive.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath %>res/css/list.css" />
	<script type="text/javascript" src="<%=basePath %>res/tp/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath %>res/tp/bs/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	function submit_check(){
		
	    var newpw = $("#newpw").val();
	    var repeat = $("#repeat").val();
	    if(newpw == repeat)
    	{
    		$("form").submit();
    	}else{
    		alert("两次输入不一致");
    	}
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
			
      <form class="form-signin" action="<%=basePath %>resetPassword"  method="post">
        <h2 class="form-signin-heading">重置密码</h2>
        <input  id="newpw" type="text" class="input-block-level" placeholder="新密码" name="n" />
        <%
			String msg = (String)request.getParameter("r");
        	if(msg != null)
        	{
		%>
        <div class="alert alert-error">
		  	用户名或密码错误！
		</div>
		<%} %>
		<input id="repeat"  type="text" class="input-block-level" placeholder="确认新密码"/>
        <button class="btn btn-large btn-primary"  onclick="submit_check()" >确定</button>
      </form>

    </div>
  </body>
</html>
