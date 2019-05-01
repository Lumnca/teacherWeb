<%@ page import="userInfor.User" %>
<%@ page import="userInfor.teacherData" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>用户信息</title>
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
<%
    request.setCharacterEncoding("UTF-8");
    User user = (User) session.getAttribute("user");
    teacherData tea_data =  (teacherData)user.data;
%>
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
                <h4 class="page-title"><span><i class="fa fa-user"></i></span>&nbsp;用户信息</h4>
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
                        <div class="white-box ">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">基本信息</h3>
                                </div>
                                <div class="panel-body">
                                    <form class="form-inline" role="form" action="teacherUserServlet" method="post">
                                        <div>
                                            <label class="text_style"> <span><i class="fa fa-user"></i></span> &nbsp;姓名 </label>
                                            <input type="text" name="name" class="text-primary input_style" value="<%=user.Name%>" style="border:none;border-style: none">
                                        </div>
                                        <hr>
                                        <div>
                                            <label class="text_style"> <span><i class="fa  fa-twitter"></i></span> &nbsp;账号 </label>
                                            <input type="text"  class="text-primary input_style"  disabled  value="<%=user.ID%>" style="border:none;border-style: none">
                                        </div>
                                        <hr>
                                        <div>
                                            <label class="text_style"> <span><i class="fa  fa-male"></i></span>&nbsp;&nbsp; 性别 </label>
                                            <input type="text" name="sex"  class="text-primary input_style" value="<%=user.sex%>" style="border:none;border-style: none">
                                        </div>
                                        <hr>
                                        <div>
                                            <label class="text_style"> <span><i class="fa fa-list-alt"></i></span>&nbsp;&nbsp;身份</label>
                                            <input type="text"  class="text-primary input_style"  disabled  value="教师" style="border:none;border-style: none">
                                        </div>
                                        <hr>
                                        <div>
                                            <label class="text_style"> <span><i class="glyphicon glyphicon-phone-alt"></i></span>&nbsp;&nbsp;联系方式</label>
                                            <input type="text" name="tel" class="text-primary input_style" value="<%=user.tel%>" style="border:none;border-style: none">
                                        </div>
                                        <hr>
                                        <div>
                                            <label class="text_style"> <span><i class="glyphicon glyphicon-education"></i></span>&nbsp;&nbsp;所在高校 </label>
                                            <input type="text" name="school" class="text-primary input_style" value="<%=user.school%>" style="border:none;border-style: none">
                                        </div>
                                        <hr>
                                        <div>
                                            <label class="text_style"> <span><i class="glyphicon glyphicon-list-alt"></i></span>&nbsp;&nbsp; 个人简介 </label>
                                            <div class="">
                                                <textarea class="form-control input_style" rows="10" cols="50" name="infor" >
                                                       <%=user.infor%>
                                                </textarea>
                                            </div>
                                        </div> 
                                        <hr>
                                        <div> 
                                            <input type="submit"  class="btn btn-primary" value="确认修改信息">
                                        </div>                                 
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                  <div class="col-md-6">
                      <div class="white-box">
                            <div class="panel panel-success">
                                <div class="panel-heading">
                                    <h3 class="panel-title">使用信息</h3>
                                </div>
                                <div class="panel-body">
                                    <div>
                                        <label class="text_style"> <span><i class="fa fa-calendar-o"></i></span>&nbsp;已开课程 :</label>
                                        <span class="input_style text-success"> <%=tea_data.classNum%> </span>
                                    </div>
                                    <hr>
                                    <div>
                                        <label class="text_style"> <span><i class="fa fa-users"></i></span>&nbsp;学生总数 :</label>
                                        <span class="input_style text-success"> <%=tea_data.stuNum%> </span>
                                    </div>
                                    <hr>
                                    <div>
                                        <label class="text_style"> <span><i class="fa fa-thumbs-up"></i></span>&nbsp;好评数 :</label>
                                        <span class="input_style text-success"> <%=tea_data.good%> </span>
                                    </div>
                                    <hr>
                                    <div>
                                        <label class="text_style"> <span><i class="fa fa-star"></i></span>&nbsp;讨论交流 :</label>
                                        <span class="input_style text-success"> <%=tea_data.quesNum%> </span>
                                    </div>
                                    <hr>
                                    <div>
                                        <label class="text_style"> <span><i class="fa fa-folder"></i></span>&nbsp;资源分享 :</label>
                                        <span class="input_style text-success"> <%=tea_data.shareNum%> </span>
                                    </div>                                   
                                </div>
                            </div>
                      </div>
                  </div><!-- /col-md-6-->
			    </div>
        <!-- End Wrapper-->
        <!--Start  Footer -->
         <!--End footer -->
       </div>
      <!--End main content -->
    <!--Begin core plugin -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/plugins/moment/moment.js"></script>
    <script  src="assets/js/jquery.slimscroll.js "></script>
    <script src="assets/js/jquery.nicescroll.js"></script>
    <script src="assets/js/functions.js"></script>
    <script>

    </script>
</body>

</html>
