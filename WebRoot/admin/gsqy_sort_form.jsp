<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=utf-8"
	import="com.xdylpg.ORM.Comconsor"
	 import="com.xdylpg.ORM.CBInfo"
%>  

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String sortOptions = (String)request.getAttribute("sortOptions");
	String sortTypes = (String)request.getAttribute("sortTypes");
	CBInfo o = (CBInfo)request.getSession().getAttribute("admin_currentCom");

%>

<!-- 站点导航开始 -->
            <ul class="breadcrumb">
              <li><a href="com-cpc-index?comnum=<%=o.getComnum() %>"><%=o.getBusname() %></a> <span class="divider">/</span></li>
              <li><a href="#">栏目管理</a> <span class="divider">/</span></li>
              <li class="active">新增栏目</li>
            </ul>
            <!-- 站点导航结束 -->		
<!-- ueditor -->

<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>			


<LINK href="./images/style.css" type=text/css rel=stylesheet />
<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript" src="./js/jquery.tinyTips.js"></script>
<script type="text/javascript">
		$(document).ready(function() {
			$('a.tTip').tinyTips('title');
			$('a.imgTip').tinyTips('title');
			$('img.tTip').tinyTips('title');
			$('h1.tagline').tinyTips('tinyTips are totally awesome!');
		});
		</script>
<link rel="stylesheet" type="text/css" media="screen" href="./css/tinyTips.css" />
<style type="text/css">
<!--
#pw {}
#pw .imgDiv { float:left; width:130px; height:110px; padding-top:10px; padding-left:5px; background:#ccc;}
#pw img{ border:0px; width:120px; height:90px}
-->
</style>
</HEAD>
<BODY>
<FORM name="form" action="com-ccs-save" method="post" >
<DIV class=formzone>
<DIV class=namezone>添加分类</DIV>
<DIV class=tablezone>
<DIV class=noticediv id=notice></DIV>
<TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
  <TBODY>
  <TR>
  	<input type="hidden" name='sornum'  />					
    <TD align=middle width=100 height=30> <label class="control-label">分类名称</label></TD>
    <TD><INPUT type='text' style="WIDTH: 200px" maxLength="200" name="sorname" value=''/> <FONT color=#ff0000>*</FONT></TD>
  </TR>
  <TR>
    <TD align=middle width=100 height=30><label class="control-label">顶级分类</label></TD>    
   <TD><%
   		out.print("<select name='fatnum' id='ParentID'>");
   		out.print(sortOptions+"</select>");
   %></TD>
</tr>
  <TR>
    <TD align='middle' width=100 height=30><label class="control-label">分类类型</label></TD>    
    <TD><%
    		out.print("<select name='sortype' id='sortType' onchange='setInput(sortType.value)'>");
    		out.print(sortTypes+"</select>");
    %><img src="./images/help.gif" class="tTip" title="如果该分类为子类<br>请选择与父类相同的分类类型" />
