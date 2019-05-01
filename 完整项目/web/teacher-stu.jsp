<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="userInfor.User" %>
<%@ page import="userInfor.TeacherCur" %>
<%@ page import="mysql.GetDb" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page import="userInfor.CurStudent" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="userInfor.StudentCur" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>学生信息</title>
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
    User user = (User)session.getAttribute("user");
    int i = 1;
    List<CurStudent> stuList = new ArrayList<>();
    TeacherCur tcur = (TeacherCur) user.cur;
    GetDb db = new GetDb();
    try {
        PreparedStatement p = db.conn.prepareStatement("select users.name,stu_course.id,cname,users.sex,users.school from stu_course,tea_course,users where ( tea_course.cno =  stu_course.cno and users.id = stu_course.id) and ( tea_course.cno in (select cno from tea_course where id = ? ) );");
        p.setString(1,user.ID);
        ResultSet rs = p.executeQuery();
        while (rs.next()){
            stuList.add(new CurStudent(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)));
        }
        rs.close();p.close();
        application.setAttribute("stu",stuList);

    }
    catch (Exception e){
        e.printStackTrace();
    }


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
                <h4 class="page-title"><span><i class="fa fa-users"></i></span>&nbsp;学生信息</h4>
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
            <div class="col-md-12">
                <div class="white-box">     
                    <button  class="btn btn-primary" ><span><i class="glyphicon glyphicon-plus-sign"></i> 导出学生</span></button> 
                    &nbsp; &nbsp; &nbsp; &nbsp;
                    <button  class="btn btn-primary" onclick="newurl()">
                            <span>
                                <i class="glyphicon glyphicon-plus-sign"></i>添加学生
                            </span>
                        </button>
                    <div class="text-center">
                        <b style="font-size:1.3em;color:#3fc070;">课程信息</b>
                    </div>
                    <hr>


                    <div>
                        <form class="form-inline" role="form">
                            <label>排序方式&nbsp;</label>
                            <select class="form-control">
                                <option>编号</option>
                                <option>姓名</option>
                                <option>账号</option>
                                <option>课程</option>
                                <option>性别</option>
                                <option>学校</option>
                            </select>
                            &nbsp;
                            <label>姓名&nbsp;</label>
                            <input type="text" class="form-control ">
                            <button  class="btn btn-primary" type="submit"><span><i class="glyphicon glyphicon-zoom-in"></i>&nbsp;搜索</span></button>
                            &nbsp;
                            <label>账号&nbsp;</label>
                            <input type="text" class="form-control ">
                            &nbsp;
                            <button  class="btn btn-primary" type="submit"><span><i class="glyphicon glyphicon-zoom-in"></i>&nbsp;搜索</span></button>
                            <label>课程&nbsp;</label>
                            &nbsp;
                            <input type="text" class="form-control ">
                            <button  class="btn btn-primary" type="submit"><span><i class="glyphicon glyphicon-zoom-in"></i>&nbsp;搜索</span></button>
                            &nbsp;
                            <label>学校&nbsp;</label>
                            <input type="text" class="form-control ">
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
                                    <th>姓名</th>
                                    <th>账号</th>
                                    <th>课程</th>
                                    <th>性别</th>
                                    <th>学校</th>
                                    <th>数据操作</th>
                                </tr>
                            </thead>
                            <tbody>

                            <c:forEach var="item" items="${stu}">
                                    <tr class="list_text">
                                        <td><button class="btn btn-primary"><%=i++%></button></td>
                                        <td>${item.name}</td>
                                        <td>${item.id}</td>
                                        <td>${item.cname}</td>
                                        <td>${item.sex}</td>
                                        <td>${item.school}</td>
                                        <td>
                                            <button class="btn btn-danger"  data-toggle="modal" data-target="#myModal"><span><i class="fa fa-times-circle"></i>&nbsp;删除</span></button>
                                        </td>
                                    </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <hr>
                        <div class="pull-right col-md-8 col-sm-12" style="overflow: auto;">
                            总人数 :<span class="list_text"><%=i-1%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             <button class="btn btn-primary"><span><i class="fa   fa-fast-backward"></i></span>&nbsp;&nbsp;首页</button>
                             <button class="btn btn-primary"><span><i class="fa fa-backward"></i></span>&nbsp;&nbsp;上一页</button>
                             <button class="btn btn-infor" disabled>&nbsp;&nbsp;1&nbsp;&nbsp;</button>
                             <button class="btn btn-primary">下一页&nbsp;&nbsp;<span><i class="fa  fa-forward"></i></span></button>
                             <button class="btn btn-primary">尾页&nbsp;&nbsp;<span><i class="fa  fa-fast-forward"></i></span></button>
                        </div>
                    </div>                                                            
                </div>
            <!-- 弹出框 -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
                <div class="modal-dialog">
                    <form action="delStuServlet" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" id="myModalLabel">
                                您正在尝试删除一个学生信息
                            </h4>
                        </div>
                        <div class="modal-body">
                            <input type="text" name="cid" hidden id = "cid">
                            <input type="text" name="cname" hidden id="cname">
                            你确认删除姓名为:&nbsp;&nbsp;<span id="delname" style="color:red"></span>&nbsp;&nbsp;&nbsp;  账号为:&nbsp;&nbsp;<span id="delid" style="color:royalblue"></span>&nbsp;&nbsp;的学生？
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
                document.getElementById("cid").value = this.parentNode.parentNode.children[2].innerText;
                document.getElementById("cname").value = this.parentNode.parentNode.children[3].innerText;
                delName.innerHTML = this.parentNode.parentNode.children[1].innerText;
                delID.innerHTML = this.parentNode.parentNode.children[2].innerText;
            }
        }
        var flag = '<%=session.getAttribute("flag")%>';
        if(flag!="null"){
            alert(flag);
        }

        function  newurl(){
            window.location.href="teacher-info.jsp";
        }
    </script>
<%
  application.removeAttribute("stu");
  session.removeAttribute("flag");
%>
</body>

</html>
