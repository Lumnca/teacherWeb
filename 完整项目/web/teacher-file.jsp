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
    <style>
    span > a{
        font-size: 2em;
    }
    .fa-caret-right,.fa-folder,.op,.fp,.fa-file-text-o,.fa-folder-open,.fa-caret-down{
       font-size: 2em;
    }
    
    </style>
</head>

<body class="sticky-header">


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
                            刘某人
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                                <li> <a href="#"> <i class="fa fa-wrench"></i> 设置 </a> </li>
                                <li> <a href="#"> <i class="fa fa-user"></i> 个人 </a> </li>
                                <li> <a href="#"> <i class="fa fa-info"></i> 帮助 </a> </li>
                                <li> <a href="#"> <i class="fa fa-sign-out"></i> 退出 </a> </li>
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
                <h4 class="page-title"><span><i class="fa fa-clipboard"></i></span>&nbsp;资料分享</h4>
                <ol class="breadcrumb">
                    <li>
                        <a href="teacher-index.jsp">教师</a>
                    </li>
                    
                    <li class="active">
                        刘某人
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
                            <div class="white-box tableinfor">
                                <div >
                                    <h3><span><i class="fa fa-file"></i></span>&nbsp;文件分享</h3>
                                    <hr>

                                    <div>
                                        <span><i class="fa fa-caret-right fb" flag="false"></i></span>
                                        <span><i class="fa fa-folder ob"></i></span>
                                        <span><a href="#file" data-toggle="collapse" onclick="changeicon(0)">前端开发</a></span>
                                    </div>

                                    <div id="file" class="collapse">
                                        <!--Html/css-->
                                        <div class="container">
                                                <span><i class="fa fa-caret-right fx" flag="false"></i></span>
                                                <span><i class="fa fa-folder op"></i></span>
                                                <span><a href="#htmlfile" data-toggle="collapse" onclick="changeicons(0)">Html/Css</a></span>
                                        </div>
                                        <div id="htmlfile" class="collapse">
                                            <div class="container">
                                                <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                <span><i class="fa  fa-file-text-o" id="f"></i></span>
                                                <span><a href="#">Html参考手册</a></span>
                                            </div>
                                        </div>
                                        <!--HtmlEnd-->

                                        <!--JavaScript-->
                                        <div class="container">
                                                <span><i class="fa fa-caret-right fx" flag="false"></i></span>
                                                <span><i class="fa fa-folder op"></i></span>
                                                <span><a href="#jsfile" data-toggle="collapse" onclick=" changeicons(1)">JavaScript</a></span>
                                        </div>
                                        <div id="jsfile" class="collapse">
                                                <div class="container">
                                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                    <span><i class="fa  fa-file-text-o"></i></span>
                                                    <span><a href="#">JavaScript参考手册</a></span>
                                                </div>
                                        </div> 
                                        <!--JavaScriptEnd-->                      
                                        <div class="container">
                                                <span><i class="fa fa-caret-right fx" flag="false"></i></span>
                                                <span><i class="fa fa-folder op" id="o"></i></span>
                                                <span><a href="#other" data-toggle="collapse" onclick=" changeicons(2)">样式处理</a></span>
                                        </div>
                                        <div id="other" class="collapse">
                                                <div class="container">
                                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                    <span><i class="fa  fa-file-text-o"></i></span>
                                                    <span><a href="#">Sass参考手册</a></span>
                                                </div>
                                        </div> 
                                    </div>

                    <!--2  -->
                                    <div>
                                        <span><i class="fa fa-caret-right fb" flag="false"></i></span>
                                        <span><i class="fa fa-folder ob"></i></span>
                                        <span><a href="#file1" data-toggle="collapse" onclick="changeicon(1)"  flag="false">后端开发</a></span>
                                    </div>
                                    <div id="file1" class="collapse">
                                        <!--C#-->
                                        <div class="container">
                                                <span><i class="fa fa-caret-right fx" flag="false"></i></span>
                                                <span><i class="fa fa-folder op"></i></span>
                                                <span><a href="#aspfile" data-toggle="collapse" onclick="changeicons(3)">C# ASP.NET</a></span>
                                        </div>
                                        <div id="aspfile" class="collapse">
                                            <div class="container">
                                                <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                <span><i class="fa  fa-file-text-o" id="f"></i></span>
                                                <span><a href="#">C#高级程序设计</a></span>
                                            </div>
                                        </div>
                                        <!--End-->
                
                                        <!--jsp-->
                                        <div class="container">
                                                <span><i class="fa fa-caret-right fx" flag="false"></i></span>
                                                <span><i class="fa fa-folder op"></i></span>
                                                <span><a href="#javafile" data-toggle="collapse" onclick=" changeicons(4)">Java Web</a></span>
                                        </div>
                                        <div id="javafile" class="collapse">
                                                <div class="container">
                                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                    <span><i class="fa  fa-file-text-o"></i></span>
                                                    <span><a href="#">Java高级程序设计</a></span>
                                                </div>
                                        </div> 
                                        <!--数据库-->                      
                                        <div class="container">
                                                <span><i class="fa fa-caret-right fx" flag="false"></i></span>
                                                <span><i class="fa fa-folder op" id="o"></i></span>
                                                <span><a href="#database" data-toggle="collapse" onclick=" changeicons(5)">数据库</a></span>
                                        </div>
                                        <div id="database" class="collapse">
                                                <div class="container">
                                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                    <span><i class="fa  fa-file-text-o"></i></span>
                                                    <span><a href="#">Mysql</a></span>
                                                </div>
                                        </div> 
                                    </div>


                                    <div>
                                        <span><i class="fa fa-caret-right fb" flag="false"></i></span>
                                        <span><i class="fa fa-folder ob"></i></span>
                                        <span><a href="#file2" data-toggle="collapse" onclick="changeicon(2)"  flag="false">程序设计</a></span>
                                    </div>
                                    <div id="file2" class="collapse">
                                        
                                        <div class="container">
                                                <span><i class="fa fa-caret-right fx" flag="false"></i></span>
                                                <span><i class="fa fa-folder op"></i></span>
                                                <span><a href="#cfile" data-toggle="collapse" onclick="changeicons(6)">C++</a></span>
                                        </div>
                                        <div id="cfile" class="collapse">
                                            <div class="container">
                                                <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                <span><i class="fa  fa-file-text-o" id="f"></i></span>
                                                <span><a href="#">C++入门与精通</a></span>
                                            </div>
                                        </div>             
                                    
                                        <div class="container">
                                                <span><i class="fa fa-caret-right fx" flag="false"></i></span>
                                                <span><i class="fa fa-folder op"></i></span>
                                                <span><a href="#unityfile" data-toggle="collapse" onclick=" changeicons(7)">Unity</a></span>
                                        </div>
                                        <div id="unityfile" class="collapse">
                                                <div class="container">
                                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                    <span><i class="fa  fa-file-text-o"></i></span>
                                                    <span><a href="#">Unity手册</a></span>
                                                </div>
                                        </div> 
                                                            
                                        <div class="container">
                                                <span><i class="fa fa-caret-right fx" flag="false"></i></span>
                                                <span><i class="fa fa-folder op" id="o"></i></span>
                                                <span><a href="#layair" data-toggle="collapse" onclick=" changeicons(8)">LayAir</a></span>
                                        </div>
                                        <div id="layair" class="collapse">
                                                <div class="container">
                                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                    <span><i class="fa  fa-file-text-o"></i></span>
                                                    <span><a href="#">LayAir开发</a></span>
                                                </div>
                                        </div> 
                                    
                                    </div>
                                </div>             
			                </div>                                
                        </div>
                    
                        
 

                     <div class="col-md-6">
                         <div class="white-box tableinfor">

                                <h3><span style="columns: #1b9954;"><i class="glyphicon glyphicon-cloud"></i>&nbsp;网址分享</span></h3><hr>
                                <div>
                                        <div class="card-header">
                                            <a href="#collapseThree" class="card-link" data-toggle="collapse" >
                                                <h4><span class=" fa  fa-folder-o"></span>前端</h4>
                                            </a>
                                            
                                        </div>
                                        <div id="collapseThree" class="collapse">
                                            <div class="card-body" style="text-align:center;">
                                                    <div class="list-group">
                                                        <a href="http://caibaojian.com/30-seconds-of-css/#box-sizing-reset" class="list-group-item list-group-item-success">
                                                            <span class="fa fa-chain (alias)"></span>30秒 Css 中文版
                                                        </a>
                                                        <a href="http://tool.oschina.net/commons?type=2" class="list-group-item list-group-item-success">
                                                            <span class="fa fa-chain (alias)"></span>Html转义表
                                                        </a>
                                                        <a href="http://phpstudy.php.cn/css3/" class="list-group-item list-group-item-success">
                                                            <span class="fa fa-chain (alias)"></span>Css参考手册
                                                        </a>
                                                        <a href="https://cn.vuejs.org/v2/guide/instance.html" class="list-group-item list-group-item-success">
                                                            <span class="fa fa-chain (alias)"></span>Vue实例
                                                        </a>
                                                        <a href="http://echarts.baidu.com/" class="list-group-item list-group-item-success">
                                                            <span class="fa fa-chain (alias)"></span>ECharts
                                                        </a>
                                                        <a href="https://www.sass.hk/docs/" class="list-group-item list-group-item-success">
                                                            <span class="fa fa-chain (alias)"></span>Sass
                                                        </a>
                                                        <a href="http://es6.ruanyifeng.com/" class="list-group-item list-group-item-success">
                                                            <span class="fa fa-chain (alias)"></span>ECMAScript6
                                                        </a>
                                                    </div>								
                                            </div>
                                        </div>
                                        <!---------------------->
                                        <br>
                                        <div class="card-header">
                                                <a href="#collapse" class="card-link" data-toggle="collapse" >
                                                    <h4><span class=" fa  fa-folder-o"></span>C#.NET</h4>
                                                </a>
                                                
                                        </div>
                                        <div id="collapse" class="collapse">
                                                <div class="card-body" style="text-align:center;">
                                                        <div class="list-group">
                                                            <a href="http://www.jinxuliang.com/course2/CoursePortal/Details/543b979c137e481e6cbdb267" class="list-group-item list-group-item-info">
                                                                <span class="fa fa-chain (alias)"></span>C#金老师自学网站
                                                            </a>
                                                            <a href="https://www.bilibili.com/video/av5484437/?spm_id_from=333.788.videocard.16" class="list-group-item list-group-item-info">
                                                                <span class="fa fa-chain (alias)"></span>B站C#初级教程
                                                            </a>
                                                            <a href="https://www.bilibili.com/video/av25177810?from=search&seid=9142339030764875482" class="list-group-item list-group-item-info">
                                                                <span class="fa fa-chain (alias)"></span>B站C#中级教程
                                                            </a>
                                                            <a href="https://www.bilibili.com/video/av25178653?from=search&seid=10343125122979058460" class="list-group-item list-group-item-info">
                                                                <span class="fa fa-chain (alias)"></span>B站C#高级教程
                                                            </a>
                                                            <a href="https://www.bilibili.com/video/av36820642?from=search&seid=13955252104189483036" class="list-group-item list-group-item-info">
                                                                <span class="fa fa-chain (alias)"></span>ASP .NET Core 2.1基础教程
                                                            </a>
                                                            <a href="https://www.bilibili.com/video/av38392956" class="list-group-item list-group-item-info">
                                                                <span class="fa fa-chain (alias)"></span>ASP .NET Core MVC 2.x中级教程
                                                            </a>
                                                        </div>								
                                                </div>
                                        </div>
                                        <br>
                                        <div class="card-header">
                                                <a href="#collapse1" class="card-link" data-toggle="collapse" >
                                                    <h4><span class=" fa  fa-folder-o"></span>Linux</h4>
                                                </a>
                                                
                                        </div>
                                        <div id="collapse1" class="collapse">
                                            <div class="card-body" style="text-align:center;">
                                                    <div class="list-group">
                                                        
                                                        <a href="http://edu.51cto.com/course/10867.html?tdsourcetag=s_pctim_aiomsg" class="list-group-item list-group-item-dark">
                                                            <span class="fa fa-chain (alias)"></span>Centos7入门到精通
                                                        </a>
                                                        <a href="http://edu.51cto.com/course/13354.html?ADUIN=724119519&ADSESSION=1534209464&ADTAG=CLIENT.QQ.5579_.0&ADPUBNO=26833" class="list-group-item list-group-item-dark">
                                                            <span class="fa fa-chain (alias)"></span>Linux防火墙
                                                        </a>
                
                                                    </div>								
                                            </div>
                                        </div>
                                    </div>
                    
                            </div>	





                         </div>
                     </div><!-- /col-md-6-->


            



                     <div class="col-md-12">
                        <div class="white-box">

                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><span><i class="fa fa-cloud-upload"></i></span>分享文件</h3>
                                </div>
                                <div class="panel-body">
                                        <div class="container">
                                                <form class="form-horizontal">
                                                     <div class="form-group">
                                                            <label class="sr-only" for="inputfile">文件输入</label>
                                                            <input type="file" class="btn btn-primary btn-lg" >
                                                     </div>
                            
                                                     <div  class="form-group">
                                                            <button type="submit" class="btn btn-primary btn-lg">
                                                                <span><i class="glyphicon glyphicon-open-file"></i></span>&nbsp;提交
                                                            </button>
                                                     </div>
                                                </form> 
                                        </div>  
                                </div>
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


