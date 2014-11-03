<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>多大</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" type="text/css" href="./css/my.css" />

    <!-- <script src="http://code.jquery.com/jquery.js"></script> -->
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/dd.js"></script>
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
                        <li><a href="#overview"><i class="icon-chevron-right"></i>留言管理</a></li>
                        <li class="active"><a href="#transitions"><i class="icon-chevron-right"></i> 入驻申请</a></li>
                        <li><a href="#modals"><i class="icon-chevron-right"></i> 意见反馈</a></li>
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
                        <li><a href="#overview"><i class="icon-chevron-right"></i>全&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;部</a></li>
                        <li><a href="#overview"><i class="icon-chevron-right"></i>企业公司</a></li>
                        <li><a href="#transitions"><i class="icon-chevron-right"></i>商铺商店</a></li>
                        <li><a href="#modals"><i class="icon-chevron-right"></i> 生活服务</a></li>
                        <li class="active"><a href="#dropdowns"><i class="icon-chevron-right"></i> 公共单位</a></li>
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
                         <li class="divider">&nbsp;</li>
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
              <li><a href="#">商家管理</a> <span class="divider">/</span></li>
              <li class="active">公共服务类</li>
            </ul>
            <!-- 站点导航结束 -->
                                                         
            <!-- 内容开始 -->
          <form class="form-horizontal" action="../web/save">
              <div class="control-group">
                <label class="control-label" for="public_name">名称</label>
                <div class="controls">
                  <input type="text" class="" id="public_name" name="public_name" placeholder="public_name" />
                </div>
              </div>
              <div class="control-group">
                <label class="control-label" for="public_tel">电话</label>
                <div class="controls">
                  <input type="text" id="public_tel" name="public_tel" placeholder="public_tel" />
                </div>
              </div>
              <div class="control-group">
                <label class="control-label" for="public_addr">地址</label>
                <div class="controls">
                  <input type="text" id="public_addr" name="public_addr" placeholder="public_addr">
                </div>
              </div>
              <div class="control-group">
                <label class="control-label" for="public_intr">简介</label>
                <div class="controls">
                  <input type="text" id="public_intr" name="public_intr" placeholder="public_intr" />
                </div>
              </div>
              <div class="control-group">
                <label class="control-label" for="public_detail">详细信息</label>
                <div class="controls">
                  <input type="text" id="public_detail" name="public_detail" placeholder="public_detail" />
                </div>
              </div>
              <div class="control-group">
                <label class="control-label" for="public_mapstr">地图</label>
                <div class="controls">
                  <input type="text" id="public_mapstr" name="public_mapstr" placeholder="public_mapstr" />
                </div>
              </div>
                  <div class="control-group">
                    <label class="control-label" for="inputPassword">图片</label>
                        <div class="controls">
                          <ul class="thumbnails">
                            <li class="span3">
                              <div class="thumbnail">
                                <img alt="" src="./img/001.jpg" />
                                <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                </div>
                                <h5>文字内容</h5>
                                <p class="img-desc" rows="4" class="ta-mid">我么事盛大的沙发</p>
                              </div>
                            </li>
                            <li class="span3">
                              <div class="thumbnail">
                                <img alt="" src="./img/001.jpg" />
                                <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                </div>
                                <h5>文字内容</h5>
                                <p class="img-desc" class="ta-mid">我么事盛大的沙发2</p>
                              </div>
                            </li>
                            <li class="span3">
                              <div class="thumbnail">
                               <img alt="" src="./img/001.jpg" />
                                <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                </div>
                                <h5>文字内容</h5>
                                <p class="img-desc" class="ta-mid">我么事盛大的沙发3</p>
                              </div>
                            </li>
                            <li class="span3">
                              <div class="thumbnail">
                                <img alt="" src="./img/001.jpg" />
                                <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                </div>
                                <h5>文字内容</h5>
                                <p class="img-desc" class="ta-mid">我么事盛大的沙发4</p>
                              </div>
                            </li>
                          </ul>
                        </div>
                  </div>
                <div class="control-group">
                <!-- <label class="control-label" for="inputPassword">图片</label> -->
                <div class="controls">
                  <input type="submit" value="save" />
                </div>
              </div>
              <div class="control-group">
                <!-- <label class="control-label" for="inputPassword">图片</label> -->
                <div class="controls">
                </div>
              </div>
            </form>
  <!-- 内容结束 -->

        </div>
      </div>
    </div>
  </div>
</div>
  </body>
</html>
