<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="userInfor.User" %>
<%@ page import="userInfor.teacherData" %>
<%@ page import="userInfor.TeacherCur" %>
<%@ page import="mysql.GetDb" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.alibaba.fastjson.*" %>
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
  <title>Home</title>
    <link href="assets/plugins/morris-chart/morris.css" rel="stylesheet">
    <link href="assets/css/icons.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
    <script src="assets/js/echarts.js"></script>
</head>

<body class="sticky-header">
<%
    User user = (User) session.getAttribute("user");
    teacherData tea_data =  (teacherData)user.data;

    GetDb db = new GetDb();
    try {
        PreparedStatement ps = db.conn.prepareStatement("select cname,tea_course.cno,count(stu_course.id) from stu_course right outer join tea_course  on stu_course.cno=tea_course.cno  group by cno having cno in (select cno from tea_course where  tea_course.id = ?)");
        ps.setString(1,user.ID);
        ResultSet rs = ps.executeQuery();
        int[] nums = new int[tea_data.classNum];
        String[] cnames = new String[tea_data.classNum];
        int i = 0;
        while (rs.next()){
            cnames[i] = rs.getString(1);
            nums[i] = rs.getInt(3);
            i++;
        }
        rs.close();
        ps.close();
        String curNums = JSON.toJSONString(nums,SerializerFeature.BeanToArray);
        System.out.println(curNums);
        String curName= JSON.toJSONString(cnames,SerializerFeature.BeanToArray);
        System.out.println(curName);
        application.setAttribute("curName",curName);
        application.setAttribute("curNums",curNums);

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
                 <!--End row-->
           
                  <!--Start row-->
                  <div class="row">
                   <!--Start info box-->
                   <div class="col-md-3 col-sm-6">
                       <div class="info-box-main">
                          <div class="info-stats">
                              <p> <span><small class="fa fa-user"> </small> 教师ID </span></p>
                              <span><%=user.ID%></span>
                          </div>
                       </div>
                   </div>
                   <!--End info box-->
                   
                   <!--Start info box-->
                   <div class="col-md-3 col-sm-6">
                       <div class="info-box-main">
                          <div class="info-stats">
                              <p> <span><i class="fa fa-th"> </i> 课程数 </span>  </p>
                              <span><%=tea_data.classNum%></span>
                          </div>
                       </div>
                   </div>
                   <!--End info box-->
                
                   <!--Start info box-->
                   <div class="col-md-3 col-sm-6">
                       <div class="info-box-main">
                          <div class="info-stats">
                              <p> <span><i class="fa-users fa"></i> 课程学生 </span></p>
                              <span><%=tea_data.stuNum%></span>
                          </div>
                       </div>
                   </div>
                   <!--End info box-->
                
                   <!--Start info box-->
                   <div class="col-md-3 col-sm-6">
                       <div class="info-box-main">
                          <div class="info-stats">
                              <p><span><i class="fa fa-thumbs-o-up"></i></span> 好评数 </p>
                              <span><%=tea_data.good%></span>
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
                            课程进度:
                                <div class="progress progress-striped active" style="height:25px">
                                    <div class="progress-bar progress-bar-primary" role="progressbar"
                                        aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                                        style="width: 40%;  display: grid;justify-content: center; align-items: center;">40%
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
       var curName = JSON.parse('${curName}');
       var curNums = JSON.parse('${curNums}');

       var infor = [];
       for(var i=0;i<curName.length;i++){
           var o = {value:curNums[i], name:curName[i]}
           infor[i] = o;
       }

       var table1 = echarts.init(document.getElementsByClassName("tableinfor")[0]);
       var table2 = echarts.init(document.getElementsByClassName("tableinfor")[1]);

       var  option1 = {
            color: ['#3398DB'],
            title :{
                text : "课程人数"
            },
            legend: {
                left: 'center',
                data : ['人数']
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
                    data : curName,
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
                    name:'课程人数',
                    type:'bar',
                    barWidth: '60%',
                    data:curNums
                }
            ]
        };
        
        var option2 = {
            title : {
                text: '课程学生分布',
                subtext: '学生占比',
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
                    data:infor,
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
<%
    application.removeAttribute("curName");
    application.removeAttribute("curNums");
%>
</body>

</html>
