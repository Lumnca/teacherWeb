<%@ page import="userInfor.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="exam.Single" %>
<%@ page import="exam.Judge" %>
<%@ page import="exam.App" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <title>试题练习</title>
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
    String testId = "";
    if(session.getAttribute("apps")!=null){
        List<App> list =(List<App>) session.getAttribute("apps");
        testId = list.get(0).getAid();
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
                <h4 class="page-title"><span><i class="glyphicon glyphicon-flag"></i></span>&nbsp;试题练习</h4>
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

            <div class="col-md-12">
                <c:if test="${sessionScope.apps==null}">
                    <form class="form-horizontal" role="form" action="findExamServlet">
                        <label>试卷编号:</label>
                        <input type="text" class="form-control" name="findExam"><br>
                        <button class="btn btn-primary">
                           <span>
                                  <i class="fa fa-search"></i>&nbsp;查询试卷
                           </span>
                        </button>
                    </form>
                </c:if>
                   <c:if test="${sessionScope.apps!=null}">
                       <div class="white-box">
                           <div class="table_text text-center">
                               <span><i class="glyphicon glyphicon-list-alt"></i>${sessionScope.test}</span>
                               <span class="pull-right"><i class="glyphicon glyphicon-time"></i>&nbsp;答题时间:120分钟</span>
                           </div>
                           <div class="">
                               <form class="form-horizontal" role="form">
                                   <div><h2>第一部分，单选题</h2></div><hr>
                                   <% int i = 1;%>
                                   <f:forEach var="item" items="${sessionScope.singles}">
                                       <div class="options">
                                           <h3>${item.no}.${item.title}</h3>
                                           <input type="radio"  name="a${item.no}" onfocus="worknum(<%=i%>,'A')" value="A" ><span></span>
                                           <label>A.</label><span>${item.op_A}</span><br>
                                           <input type="radio"  name="a${item.no}"  onfocus="worknum(<%=i%>,'B')" value="B">
                                           <label>B.</label><span>${item.op_B}</span><br>
                                           <input type="radio"  name="a${item.no}"  onfocus="worknum(<%=i%>,'C')" value="C">
                                           <label>C.</label><span>${item.op_C}</span><br>
                                           <input type="radio"  name="a${item.no}"  onfocus="worknum(<%=i%>,'D')" value="D">
                                           <label>D.</label><span>${item.op_D}</span><br>
                                           <%i+=1;%>
                                       </div>
                                       <hr>
                                   </f:forEach>
                                   <div><h2> 第二部分，判断题</h2></div><hr>
                                   <c:forEach var="item" items="${sessionScope.judges}">
                                       <h3>${item.no}.${item.title}</h3>
                                       <input type="radio"  name="b${item.no}"  onfocus="worknum(<%=i%>,'1')" value="1">
                                       <label>A.</label><span>${item.op_One}</span><br>
                                       <input type="radio"  name="b${item.no}"  onfocus="worknum(<%=i%>,'2')" value="2">
                                       <label>B.</label><span>${item.op_Two}</span><br>
                                       <%i+=1;%>
                                   </c:forEach>
                                   <hr>
                                   <div><h2> 第三部分，应用题</h2></div><hr>
                                   <c:forEach var="item" items="${sessionScope.apps}">
                                       <p style="font-size:1.2em;color:#766c96;">${item.no}.${item.title}</p>
                                       <textarea rows="10" cols="80" onfocus="worknum(<%=i%>)">

                                            </textarea>
                                   </c:forEach>
                                   <div style="position: fixed;right: 60px;top:45%;background: #0e0e0e;color: #FFFFFF;padding: 20px 30px;">
                                       <span><i class="fa fa-bar-chart-o"></i>&nbsp;&nbsp;完成度:&nbsp;&nbsp;<b id="work1">0</b>&nbsp;/<b><%=i-1%></b></span><br>
                                       <span><i class="glyphicon glyphicon-time">&nbsp;时间: </i> <b id="txt"></b> </span>
                                   </div >

                               </form>
                               <hr>
                               <button class="btn btn-primary "  data-toggle="modal" data-target="#myModal">
                                        <span>
                                            <i class="glyphicon glyphicon-upload"></i>&nbsp;提交试卷
                                        </span>
                               </button>
                           </div>
                       </div>
                   </c:if>
					<!-- Start inbox widget-->
                   </div>
                   <!--End row-->
			    </div>
         <!--End footer -->
       </div>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
            <div class="modal-dialog">
                <form action="StuExamServlet" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">
                                答题信息
                            </h4>
                        </div>
                        <div class="modal-body">
                            <input type="text" name="cid"  id = "cid" value="<%=user.ID%>" hidden>
                            <input type="text" name="tname"  value="${sessionScope.test}" hidden>
                            <input type="text" name="tid"  value="<%=testId%>" hidden>
                            <table class="table table-border">
                                <thead>
                                <%
                                    int i=1;
                                %>
                                    <tr>
                                        <c:forEach var="i" items="${sessionScope.singleAnswer}">
                                            <th><%=i++%></th>
                                        </c:forEach>
                                        <c:forEach var="i" items="${sessionScope.judgeAnswer}">
                                            <th><%=i++%></th>
                                        </c:forEach>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr id="answerx">
                                        <c:forEach  var="item" items="${sessionScope.singleAnswer}">
                                                <td>${item}</td>
                                        </c:forEach>
                                        <c:forEach  var="item" items="${sessionScope.judgeAnswer}">
                                            <td>${item}</td>
                                        </c:forEach>
                                    </tr>
                                    <tr id="answers">

                                    </tr>
                                </tbody>
                            </table>
                            <label>正确数</label>
                            <input type="text" class="form-control " value="" name="num" id="num">
                            <hr>
                            <label>得分</label>
                                <input type="text" class="form-control " value="" name="grade" id="grade">
                            <hr>
                            <button type="button" onclick="get()"  class="btn btn-primary">
                                试卷评测
                            </button>
                        </div>

                        <div class="modal-footer">
                            <button type="" class="btn btn-primary">
                                提交
                            </button>
                        </div>
                    </div><!-- /.modal-content -->
                </form>
            </div><!-- /.modal -->
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
        var i = 0;
        var ansewr = new Array(<%=i-1%>).fill("未提交");
        var items = new Array(<%=i%>).fill(0);
        function worknum(index,e) {
            if (items[index] === 0) {
                i++;
                items[index] = 1;
                ansewr[index-1] = e;
            } else {

            }
            document.getElementById("work1").innerHTML = i;
        }

        var tr = document.getElementById("answers");
        var tr2 = document.getElementById("answerx");
        var flag = false;
        var answerTrue = 0;
        function get()
        {
            answerTrue = 0;
            if(!flag){
                for(var o in ansewr){
                    tr.insertCell();
                    if(ansewr[o]!=undefined){
                        tr.cells[o].appendChild(document.createTextNode(ansewr[o]));
                    }
                    else {
                        tr.cells[o].appendChild(document.createTextNode("未提交"));
                    }
                }
                flag = true;
            }

            for(var i=0;i<tr2.children.length;i++){
                if(tr.children[i].innerText.trim()===tr2.children[i].innerText.trim()){
                    tr.children[i].style.color='green';
                    answerTrue++;
                }
                else {
                    tr.children[i].style.color='red';
                }
            }
            document.getElementById('grade').value =Math.floor(answerTrue*100/(tr2.children.length));
            document.getElementById('num').value = answerTrue ;
        }
        function startTime(){
            var today=new Date();
            var h=today.getHours();
            var m=today.getMinutes();
            var s=today.getSeconds();// 在小于10的数字前加一个‘0’
            m=checkTime(m);
            s=checkTime(s);
            document.getElementById('txt').innerHTML=h+":"+m+":"+s;
            t=setTimeout(function(){startTime()},500);
        }
        function checkTime(i){
            if (i<10){
                i="0" + i;
            }
            return i;
        }
        startTime();
    </script>
</body>

</html>
