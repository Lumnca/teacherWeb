<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>试题信息</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="keywords" content="">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="assets/images/favicon.png" type="image/png">
  <link href="assets/plugins/morris-chart/morris.css" rel="stylesheet">
  <link href="assets/css/icons.css" rel="stylesheet">
  <link href="assets/css/style.css" rel="stylesheet">
  <link href="assets/css/responsive.css" rel="stylesheet">
  <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">   
</head>

<body class="sticky-header">
<!--Start left side Menu-->
<div class="left-side sticky-left-side">

    <!--logo-->
    <div class="logo">
        <a href="student-index.jsp"><img src="assets/images/logo.png" alt=""></a>
    </div>

    <div class="logo-icon text-center">
        <a href="student-index.jsp"><img src="assets/images/logo-icon.png" alt=""></a>
    </div>
    <!--logo-->

    <div class="left-side-inner">
        <!--Sidebar nav-->
        <ul class="nav nav-pills nav-stacked custom-nav">
            <li class="menu-list"><a href="#"><i class="icon-home"></i> <span>首页</span></a>
                <ul class="sub-menu-list">
                    <li  class="active"><a href="studnet-user.jsp">用户信息</a></li>
                </ul>
            </li>

            <li class="menu-list"><a href="#"><i class="icon-layers"></i> <span>课程信息</span></a>
                <ul class="sub-menu-list">
                    <li><a href="student-cur.jsp">课程管理</a></li>
                </ul>
            </li>

            <li class="menu-list"><a href="#"><i class="icon-grid"></i> <span>作业管理</span></a>
                <ul class="sub-menu-list">
                    <li><a href="student-shw.jsp">作业管理</a></li>
                </ul>
            </li>

            <li class="menu-list"><a href="#"><i class="fa fa-google-plus-official"></i> <span>试题考试</span></a>
                <ul class="sub-menu-list">
                    <li><a href="studnet-examruning.jsp">试题练习</a></li>
                    <li><a href="student-examinfor.jsp">试题信息</a></li>
                </ul>
            </li>

            <li class="menu-list"><a href="#"><i class="glyphicon glyphicon-comment"></i> <span>问题答疑</span></a>
                <ul class="sub-menu-list">
                    <li><a href="student-talk.jsp">讨论区</a></li>
                </ul>
            </li>

            <li class="menu-list"><a href="#"><i class="glyphicon glyphicon-globe"></i> <span>课外学习</span></a>
                <ul class="sub-menu-list">
                    <li><a href="student-file.jsp">资料分享</a></li>
                </ul>
            </li>

            <li class="menu-list"><a href="#"><i class="glyphicon glyphicon-briefcase"></i> <span>辅助工具</span></a>
                <ul class="sub-menu-list">
                    <li><a href="student-table.jsp">自定义制表</a></li>
                </ul>
            </li>


        </ul>
        <!--End sidebar nav-->

    </div>
</div>
    <!--End left side menu-->
    
    
    <!-- main content start-->
    <div class="main-content" >

        <!-- header section start-->
        <div class="header-section">

            <a class="toggle-btn"><i class="fa fa-bars"></i></a>

            <form class="searchform">
                <input type="text" class="form-control" name="keyword" placeholder="Search here..." />
            </form>

            <!--notification menu start -->
            <div class="menu-right">
                <ul class="notification-menu">
                    <li>
                        <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            <img src="assets/images/users/avatar-6.jpg" alt="" />
                            刘某人
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                                <li> <a href="#"> <i class="fa fa-wrench"></i> 设置 </a> </li>
                                <li> <a href="#"> <i class="fa fa-user"></i> 个人 </a> </li>
                                <li> <a href="#"> <i class="fa fa-info"></i> 帮助 </a> </li>
                                <li> <a href="#"> <i class="fa fa-sign-out"></i> 退出 </a> </li>
                         </ul>
                    </li>

                </ul>
            </div>
            <!--notification menu end -->

        </div>
        <!-- header section end-->


        <!--body wrapper start-->
        <div class="wrapper">
              
          <!--Start Page Title-->
           <div class="page-title-box">
                <h4 class="page-title"><span><i class="glyphicon glyphicon-circle-arrow-up"></i></span>&nbsp;试题信息</h4>
                <ol class="breadcrumb">
                    <li>
                        <a href="#">学生</a>
                    </li>
                    
                    <li class="active">
                        刘某人
                    </li>
                </ol>
                <div class="clearfix"></div>
             </div>
              <!--End Page Title-->          
           
                 <!--Start row-->
                 <div class="row">
                     <div class="container">
                         <div class="analytics-box">
                           
                         </div>
                     </div>
                 </div>
                <!--Start row-->  
            <div class="col-md-12">
                <div class="white-box">     
                    <div class="text-center">
                        <b style="font-size:1.3em;color:#3fc070;">试题信息</b>
                    </div>
                    <hr>


                    <div>
                        <form class="form-inline" role="form">
                            <label for="name">排序方式&nbsp;</label>
                            <select class="form-control">
                                <option>编号</option>
                                <option>分数</option>
                            </select>
                            &nbsp;
                            <label>试题名称&nbsp;</label>
                            <input type="text" class="form-control ">
                            <button  class="btn btn-primary" type="submit"><span><i class="glyphicon glyphicon-zoom-in"></i>&nbsp;搜索</span></button>
                            &nbsp;
                        </form>
                        
                    </div>
                    <hr>
                    <br>
                    <div class="table-responsive">    
                        <table class="table table-striped table-hover">
                            <thead class="">
                                <tr class="table_text info">
                                    <th>编号</th>
                                    <th>试题名称</th>
                                    <th>出题教师</th>
                                    <th>分数</th>
                                    <th>查看</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="list_text">
                                    <td><button class="btn btn-primary">1</button></td>
                                    <td>第一次考试</td>
                                    <td>而巴基</td>
                                    <td>85</td>
                                    <td>
                                        <button class="btn btn-primary"  data-toggle="modal" data-target="#myModal2"><span><i class="glyphicon glyphicon-search"></i>&nbsp;详情</span></button>
                                    </td>
                                </tr>
                                                                                                                         
                            </tbody>
                        </table>
                        <hr>
                        <div class="pull-right col-md-8 col-sm-12" style="overflow: auto;">
                            总人数 :<span class="list_text">96</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             <button class="btn btn-primary"><span><i class="fa   fa-fast-backward"></i></span>&nbsp;&nbsp;首页</button>
                             <button class="btn btn-primary"><span><i class="fa fa-backward"></i></span>&nbsp;&nbsp;上一页</button>
                             <button class="btn btn-infor" disabled>&nbsp;&nbsp;1&nbsp;&nbsp;</button>
                             <button class="btn btn-primary">下一页&nbsp;&nbsp;<span><i class="fa  fa-forward"></i></span></button>
                             <button class="btn btn-primary">尾页&nbsp;&nbsp;<span><i class="fa  fa-fast-forward"></i></span></button>
                        </div>
                    </div>                                                            
                </div>

    <!--Begin core plugin -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/plugins/moment/moment.js"></script>
    <script  src="assets/js/jquery.slimscroll.js "></script>
    <script src="assets/js/jquery.nicescroll.js"></script>
    <script src="assets/js/functions.js"></script>
</body>

</html>
