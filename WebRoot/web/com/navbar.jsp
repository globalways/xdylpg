<%@ page pageEncoding="UTF-8"%>
<%@ page import="com.xdylpg.ORM.Comconsor"
		 import="java.util.*"
		 import="com.xdylpg.ORM.CBInfo"
 %>

<%
	CBInfo com_navbar = (CBInfo)request.getSession().getAttribute("com");
	List<Comconsor> list = (List<Comconsor>)request.getAttribute("ccsParentsList");
	Comconsor cs = (Comconsor)request.getAttribute("parentsSort");
	if(cs == null)
		cs = new Comconsor();
 %>

<div class="navbar">
          <div class="navbar-inner">
            <div class="container">
              <ul class="nav">
              <li><a href='com-home?comnum=<%=com_navbar.getComnum() %>'>首页</a></li>
              	<%
              		for(Comconsor c : list)
              		{
              			if(c.getSornum().equals(cs.getSornum()))
              				out.print("<li class='active'><a href='com-s?sort="+c.getSornum()+"'>");
              			else
              				out.print("<li><a href='com-s?sort="+c.getSornum()+"'>");
              			out.print(c.getSorname());
              			out.print("</a></li>");
              		}
              	 %>
<!--                 <li class="active"><a href="#">Home</a></li>
                <li><a href="#">Projects</a></li>
                <li><a href="#">Services</a></li>
                <li><a href="#">Downloads</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Contact</a></li> -->
              </ul>
            </div>
          </div>
</div><!-- /.navbar -->
