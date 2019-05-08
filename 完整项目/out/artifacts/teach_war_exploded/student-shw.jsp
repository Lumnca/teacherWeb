<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="userInfor.User" %>
<%@ page import="mysql.GetDb" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page import="userInfor.Stuhw" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.File" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>作业提交</title>
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
    <%
        User user = (User)session.getAttribute("user");
        GetDb db = new GetDb();
        int i = 1;
        try {
            PreparedStatement ps1 =  db.conn.prepareStatement("select hw.name , hw.cname, tea_course.name, d_date,tea_course.id,hw.hw_file from hw,tea_course,stu_course where hw.cname = tea_course.cname and stu_course.cno =  tea_course.cno  and stu_course.id=?;");
            ps1.setString(1,user.ID);
            ResultSet rs = ps1.executeQuery();
            List<Stuhw> stuHwList = new ArrayList<>();
            while (rs.next()){
                stuHwList.add(new Stuhw(rs.getString(1),rs.getString(2),rs.getString(3),"可提交",rs.getString(4),
                        rs.getString(5),rs.getString(6)));
            }
            rs.close();ps1.close();db.CloseAll();
            application.setAttribute("hwList",stuHwList);
            for (Stuhw s:stuHwList
                 ) {
                System.out.println(s.getFileurl());
            }


        }
        catch (Exception e){
            System.out.println("错误信息："+e.getMessage());
            e.printStackTrace();
        }
    %>
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
                                <li> <a href="studnet-user.jsp"> <i class="fa fa-user"></i> 个人 </a> </li>
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
                <h4 class="page-title"><span><i class="glyphicon glyphicon-circle-arrow-up"></i></span>&nbsp;作业提交</h4>
                <ol class="breadcrumb">
                    <li>
                        <a href="#">学生</a>
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
            <div class="col-md-12">
                <div class="white-box">     
                    <div class="text-center">
                        <b style="font-size:1.3em;color:#3fc070;">作业信息</b>
                    </div>
                    <hr>


                    <div>
                        <form class="form-inline" role="form">
                            <label>排序方式&nbsp;</label>
                            <select class="form-control">
                                <option>编号</option>
                                <option>课程名</option>
                                <option>教师</option>
                            </select>
                            &nbsp;
                            <label>作业名称&nbsp;</label>
                            <input type="text" class="form-control ">
                            <button  class="btn btn-primary" type="submit"><span><i class="glyphicon glyphicon-zoom-in"></i>&nbsp;搜索</span></button>
                            &nbsp;
                            <label>课程名称&nbsp;</label>
                            <input type="text" class="form-control ">
                            &nbsp;
                            <button  class="btn btn-primary" type="submit"><span><i class="glyphicon glyphicon-zoom-in"></i>&nbsp;搜索</span></button>
                        </form>
                        
                    </div>
                    <hr>

                    <br>
                    <div class="table-responsive">    
                        <table class="table table-striped table-hover">
                            <thead class="">
                                <tr class="table_text info">
                                    <th>编号</th>
                                    <th>作业名称</th>
                                    <th>课程名称</th>
                                    <th>课程教师</th>
                                    <th>提交状态</th>
                                    <th>截止时间</th>
                                    <th>查看作业</th>
                                    <th>下载文件</th>
                                    <th>查看提交</th>
                                    <th>重新提交/提交</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${hwList}">

                                <tr class="list_text">
                                    <td><button class="btn btn-primary"><%=i++%></button></td>
                                    <td>${item.hwName}</td>
                                    <td>${item.cname}</td>
                                    <td>${item.teaName}</td>
                                    <td>${item.state}</td>
                                    <td>${item.hwData}</td>
                                    <td>
                                       <a class="btn btn-success"  href="TeacherHw/${item.fileurl}"><span><i class="glyphicon glyphicon-search"></i>&nbsp;详情</span></a>
                                    </td>
                                    <td>
                                        <a   class="btn btn-primary"  href="TeacherHw/${item.fileurl}" download="TeacherHw/${item.fileurl}"><span><i class=" glyphicon glyphicon-save"></i>&nbsp;下载作业</span></a>
                                    </td>
                                    <td>
                                        <a class="btn btn-primary" href="StudentHw/<%=user.ID%>/${item.filename}"><span><i class="glyphicon glyphicon-search"></i>&nbsp;查看提交</span></a>
                                    </td>
                                    <td>
                                        <button class="btn btn-success tj"  data-toggle="modal" data-target="#myModal"><span><i class="glyphicon glyphicon-repeat"></i>&nbsp;提交</span></button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                        <hr>
                        <div class="pull-right col-md-8 col-sm-12" style="overflow: auto;">
                            总数 :<span class="list_text"><%=i-1%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             <button class="btn btn-primary"><span><i class="fa   fa-fast-backward"></i></span>&nbsp;&nbsp;首页</button>
                             <button class="btn btn-primary"><span><i class="fa fa-backward"></i></span>&nbsp;&nbsp;上一页</button>
                             <button class="btn btn-infor" disabled>&nbsp;&nbsp;1&nbsp;&nbsp;</button>
                             <button class="btn btn-primary">下一页&nbsp;&nbsp;<span><i class="fa  fa-forward"></i></span></button>
                             <button class="btn btn-primary">尾页&nbsp;&nbsp;<span><i class="fa  fa-fast-forward"></i></span></button>
                        </div>
                    </div>                                                            
                </div>

            <!-- 弹出框 -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <form class="" role="form"  method="post" action="stuHwServlet" enctype="multipart/form-data">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" id="myModalLabel">
                                作业提交
                            </h4>
                        </div>
                        <div class="modal-body">
                                <div>
                                    <div class="form-group">
                                        <label class="sr-only"  >作业名称</label>
                                        <div>
                                            <input class="form-control" id="hwname" type="text" name="hwname">
                                        </div>
                                    </div>
                                    <br>
                                    <div class="form-group">
                                        <label class="sr-only col-sm-10" >课程名称</label>
                                        <div >
                                            <input class="form-control" id="cname" type="text" name="cname">
                                        </div>
                                    </div>
                                    <br>
                                    <div class="form-group">
                                        <label class="sr-only" >文件输入</label>
                                        <input type="file" class="btn btn-primary"  name="uploadFile">
                                    </div>
                                </div>                             
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消
                            </button>
                            <button type="submit" class="btn btn-primary">
                                    <span><i class="glyphicon glyphicon-open-file"></i></span>&nbsp;提交
                            </button>
                        </div>
                    </div><!-- /.modal-content -->
                    </form>
                </div><!-- /.modal -->
            </div>
            </div>
        </div>
</body>
      <!--End main content -->
    <!--Begin core plugin -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/plugins/moment/moment.js"></script>
    <script  src="assets/js/jquery.slimscroll.js "></script>
    <script src="assets/js/jquery.nicescroll.js"></script>
    <script src="assets/js/functions.js"></script>
    <script>

    var doms = document.getElementsByClassName("tj");
    var hwName = document.getElementById("hwname");
    var cName = document.getElementById("cname");
    for(var i = 0;i<doms.length;i++){
        doms[i].onclick = function(){
            hwName.value = this.parentNode.parentNode.children[1].innerText;
            cName.value = this.parentNode.parentNode.children[2].innerText;
        }
    }
    </script>

<%
    application.removeAttribute("hwList");
%>
</html>
