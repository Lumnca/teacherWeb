<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="userInfor.TalkInfor" %>
<%@ page import="mysql.GetDb" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="userInfor.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.PreparedStatement" %>
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
  <title>讨论区</title>
    <link href="assets/plugins/morris-chart/morris.css" rel="stylesheet">
    <link href="assets/css/icons.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/responsive.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/vue/2.2.2/vue.min.js"></script>
    <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
    <script src="assets/js/echarts.js"></script>
</head>

<body class="sticky-header">
<%
    User user = (User)session.getAttribute("user");
    GetDb db = new GetDb();
    List<TalkInfor> talkInforList = new ArrayList<>();
    List<TalkInfor>  shareList = new ArrayList<>();
    try {
        PreparedStatement ps = db.conn.prepareStatement("select * from talkInfor order by date");
        ResultSet rs = ps.executeQuery();
        while (rs.next()){
            talkInforList.add(new TalkInfor(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),
                    rs.getInt(5),rs.getInt(6),rs.getString(7)));
        }
        PreparedStatement ps2 = db.conn.prepareStatement("select * from shareInfor order by date");
        ResultSet rs2 = ps2.executeQuery();
        while (rs2.next()){
            shareList.add(new TalkInfor(rs2.getString(1),rs2.getString(2),rs2.getString(3),rs2.getString(4),
                    rs2.getInt(5),0,""));
        }

        ps2.close();ps.close();
        db.CloseAll();
        application.setAttribute("talks",talkInforList);
        application.setAttribute("shares",shareList);
    }
    catch (Exception e){
        e.printStackTrace();
    }
