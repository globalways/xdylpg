<%@ page pageEncoding="UTF-8"
	import="com.xdylpg.ORM.CBInfo"
	import="net.sf.json.JSONArray"
	import="net.sf.json.JSONObject"
%>
<%
CBInfo com_jumbotron = (CBInfo)request.getSession().getAttribute("com");
String carousel = com_jumbotron.getCarousel();
	JSONArray ja = JSONArray.fromObject(carousel);
 %>
        <!-- Jumbotron -->
      <div class="jumbotron">
        <div id="myCarousel" class="carousel slide">
		  <ol class="carousel-indicators">
		 	<%
		 		for(int cj = 0;cj<ja.size();cj++)
		 		{
		 	%>
			<li data-target="#myCarousel" data-slide-to="<%=cj %>" class='<%=cj==0?"active":""%>'></li>
			<%} %>
		  </ol>
		  <!-- Carousel items -->
		  <div class="carousel-inner">
		  <%
		  		for(int ci=0;ci<ja.size();ci++)
		  		{
		  			JSONObject jo = ja.getJSONObject(ci);
		  %>
			<div class='item <%=ci==0?"active":""%>'>
				<img src="<%=jo.get("addr") %>" style="
					height: 300px;
					width: 100%;
				">
				<div class="carousel-caption">
                      <%--<h4>Third Thumbnail label</h4>
                      --%><p><%=jo.getString("desc") %></p>
                </div>
			</div>
			<%} %>
		  </div>
		  <!-- Carousel nav -->
		  <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
		  <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
		</div>
      </div>