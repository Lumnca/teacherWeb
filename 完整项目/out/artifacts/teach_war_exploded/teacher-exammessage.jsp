<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="userInfor.User" %>
<%@ page import="java.util.List" %>
<%@ page import="exam.Single" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mysql.GetDb" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="exam.Judge" %>
<%@ page import="exam.App" %>
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
  <title>试题管理</title>
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
                <h4 class="page-title"><span><i class="glyphicon glyphicon-info-sign"></i></span>&nbsp;试题管理</h4>
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
                                <ul id="myTab" class="nav nav-tabs">
                                        <li class="active">
                                            <a href="#home" data-toggle="tab">
                                                 <span><i class="fa fa-bar-chart-o"></i></span>试题一览
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#e1" data-toggle="tab">
                                                <span><i class="fa  fa-pencil-square-o"></i></span>单选试题修改
                                            </a>
                                        </li>
                                        <li>
                                        <a href="#e2" data-toggle="tab">
                                            <span><i class="fa  fa-pencil-square-o"></i></span>选择试题修改
                                            </a>
                                        </li>
                                        <li>
                                                <a href="#e3" data-toggle="tab">
                                                <span><i class="fa  fa-pencil-square-o"></i></span>应用题修改
                                                </a>
                                        </li>
                                    </ul>
                                    <div id="myTabContent" class="tab-content">
                                        <div class="tab-pane fade in active" id="home">
                                                <div class="table-responsive">
                                                        <table class="table table-border">
                                                            <caption><span><i class="fa fa-chevron-circle-down"></i></span>&nbsp;单选题信息</caption>
                                                            <thead class="success">
                                                            <tr>
                                                                <th>题号</th>
                                                                <th>题目信息</th>
                                                                <th>选项A</th>
                                                                <th>选项B</th>
                                                                <th>选项C</th>
                                                                <th>选项D</th>
                                                                <th>答案</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <c:if test="${singles!=null}">
                                                                <c:forEach var="item" items="${singles}">
                                                                    <tr>
                                                                        <td>${item.no}</td>
                                                                        <td>${item.title}</td>
                                                                        <td>${item.op_A}</td>
                                                                        <td>${item.op_B}</td>
                                                                        <td>${item.op_C}</td>
                                                                        <td>${item.op_D}</td>
                                                                        <td>${item.answer}</td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </c:if>
                                                            </tbody>
                                                        </table>
                                                </div>
                                                <div class="table-responsive">
                                                        <table class="table table-border">
                                                            <caption><span><i class="fa fa-chevron-circle-down"></i></span>&nbsp;判断题信息</caption>
                                                            <thead class="success">
                                                            <tr>
                                                                <th>题号</th>
                                                                <th>题目信息</th>
                                                                <th>选项1</th>
                                                                <th>选项2</th>
                                                                <th>答案</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <c:if test="${judges!=null}">
                                                                <c:forEach var="item" items="${judges}">
                                                                    <tr>
                                                                        <td>${item.no}</td>
                                                                        <td>${item.title}</td>
                                                                        <td>${item.op_One}</td>
                                                                        <td>${item.op_Two}</td>
                                                                        <td>${item.answer}</td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </c:if>
                                                            </tbody>
                                                        </table>
                                                </div>
                                                <div class="table-responsive">
                                                        <table class="table table-border">
                                                            <caption><span><i class="fa fa-chevron-circle-down"></i></span>&nbsp;应用题信息</caption>
                                                            <thead class="success">
                                                            <tr>
                                                                <th>题号</th>
                                                                <th>题目信息</th>
                                                                <th>备注</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <c:if test="${apps!=null}">
                                                                <c:forEach var="item" items="${apps}">
                                                                    <tr>
                                                                        <td>${item.no}</td>
                                                                        <td>${item.title}</td>
                                                                        <td>${item.mark}</td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </c:if>
                                                            </tbody>
                                                        </table>
                                                </div>
                                        </div>
                                        <div class="tab-pane fade" id="e1">
                                                <div class="table-responsive">
                                                        <table class="table table-border">
                                                            <thead class="table_text">
                                                                <tr>
                                                                    <th>题号</th>
                                                                    <th>题目信息</th>
                                                                    <th>选项A</th>
                                                                    <th>选项B</th>
                                                                    <th>选项C</th>
                                                                    <th>选项D</th>
                                                                    <th>答案</th>
                                                                    <th>查看</th>
                                                                    <th>删除</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody class="list_text">
                                                            <c:if test="${singles!=null}">
                                                                <c:forEach var="item" items="${singles}">
                                                                    <tr>
                                                                        <td>${item.no}</td>
                                                                        <td>${item.title}</td>
                                                                        <td>${item.op_A}</td>
                                                                        <td>${item.op_B}</td>
                                                                        <td>${item.op_C}</td>
                                                                        <td>${item.op_D}</td>
                                                                        <td>${item.answer}</td>
                                                                        <td hidden>${item.sid}</td>
                                                                        <td>
                                                                            <button class="btn btn-primary single"  data-toggle="modal" data-target="#a1">
                                                                                <span><i class="fa fa-search"></i>&nbsp;详细信息</span>
                                                                            </button>
                                                                        </td>
                                                                        <td>
                                                                            <button class="btn btn-danger"  data-toggle="modal" data-target="#a2">
                                                                                <span><i class="glyphicon glyphicon-remove-sign"></i>&nbsp;删除</span>
                                                                            </button>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </c:if>

                                                            <tr>
                                                                <td>
                                                                    <button class="btn btn-primary"  data-toggle="modal" data-target="#a1" onclick="selectType(1)">
                                                                        <span><i class="glyphicon glyphicon-plus-sign"></i>&nbsp;添加题目</span>
                                                                    </button></td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                </div>                                            
                                        </div>

                                        <div class="tab-pane fade" id="e2">
                                                <div class="table-responsive">
                                                        <table class="table table-border">
                                                            <thead class="table_text">
                                                                <tr>
                                                                    <th>题号</th>
                                                                    <th>题目信息</th>
                                                                    <th>选项1</th>
                                                                    <th>选项2</th>
                                                                    <th>答案</th>
                                                                    <th>查看</th>
                                                                    <th>删除</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody class="list_text">
                                                            <c:if test="${judges!=null}">
                                                                <f:forEach var="item" items="${judges}">
                                                                    <tr>
                                                                        <td>${item.no}</td>
                                                                        <td>${item.title}</td>
                                                                        <td>${item.op_One}</td>
                                                                        <td>${item.op_Two}</td>
                                                                        <td>${item.answer}</td>
                                                                        <td hidden>${item.jid}</td>
                                                                        <td>
                                                                            <button class="btn btn-primary judges"  data-toggle="modal" data-target="#a3">
                                                                                <span><i class="fa fa-search"></i>&nbsp;详细信息</span>
                                                                            </button>
                                                                        </td>
                                                                        <td>
                                                                            <button class="btn btn-danger"  data-toggle="modal" data-target="#a2">
                                                                                <span><i class="glyphicon glyphicon-remove-sign"></i>&nbsp;删除</span>
                                                                            </button>
                                                                        </td>
                                                                    </tr>
                                                                </f:forEach>
                                                            </c:if>

                                                            <tr>
                                                                <td>
                                                                    <button class="btn btn-primary"  data-toggle="modal" data-target="#a3" onclick="selectType(2)">
                                                                        <span><i class="glyphicon glyphicon-plus-sign"></i>&nbsp;添加题目</span>
                                                                    </button>
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                </div>                                             
                                        </div>
                                        <div class="tab-pane fade" id="e3">
                                                    <div class="table-responsive">
                                                        <table class="table table-border">
                                                                    <thead class="table_text">
                                                                        <tr>
                                                                            <th>题号</th>
                                                                            <th>题目信息</th>
                                                                            <th>答案/备注</th>
                                                                            <th>查看</th>
                                                                            <th>删除</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody class="list_text">
                                                                    <c:if test="${apps!=null}">
                                                                        <c:forEach var="item" items="${apps}">
                                                                            <tr>
                                                                                <td>${item.no}</td>
                                                                                <td>${item.title}</td>
                                                                                <td>${item.mark}</td>
                                                                                <td hidden>${item.aid}</td>
                                                                                <td>
                                                                                    <button class="btn btn-primary apps"  data-toggle="modal" data-target="#a4">
                                                                                        <span><i class="fa fa-search"></i>&nbsp;详细信息</span>
                                                                                    </button>
                                                                                </td>
                                                                                <td>
                                                                                    <button class="btn btn-danger"  data-toggle="modal" data-target="#a2">
                                                                                        <span><i class="glyphicon glyphicon-remove-sign"></i>&nbsp;删除</span>
                                                                                    </button>
                                                                                </td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:if>

                                                                    <tr>
                                                                                <td>
                                                                                    <button class="btn btn-primary"  data-toggle="modal" data-target="#a4" onclick="selectType(3)">
                                                                                        <span><i class="glyphicon glyphicon-plus-sign"></i>&nbsp;添加题目</span>
                                                                                    </button>
                                                                                </td>
                                                                    </tr>
                                                                    </tbody>
                                                            </table>
                                                </div>                                             
                                            </div>

                 <!-----------------------------------------------------> 
                         </div>   

                    </div>
					<!-- Start inbox widget-->
                   </div>
                   <!--End row-->
			    </div>
         <!--End footer -->
       </div>
      <!--End main content -->
      <div class="modal fade" id="a1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <form class="form-horizontal" role="form" action="SingleUpdateServlet"  method="post">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title">
                            <span><i  class="glyphicon glyphicon-comment"></i></span>&nbsp;&nbsp;选项详情
                        </h4>
                    </div>
                    <div class="modal-body">
                       
                            <label><span><i class="fa fa-calendar-o "></i></span>&nbsp;题目信息</label>
                            <textarea class="form-control tabinfor" rows="10" cols="50" name="title"></textarea>
                               
                            <span><i class="glyphicon glyphicon-stats"></i>&nbsp;选项信息</span><hr> 
                            <label>选项数量</label>
                            <select  class="form-control">
                                    <option>4</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                            </select>
                            <label>题号</label>
                            <input type="text"  class="form-control tabinfor" name="sno" id="s1">
                            <label>选项A</label>
                            <input type="text"  class="form-control tabinfor" name="op_A">
                            <label>选项B</label>
                            <input type="text"  class="form-control tabinfor" name="op_B">
                            <label>选项C</label>
                            <input type="text"  class="form-control tabinfor" name="op_C">
                            <label>选项D</label>
                            <input type="text"  class="form-control tabinfor" name="op_D">
                            <label>选项E</label>
                            <input type="text"  class="form-control">
                            <input type="text" name="select1" id="select1" value="0" hidden>
                            <hr>
                            <label><span><i class="fa fa-info "></i></span>&nbsp;题目答案</label>
                            <hr>
                            <input type="text"  class="form-control tabinfor" name="single">
                        
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消
                        </button>
                        <button type="submit" class="btn btn-primary" >
                            确认修改
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </form>
            </div><!-- /.modal -->
        </div>

        <div class="modal fade" id="a3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                        <form class="form-horizontal" role="form" action="JudgeUpdateServlet" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title">
                                <span><i  class="glyphicon glyphicon-comment"></i></span>&nbsp;&nbsp;选项详情
                            </h4>
                        </div>
                        <div class="modal-body">
                           
                                <label><span><i class="fa fa-calendar-o"></i></span>&nbsp;题目信息</label>
                                <textarea class="form-control tabinfor2" rows="10" cols="50" name="jtitle"></textarea>
                                   
                                <span><i class="glyphicon glyphicon-stats"></i>&nbsp;选项信息</span><hr>
                                <label>题号</label>
                                <input type="text"  class="form-control tabinfor2" name="jno" id="s2">
                                <label>选项1</label>
                                <input type="text"  class="form-control tabinfor2" name="op_one">
                                <label>选项2</label>
                                <input type="text"  class="form-control tabinfor2" name="op_two">
                                <input type="text" name="select2" id="select2" value="0" hidden>
                                <hr>
                                <label><span><i class="fa fa-info "></i></span>&nbsp;题目答案</label>
                                <hr>
                                <input type="text"  class="form-control tabinfor2" name="judge">
                            
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消
                            </button>
                            <button type="submit" class="btn btn-primary" >
                                确认修改
                            </button>
                        </div>
                    </div><!-- /.modal-content -->
                </form>
                </div><!-- /.modal -->
            </div>


            <div class="modal fade" id="a4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                            <form class="form-horizontal" role="form" action="AppUpdateServlet" method="post">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title">
                                    <span><i  class="glyphicon glyphicon-comment"></i></span>&nbsp;&nbsp;选项详情
                                </h4>
                            </div>
                            <div class="modal-body">
                                    <label>题号</label>
                                    <input type="text"  class="form-control tabinfor3" name="ano" id="s3">
                                    <label><span><i class="fa fa-calendar-o"></i></span>&nbsp;题目信息</label>
                                    <textarea class="form-control tabinfor3" rows="10" cols="50" name="apptext"></textarea>
                                    
                                    <hr>
                                    <label><span><i class="fa fa-info "></i></span>&nbsp;题目答案及备注</label>
                                    <hr>
                                    <input type="text"  class="form-control tabinfor3" name="mark">
                                    <input type="text" name="select3" id="select3" value="0" hidden>
                                
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                </button>
                                <button type="submit" class="btn btn-primary" >
                                    确认修改
                                </button>
                            </div>
                        </div><!-- /.modal-content -->
                    </form>
                    </div><!-- /.modal -->
                </div>

                <div class="modal fade" id="a2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <form class="form-horizontal" role="form" action="DeleteServlet" method="post">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        <span><i  class="glyphicon glyphicon-remove-sign"></i></span>&nbsp;&nbsp;删除操作
                                    </h4>
                                </div>
                                <div class="modal-body">
                                        <h4 style="color:red;">您确定删除此信息？</h4>
                                    <p>提示：题目必须含有一个</p>
                                    <input name="delno" id="delno" hidden>
                                    <input name="delid" id="delid" hidden>
                                    <input name="deltype" id="deltype" hidden>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                    </button>
                                    <button type="submit" class="btn btn-primary" >
                                        确认修改
                                    </button>
                                </div>
                            </div><!-- /.modal-content -->
                        </form>
                        </div><!-- /.modal -->
                    </div>
    <!--Begin core plugin -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/plugins/moment/moment.js"></script>
    <script  src="assets/js/jquery.slimscroll.js "></script>
    <script src="assets/js/jquery.nicescroll.js"></script>
    <script src="assets/js/functions.js"></script>
    <script>
        var singles = document.getElementsByClassName('single');
        var input1 = document.getElementsByClassName('tabinfor');

        var judges = document.getElementsByClassName('judges');
        var input2 = document.getElementsByClassName('tabinfor2');

        var apps = document.getElementsByClassName('apps');
        var input3 = document.getElementsByClassName('tabinfor3');

        for(var i = 0; i <singles.length;i++){
            singles[i].onclick = function () {
                delType(1)
                for(var j=0;j<input1.length;j++){
                        input1[j].value = this.parentElement.parentElement.children[j].innerText;
                }
                input1[0].value = this.parentElement.parentElement.children[1].innerText;
                input1[1].value = this.parentElement.parentElement.children[0].innerText;
            }
        }

        for(var k = 0; k <judges.length;k++){
            judges[k].onclick = function () {
                delType(2);
                for(var j=0;j<input2.length;j++){
                    input2[j].value = this.parentElement.parentElement.children[j].innerText;
                }
                input2[0].value = this.parentElement.parentElement.children[1].innerText;
                input2[1].value = this.parentElement.parentElement.children[0].innerText;
            }
        }

        for(var l = 0; l <apps.length;l++){
            apps[l].onclick = function () {
                delType(3);
                for(var j=0;j<input3.length;j++){
                    input3[j].value = this.parentElement.parentElement.children[j].innerText;
                }
            }
        }
        function selectType(i) {
            if(i===1){
                document.getElementById('select1').value = '1';
                document.getElementById('s1').value = '${singles.size()+1}'
            }
            else if(i===2){
                document.getElementById('select2').value = '1';
                document.getElementById('s2').value = '${judges.size()+1}'
            }
            else  if(i===3){
                document.getElementById('select3').value = '1';
                document.getElementById('s3').value = '${apps.size()+1}'
            }
            else {

            }
        }
        function delType(i) {
            if(i===1){
                document.getElementById('select1').value = '0';
            }
            else if(i===2){
                document.getElementById('select2').value = '0';
            }
            else  if(i===3){
                document.getElementById('select3').value = '0';
            }
            else {

            }
        }
        var del = document.getElementsByClassName("btn-danger");
        for(var i=0;i<del.length;i++){
            del[i].onclick = function () {
                document.getElementById("delno").value = this.parentNode.parentNode.children[0].innerText;


                var l = this.parentNode.parentNode.children.length;
                if(l>4&&l<8){
                    document.getElementById("deltype").value = 'app';
                    document.getElementById("delid").value = this.parentNode.parentNode.children[3].innerText;
                }
                else  if(l>=8&&l<10){
                    document.getElementById("deltype").value = 'judge';
                    document.getElementById("delid").value = this.parentNode.parentNode.children[5].innerText;
                }
                else {
                    document.getElementById("deltype").value = 'single';
                    document.getElementById("delid").value = this.parentNode.parentNode.children[7].innerText;
                }
            }
        }
    </script>
</body>
<%
    String id = appList.get(0).getAid();
    session.setAttribute("id",id);
    application.removeAttribute("singles");
    application.removeAttribute("judges");
    application.removeAttribute("apps");
%>
</html>
