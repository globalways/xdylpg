<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>商家列表</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="./css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" type="text/css" href="./css/my.css" />

    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="./js/bootstrap.min.js"></script>
  </head>
  <body>
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12">
        <div class="row-fluid">
          <div class="span3">

            <!-- 管理员信息 -->
            <div class="row-fluid">
              <div class="span12">
                <p  class="text-right">
                  <h4>管理员XX您好</h4>
                  <a href="#">sign out</a>
                 </p>
              </div>
            </div>
            <!-- 分类列表 -->
            <div class="accordion" id="accordion-969416">

              <!-- 第一组 -->
              <div class="accordion-group">
                <div class="accordion-heading">
                   <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-969416" href="#accordion-element-181694">
                    <i class="icon-briefcase pull-right"></i>网站管理</a>
                </div>
                <div id="accordion-element-181694" class="accordion-body collapse">
                  <div class="accordion-inner">
                 
                      <ul class="nav nav-list bs-docs-sidenav">
                        <li class="nav-header">用户信息</li> 
                        <li><a href="./liuyan.jsp"><i class="icon-chevron-right"></i>留言管理</a></li>
                        <li><a href="./shenqing.jsp"><i class="icon-chevron-right"></i> 入驻申请</a></li>
                        <li class="active"><a href="./jianyi.jsp"><i class="icon-chevron-right"></i> 意见反馈</a></li>
                         <li class="divider"></li>
                         <li class="nav-header">系统信息</li> 
                       <li><a href="#dropdowns"><i class="icon-chevron-right"></i> 系统设置</a></li>
                      </ul>
                  </div>
                </div>
              </div>

              <!-- 第二组 -->
              <div class="accordion-group">
                <div class="accordion-heading">
                   <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-969416" href="#accordion-element-598597">
                    <i class="icon-tasks pull-right"></i>商家管理</a>
                </div>
                <div id="accordion-element-598597" class="accordion-body in collapse">
                  <div class="accordion-inner">
                      <ul class="nav nav-list bs-docs-sidenav">
                        
                        <li class="nav-header">内容管理</li>
                        <li class="active"><a href="./shangjialiebiao.jsp"><i class="icon-chevron-right"></i>全&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;部</a></li>
                        <li><a href="#overview"><i class="icon-chevron-right"></i>企业公司</a></li>
                        <li><a href="#transitions"><i class="icon-chevron-right"></i>商铺商店</a></li>
                        <li><a href="#modals"><i class="icon-chevron-right"></i> 生活服务</a></li>
                        <li><a href="#dropdowns"><i class="icon-chevron-right"></i> 公共单位</a></li>
                        <li><a href="#overview"><i class="icon-chevron-right"></i><i class="icon-plus pull-right"></i>添&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;加</a></li>
                        <li class="divider"></li>
                        <li class="nav-header">模板修改</li>
                        <li><a href="#scrollspy"><i class="icon-chevron-right"></i> 企业模板修改 </a></li>
                        <li><a href="#tabs"><i class="icon-chevron-right"></i> 生活服务&商铺</a></li>
                        <li><a href="#tabs"><i class="icon-chevron-right"></i> 公共单位 </a></li>
                        <li class="divider"></li>
                        <li><a href="#tabs"><i class="icon-chevron-right"></i> 回收站 </a></li>
                      </ul>
                  </div>
                </div>
              </div>
              <!-- 第三组 -->
              <div class="accordion-group">
                <div class="accordion-heading">
                   <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-969416" href="#accordion-element-598598">
                    <i class="icon-user pull-right"></i>账户管理</a>
                </div>
                <div id="accordion-element-598598" class="accordion-body collapse">
                  <div class="accordion-inner">
                      <ul class="nav nav-list bs-docs-sidenav">
                        
                        <li class="nav-header">商家账号</li>
                        <li class="active"><a href="#"><i class="icon-chevron-right"></i>账户列表</a></li>
                        <li><a href="#"><i class="icon-chevron-right"></i>添加账号</a></li>
                        <li class="divider"></li>
                        <li class="nav-header">个人信息</li> 
                        <li><a href="#tooltips"><i class="icon-chevron-right"></i> 资料修改</a></li>
                         <li class="divider"></li>
                        <li><a href="#tabs"><i class="icon-chevron-right"></i> 回收站 </a></li>
                      </ul>
                  </div>
                </div>
              </div>


            </div>
          </div>

          <div class="span9">
            <!-- span12 占空行 -->
            <div class="span12"></div>
            <!-- 站点导航开始 -->
            <ul class="breadcrumb">
              <li><a href="#">首页</a> <span class="divider">/</span></li>
              <li><a href="#">Library</a> <span class="divider">/</span></li>
              <li class="active">Data</li>
            </ul>
            <!-- 站点导航结束 -->
                                                         
            <!-- 内容开始 -->
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>#</th>
                  <th>名称</th>
                  <th>字母ID</th>
                  <th>负责人</th>
                  <th>电话</th>
                  <th>地址</th>
                  <th>处理</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>到发大水发生的发生大发</td>
                  <td>2013-01-13 12:32:32</td>
                  <td>advdsfa</td>
                  <td>1353413413</td>
                  <td>XXX@qq.com</td>
                  <td>
                    <div class="btn-group">
                      <a class="btn btn-primary" href="#"><i class="icon-list-alt icon-white"></i></a>
                      <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
                      <ul class="dropdown-menu">
                        <li><a href="#"><i class="icon-pencil"></i> 编辑</a></li>
                        <li><a href="#"><i class="icon-trash"></i> 彻底删除</a></li>
                        <li><a href="#"><i class="icon-ban-circle"></i> 移至回收站</a></li>
                        <li class="divider"></li>
                        <li><a href="#"><i class="i"></i> Make admin</a></li>
                      </ul>
                    </div>
                    <div id="queren" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h5 id="myModalLabel">确认删除吗？</h5>
                      </div>
                      <div class="modal-body">
                        <p>打发的说法的算法第三方</p>
                      </div>
                      <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
                        <button class="btn btn-primary">确认</button>
                      </div>
                    </div>
                    <button class="btn" type="button" data-toggle="modal" data-target="#myModal" title="查看详细或者回复留言"><i class="icon-list-alt"></i></button>
                    <i class="icon-check" title="已经查看或者回复"></i>
              <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                  <h5 id="myModalLabel">信息详情</h5>
                </div>
                <div class="modal-body">
                  <form>
                      <fieldset>
                        <legend>有谁可以告诉我为什么BOORSTRAP安装RECOVERY会提示permissiodeied-有谁可以告诉我为什么BOORSTRAP安装RECOVERY会提示permissiodeied如题...我做了精简...元大的2.6版本...</legend>
                        <!--<label>回复内容</label>
                        <textarea rows="5"></textarea>
                        <span class="help-block">Example block-level help text here.</span>
                        <label class="checkbox">
                          <input type="checkbox"> Check me out
                        </label>
                        <button type="submit" class="btn">Submit</button>-->
                      </fieldset>
                  </form>
                </div>
                <div class="modal-footer">
                  <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
                  <!--<button class="btn btn-primary">回复</button>-->
                </div>
              </div>

                  </td>
                </tr>
                <tr>
                  <td>XXX</td>
                  <td>XXX</td>
                  <td>XXX</td>
                  <td>XXX</td>
                  <td>XXX</td>
                  <td>XXX</td>
                   <td><button class="btn">details</button></td>
                </tr> 
              </tbody>
            </table>

            <!-- fenye -->
            <div class="pagination pagination-large pagination-centered">
              <ul>
                <li><a href="#">Prev</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">Next</a></li>
              </ul>
            </div>
  <!-- 内容结束 -->

        </div>
      </div>
    </div>
  </div>
</div>
  </body>
</html>