<Script type="text/javascript">
function setInput(t)
{
//'单篇1,文章2,产品3,下载4,招聘5,相册6,链接7,视频8
 //alert(t);
 document.getElementById("hid1").style.display="";
 document.getElementById("hid2").style.display="";
 document.getElementById("hid3").style.display="";
 document.getElementById("hid4").style.display="";
 document.getElementById("hid5").style.display="";
 document.getElementById("hid6").style.display="";
 document.getElementById("hid7").style.display="";
 document.getElementById("hid8").style.display="";
 document.getElementById("hid9").style.display="";
switch(t)
   {
   case "1":
     document.getElementById("SortTemplate").value="about.jsp";
     document.getElementById("ContentTemplate").value="";
     document.getElementById("SortFolder").value="{sitepath}<%-- <%=setting.languagePath&htmlDir%>/about/ --%>";
     document.getElementById("ContentFolder").value="";
     document.getElementById("SortFileName").value="about-{sortid}";
     document.getElementById("ContentFileName").value="";
     document.getElementById("hid2").style.display="none";
     document.getElementById("hid4").style.display="none";
     document.getElementById("hid6").style.display="none";
	 document.getElementById("hid9").style.display="none";  
	 document.getElementById("hid10").style.display="none";   
     break;
   case "2":
     document.getElementById("SortTemplate").value="newslist.jsp";
     document.getElementById("ContentTemplate").value="news.jsp";
     document.getElementById("SortFolder").value="{sitepath}<%-- <%=setting.languagePath&htmlDir%>/newslist/ --%>";
     document.getElementById("ContentFolder").value="{sitepath}<%-- <%=setting.languagePath&htmlDir%>/news/ --%>";
     document.getElementById("SortFileName").value="list-{sortid}-{page}";
     document.getElementById("ContentFileName").value="{y}-{m}-{d}/{id}";    
	 document.getElementById("hid8").style.display="none";  
	 document.getElementById("hid9").style.display="none";
	  document.getElementById("hid10").style.display="none";
     break;
   case "3":
     document.getElementById("SortTemplate").value="productlist.jsp";
     document.getElementById("ContentTemplate").value="product.jsp";
     document.getElementById("SortFolder").value="{sitepath}<%-- <%=setting.languagePath&htmlDir%>/productlist/ --%>";
     document.getElementById("ContentFolder").value="{sitepath}<%-- <%=setting.languagePath&htmlDir%>/product/ --%>";
     document.getElementById("SortFileName").value="list-{sortid}-{page}";
     document.getElementById("ContentFileName").value="{y}-{m}-{d}/{id}";   
	 document.getElementById("hid8").style.display="none";     
	 document.getElementById("hid9").style.display="none";
	 document.getElementById("hid10").style.display="none";     
     break;
   case "4":  
     document.getElementById("SortTemplate").value="downlist.jsp";
     document.getElementById("ContentTemplate").value="down.jsp";
     document.getElementById("SortFolder").value="{sitepath}<%-- <%=setting.languagePath&htmlDir%>/downlist/ --%>";
     document.getElementById("ContentFolder").value="{sitepath}<%-- <%=setting.languagePath&htmlDir%>/down/ --%>";
     document.getElementById("SortFileName").value="list-{sortid}-{page}";
     document.getElementById("ContentFileName").value="{y}-{m}-{d}/{id}"; 
	 document.getElementById("hid8").style.display="none";  
	 document.getElementById("hid9").style.display="none";
	 document.getElementById("hid10").style.display="none";      
     break;
   case "5":
     document.getElementById("SortTemplate").value="joblist.jsp";
     document.getElementById("ContentTemplate").value="job.jsp";
     document.getElementById("SortFolder").value="{sitepath}<%-- <%=setting.languagePath&htmlDir%>/jobtlist/ --%>";
     document.getElementById("ContentFolder").value="{sitepath}<%-- <%=setting.languagePath&htmlDir%>/job/ --%>";
     document.getElementById("SortFileName").value="list-{sortid}-{page}";
     document.getElementById("ContentFileName").value="{y}-{m}-{d}/{id}";  
	 document.getElementById("hid8").style.display="none";
	 document.getElementById("hid9").style.display="none";
	  document.getElementById("hid10").style.display="none";          
     break;
   case "6":
     document.getElementById("SortTemplate").value="albumlist.jsp";
     document.getElementById("ContentTemplate").value="album.jsp";
     document.getElementById("SortFolder").value="{sitepath}<%-- <%=setting.languagePath&htmlDir%>/albumtlist/ --%>";
     document.getElementById("ContentFolder").value="{sitepath}<%-- <%=setting.languagePath&htmlDir%>/album/ --%>";
     document.getElementById("SortFileName").value="list-{sortid}-{page}";
     document.getElementById("ContentFileName").value="{y}-{m}-{d}/{id}";
	 document.getElementById("hid8").style.display="none";
	 document.getElementById("hid9").style.display="none";            
     break;
	case "8":
     document.getElementById("SortTemplate").value="videolist.jsp";
     document.getElementById("ContentTemplate").value="video.jsp";
     document.getElementById("SortFolder").value="{sitepath}<%-- <%=setting.languagePath&htmlDir%>/videolist/ --%>";
     document.getElementById("ContentFolder").value="{sitepath}<%-- <%=setting.languagePath&htmlDir%>/video/ --%>";
     document.getElementById("SortFileName").value="list-{sortid}-{page}";
     document.getElementById("ContentFileName").value="{y}-{m}-{d}/{id}";    
	 document.getElementById("hid8").style.display="none";  
	 document.getElementById("hid9").style.display="none"; 
	  document.getElementById("hid10").style.display="none";     
     break;
   default:
     document.getElementById("hid1").style.display="none";
     document.getElementById("hid2").style.display="none";
     document.getElementById("hid3").style.display="none";
     document.getElementById("hid4").style.display="none";
     document.getElementById("hid5").style.display="none";
     document.getElementById("hid6").style.display="none";
     document.getElementById("hid7").style.display="none";
     document.getElementById("hid8").style.display="none";
     document.getElementById("hid10").style.display="none";
   }
}

