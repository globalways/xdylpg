 <%@page pageEncoding="utf-8" %>
 <%@page import="java.util.Date" 
 import="com.xdylpg.ORM.Cpcontent"
 import="com.xdylpg.ORM.CBInfo"
 %>     
 <%
 	String sortOptions = (String)request.getAttribute("sortOptions");
 	CBInfo o = (CBInfo)request.getSession().getAttribute("admin_currentCom");
 	
 %>			
 			<!-- 站点导航开始 -->
            <ul class="breadcrumb">
              <li><a href="com-cpc-index?comnum=<%=o.getComnum() %>"><%=o.getBusname() %></a> <span class="divider">/</span></li>
              <li><a href="#">内容管理</a> <span class="divider">/</span></li>
              <li class="active">新增内容</li>
            </ul>
            <!-- 站点导航结束 -->
            <!-- 内容开始 -->
            <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
			<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"> </script>
			<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
			<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
			<script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>	
				<form class="form-horizontal" action="com-cpc-save" method="post">
				
				  <!-- public form -->
				  <input type="hidden" name="contnum" />
				  <input type="hidden" name="CBInfo.comnum" value='<%=o.getComnum() %>'>
				  <div class="control-group">
				    <label class="control-label" for="sornumb">分类</label>
				    <div class="controls">
				     <!--  <input type="text" id="sornumb" name="comconsor.sornum"/> -->
				      <%
				    		out.print("<select name='comconsor.sornum' id='sornumb'>");
				   			out.print(sortOptions+"</select>");
    					%>
				    </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="contit">标题</label>
				    <div class="controls">
				      <input type="text" id="contit" name="contit" />
				    </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="author">作者</label>
				    <div class="controls">
				      <input type="text" id="author" name="author"  />
				    </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="content">内容</label>
				    <div class="controls">
				    	<input type="hidden" id='tempcontent'  />
				        <input type="hidden" id="content" name="content"/>
				       	<script id="editor" type="text/plain" style="width:733px;height:300px;"></script>
					 	<script type="text/javascript">
					 	 var editor = UE.getEditor('editor');
					 	    function getContent() {
						        $("#content").val(editor.getContent());
						    }
						    function submit()
						    {
						    	getContent();
						    	$("form").submit();
						    }
					 	</script>
				    </div>
				  </div>
				  <!-- public form end -->
				  
				  <!-- album & product start -->
				  <div class='img-up-load'>
					  <div class='img-up-load'>
					  <div class="control-group">
					    <label class="control-label" for="inputEmail">文章缩略图</label>
					    <div class="controls">
					      <input type="hidden" id="index-image" name="indimg"  />
					      <img height="235px" width="256px" src='' />
					    </div>
					  </div>
				  </div>
				  </div>
				  <!-- album & product end -->
				  <script type="text/javascript">
				  $(document).ready(function(){
				  	var input = $("#status");
				  	var status = input.attr("value");
				  	if(status == 1)
				  		input.attr("checked",true);
				  });
				  function check(){
				  	var input =  $("#status");
				  	var status1 = input.attr("checked");
				  	if(status1=="checked")
				  	{
				  		input.val(1);
				  	}
				  	else input.val(0);
				  }
				  </script>
				  <div class="control-group">
				    <div class="controls">
				      <label class="checkbox">
				        <input id="status" onclick="check()" type="checkbox" name="consta" value="1" > 启用
				      </label>
				      <a id="submit" href="javascript:submit()" class="btn">保存</a>
				    </div>
				  </div>
				</form>
  			<!-- 内容结束 -->
       