<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	import="com.xdylpg.ORM.CBInfo"
	import="com.xdylpg.ORM.BusAdmin"
	import="com.xdylpg.ORM.Category"
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	CBInfo model = null;
	Category toCategory = (Category)request.getAttribute("toCategory");
	Object obj = request.getAttribute("busObj");
	if(obj == null)
	{
		model = new CBInfo();
		BusAdmin ba = new BusAdmin();
		ba.setAdmtel("");
		ba.setAdmname("");
		model.setBusname("");
		model.setPinyinid("");
		model.setBusaddr("");
		model.setBusml("");
		model.setBusphone("");
		model.setWebtitle("");
		model.setSubtitle("");
		model.setContacts("");
		model.setEmail("");
		model.setIcpcode("");
		model.setWebdes("");
		model.setPostcode("");
		model.setBusAdmin(ba);
		model.setBusintr("");
	}else{
		model = (CBInfo)obj;
	}
 %>

<html>
  <head>
  
  <script type="text/javascript" src="./js/qygs.js" ></script>
  <script type="text/javascript" src="./js/jquery.uploadify.js"></script>
  <link href="./css/uploadify.css" rel="stylesheet" type="text/css" />
  		<style type="text/css">
  			#images ul{height:0px;}
			#uploadify
			{
				float:left;margin-left: -37px;
			}
			#uploadify-notice
			{
				margin-left: 50px;
			}
			#uploadify-notice button
			{outline: none;cursor:text;}
			#images{display:none;}
			#images ul,li
			{
				margin:0px;
				
			}
			#images li
			{background-color: #f7f7f9;padding: 10px;}
			#admin-list td:hover
			{
				cursor:pointer;
				background-color:#f2dede;
			}
		</style>
<script type="text/javascript">



</script>
  </head>
  <body>
  <input type="hidden" name="nav" value='2-nav-1' />
    <form id="main-form" class="form-horizontal" action="" method="post">
              <div class="control-group">
                <label class="control-label" for="inputName">名称</label>
                <div class="controls">
                  <input type="text" id="inputName" name="busname" value='<%=model.getBusname() %>' />
                  <%
                  	if(model.getComnum()!=null)
                  		out.print("<input type='hidden' name='comnum' value='"+model.getComnum()+"' />");
                   %>
                  <!-- <input type="hidden" name="busAdmin.busadmnum" value="1" /> -->
                  
                  
                  <input type="hidden" name="category.bcnum" value='<%=toCategory.getBcnum() %>' />
                  <input type="hidden" id="logimg" name="logimg" value=<%=model.getLogimg() %> />
                  <input type="hidden" id="icoimg" name="icoimg" value=<%=model.getIcoimg() %> />
                  <input type="hidden" id="carousel" name="carousel" value=<%=model.getCarousel() %> />
                 <!--  <input type="hidden" name="pinyinid" value="无" /> -->
                  <!-- <input type="hidden" name="status" value="1" /> -->
                  <input type="hidden" name="hits" value="0" />
                </div>
              </div>
              <!-- 字母ID -->
              <div class="control-group">
                <label class="control-label" for="pinyinID">字母ID</label>
                <div class="controls">
                  <input type="text" id="pinyinID" name="pinyinid" value='<%=model.getPinyinid() %>' />
                </div>
              </div>
              <!-- address -->
              <div class="control-group">
                <label class="control-label" for="inputAddress">店家地址</label>
                <div class="controls">
                  <input type="text" id="inputAddress" name="busaddr" value='<%=model.getBusaddr() %>' />
                </div>
              </div>
              <!-- baidu map location -->
              <div class="control-group">
                <label class="control-label" for="inputLocation">地图</label>
                <div class="controls input-append" style="display: flex;">
                  <input type="text" id="inputLocation" name="busml" class="uneditable-input" autocomplete="off" value='<%=model.getBusml() %>' />
                  <button class="btn" type="button" href="#mapModal" onclick="showMap()"><i class="icon-map-marker"></i></button>
                </div>
              </div>
              <!-- Tel -->
              <div class="control-group">
                <label class="control-label" for="inputTel">联系电话</label>
                <div class="controls">
                  <input type="text" id="inputTel" name="busphone" value='<%=model.getBusphone() %>'>
                </div>
              </div>
              <!-- template -->
              <div class="control-group">
                <label class="control-label" for="unitTempate">默认模板</label>
                <div class="controls">
                  <input type="text" id="unitTempate" name="unittem" value='<%=model.getSubtitle() %>' />
                </div>
              </div>
               <!-- admin -->
              <div class="control-group">
                <label class="control-label" for="busadmnum">管理员</label>
                <div class="controls">
                  <input type="text" id="busadmnum" readonly="readonly" placeholder='<%=model.getBusAdmin().getAdmname()+" "+model.getBusAdmin().getAdmtel() %>'/>
                  <input type="hidden" id="busadmnum-h" name="busAdmin.busadmnum" value='1'>
                  <div class='well' id='admin-list' style="display:none;margin-top:2px;">
                  
                  </div>
                </div>
              </div>
              
              
              <!-- web title -->
              <div class="control-group">
                <label class="control-label" for="inputWebTitle">web title</label>
                <div class="controls">
                  <input type="text" id="inputWebTitle" name="webtitle" value='<%=model.getWebtitle() %>' />
                </div>
              </div>
              
              <!-- sub title -->
              <div class="control-group">
                <label class="control-label" for="inputSubTitle">sub title</label>
                <div class="controls">
                  <input type="text" id="inputSubTitle" name="subtitle" value='<%=model.getSubtitle() %>' />
                </div>
              </div>
              
              <!-- post code -->
              <div class="control-group">
                <label class="control-label" for="inputPostCode">post code</label>
                <div class="controls">
                  <input type="text" id="inputPostCode" name="postcode" value='<%=model.getPostcode() %>' />
                </div>
              </div>
              
              <!-- contacts -->
              <div class="control-group">
                <label class="control-label" for="inputContact">contacts</label>
                <div class="controls">
                  <input type="text" id="inputContact" name="contacts" value='<%=model.getContacts() %>' />
                </div>
              </div>
              
              <!-- email -->
              <div class="control-group">
                <label class="control-label" for="inputEmail">email</label>
                <div class="controls">
                  <input type="text" id="inputEmail" name="email" value='<%=model.getEmail() %>' />
                </div>
              </div>
              
              <!-- ICP code -->
              <div class="control-group">
                <label class="control-label" for="inputFilNum">ICP code</label>
                <div class="controls">
                  <input type="text" id="inputFilNum" name="filnum" value='<%=model.getIcpcode() %>' />
                </div>
              </div>
              
              <!-- web des -->
              <div class="control-group">
                <label class="control-label" for="inputWebDes">web des</label>
                <div class="controls">
                  <input type="text" id="inputWebDes" name="webdes" value='<%=model.getWebdes() %>' />
                </div>
              </div>
              
              <!-- introduce -->
              <div class="control-group">
                <label class="control-label" for="inputIntro">简介</label>
                <div class="controls">
                  <textarea rows="4" id="inputIntro" name="busintr"><%=model.getBusintr() %></textarea>
                </div>
              </div>
              <div class="control-group">
                <label class="control-label" for="inputPromo">LOGO ICO图片</label>
                <div class="controls">
		        <div id="images">
		        <ul class='thumbnails'>
		        <% 
		        	//加载图片
		        	if(model.getLogimg() != null && model.getLogimg() != "")
					out.println("<script>$('#images').css('display','block'); $('#images ul').append(genImgItem('"+model.getLogimg()+"',1));</script>");
					if(model.getIcoimg() != null&& model.getIcoimg() != "")
					out.println("<script> $('#images ul').append(genImgItem('"+model.getIcoimg()+"',2));</script>");
					if(model.getIcoimg() != null&&model.getLogimg() != null&& model.getIcoimg() != ""&& model.getLogimg() != "")
					out.println("<script> $('#images').siblings('div.span12').hide();</script>");
					
				%>
		        </ul>
				
				</div>
				<div id="itemArea">
				</div>
				
				<div class='span12'>
				<input  type="file" name="uploadify" id="uploadify" />
				<div id="uploadify-notice">
					<p type="button" class="btn btn-link">
								<span  class="text-center">图片最大5M，支持格式： png jpeg gif&nbsp;&nbsp;</span>
					<span class="label label-info">注意！</span>
					
					</p>
				</div>
				
		<!-- 		<a class='span1 offset2 btn' href="javascript:jQuery('#uploadify').uploadify('upload','*')">开始上传</a>&nbsp;
				<a class='span1 offset2 btn' href="javascript:$('#uploadify').uploadify('cancel', '*')">取消</a> -->
				
				</div>
		
                </div>
              </div>
              <div class="control-group">
                <!-- <label class="control-label" for="inputPassword">图片</label> -->
                <div class="controls">
                  <label class="checkbox">
			        <input id="status" type="checkbox" name="status" checked="checked"> 启用
			      </label>
                  <a class="btn btn-primary btn-large" style="width:100px;" href="javascript:submit()">保存</a>
                </div>
              </div>
            </form>
  </body>
</html>
