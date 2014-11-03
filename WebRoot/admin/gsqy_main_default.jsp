 <%@page pageEncoding="utf-8" %> 
 <%@page import="com.xdylpg.ORM.CBInfo" %>
 <%
 	CBInfo com = new CBInfo();
 	Object o = request.getSession().getAttribute("admin_currentCom");
 	if(o == null)
 		out.print("ERROR: no company found!");
 	else 
 		com = (CBInfo)o;
  %>
            <!-- 内容开始 -->
		<div class="hero-unit" style="
    height: 198px;
    padding: 0px;
    margin-top: 70px;
">
	<div style="
    padding: 10px;
">
		  <h3><%=com.getBusname() %></h3>
		  <p>欢迎使用</p>
		  <p>
		  </p>
		  </div>
		</div>

			<!-- 内容结束 -->
       