%>
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
                <h4 class="page-title"><span><i class="fa fa-comments"></i></span>&nbsp;讨论区</h4>
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
            <div class="row">
                <div class="col-md-6">
                    <div class="white-box">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title"><span><i class="fa fa-question"></i></span>&nbsp;问题解答</h3>
                            </div>
                            <div class="panel-body">
                                <form class="form-inline" role="form">
                                    <span style="font-size: 1.2em;"><i class="fa fa-calendar"></i>&nbsp;日期检索&nbsp;</span>
                                    <select class="form-control">
                                        <option>2019</option>
                                        <option>2018</option>
                                    </select>
                                    &nbsp;<label>年&nbsp;</label>

                                    <select class="form-control">
                                        <option value="">1</option>
                                        <option value="">2</option>
                                        <option value="">3</option>
                                        <option value="" selected="selected">4</option>
                                        <option value="">5</option>
                                        <option value="">6</option>
                                        <option value="">7</option>
                                        <option value="">8</option>
                                        <option value="">9</option>
                                        <option value="">10</option>
                                        <option value="">11</option>
                                        <option value="">12</option>
                                    </select>
                                    <label>月&nbsp;</label>
                                    <select class="form-control">
                                        <option value="">1</option>
                                        <option value="">2</option>
                                        <option value="">3</option>
                                        <option value="">4</option>
                                        <option value="">5</option>
                                        <option value="">6</option>
                                        <option value="">7</option>
                                        <option value="">8</option>
                                        <option value="">9</option>
                                        <option value="">10</option>
                                        <option value="">11</option>
                                        <option value="">12</option>
                                        <option value="">13</option>
                                        <option value="">14</option>
                                        <option value="">15</option>
                                        <option value="">16</option>
                                        <option value="">17</option>
                                        <option value="" selected="selected">18</option>
                                        <option value="">19</option>
                                        <option value="">20</option>
                                        <option value="">21</option>
                                        <option value="">22</option>
                                        <option value="">23</option>
                                        <option value="">24</option>
                                        <option value="">25</option>
                                        <option value="">26</option>
                                        <option value="">27</option>
                                        <option value="">28</option>
                                        <option value="">29</option>
                                        <option value="">30</option>
                                        <option value="">31</option>
                                    </select>
                                    <label>日&nbsp;</label>
                                    <button  class="btn btn-primary" type="submit"><span><i class="glyphicon glyphicon-zoom-in"></i>&nbsp;搜索</span></button>
                                    &nbsp;
                                </form>
                                <hr>
                                <c:forEach var="item" items="${talks}">
                                        <span style="color:royalblue;"><c:if test="${item.retalk!=0}">
                                            回复:${item.rename}
                                        </c:if> <i class="fa fa-user"></i>&nbsp;${item.name } </span> <br>
                                    ${item.text}
                                    <div class="pull-right" id="app">
                                        <br><span style="color:royalblue;"><i class="fa  fa-clock-o"></i>&nbsp;${item.date}&nbsp;&nbsp;</span>
                                        <a href="#"><span style="color:royalblue;"><i class="fa fa-thumbs-up"></i>&nbsp;(${item.good})</span></a>
                                        <a data-toggle="collapse" data-parent="#accordion" class="retalk" href="#demo">
                                            <span><i class="fa fa-stack-exchange"></i>&nbsp;回复</span>
                                        </a>
                                    </div>
                                    <hr>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="panel panel-success collapse  panel-collapse" id="demo">
                            <div class="panel-heading">
                                <h3 class="panel-title"><span><i class="fa fa-glide-g"></i></span>发表信息</h3>
                            </div>
                            <div class="panel-body">
                                <div  class="container">
                                    <span>回复:<i class="glyphicon glyphicon-user"></i>&nbsp;<b id="username"></b></span><hr>
                                    <form role="form" method="post" action="talkServlet">
                                        <input type="text" name="id" value="<%=user.ID%>" hidden>
                                        <input type="text" name="name" value="<%=user.Name%>" hidden>
                                        <input type="text" name="rename" id="rename" hidden>
                                        <label>主体信息</label>
                                        <div class="form-group">
                                                          <textarea rows="10" cols="40" name="text">

                                                          </textarea>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <button type="submit" class="btn btn-primary"><span><i class="fa  fa-check-circle"></i></span>&nbsp;发表</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>




                    </div>
                </div>


                <div class="col-md-6">
                    <div class="white-box">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title"><span><i class="fa fa-comments"></i></span>&nbsp;交流分享</h3>
                            </div>
                            <div class="panel-body">
                                <form class="form-inline" role="form">
                                    <span style="font-size: 1.2em;"><i class="fa fa-calendar"></i>&nbsp;日期检索&nbsp;</span>
                                    <select class="form-control">
                                        <option>2019</option>
                                        <option>2018</option>
                                    </select>
                                    &nbsp;<label>年&nbsp;</label>

                                    <select class="form-control">
                                        <option value="">1</option>
                                        <option value="">2</option>
                                        <option value="">3</option>
                                        <option value="" selected="selected">4</option>
                                        <option value="">5</option>
                                        <option value="">6</option>
                                        <option value="">7</option>
                                        <option value="">8</option>
                                        <option value="">9</option>
                                        <option value="">10</option>
                                        <option value="">11</option>
                                        <option value="">12</option>
                                    </select>
                                    <label>月&nbsp;</label>
                                    <select class="form-control">
                                        <option value="">1</option>
                                        <option value="">2</option>
                                        <option value="">3</option>
                                        <option value="">4</option>
                                        <option value="">5</option>
                                        <option value="">6</option>
                                        <option value="">7</option>
                                        <option value="">8</option>
                                        <option value="">9</option>
                                        <option value="">10</option>
                                        <option value="">11</option>
                                        <option value="">12</option>
                                        <option value="">13</option>
                                        <option value="">14</option>
                                        <option value="">15</option>
                                        <option value="">16</option>
                                        <option value="">17</option>
                                        <option value="" selected="selected">18</option>
                                        <option value="">19</option>
                                        <option value="">20</option>
                                        <option value="">21</option>
                                        <option value="">22</option>
                                        <option value="">23</option>
                                        <option value="">24</option>
                                        <option value="">25</option>
                                        <option value="">26</option>
                                        <option value="">27</option>
                                        <option value="">28</option>
                                        <option value="">29</option>
                                        <option value="">30</option>
                                        <option value="">31</option>
                                    </select>
                                    <label>日&nbsp;</label>
                                    <button  class="btn btn-primary" type="submit"><span><i class="glyphicon glyphicon-zoom-in"></i>&nbsp;搜索</span></button>
                                    &nbsp;
                                </form>
                                <hr>
                                <c:forEach  var="item" items="${shares}">
                                    <span style="color:royalblue;"><i class="fa fa-user"></i>&nbsp;${item.name}</span><br>
                                    ${item.text}
                                    <div class="pull-right" id="app">
                                        <br><span style="color:royalblue;"><i class="fa  fa-clock-o"></i>&nbsp;${item.date}&nbsp;&nbsp;</span>
                                        <a href="#"><span style="color:royalblue;"><i class="fa fa-thumbs-up"></i>&nbsp;(${item.good})</span><br></a>
                                    </div>
                                    <hr>
                                </c:forEach>
                            </div>
                        </div>


                        <div class="panel panel-success">
                            <div class="panel-heading">
                                <h3 class="panel-title"><span><i class="fa fa-glide-g"></i></span>发表信息</h3>
                            </div>
                            <div class="panel-body">
                                <div  class="container">
                                    <form role="form" action="shareServlet" method="post" class="form-horizontal">
                                        <div  class="form-group">
                                            <label >主体信息</label>
                                            <input type="text" value="<%=user.ID%>" name="sid" hidden>
                                            <input type="text" value="<%=user.Name%>" name="sname" hidden>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label >提交类型</label>
                                            <select class="form-control" name="stype">
                                                <option>问题答疑</option>
                                                <option>分享交流</option>
                                            </select>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                                          <textarea rows="10" cols="60%" name="stext" style="overflow: auto">

                                                          </textarea>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <button type="submit" class="btn btn-primary"><span><i class="fa  fa-check-circle"></i></span>&nbsp;发表</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- /col-md-6-->
            </div>


            <div class="col-md-12">
                <div class="white-box">

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
    var doms = document.getElementsByClassName("retalk");
    var username = document.getElementById("username");

    for(var i = 0;i<doms.length;i++){
        doms[i].onclick = function(){
            username.innerHTML = this.parentElement.previousElementSibling.previousElementSibling.lastChild.textContent;
            document.getElementById("rename").value = this.parentElement.previousElementSibling.previousElementSibling.lastChild.textContent;
        }
    }
</script>
</body>

<%
    application.removeAttribute("talks");
    application.removeAttribute("shares");
%>
</html>