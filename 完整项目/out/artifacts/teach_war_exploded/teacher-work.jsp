<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="userInfor.User" %>
<%@ page import="userInfor.StudentCur" %>
<%@ page import="userInfor.TeacherCur" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="keywords" content="">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="assets/images/favicon.png" type="image/png">
  <title>发布作业</title>
    <link href="assets/plugins/morris-chart/morris.css" rel="stylesheet">
    <link href="assets/css/icons.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
    <script src="assets/js/echarts.js"></script>
</head>

<body class="sticky-header">

<!--Start left side Menu-->
<div class="left-side sticky-left-side">
    <%
        User user = (User)session.getAttribute("user");
        TeacherCur tcur = (TeacherCur)user.cur;
        application.setAttribute("scur",tcur.CurList);
    %>
    <!--logo-->
    <div class="logo">
        <a href="teacher-index.jsp"><img src="assets/images/logo.png" alt=""></a>
    </div>

    <div class="logo-icon text-center">
        <a href="teacher-index.jsp"><img src="assets/images/logo-icon.png" alt=""></a>
    </div>
    <!--logo-->

    <div class="left-side-inner">
        <!--Sidebar nav-->
        <ul class="nav nav-pills nav-stacked custom-nav">
            <li class="menu-list"><a href="index.html"><i class="icon-home"></i> <span>首页</span></a>
                <ul class="sub-menu-list">
                    <li  class="active"><a href="teacher-user.jsp">用户信息</a></li>
                </ul>
            </li>

            <li class="menu-list"><a href="#"><i class="icon-layers"></i> <span>课程信息</span></a>
                <ul class="sub-menu-list">
                    <li><a href="teacher-cur.jsp">课程信息</a></li>
                    <li><a href="teacher-stu.jsp">学生信息</a></li>
                    <li><a href="teacher-info.jsp">信息管理</a></li>
                </ul>
            </li>

            <li class="menu-list"><a href="#"><i class="icon-grid"></i> <span>作业管理</span></a>
                <ul class="sub-menu-list">
                    <li><a href="teacher-work.jsp">发布作业</a></li>
                    <li><a href="teacher-shw.jsp">查看提交</a></li>
                    <li><a href="teacher-shif.jsp">作业信息</a></li>
                </ul>
            </li>

            <li class="menu-list"><a href="#"><i class="fa fa-google-plus-official"></i> <span>试题考试</span></a>
                <ul class="sub-menu-list">
                    <li><a href="teacher-exammessage.jsp">试题管理</a></li>
                    <li><a href="teacher-examruning.jsp">发布试题</a></li>
                    <li><a href="teacher-examinfor.jsp">试题信息</a></li>
                </ul>
            </li>

            <li class="menu-list"><a href="#"><i class="glyphicon glyphicon-comment"></i> <span>问题答疑</span></a>
                <ul class="sub-menu-list">
                    <li><a href="teacher-talk.jsp">讨论区</a></li>
                </ul>
            </li>

            <li class="menu-list"><a href="#"><i class="glyphicon glyphicon-globe"></i> <span>课外学习</span></a>
                <ul class="sub-menu-list">
                    <li><a href="teacher-file.jsp">资料分享</a></li>
                </ul>
            </li>

            <li class="menu-list"><a href="#"><i class="glyphicon glyphicon-briefcase"></i> <span>辅助工具</span></a>
                <ul class="sub-menu-list">
                    <li><a href="teacher-table.jsp">自定义制表</a></li>
                </ul>
            </li>
        </ul>
        <!--End sidebar nav-->

    </div>
</div>
    
    
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
                                <%=user.Name%>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                                <li> <a href="teacher-user.jsp"> <i class="fa fa-user"></i> 个人 </a> </li>
                                <li> <a href="help.jsp"> <i class="fa fa-info"></i> 帮助 </a> </li>
                                <li> <a href="index.jsp"> <i class="fa fa-sign-out"></i> 退出 </a> </li>
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
                <h4 class="page-title"><span><i class="fa fa-pencil"></i></span>&nbsp;发布作业</h4>
                <ol class="breadcrumb">
                    <li>
                        <a href="teacher-index.jsp">教师</a>
                    </li>
                    <li class="active">
                        <%=user.Name%>
                    </li>
                </ol>
                <div class="clearfix"></div>
            </div>
                     <!-- Start inbox widget-->
                <div class="col-md-12">
                    <div class="white-box">
                            <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">上传作业</h3>
                                    </div>
                                    <div class="panel-body">
                                            <div class="container">
                                                    <form class="form-horizontal" method="post" action="teaHwServlet" enctype="multipart/form-data">

                                                        <div class="form-group">
                                                            <label>作业名称</label>
                                                            <input type="text" class="form-control" name="name" placeholder="作业名称">
                                                        </div>

                                                        <div class="form-group">
                                                            <label >对应课程</label>
                                                            <div>
                                                                <select class="form-control" name="cname">
                                                                    <option>无</option>
                                                                    <c:forEach var="item" items="${scur}" >
                                                                        <option>${item.cname}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                         </div>

                                                        <div class="form-group">
                                                            <label>截止日期</label>
                                                            <input type="text" class="form-control" name="date" placeholder="YYYY/MM/DD">
                                                        </div>

                                                         <div class="form-group">
                                                                <label class="sr-only" >文件输入</label>
                                                                <input type="file" class="btn btn-primary btn-lg" name="uploadFile">
                                                         </div>
                                
                                                         <div  class="form-group">
                                                                <button type="submit" class="btn btn-primary btn-lg">
                                                                    <span><i class="glyphicon glyphicon-open-file"></i></span>&nbsp;提交
                                                                </button>
                                                         </div>
                                                    </form> 
                                            </div>  
                                    </div>
                            </div>
                                         
                    </div>
					<!-- Start inbox widget-->
                </div>
                   <!--End row-->
			
       </div>
      <!--End main content -->
    <!--Begin core plugin -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/plugins/moment/moment.js"></script>
    <script  src="assets/js/jquery.slimscroll.js "></script>
    <script src="assets/js/jquery.nicescroll.js"></script>
    <script src="assets/js/functions.js"></script>
    </div>
<%
    application.removeAttribute("scur");
%>
</body>

</html>
