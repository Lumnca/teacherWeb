<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="userInfor.User" %>
<%@ page import="exam.Single" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="exam.Judge" %>
<%@ page import="exam.App" %>
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
  <title>发布试题</title>
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
    List<Single> singleList = new ArrayList<>();
    List<Judge> judgeList = new ArrayList<>();
    List<App> appList = new ArrayList<>();
    GetDb db = new GetDb();
    try{
        PreparedStatement ps = db.conn.prepareStatement("select * from single where id = ?");
        ps.setString(1,user.ID);
        ResultSet rs = ps.executeQuery();

        while (rs.next()){
            singleList.add(new Single(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),
                    rs.getString(6),rs.getString(7),rs.getString(8),rs.getInt(9)));
        }
        rs.close();ps.close();

        PreparedStatement ps2 = db.conn.prepareStatement("select * from judge where id = ?");
        ps2.setString(1,user.ID);
        ResultSet rs2 = ps2.executeQuery();

        while (rs2.next()){
            judgeList.add(new Judge(rs2.getString(1),rs2.getString(2),rs2.getString(3),rs2.getString(4),
                    rs2.getString(5),rs2.getInt(6),rs2.getInt(7)));
        }
        rs2.close();ps2.close();

        PreparedStatement ps3 = db.conn.prepareStatement("select * from app where id = ?");
        ps3.setString(1,user.ID);
        ResultSet rs3 = ps3.executeQuery();

        while (rs3.next()){
            appList.add(new App(rs3.getString(1),rs3.getString(2),rs3.getString(3),
                    rs3.getString(4),rs3.getInt(5)));
        }

        rs3.close();rs3.close();
        db.CloseAll();
        application.setAttribute("singles",singleList);
        application.setAttribute("judges",judgeList);
        application.setAttribute("apps",appList);
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
                <h4 class="page-title"><span><i class="glyphicon glyphicon-flag"></i></span>&nbsp;发布试题</h4>
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

                     <div class="col-md-12">
                        <div class="white-box">
                            <div class="table_text text-center">
                                <span><i class="glyphicon glyphicon-list-alt"></i>试卷详情</span>
                            </div>
                            <div class="">
                            <form class="form-horizontal" role="form" action="ExamServlet" method="post">
                                    <div><h2>第一部分，单选题</h2></div><hr>
                                    <%int i =0;%>
                                    <div class="options">
                                        <c:forEach var="item" items="${singles}">
                                            <h3>${item.no}.${item.title}</h3>
                                            <input type="radio"  name="a${item.no}" onfocus="worknum(<%=i%>)">
                                            <label>A.</label><span>${item.op_A}</span><br>
                                            <input type="radio"  name="a${item.no}"  onfocus="worknum(<%=i%>)">
                                            <label>B.</label><span>${item.op_B}</span><br>
                                            <input type="radio"  name="a${item.no}"  onfocus="worknum(<%=i%>)">
                                            <label>C.</label><span>${item.op_C}</span><br>
                                            <input type="radio"  name="a${item.no}"  onfocus="worknum(<%=i%>)">
                                            <label>D.</label><span>${item.op_D}</span><br>
                                            <%i+=1;%>
                                        </c:forEach>
                                    </div>
                                    <hr>
                                    <div><h2> 第二部分，判断题</h2></div><hr>
                                    <hr>
                                    <div class="options">
                                        <c:forEach var="item" items="${judges}">
                                            <h3>${item.no}.${item.title}</h3>
                                            <input type="radio"  name="b${item.no}"  onfocus="worknum(<%=i%>)">
                                            <label>A.</label><span>${item.op_One}</span><br>
                                            <input type="radio"  name="b${item.no}"  onfocus="worknum(<%=i%>)">
                                            <label>B.</label><span>${item.op_Two}</span><br>
                                            <%i+=1;%>
                                        </c:forEach>
                                    </div>
                                    <hr>
                                    <div><h2> 第三部分，应用题</h2></div><hr>
                                    <div>
                                        <c:forEach var="item" items="${apps}">
                                            <p style="font-size:1.2em;color:#766c96;">${item.no}.${item.title}</p>
                                            <textarea rows="10" cols="80" onfocus="worknum(<%=i%>)">

                                            </textarea>
                                            <%i+=1;%>
                                        </c:forEach>
                                    </div>

                                    <div>
                                        <span><i class="fa fa-bar-chart-o"></i>&nbsp;&nbsp;完成度:&nbsp;&nbsp;<b id="work1">0</b>&nbsp;/<b><%=i%></b></span>
                                    </div>
                                    <hr>
                                    <label>试卷名称:</label>
                                    <input type="text" class="form-control" name="ename"><br>
                                    <label>试卷编号:</label>
                                    <input type="text" class="form-control" name="eid" id="eid"  value="${apps.get(0).aid}" onfocus="warn()"><br>
                                    <label>截止日期:</label>
                                    <input type="text" class="form-control" name="edate" ><br>
                                    <button class="btn btn-primary" type="submit">
                                        <span>
                                            <i class="glyphicon glyphicon-upload"></i>&nbsp;确认发布
                                        </span>
                                    </button>
                                </form>
                            </div>
                        </div>
					<!-- Start inbox widget-->
                   </div>
                   <!--End row-->
			    </div>
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

        var i = 0;
        var items = new Array(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);


        function worknum(index) {
            if (items[index] === 0) {
                i++;
                items[index] = 1;
            } else {

            }
            document.getElementById("work1").innerHTML = i;
        }
        function warn() {
            window.location.href = "";
        }
    </script>
</body>
<%
    application.removeAttribute("singles");
    application.removeAttribute("judges");
    application.removeAttribute("apps");
%>
</html>