</script>    </TD>
</tr>
  <TR id="hid9">
    <TD align=middle width=100 height=30>链接</TD>
    <TD><input type='text' maxlength="200" style="WIDTH: 300px" name="sorurl"/> 注：留言链接"/gbook/"</TD></TR>
  <TR>
    <TD align=middle width=100 height=30>排序</TD>
    <TD><input type='text' maxlength="6"  style="WIDTH: 60px" name="sorord"/> <FONT color=#ff0000>*</FONT> <img src="./images/help.gif" class="tTip" title="该栏目排序位置，不能和同级栏目有重复序号"></TD></TR>
  <TR>
    <TD align=middle height=30>状态</TD>
    <TD><INPUT class="checkbox" type="checkbox" checked="checked" name="sorsta" value="1"/>    </TD>
  </TR>
  <TR id="hid1">
    <TD align=middle height=30>列表模板</TD>
    <TD><input type='text' name='sortem' id='SortTemplate'  />  <img src="./images/help.gif" class="tTip" title="该分类使用的列表的模板的文件名"></TD>
  </TR>
  <TR id="hid2">
    <TD align=middle height=30>内容页模板</TD>
    <TD><input type='text' name='contem' id='ContentTemplate'  />   <img src="./images/help.gif" class="tTip" title="该分类的内容详细页使用的模板的文件名">    </TD>
  </TR>
  <TR id="hid3">
    <TD align=middle height=30>列表生成目录</TD>
    <TD> <input type='text' maxlength="200" style="WIDTH: 200px" name="sorfol" id="SortFolder" value="{sitepath}<%-- <%=setting.languagePath&htmlDir%> --%>/newslist/"/>
      <img src="./images/help.gif" class="tTip" title="静态模式下，该分类生成的静态列表页面存放的位置<br>{sitepath}为网站根目录"> </TD>
  </TR>
  <TR id="hid4">
    <TD align=middle height=30>内容生成目录</TD>
    <TD> <input type='text' maxlength="200" style="WIDTH: 200px" name="confol" id="ContentFolder" value="{sitepath}<%-- <%=setting.languagePath&htmlDir%> --%>/news/"/>
      <img src="./images/help.gif" class="tTip" title="静态模式下，该分类生成的静态详细页面存放的位置<br>{sitepath}为网站根目录"> </TD>
  </TR>
  <TR id="hid5">
    <TD align=middle height=30>列表文件命名</TD>
    <TD> <input type='text' maxlength="200" style="WIDTH: 200px" name="sfname" id="SortFileName" value="list-{sortid}-{page}"/>
   <%--  <%=FileExt%> --%>     <img src="./images/help.gif" class="tTip" title="静态模式下该分类列表生成文件的命名规则<br>{sortid}为该分类的ID值<br>{page}为页码
"> </TD>
  </TR>
  <TR  id="hid6">
    <TD align=middle height=30>内容页文件命名</TD>
    <TD> <input type='text' maxlength="200" style="WIDTH: 200px" name="ContentFileName" id="cfname" value="{y}-{m}-{d}/{id}"/>
     <%--  <%=FileExt%> --%>     <img src="./images/help.gif" class="tTip" title="静态模式下该分类详细页生成文件的命名规则<br>
{y}年<br>{m}月<br>{d}日<br>{id}文章编号"> </TD>
  </TR>
  <TR id="hid7">
    <TD align=middle height=30> 浏览权限 </TD>
    <TD>
    <%-- <%=userGroupSelect("GroupID", 0, 0)%> --%>
        <input type="radio" name="Exclusive" value=">=" checked="checked" />
        隶属
        <input type="radio" name="Exclusive" value="=" /> 
        专属（隶属：权限值≥可查看，专属：权限值＝可查看）    <img src="./images/help.gif" class="tTip" title="该分类的访问权限的设定<br>隶属为权限大于该用户组都可以访问<br>
