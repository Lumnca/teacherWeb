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
  <title>信息管理</title>
    <link href="assets/plugins/morris-chart/morris.css" rel="stylesheet">
    <link href="assets/css/icons.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
    <script src="assets/js/echarts.js"></script>
</head>

<body class="sticky-header">
<%
    User user = (User)session.getAttribute("user");
    TeacherCur tcur = (TeacherCur)user.cur;
    application.setAttribute("scur",tcur.CurList);
%>

    <!--Start left side Menu-->
    <div class="left-side sticky-left-side">

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
                                <li> <a href="#"> <i class="fa fa-wrench"></i> 设置 </a> </li>
                                <li> <a href="#"> <i class="fa fa-user"></i> 个人 </a> </li>
                                <li> <a href="#"> <i class="fa fa-info"></i> 帮助 </a> </li>
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
                <h4 class="page-title"><span><i class="glyphicon glyphicon-th"></i></span>&nbsp;信息管理</h4>
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
              <!--End Page Title-->

                 <!--Start row-->
                 <div class="row">
                     <div class="container">
                         <div class="analytics-box">

                         </div>
                     </div>
                 </div>

                <!--Start row-->  
                <div class="row">
                     <div class="col-md-6">
                         <div class="white-box">
                                <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">添加课程</h3>
                                        </div>
                                        <div class="panel-body">
                                                <form class="form-horizontal" role="form" action="courseServlet" method="post">
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">课程编号</label>
                                                        <div class="col-sm-10">
                                                            <input class="form-control" id="focused" type="text" name="cno"  placeholder="8位字符">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="disabled" class="col-sm-2 control-label">
                                                            课程名称
                                                        </label>
                                                        <div class="col-sm-10">
                                                            <input class="form-control" id="disabled" type="text" name="cname">
                                                        </div>
                                                    </div>
                                                    <button type="submit" class="btn btn-success" >
                                                            <span><i class="glyphicon glyphicon-plus-sign"></i>&nbsp;添加课程</span>
                                                        </button>
                                                </form>
                                        </div>
                                </div>  
                                <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">修改课程</h3>
                                        </div>
                                        <div class="panel-body">
                                                <form class="form-horizontal" role="form" action="updateCurServlet" method="post">
                                                    <div class="form-group">
                                                        <label  class="col-sm-2 control-label">选择列表</label>
                                                        <div class="col-sm-4">
                                                            <select class="form-control" name="ud">
                                                                <option>无</option>
                                                                <c:forEach  var="item" items="${scur}" >
                                                                    <option>${item.cname}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>

                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">课程编号</label>
                                                        <div class="col-sm-10">
                                                            <input class="form-control"  name="udcno" type="text" placeholder="8位字符">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label  class="col-sm-2 control-label">
                                                            课程名称
                                                        </label>
                                                        <div class="col-sm-10">
                                                            <input class="form-control" id="disabledInput" type="text" name="udcname">
                                                        </div>
                                                    </div>
                                                    <button type="submit" class="btn btn-success" >
                                                        <span><i class="glyphicon glyphicon-pencil"></i>&nbsp;修改课程</span>
                                                    </button>
                                                    
                                                </form>
                                        </div>
                                </div>                            
                         </div>
                     </div>
                     
                     
                  <div class="col-md-6">
                      <div class="white-box">
                            <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">添加学生</h3>
                                    </div>
                                    <div class="panel-body">
                                            <form class="form-horizontal" role="form" action="addStuServlet" method="post">
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">学生账号</label>
                                                    <div class="col-sm-10">
                                                        <input class="form-control" name="cid" type="text" placeholder="8位字符">
                                                    </div>
                                                </div>
                                                    <button type="submit" class="btn btn-primary pull-right" >
                                                            <span><i class="fa fa-search"></i>&nbsp;查询学生</span>
                                                    </button>          
                                            </form>
                                            <div class="form-group text-center">
                                                    <h3>查询结果</h3>
                                            </div>
                                            <% String[] stu = (String[]) session.getAttribute("stu"); %>
                                            <form class="form-horizontal" role="form" action="addStuServlet" method="post">
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">学生姓名</label>
                                                        <div class="col-sm-10">
                                                            <input class="form-control"   type="text" value="<c:out value="${stu[0]}" default=""></c:out>">
                                                        </div>
                                                    </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">学生账号</label>
                                                    <div class="col-sm-10">
                                                        <input class="form-control"  name="stuid" type="text" value="<c:out value="${stu[1]}" default=""></c:out>">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label  class="col-sm-2 control-label">课程编号</label>
                                                    <div class="col-sm-4">
                                                        <select class="form-control" name="stucno">
                                                            <option>无</option>
                                                            <c:forEach  var="item" items="${scur}" >
                                                                <option>${item.cno}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>

                                                </div>
                                                    <div class="form-group container">
                                                            <button type="submit" class="btn btn-success " >
                                                                    <span><i class="glyphicon glyphicon-plus-sign"></i>&nbsp;添加学生</span>
                                                            </button> 
                                                    </div >
                                                        
                                            </form>
                                    </div>
                            </div>                           
                      </div>
                  </div><!-- /col-md-6-->
                </div>
                     

                 <!-- End timeline-->  
                       
                    
                     <!-- Start inbox widget-->
                     <div class="col-md-12">
                        <div class="white-box" style="font-size:1.2em;color: #931e97;font-weight: 600;">
                                           
                       </div>
					<!-- Start inbox widget-->
                   </div>
                   <!--End row-->
			    </div>

       </div>
      <!--End main content -->
    <!--Begin core plugin -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/plugins/moment/moment.js"></script>
    <script  src="assets/js/jquery.slimscroll.js "></script>
    <script src="assets/js/jquery.nicescroll.js"></script>
    <script src="assets/js/functions.js"></script>
</body>
</html>
