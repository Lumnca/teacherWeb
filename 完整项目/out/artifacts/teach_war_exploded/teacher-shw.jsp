<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="userInfor.User" %>
<%@ page import="jdk.internal.dynalink.linker.LinkerServices" %>
<%@ page import="java.util.List" %>
<%@ page import="userInfor.Stuhw" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mysql.GetDb" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
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
  <title>查看提交</title>
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
    List<Stuhw> stuhwList = new ArrayList<>();
    int i = 0;
    GetDb db = new GetDb();
    try {
        PreparedStatement ps = db.conn.prepareStatement("select hw_name, stuhw.hw_file, users.name, stuhw.d_date, stuhw.cname, users.id from stuhw,hw,users where hw.name = stuhw.hw_name and stuhw.cname= hw.cname and stuhw.id=users.id and hw.id=?");
        ps.setString(1,user.ID);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            stuhwList.add(new Stuhw(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)
            ,rs.getString(6)));
        }
        rs.close();ps.close();
        application.setAttribute("stuhwList",stuhwList);
        db.CloseAll();
    }
    catch (Exception e){
        e.printStackTrace();
    }

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
                <h4 class="page-title"><span><i class="fa fa-pencil"></i></span>&nbsp;查看提交</h4>
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

                     

                 <!-- End timeline-->      
                    
                     <!-- Start inbox widget-->
                <div class="col-md-12">
                    <div class="white-box">
                            <div class="text-center list_text"><b>查看提交</b></div>
                            <hr>
                            <div>
                                <form class="form-inline" role="form">
                                    <label >排序方式&nbsp;</label>
                                    <select class="form-control">
                                            <option>名称</option>
                                            <option>文件</option>
                                    </select>
                                        &nbsp;
                                        <label>作业名称&nbsp;</label>
                                        <input type="text" class="form-control ">
                                        <button  class="btn btn-primary" type="submit"><span><i class="glyphicon glyphicon-zoom-in"></i>&nbsp;搜索</span></button>
                                        &nbsp;
                                        <label>姓名&nbsp;</label>
                                        <input type="text" class="form-control ">
                                        <button  class="btn btn-primary" type="submit"><span><i class="glyphicon glyphicon-zoom-in"></i>&nbsp;搜索</span></button>
                                        &nbsp;
                                </form>
                            </div>
                            <hr>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>作业名称</th>
                                        <th>作业文件</th>
                                        <th>姓名</th>
                                        <th>提交时间</th>
                                        <th>课程名称</th>
                                        <th>查看操作</th>
                                        <th>下载文件</th>
                                        <th>删除操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="item" items="${stuhwList}">
                                    <tr>
                                        <%i++;%>
                                        <th>${item.hwName}</th>
                                        <th>${item.filename}</th>
                                        <th>${item.teaName}</th>
                                        <th>${item.hwData}</th>
                                        <th>${item.cname}</th>
                                        <th>
                                            <a href="StudentHw/${item.state}/${item.filename}" class="btn btn-primary"><span><i class="glyphicon glyphicon-pencil"></i>&nbsp;查看</span></a>
                                        </th>
                                        <td>
                                            <a   class="btn btn-primary"  href="StudentHw/${item.state}/${item.filename}" download="StudentHw/${item.state}/${item.filename}"><span><i class=" glyphicon glyphicon-save"></i>&nbsp;下载作业</span></a>
                                        </td>
                                        <th>
                                            <button class="btn btn-danger" data-toggle="modal" data-target="#myModal">
                                                <span><i class="glyphicon glyphicon-remove-sign"></i>&nbsp;删除</span>
                                            </button>
                                        </th>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="pull-right col-md-8 col-sm-12" style="overflow: auto;">
                                    提交总数 :<span class="list_text"><%=i%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     <button class="btn btn-primary"><span><i class="fa   fa-fast-backward"></i></span>&nbsp;&nbsp;首页</button>
                                     <button class="btn btn-primary"><span><i class="fa fa-backward"></i></span>&nbsp;&nbsp;上一页</button>
                                     <button class="btn btn-infor" disabled>&nbsp;&nbsp;1&nbsp;&nbsp;</button>
                                     <button class="btn btn-primary">下一页&nbsp;&nbsp;<span><i class="fa  fa-forward"></i></span></button>
                                     <button class="btn btn-primary">尾页&nbsp;&nbsp;<span><i class="fa  fa-fast-forward"></i></span></button>
                                </div>
                        </div>                    
                    </div>
					<!-- Start inbox widget-->
                </div>
                   <!--End row-->
                   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <form action="rmHwServlet" method="post">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        您正在尝试删除一个学生作业
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <input id="stuName" type="text" hidden name="stuName">
                                    <input id="fileName" type="text" hidden name="fileName">
                                    你确认删除姓名为:&nbsp;&nbsp;<span id="delname" style="color:red"></span>&nbsp;&nbsp;&nbsp;  作业为:&nbsp;&nbsp;<span id="delid" style="color:royalblue"></span>&nbsp;&nbsp;的信息？
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                    </button>
                                    <button type="submit" class="btn btn-primary">
                                        确认删除
                                    </button>
                                </div>
                            </div><!-- /.modal-content -->
                            </form>
                        </div><!-- /.modal -->
                    </div>
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
    <script>

    var doms = document.getElementsByClassName("btn-danger");
    var delName = document.getElementById("delname");
    var delID = document.getElementById("delid");
    for(var i = 0;i<doms.length;i++){
    doms[i].onclick = function(){
        
        delName.innerHTML = this.parentNode.parentNode.children[2].innerText;
        delID.innerHTML = this.parentNode.parentNode.children[1].innerText;
        document.getElementById('stuName').value = this.parentNode.parentNode.children[2].innerText;
        document.getElementById('fileName').value =  this.parentNode.parentNode.children[1].innerText;
        }
    }
    </script>

</body>
<%
    application.removeAttribute("stuhwList");
%>
</html>
