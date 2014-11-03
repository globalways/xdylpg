<%@page pageEncoding="utf-8" %>
<style>
#user-info a:hover{
 color: #08c;
}
#user-info a{
text-shadow: none;
outline:none;
text-decoration:none;
}
</style>
<div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            is<span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="index">新都黄页</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li><a href="about#about">关于我们</a></li>
              <li><a href="about#about">联系我们</a></li>
              <li><a href="about#coo-1">入驻合作</a></li>
            </ul><%--
            
            <form class="navbar-form pull-right">
              <input class="span2" type="text" placeholder="账号/邮箱/手机">
              <input class="span2" type="password" placeholder="密码">
              <button type="submit" class="btn">登录</button>
            </form>
          
          --%><div id="user-info" class="pull-right" >
           <a href="#" class="btn btn-link">算大</a> 
           </div>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>