专属为只有设定的该组可以访问"></TD>
  </TR>
  <TR id="hid8">
    <TD align="middle" height="30">
  	  内容<BR><BR>
     </TD>
    <TD>
 	<script id="editor" type="text/plain" style="width:733px;height:300px;"></script>
 	<script type="text/javascript">
 	UE.getEditor('editor');
 	</script>
	</TD>
  </TR>
   <tr id="hid10">
   	<td align="middle" height="30" valign="top">上传图片</td>
   	<td><input type='text'  /></td>
   </tr>
    <tr>
    <TD align=middle height=30 valign="top">ICO缩略图</td>
      <td colspan="3" ><input type='text' style="WIDTH: 450px" name="IcoImage" type="text" id="IcoImage" size="70"value="<%-- <%=IcoImage%> --%>">
        <input type="hidden" name="IcoPath" id="ImagePath" value="<%-- <%=IcoPath%> --%>">&nbsp;&nbsp;
        <!--<input type="checkbox" name="AutoRemote" value='1'> 自动保存远程图片 -->
       <!-- <input type="button" name="selectpic" value="从已上传图片中选择" onClick="SelectPhoto()" class="button"> -->&nbsp;&nbsp;
 <br><div id="pw"><%-- <%
if not isnul(IcoPath) then 
	dim j,images
	images=split(IcoPath,"|")
	for j=0 to ubound(images)
		echo "<div id=""img"&j&""" class=""imgDiv""><a href=""javascript:SetEditorContents('Content','"&images(j)&"')""><img border=""0"" src="""&images(j)&"""></a><br><input type=""radio"" value="""&images(j)&""" onclick=""setIndexImage('"&images(j)&"')"" name=""IndexImageradio"">设为缩略图 <a href=""javascript:dropThisDiv('img"&j&"','"&images(j)&"')"">删除</a></div>"
	next
end if
%> --%></div>
<script type="text/javascript">
//parent.parent.FCKeditorAPI.GetInstance('content')
// 设置编辑器中内容
function SetEditorContents(EditorName, ContentStr) {
     var oEditor = FCKeditorAPI.GetInstance(EditorName) ;
	 oEditor.Focus();
	 //setTimeout(function() { oEditor.Focus(); }, 100);
     oEditor.InsertHtml("<img src="+"'"+ContentStr+"'"+"/>");	
}
function SetEditorPage(EditorName, ContentStr) {
     var oEditor = FCKeditorAPI.GetInstance(EditorName) ;
	 oEditor.Focus();
	 //setTimeout(function() { oEditor.Focus(); }, 100);
     oEditor.InsertHtml(ContentStr);	
}
</script>

<script type="text/javascript">
function dropThisDiv(t,p)
{
document.getElementById(t).style.display='none'
var str =document.getElementById("IcoPath").value;
var arr = str.split("|");
var nstr="";
for (var i=0; i<arr.length; i++)
{
	if(arr[i]!=p)
	{
		if (nstr!="")
		{
			nstr=nstr+"|";
		}		
		nstr=nstr+arr[i]
	}
}
document.getElementById("IcoPath").value=nstr;

doChange(document.getElementById("IcoPath"),document.getElementById("ImageFileList"))
}

function setIndexImage(t)
{
document.getElementById("IcoImage").value=t

doChange(document.getElementById("IcoPath"),document.getElementById("ImageFileList"))
}

function doChange(objText, objDrop){
if (!objDrop) return;
var str = objText.value;
var arr = str.split("|");
var nIndex = objDrop.selectedIndex;
objDrop.length=1;
for (var i=0; i<arr.length; i++){
objDrop.options[objDrop.length] = new Option(arr[i], arr[i]);
}
objDrop.selectedIndex = nIndex;
}
doChange(document.getElementById("IcoPath"),document.getElementById("ImageFileList"))
</script>
        </td>
    </tr>
  <TR>
    <TD align=middle height=30>页面标题</TD>
    <TD> <input type='text' maxlength="200" style="WIDTH: 450px"  name="PageTitle"/> </TD>
  </TR>
  <TR>
    <TD align=middle height=30>页面关键词</TD>
    <TD> <input type='text' maxlength="200" style="WIDTH: 450px"  name="PageKeywords"/> </TD>
  </TR>
  <TR>
    <TD align=middle height=30>页面描述</TD>
    <TD>  <TEXTAREA class="textarea" style="WIDTH: 450px" name="PageDesc" rows="3"></TEXTAREA>    </TD>
  </TR>
    </TBODY></TABLE>
</DIV>
<DIV class=adminsubmit>
<INPUT class="button" type="submit" value="添加" />
<INPUT class="button" type="button" value="返回" onClick="history.go(-1)"/> 

<INPUT onClick="location.href='<%-- <%=getPageName()%> --%>'" type="button" value="刷新" class="button" /> 
</DIV></DIV></FORM>

  		