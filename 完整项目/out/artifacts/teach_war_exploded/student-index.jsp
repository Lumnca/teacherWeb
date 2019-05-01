<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="userInfor.User" %>
<%@ page import="userInfor.studentData" %>
<%@ page import="userInfor.StudentCur" %>
<%@ page import="mysql.GetDb" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="userInfor.StuCur" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="com.alibaba.fastjson.serializer.SerializerFeature" %>
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
  <title>学生主页</title>
    <link href="assets/plugins/morris-chart/morris.css" rel="stylesheet">
    <link href="assets/css/icons.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
    <script src="assets/js/echarts.js"></script>
</head>

<body class="sticky-header">
<!--Start left side Menu-->
<%
   User user = (User) session.getAttribute("user");
    studentData stu_data = (studentData)user.data;

%>
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
                <h4 class="page-title"><span><i class="glyphicon glyphicon-home"></i></span>&nbsp;首页</h4>
                <ol class="breadcrumb">
                    <li>
                        <a href="student-index.jsp">学生</a>
                    </li>
                    
                    <li class="active">
                        ${sessionScope.user.name}
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
                 <!--End row-->
           
                  <!--Start row-->
                  <div class="row">
                   <!--Start info box-->
                   <div class="col-md-3 col-sm-6">
                       <div class="info-box-main">
                          <div class="info-stats">
                              <p> <span><small class="fa fa-user"> </small> 学生ID </span></p>
                              <span><%=user.ID%></span>
                          </div>
                       </div>
                   </div>
                   <!--End info box-->
                   
                   <!--Start info box-->
                   <div class="col-md-3 col-sm-6">
                       <div class="info-box-main">
                          <div class="info-stats">
                              <p> <span><i class="fa fa-th"> </i> 参与课程 </span>  </p>
                              <span><%=stu_data.classNum%></span>
                          </div>
                       </div>
                   </div>
                   <!--End info box-->
                
                   <!--Start info box-->
                   <div class="col-md-3 col-sm-6">
                       <div class="info-box-main">
                          <div class="info-stats">
                              <p> <span><i class=" fa-edit (alias) fa"></i> 作业提交 </span></p>
                              <span><%=stu_data.workNum%></span>
                          </div>
                       </div>
                   </div>
                   <!--End info box-->
                
                   <!--Start info box-->
                   <div class="col-md-3 col-sm-6">
                       <div class="info-box-main">
                          <div class="info-stats">
                              <p><span><i class="glyphicon glyphicon-comment"></i> 讨论交流 </span>  </p>
                              <span><%=stu_data.talkNum%></span>
                          </div>
                       </div>
                   </div>
                   <!--End info box-->
                
                  </div>
                  <!--End row-->
                  
                             
                  
                <!--Start row-->  
                <div class="row">
                     <div class="col-md-6">
                         <div class="white-box tableinfor">
                             
                         </div>
                     </div>
                     
                     
                  <div class="col-md-6">
                      <div class="white-box tableinfor">
                      </div>
                  </div><!-- /col-md-6-->
                </div>
                     

                 <!-- End timeline-->  
                       
                    
                     <!-- Start inbox widget-->
                     <div class="col-md-12">
                        <div class="white-box" style="font-size:1.2em;color: #931e97;font-weight: 600;">
                            课程完成进度:
                                <div class="progress progress-striped active" style="height:25px">
                                    <div class="progress-bar progress-bar-primary" role="progressbar"
                                        aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                                        style="width: 20%;  display: grid;justify-content: center; align-items: center;">20%
                                    </div>
                                </div>                                              
                       </div>
					<!-- Start inbox widget-->
                   </div>
                   <!--End row-->
			    </div>
        <!-- End Wrapper-->
        <!--Start  Footer -->
        <footer class="footer-main">联系方式: Tel <span class="fa fa-phone-square"></span> : 1351111233 </footer>	
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


    <!--End Page Level Plugin-->
   <script>
       <% StudentCur sc = (StudentCur)user.cur;
        int i = 0;
        String[] curName = new String[sc.StuList.size()];
        for (StuCur s : sc.StuList ) {
            curName[i] = s.getCname();
            i++;
        }
        String s1 = JSON.toJSONString(curName,SerializerFeature.BeanToArray);

        application.setAttribute("curName",s1);
        application.setAttribute("n",1);


        %>
       var table1 = echarts.init(document.getElementsByClassName("tableinfor")[0]);
       var table2 = echarts.init(document.getElementsByClassName("tableinfor")[1]);

       var curName = JSON.parse('${curName}');
       var infor = [];
       var nums = [];
       for(var i=0;i<curName.length;i++){
           var num = Math.floor(Math.random()*20+5);
           nums[i] = num;
           var o = {
               value: num,
               name : curName[i]
           }
           infor[i] = o;

       }
       var  option1 = {
            color: ['#3398DB'],
            title :{
                text : "功能使用"
            },
            legend: {
                left: 'center',
                data : ['次数']
            },
            tooltip : {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis : [
                {
                    type : 'category',
                    data : curName ,
                    axisTick: {
                        alignWithLabel: true
                    }
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],

            series : [
                {
                    name:'课程',
                    type:'bar',
                    barWidth: '60%',
                    data:nums
                }
            ]
        };
        
        var option2 = {
            title : {
                text: '课程分布',
                subtext: '使用占比',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: curName
            },
            series : [
                {
                    name: '课程数据',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data: infor,
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        
        
        table1.setOption(option1);
        table2.setOption(option2);
   
   </script>

</body>

</html>
