<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
  	<title>关于</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
     .hero-unit{
     	text-align: center;
     } 
     #appendedInput , #appendedButton{
     	padding: 11px;
     	outline: none;
     }
    section{
     	padding-top:30px;
     }
    </style>
	<link rel="stylesheet" type="text/css" href="<%=basePath %>res/tp/bs/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath %>res/tp/bs/css/bootstrap-responsive.min.css" />
	<script type="text/javascript" src="<%=basePath %>res/tp/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath %>res/tp/bs/js/bootstrap.min.js"></script>
  </head>
  
  <body data-spy="scroll" data-target=".nav">

    <%@include file="top.jsp" %>
    <div class="container">


      <!-- Example row of columns -->
      <div class="row">
	      <ul class="nav nav-pills nav-stacked span3" data-spy="affix" style="background-color:#f7f7f9;padding:20px 0;">
			  <li class="nav-header">入驻合作</li>
			  <li><a href="#coo-1">入驻的优势</a></li>
			  <li><a href="#coo-2">入驻需要什么</a></li>
			  <li><a href="#coo-3">入驻后能做什么</a></li>
			  <li><a href="#coo-4">入驻申请</a></li>
			  <li class="nav-header">关于我们 </li>
			  <li><a href="#">关于我们</a></li>
			  <li><a href="#joinus">加入我们</a></li>
			  <li><a href="#contact">我们的联系方式</a></li>
			  <li class="nav-header">反馈帮助</li>
			  <li><a href="#feedback">意见反馈</a></li>
			  <li><a href="#notice">帮助中心</a></li>
		  </ul>
		  <div class="span9 offset3">
		  	<section id="coo-1">
		  		<div class="page-header">
		            <h1>入驻的优势 </h1>
		         </div>
		  		<p>只需将<code>data-spy="scroll"</code>添加到被监听的页面元素上（大部分情况是添加到body上），然后将<code>data-target=".navbar"</code>添加到导航部分，仅此而已，顶部导航条就拥有了监听滚动的功能。你可能希望将滚动监听应用到<code>.nav</code>组件上。</p>
		  	</section>
		  	<section id="coo-2">
	          <div class="page-header">
	            <h1>入驻需要什么</h1>
	          </div>
	
	          <h3>引入单个插件还是一次性引入所有插件</h3>
	          <p>每个插件都可以单独的引入到页面中（注意插件间的依赖关系），或者一次性引入。<strong>bootstrap.js</strong> 和<strong>bootstrap.min.js</strong> 文件都将所有插件包含在一个文件中了（前者是未压缩版，后者是压缩版）。</p>
	
	          <h3>Data 属性</h3>
	          <p>你可以仅仅通过data属性API就能使用所有Bootstrap中的插件，而且不用写一行JavaScript代码。这是Bootstrap中的一等API，并且是你的首选方式。</p>
	
	          <p>特殊情况是，在某些情况下可能需要特意禁用这种默认动作。因此，我们特地提供了禁用data属性API的方式，通过解除绑定在body上的被命名为`'data-api'`的事件即可实现。如下所示：
	          </p><pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="pln">$</span><span class="pun">(</span><span class="str">'body'</span><span class="pun">).</span><span class="pln">off</span><span class="pun">(</span><span class="str">'.data-api'</span><span class="pun">)</span></li></ol></pre>
	
	          <p>还可以解除特定插件的事件绑定，只要将插件名和data-api链接在一起作为参数使用。如下所示：</p>
	          <pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="pln">$</span><span class="pun">(</span><span class="str">'body'</span><span class="pun">).</span><span class="pln">off</span><span class="pun">(</span><span class="str">'.alert.data-api'</span><span class="pun">)</span></li></ol></pre>
	
	          <h3>编程API</h3>
	          <p>我们同时为所有Bootstrap插件提供了JavaScript API。所有公开的API都可以单独或链式调用，均返回其所操作的集合（和jQuery的API一致）。</p>
	          <pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="pln">$</span><span class="pun">(</span><span class="str">".btn.danger"</span><span class="pun">).</span><span class="pln">button</span><span class="pun">(</span><span class="str">"toggle"</span><span class="pun">).</span><span class="pln">addClass</span><span class="pun">(</span><span class="str">"fat"</span><span class="pun">)</span></li></ol></pre>
	          <p>所有方法均可接受一个可选的参数对象、一个对此方法有特定意义的字符串或者什么也不传（即用默认参数初始化此插件）：</p>
	<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="pln">$</span><span class="pun">(</span><span class="str">"#myModal"</span><span class="pun">).</span><span class="pln">modal</span><span class="pun">()</span><span class="pln">                       </span><span class="com">// initialized with defaults</span></li><li class="L1"><span class="pln">$</span><span class="pun">(</span><span class="str">"#myModal"</span><span class="pun">).</span><span class="pln">modal</span><span class="pun">({</span><span class="pln"> keyboard</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">false</span><span class="pln"> </span><span class="pun">})</span><span class="pln">   </span><span class="com">// initialized with no keyboard</span></li><li class="L2"><span class="pln">$</span><span class="pun">(</span><span class="str">"#myModal"</span><span class="pun">).</span><span class="pln">modal</span><span class="pun">(</span><span class="str">'show'</span><span class="pun">)</span><span class="pln">                </span><span class="com">// initializes and invokes show immediately</span><p></p></li></ol></pre>
	          <p>每个插件都通过`Constructor` 属性暴露了其原始的构造函数：<code>$.fn.popover.Constructor</code>。如果你想获得某个特定插件的实例，可以直接从页面元素中获取：<code>$('[rel=popover]').data('popover')</code>.</p>
	
	          <h3>避免冲突</h3>
	          <p>如果你需要将Bootstrap插件和其它UI框架一同使用。在这种情况下，随时都会导致命名空间冲突。如果这种情况发生了，你可以通过调用插件的 <code>.noConflict</code> 函数恢复其原始值。</p>
	
	<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="kwd">var</span><span class="pln"> bootstrapButton </span><span class="pun">=</span><span class="pln"> $</span><span class="pun">.</span><span class="pln">fn</span><span class="pun">.</span><span class="pln">button</span><span class="pun">.</span><span class="pln">noConflict</span><span class="pun">()</span><span class="pln"> </span><span class="com">// return $.fn.button to previously assigned value</span></li><li class="L1"><span class="pln">$</span><span class="pun">.</span><span class="pln">fn</span><span class="pun">.</span><span class="pln">bootstrapBtn </span><span class="pun">=</span><span class="pln"> bootstrapButton            </span><span class="com">// give $().bootstrapBtn the bootstrap functionality</span></li></ol></pre>
	
	          <h3>事件</h3>
	          <p>Bootstrap对多数插件的独有行为提供了自定义事件。 一般而言，这些事件都是以（英语）动词的原型和过去分词形式来表示的 - 动词原形形式的(例如： <code>show</code>) 在事件执行之前触发；过去分词形式的(例如：<code>shown</code>) 在动作执行完毕后触发。</p>
	          <p>所有动词原形形式的事件都提供了preventDefault函数。这能在动作执行之前使其停止。</p>
	<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="pln">$</span><span class="pun">(</span><span class="str">'#myModal'</span><span class="pun">).</span><span class="pln">on</span><span class="pun">(</span><span class="str">'show'</span><span class="pun">,</span><span class="pln"> </span><span class="kwd">function</span><span class="pln"> </span><span class="pun">(</span><span class="pln">e</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></li><li class="L1"><span class="pln">    </span><span class="kwd">if</span><span class="pln"> </span><span class="pun">(!</span><span class="pln">data</span><span class="pun">)</span><span class="pln"> </span><span class="kwd">return</span><span class="pln"> e</span><span class="pun">.</span><span class="pln">preventDefault</span><span class="pun">()</span><span class="pln"> </span><span class="com">// stops modal from being shown</span></li><li class="L2"><span class="pun">})</span></li></ol></pre>
	        </section>
		  	<section id="coo-3">
		  		<div class="page-header">
		            <h1>入驻后能做什么</h1>
		         </div>
		  	</section>
		  	
		  	<section id="coo-4">
		  		<div class="page-header">
		            <h1>填写入驻申请</h1>
		         </div>
		      <form class="form-horizontal"  onsubmit ="return false">
			  <script type="text/javascript">
			  var aplct = function(submit)
			  {
				  var data = "";
				  var originalhtml = submit.parents("form").html();
				  submit.parents("form").find("input").each(function(){
					  data += $(this).attr("name");
					  data += "=";
					  data += $(this).val();
					  data += "&";
				  });
				  $.ajax({
					   type: "POST",
					   url: "<%=basePath%>aplct",
					   data: data,
					   async: false,
					   success: function(msg){
					     submit.parents("form").find("input").each(function(){
							  $(this).val("");
						  });
					     alert( "好的，我们已经收到您的信息，稍后我们会联系您！");
					     
					   }
					});
			  };
			  </script>
			  <input type="hidden" name="ishandle"  value="0" />
			  <div class="control-group">
			    <label class="control-label" >您的名字</label>
			    <div class="controls">
			      <input type="text" name="admname" id="admname" value="" />
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" >您的电话</label>
			    <div class="controls">
			      <input type="text"name="admtel" id="admtel" value=""   />
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" >您的邮箱</label>
			    <div class="controls">
			      <input type="text" name="admemail" id="admemail" value=""   />
			    </div>
			  </div>
			  
			  <div class="control-group">
			    <div class="controls">
			       <button class="btn" onclick="aplct($(this))" >确定</button>
			    </div>
			  </div>
			</form>
		  	</section>
		  	
		  	
		  	<section id="feedback">
		  		<div class="page-header">
		            <h1>意见反馈</h1>
		         </div>
		  	<form class="form-horizontal" onsubmit ="return false">
			  <script type="text/javascript">
			  var fb = function(submit)
			  {
				  var data = "";
				  submit.parents("form").find("input").each(function(){
					  data += $(this).attr("name");
					  data += "=";
					  data += $(this).val();
					  data += "&";
				  });
				  data += "advcon=";
				  data += submit.parents("form").find("textarea").val();
				  $.ajax({
					   type: "POST",
					   url: "<%=basePath%>fb",
					   data: data,
					   async: false,
					   success: function(msg){
						   submit.parents("form").find("input").each(function(){
								 $(this).val("");
							  });
						   submit.parents("form").find("textarea").val("");
					     alert( "感谢您的宝贵意见，我们会做的更好！");
					   }
					});
			  };
			  </script>
			  <input type="hidden" name="isread"  value="0" />
			  <div class="control-group">
			    <label class="control-label" >您的名字</label>
			    <div class="controls">
			      <input type="text" name="adviser" id="adviser" value="" />
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" >您的电话</label>
			    <div class="controls">
			      <input type="text"name="advtel" id="advtel" value=""   />
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" >您的邮箱</label>
			    <div class="controls">
			      <input type="text" name="advmai" id="advmai" value=""   />
			    </div>
			  </div>
			  
			  <div class="control-group">
			    <label class="control-label" >您的想法</label>
			    <div class="controls">
			      <textarea type="text" name="advcon" id="advcon" value=""></textarea>
			    </div>
			  </div>
			  
			  <div class="control-group">
			    <div class="controls">
			      <button class="btn" onclick="fb($(this))">确定</button>
			    </div>
			  </div>
			</form>
		  	</section>
		  	
		  	
		  	
		  </div>
      </div>
		
      <hr>
      <footer>
        <p>© Company 2013</p>
      </footer>

    </div> <!-- /container -->


  

</body>
</html>
