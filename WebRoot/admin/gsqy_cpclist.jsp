 <%@page pageEncoding="utf-8" 
 	import="com.xdylpg.ORM.Cpcontent"
 	import="java.util.List"
 	import="java.util.Date"
 	import="java.text.SimpleDateFormat"
 	import="com.xdylpg.ORM.CBInfo"
 %>
 
 <%
 	 List<Cpcontent> list = ( List<Cpcontent> )request.getAttribute("cpcList");
 	 CBInfo o = (CBInfo)request.getSession().getAttribute("admin_currentCom");
 	 String sortName = (String)request.getAttribute("current_sortName");
  %>        
  			<!-- 站点导航开始 -->
            <ul class="breadcrumb">
              <li><a href="com-cpc-index?comnum=<%=o.getComnum() %>"><%=o.getBusname() %></a> <span class="divider">/</span></li>
              <li><a href="#">内容列表</a> <span class="divider">/</span></li>
              <li class='active'><%=sortName %></li>
              <li class="pull-right"><a href='com-cpc-form'>添加内容</a></li>
            </ul>
            <!-- 站点导航结束 -->                                 
            <!-- 内容开始 -->
            <%
			if(list.size() == 0)
			{%>
				<div class="alert alert-info">
				  <strong>提示！</strong> 该分类下没有内容，请<a href='com-cpc-form'>添加内容</a>.
				</div>
		
			<%		return;
			}
			%>
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>#</th>
                  <th>标题</th>
                  <th>分类</th>
                  <th>发布时间</th>
                  <th>状态</th>
                  <th style="padding-right:94px;">操作</th>
                </tr>
              </thead>
              <tbody>
              <%
              		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
              		for(Cpcontent temp : list)
              		{
              			out.print("<tr><td>");
              			out.print(temp.getContnum());
              			out.print("</td><td>");
              			out.print(temp.getContit());
              			out.print("</td><td>");
              			out.print(temp.getComconsor().getSornum());
              			out.print("</td><td>");
              			out.print(sdf.format(new Date(temp.getAddtime())));
              			out.print("</td><td>");
              			out.print(temp.getConsta());
              			out.print("</td><td>");
              			out.print("<a class='btn' href='com-cpc-detail?contnum="+temp.getContnum()+"'><i class='icon-pencil'></i> 编辑</a> ");
                  		out.print("<a class='btn' data-toggle='modal' href='com-cpc-delete?contnum="+temp.getContnum()+"&comconsor.sornum="+temp.getComconsor().getSornum()+"'><i class='icon-trash' ></i> 删除</a> ");
                  		out.print("<a class='btn'><i class='icon-ban-circle'></i> 停用</a>");
                    	out.print("<div id='deletePsu' class='modal hide fade' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'>");
                        out.print("<div class='modal-header'>");
                        out.print("<a type='button' class='close' data-dismiss='modal' aria-hidden='true'>×</a>");
                        out.print(" <h5 id='myModalLabel'>确认删除吗？</h5>");
                        out.print("</div>");
                        out.print("<div class='modal-body'>");
                        out.print("<p>"+temp.getContit()+"</p>");
                        out.print("</div>");
                        out.print("<div class='modal-footer'>");
                        out.print("<a class='btn' data-dismiss='modal' aria-hidden='true'>取消</a>");
                        out.print("<a class='btn btn-primary deleteQR'>确认</a>");
                        out.print(" </div>");
                        out.print("</div></td> ");
              		}
              
               %>
                <tr>
                  <td>1</td>
                  <td class="busName">你好中国。</td>
                  <td>2013-01-13 12:32:32</td>
                  <td>advdsfa</td>
                  <td>&quot;</td>
                  <td>
                  	<button class='btn'><i class="icon-pencil"></i> 编辑</button>
                  	<button class='btn' data-toggle="modal" href="#deletePsu"><i class="icon-trash" ></i> 删除</button>
                  	<button class='btn'><i class="icon-ban-circle"></i> 停用</button>
                    <div id="deletePsu" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h5 id="myModalLabel">确认删除吗？</h5>
                      </div>
                      <div class="modal-body">
                        <p>打发的说法的算法第三方</p>
                      </div>
                      <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
                        <button class="btn btn-primary deleteQR">确认</button>
                      </div>
                    </div> 
                  </td>
                </tr>
                </tbody>
                </table>

  			<!-- 内容结束 -->
       