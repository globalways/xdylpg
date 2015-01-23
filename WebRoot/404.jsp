<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>404_notfound</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>res/tp/bs/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath %>res/tp/bs/css/bootstrap-responsive.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath %>res/css/list.css" />
	<script type="text/javascript" src="<%=basePath %>res/tp/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath %>res/tp/bs/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function() {  
	    $("#profile").click(function() {  
	        profile();  
	    });  
	    $("#login").click(function() {  
	        login();  
	    });  
	});  
	function profile() {  
	    var url = 'http://localhost:8080/spring-json/json/person/profile/';  
	    var query = $('#id').val() + '/' + $('#name').val() + '/'  
	            + $('#status').val();  
	    url += query;  
	    alert(url);  
	    $.get(url, function(data) {  
	        alert("id: " + data.id + "\nname: " + data.name + "\nstatus: "  
	                + data.status);  
	    });  
	}  
	function login() {  
	    var mydata = {busname:"' + $('#name').val() + '",busaddr:"'+ $('#id').val() + '",busphone:"' + $('#status').val() + '"};  
	    alert(mydata);  
	    $.ajax({  
	        type : 'POST',  
	        contentType : 'application/json',  
	        url : "http://localhost:8080/xdylpg/restful/v1/stores",  
	        processData : false,  
	        dataType : 'json',  
	        data : mydata,  
	        success : function(data) {  
	           /*  alert("id: " + data.id + "\nname: " + data.name + "\nstatus: "  
	                    + data.status);   */
	                    alert("success");
	        },  
	        error:function (XMLHttpRequest, textStatus, errorThrown)
			{
				alert(textStatus+"-"+XMLHttpRequest.readyState+"-"+XMLHttpRequest.status);
			} 
	    }); 
	}
	</script>
  </head>
  <body>
  
  <div class="container">

     page not found,sorry

    </div>
    
    <table>  
    <tr>  
        <td>id</td>  
        <td><input id="id" value="100" /></td>  
    </tr>  
    <tr>  
        <td>name</td>  
        <td><input id="name" value="snowolf" /></td>  
    </tr>  
    <tr>  
        <td>status</td>  
        <td><input id="status" value="true" /></td>  
    </tr>  
    <tr>  
        <td><input type="button" id="profile" value="Profile——GET" /></td>  
        <td><input type="button" id="login" value="Login——POST" /></td>  
    </tr>  
</table>
  </body>
</html>
