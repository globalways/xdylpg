<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	import="com.xdylpg.ORM.Shop"
	import="com.xdylpg.ORM.Shoppro"
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Shop shop = (Shop)request.getAttribute("shop");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=shop.getBusname() %></title>

<link rel="stylesheet" type="text/css" href="<%=basePath %>res/tp/bs/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>web/shop/original.css" />
<%--<link rel="stylesheet" type="text/css" href="<%=basePath %>res/tp/bs/css/bootstrap-responsive.min.css" />
--%><script type="text/javascript" src="<%=basePath %>res/tp/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>res/tp/bs/js/bootstrap.min.js"></script>
<style type="text/css">
.hero-unit{
	padding:10px;
}
<img src="<%=basePath %>web/shop/map.png" alt="" />
</style>
</head>

<body>

<header>
            <div class="container">
                <div class="row">
                    <div class="span7">
                        <div class="logo">
                            <h1><%=shop.getBusname() %></h1>
                            <div></div>
                        </div>
                    </div>
                    <%--<div class="span5">
                        <div class="form" style="margin-top: 10px; margin-bottom: 10px;">
                            
                                    <div>
                                        
                                            13634134321
                                        
                                            杨浦区 彰武路38号同济联合广场 2楼(近同济大学)
                                    </div>
                                

                        </div>
                    </div>
                --%></div>
            </div>
</header>

<nav>
        <div class="navbar">
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span>Menu</span>
                    </a>
                    <div class="nav-collapse collapse">
                        <ul class="nav">
                            <li>
                           <a> 电话:<%=shop.getBusphone() %>&nbsp;&nbsp;地址:<%=shop.getBusaddr() %></a>
                                <%--<a href="#">夏月湘菜!仅售99元,价值160元2-3人超值套餐!麻辣鲜香,精致诱人菜...</a>                       
                            --%></li>  
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>
<section>
            <div class="content">
                <div class="container">
    <section>
        <div class="row">
            <div class="span12">
                <article style="position: relative;">
                    <a>关于我们
                    </a>
                    <p style="width:60%;min-height: 145px;">
                    <%=shop.getBusintr() %>
                    </p><img src="<%=basePath %>web/shop/map.png" style="position: absolute;right: 0px;top: 0px;" />
                    <hr>
                </article>
            </div>
        </div>
    </section>

    <div class="services">
        <div class="row">
            <article>
                <div class="span12" style="padding-bottom: 10px;">
                    <a>我们的图片墙</a>
                    <p>
                       	这里展示了我们的一些产品和实体照片     
                    </p>

                </div>
            </article>
        </div>
    </div>

    
<div class="services">
    <style>
        .service a,
        .service a:hover,
        .service a:focus {
            text-decoration: none;
        }
    </style>
    <section>
    <%
    	int rowhead = 1;
    	int next = 1;
    
	    Set<Shoppro> pro = shop.getShoppros();
		if(pro.size() != 0)
		{
		ArrayList<Shoppro> list = new ArrayList<Shoppro>(pro);
		Collections.sort(list);
		for(int i=0;i<list.size();i++)
		{
			try{
			if(i%16 == 0)
			{
				rowhead = 1;
		
    %>
        <div class="row">

            <div class="span6">
                <div class="col-l">
                    <div class="service">
                        <a id="" href="">
                            <div class="b-orange serv-block">
                                <img src="<%=list.get(i).getProimg()%>"  />
                                <h3><%=list.get(i).getProname()%></h3>
                            </div>
                        </a>
                        <p>
                         	<%=list.get(i).getProintr()%>
                        </p>
                        <a id="" href="#">链接 <i class="icon-double-angle-right"></i></a>
                    </div>
                </div>
                <div class="col-r">
                    <div class="service">
                        <a id="" href="">
                            <div class="b-green serv-block">
                                <img src="<%=list.get(i+1).getProimg()%>">
                                <h3>
                                   <%=list.get(i+1).getProname()%> 	
                                </h3>
                            </div>
                        </a>
                        <p>
                            <%=list.get(i+1).getProintr()%>
                        </p>
                        <a id="" href="">Link <i class="icon-double-angle-right"></i></a>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="span6">
                <div class="col-l">
                    <div class="service">
                        <a id="" href="">
                            <div class="b-purple serv-block">
                                <img src="<%=list.get(i+2).getProimg()%>">
                                <h3> <%=list.get(i+2).getProname()%> 	</h3>
                            </div>
                        </a>
                        <p>
                            <%=list.get(i+2).getProintr()%>
                        </p>
                        <a id="" href="">link <i class="icon-double-angle-right"></i></a>
                    </div>
                </div>
                <div class="col-r">
                    <div class="service">
                        <a id="" href="">
                        <div class="b-blue serv-block">
                            <img src="<%=list.get(i+3).getProimg()%>">
                            <h3><%=list.get(i+3).getProname()%></h3>
                        </div>
                        </a>
                        <p>
                            <%=list.get(i+3).getProintr()%>
                        </p>
                        <a id="" href="">link <i class="icon-double-angle-right"></i></a>
                    </div>
                </div>
                <div class="clearfix"></div>
                </div> <!-- end of span6 -->
        </div>
        <%}}catch(IndexOutOfBoundsException e){
        	continue;
        }
			
			} }%>
        
    </section>