function changeicon(i){
    var icon1 = document.getElementsByClassName("fb")[i];
    var icon2 = document.getElementsByClassName("ob")[i];

    var classValue = icon1.getAttribute("class");
    var classValue2 = icon2.getAttribute("class");

    var fflag = icon1.getAttribute("flag");


    if(icon1.getAttribute("flag")=="false"){
   
        classValue = classValue.replace("fa-caret-right","fa-caret-down");
        icon1.setAttribute("class",classValue);
        classValue2 = classValue2.replace("fa-folder","fa-folder-open");
        icon2.setAttribute("class",classValue2)

        fflag = fflag.replace("false","true");
        icon1.setAttribute("flag",fflag);
    }
    else{
        classValue = classValue.replace("fa-caret-down","fa-caret-right");
        icon1.setAttribute("class",classValue);
        classValue2 = classValue2.replace("fa-folder-open","fa-folder");
        icon2.setAttribute("class",classValue2)

        fflag = fflag.replace("true","false");
        icon1.setAttribute("flag",fflag);
    }
}


function changeicons(i){
    var icon1 = document.getElementsByClassName("fx")[i];
    var icon2 = document.getElementsByClassName("op")[i];

    var classValue = icon1.getAttribute("class");
    var classValue2 = icon2.getAttribute("class");

    var fflag = icon1.getAttribute("flag");


    if(icon1.getAttribute("flag")=="false"){
   
        classValue = classValue.replace("fa-caret-right","fa-caret-down");
        icon1.setAttribute("class",classValue);
        classValue2 = classValue2.replace("fa-folder","fa-folder-open");
        icon2.setAttribute("class",classValue2)

        fflag = fflag.replace("false","true");
        icon1.setAttribute("flag",fflag);
    }
    else{
        classValue = classValue.replace("fa-caret-down","fa-caret-right");
        icon1.setAttribute("class",classValue);
        classValue2 = classValue2.replace("fa-folder-open","fa-folder");
        icon2.setAttribute("class",classValue2)

        fflag = fflag.replace("true","false");
        icon1.setAttribute("flag",fflag);
    }
}

    </script>
</body>

</html>