</div>
<hr>


<%--

    <section>
        <div class="row">
            <div class="span12" style="padding-bottom: 1em;">
                <hr>
                <h2>
                    Wybrani Partnerzy i Klienci
                </h2>
            </div>
            <div class="span2">
                <a href="http://konteksthr.pl/">
                    <img src="Img/Logo/KontekstHR-logo.png" class="img-rounded" alt="KontekstHR International Group"></a>
            </div>
            <div class="span2">
                <a href="http://monier.pl">
                    <img src="http://www.monier.pl/typo3conf/ext/monier_template/images/logos/Braas_Logo_Claim_PL_web.png" class="img-rounded" alt="Monier"></a>
            </div>
            <div class="span2">
                <a href="http://polkomtel.pl/">
                    <img src="Img/Logo/PLUS_logo_nowe1.jpg" class="img-rounded" alt="Polkomtel S.A."></a>
            </div>
            <div class="span2">
                <a href="http://enjoymdlz.pl/">
                    <img src="Img/Logo/kraft-logo11.jpg" class="img-rounded" alt="Mondelez Inc"></a>
            </div>
            <div class="span2">
                <a href="http://www.aelia.pl">
                    <img src="Img/Logo/Aelia-logo.png" class="img-rounded" alt="Aelia Duty free"></a>
            </div>
            <div class="span2">
                <a href="http://danone.pl/">
                    <img src="Img/Logo/Danone-logo.png" class="img-rounded" alt="Danone Polska"></a>
            </div>
            <div class="span12">
                <hr>
            </div>
        </div>
    </section>




                --%></div>
            </div>
        </section>
        
        <section>
            <div class="social-links">
                <div class="container">
                    <div class="row">
                        <div class="span12">
                            <p class="big">
                                <span>
                                    关注我们:</span>
                                <a target="_blank" href="" tppabs=""><i class="icon-facebook"></i>微博</a>
                                <a target="_blank" href=""></i>微信</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        
        <footer>
            <div class="container">
                <div class="row">

                    <div class="widgets">
                        <div class="span4">
                            <div class="fwidget">
                                <h6>联系我们</h6>
                                <ul>
                                    <li>
                                    电话：242545245
                                    	<a href="" tppabs=""></a>
                                    </li>
                                    <li>
                                    地址：杨浦区 彰武路38号同济联合广场 2楼(近同济大学)
                                    	<a href="" tppabs=""></a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="span5">
                            <div class="fwidget">
                                <h6>招聘信息</h6>
                                <ul>
                                    <li>大厨2名 <a href="" tppabs="">
                                           <a>链接</a></li>
                                    <li>
                                        <a id="" href="" tppabs="">链接</a></li>
                                    <li>
                                        <a id="" href="" tppabs="">链接</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <%--<div class="span12">
                        <div class="copy">
                            <h6>Copyright © ebadanie.com 2013</h6>
                            <p>
                                <a href="index.htm" tppabs="http://www.ebadanie.com/">Start</a> | <a href="javascript:if(confirm('http://www.ebadanie.com/Ankieta  \n\n���ļ��޷��� Teleport Ultra ����, ��Ϊ ������, ������������, ����Ŀ����ֹͣ��  \n\n�����ڷ������ϴ�����?'))window.location='http://www.ebadanie.com/Ankieta'" tppabs="http://www.ebadanie.com/Ankieta">Ankieta</a> | <a href="javascript:if(confirm('http://www.ebadanie.com/Raport  \n\n���ļ��޷��� Teleport Ultra ����, ��Ϊ ������, ������������, ����Ŀ����ֹͣ��  \n\n�����ڷ������ϴ�����?'))window.location='http://www.ebadanie.com/Raport'" tppabs="http://www.ebadanie.com/Raport">Raport</a>
                                | <a href="javascript:if(confirm('http://www.ebadanie.com/Ustawienia  \n\n���ļ��޷��� Teleport Ultra ����, ��Ϊ ������, ������������, ����Ŀ����ֹͣ��  \n\n�����ڷ������ϴ�����?'))window.location='http://www.ebadanie.com/Ustawienia'" tppabs="http://www.ebadanie.com/Ustawienia">Ustawienia</a> | <a href="javascript:if(confirm('http://www.ebadanie.com/Kontakt  \n\n���ļ��޷��� Teleport Ultra ����, ��Ϊ ������, ������������, ����Ŀ����ֹͣ��  \n\n�����ڷ������ϴ�����?'))window.location='http://www.ebadanie.com/Kontakt'" tppabs="http://www.ebadanie.com/Kontakt">Pomoc</a> - Oprogramowanie
                                serwisu: <a href="javascript:if(confirm('http://www.abcdn.pl/  \n\n���ļ��޷��� Teleport Ultra ����, ��Ϊ ����һ������·���ⲿ������Ϊ������ʼ��ַ�ĵ�ַ��  \n\n�����ڷ������ϴ�����?'))window.location='http://www.abcdn.pl/'" tppabs="http://www.abcdn.pl/">ABCDN</a>, zobacz też: <a href="javascript:if(confirm('http://abcdw.pl/  \n\n���ļ��޷��� Teleport Ultra ����, ��Ϊ ����һ������·���ⲿ������Ϊ������ʼ��ַ�ĵ�ַ��  \n\n�����ڷ������ϴ�����?'))window.location='http://abcdw.pl/'" tppabs="http://abcdw.pl/">
                                    Blog: otoczenie szkoleń</a>, <a href="javascript:if(confirm('https://plus.google.com/111219305677475400586  \n\n���ļ��޷��� Teleport Ultra ����, ��Ϊ ����һ������·���ⲿ������Ϊ������ʼ��ַ�ĵ�ַ��  \n\n�����ڷ������ϴ�����?'))window.location='https://plus.google.com/111219305677475400586'" tppabs="https://plus.google.com/111219305677475400586" rel="author"><span itemprop="author" itemscope="" itemtype="http://schema.org/Person"><span itemprop="name">Krzysztof Wiśniewski</span></span></a>
                            </p>
                        </div>
                    </div>
                --%></div>
                <div class="clearfix"></div>
            </div>
        </footer>






























	<%--<div class="container">
    	<div id="head" class="page-header">
        	<h2><%=shop.getBusname() %></h2>
            <span id="addr"><i class="icon-map-marker"></i>&nbsp;<%=shop.getBusaddr() %></span>
            <span id="tel">电话：<%=shop.getBusphone() %></span>
        </div>
        <div id="basic-intro" class="hero-unit">
        	<div class="text-intro">
            	<p>
                 	<%=shop.getBusintr() %>
               	</p>
            </div>
        </div>
        <div id="news" class="container">
        <span class="theme">最新活动</span>&nbsp;<i class="icon-bullhorn"></i>
             <p>
				<%=shop.getShopnews() %>
            </p>
        </div>
        <div id="items" class="container" style="margin-top:20px;">
         <ul class="thumbnails">
        	<%
        		Set<Shoppro> pro = shop.getShoppros();
        		if(pro.size() == 0)
        			return;
        		ArrayList<Shoppro> list = new ArrayList<Shoppro>(pro);
        		Collections.sort(list);
        		Iterator<Shoppro> iterator =  list.iterator();
        		while(iterator.hasNext())
        		{
        			Shoppro temp = iterator.next();
        	 %>
			  <li class="span3 pro" pronum='<%=temp.getPronum() %>'>
			    <div class="thumbnail" style="position:relative;color:white;">
			      <img src="<%=temp.getProimg() %>" />
			      <div class="carousel-caption pro-hover" style="height:100%;padding:0 15px;cursor:pointer;">
			      	<h6><%=temp.getProname() %>,<%=temp.getProintr() %></h6>
			      	<h6>原价：<%=temp.getPropri() %></h6>
			      	<h6>现价：<%=temp.getPronewpri() %></h6>
			      </div>
			    </div>
			  </li>
			<%} %>
			</ul>
        </div>
        <script type="text/javascript">
			 $(document).ready(function(){
				$(".pro-hover").hide();
				$(".pro").hover(function(){
					$(this).find("img").siblings("div").show();
				},function(){
					$(this).find("img").siblings("div").hide();
				});
			 });
		</script>
    </div>
--%></body>
</html>

