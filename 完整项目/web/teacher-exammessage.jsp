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
                <h4 class="page-title"><span><i class="glyphicon glyphicon-info-sign"></i></span>&nbsp;试题管理</h4>
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
                                                            </thead>
                                                            <tbody>
                                                            </tbody>
                                                        </table>
                                                </div>
                                                <div class="table-responsive">
                                                        <table class="table table-border">
                                                            <caption><span><i class="fa fa-chevron-circle-down"></i></span>&nbsp;判断题信息</caption>
                                                            <thead class="success">
                                                            </thead>
                                                            <tbody>
                                                            </tbody>
                                                        </table>
                                                </div>
                                                <div class="table-responsive">
                                                        <table class="table table-border">
                                                            <caption><span><i class="fa fa-chevron-circle-down"></i></span>&nbsp;应用题信息</caption>
                                                            <thead class="success">
                                                            </thead>
                                                            <tbody>
                                                            </tbody>
                                                        </table>
                                                </div>
                                        </div>
                                        <div class="tab-pane fade" id="e1">
                                                <div class="table-responsive">
                                                        <table class="table table-border">
                                                            <thead class="table_text">
                                                                <tr>
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
                                                                <tr>
                                                                    <td>餐哦按时吃</td>
                                                                    <td>叛逆</td>
                                                                    <td>法军</td>
                                                                    <td>阿尼</td>
                                                                    <td>阿丹</td>
                                                                    <td>A</td>
                                                                    <td>
                                                                        <button class="btn btn-primary"  data-toggle="modal" data-target="#a1">
                                                                            <span><i class="fa fa-search"></i>&nbsp;详细信息</span>
                                                                        </button>
                                                                    </td>
                                                                   <td>
                                                                        <button class="btn btn-danger"  data-toggle="modal" data-target="#a2">
                                                                            <span><i class="glyphicon glyphicon-remove-sign"></i>&nbsp;删除</span>
                                                                        </button>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                        <td>玻尿酸地</td>
                                                                        <td>发挥</td>
                                                                        <td>班的积分</td>
                                                                        <td>发送到莫</td>
                                                                        <td>am是大V哦</td>
                                                                        <td>D</td>
                                                                        <td>
                                                                            <button class="btn btn-primary"  data-toggle="modal" data-target="#a1">
                                                                                <span><i class="fa fa-search"></i>&nbsp;详细信息</span>
                                                                            </button>
                                                                        </td>
                                                                       <td>
                                                                            <button class="btn btn-danger"  data-toggle="modal" data-target="#a2">
                                                                                <span><i class="glyphicon glyphicon-remove-sign"></i>&nbsp;删除</span>
                                                                            </button>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                            <td>
                                                                                <button class="btn btn-primary"  data-toggle="modal" data-target="#a1">
                                                                                    <span><i class="glyphicon glyphicon-plus-sign"></i>&nbsp;添加题目</span>
                                                                                </button>
                                                                            </td>                                                                             
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
                                                                    <th>题目信息</th>
                                                                    <th>选项1</th>
                                                                    <th>选项2</th>
                                                                    <th>答案</th>
                                                                    <th>查看</th>
                                                                    <th>删除</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody class="list_text">
                                                                <tr>
                                                                    <td>你是个人？</td>
                                                                    <td>是</td>
                                                                    <td>不是</td>
                                                                    <td>2</td>
                                                                    <td>
                                                                        <button class="btn btn-primary pd"  data-toggle="modal" data-target="#a3">
                                                                            <span><i class="fa fa-search"></i>&nbsp;详细信息</span>
                                                                        </button>
                                                                    </td>
                                                                   <td>
                                                                        <button class="btn btn-danger"  data-toggle="modal" data-target="#a2">
                                                                            <span><i class="glyphicon glyphicon-remove-sign"></i>&nbsp;删除</span>
                                                                        </button>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                        <td>啊啊啊啊</td>
                                                                        <td>是</td>
                                                                        <td>不是</td>
                                                                        <td>2</td>
                                                                        <td>
                                                                            <button class="btn btn-primary pd"  data-toggle="modal" data-target="#a3">
                                                                                <span><i class="fa fa-search"></i>&nbsp;详细信息</span>
                                                                            </button>
                                                                        </td>
                                                                       <td>
                                                                            <button class="btn btn-danger"  data-toggle="modal" data-target="#a2">
                                                                                <span><i class="glyphicon glyphicon-remove-sign"></i>&nbsp;删除</span>
                                                                            </button>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                            <td>
                                                                                <button class="btn btn-primary pd"  data-toggle="modal" data-target="#a3">
                                                                                    <span><i class="glyphicon glyphicon-plus-sign"></i>&nbsp;添加题目</span>
                                                                                </button>
                                                                            </td>                                                                             
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
                                                                    <th>题目信息</th>
                                                                    <th>选项1</th>
                                                                    <th>选项2</th>
                                                                    <th>答案</th>
                                                                    <th>查看</th>
                                                                    <th>删除</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody class="list_text">
                                                                <tr>
                                                                    <td>你是个人？</td>
                                                                    <td>是</td>
                                                                    <td>不是</td>
                                                                    <td>2</td>
                                                                    <td>
                                                                        <button class="btn btn-primary pd"  data-toggle="modal" data-target="#a3">
                                                                            <span><i class="fa fa-search"></i>&nbsp;详细信息</span>
                                                                        </button>
                                                                    </td>
                                                                   <td>
                                                                        <button class="btn btn-danger"  data-toggle="modal" data-target="#a2">
                                                                            <span><i class="glyphicon glyphicon-remove-sign"></i>&nbsp;删除</span>
                                                                        </button>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                        <td>啊啊啊啊</td>
                                                                        <td>是</td>
                                                                        <td>不是</td>
                                                                        <td>2</td>
                                                                        <td>
                                                                            <button class="btn btn-primary pd"  data-toggle="modal" data-target="#a3">
                                                                                <span><i class="fa fa-search"></i>&nbsp;详细信息</span>
                                                                            </button>
                                                                        </td>
                                                                       <td>
                                                                            <button class="btn btn-danger"  data-toggle="modal" data-target="#a2">
                                                                                <span><i class="glyphicon glyphicon-remove-sign"></i>&nbsp;删除</span>
                                                                            </button>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                            <td>
                                                                                <button class="btn btn-primary yy"  data-toggle="modal" data-target="#a3">
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
                                                                            <th>题目信息</th>
                                                                            <th>答案/备注</th>
                                                                            <th>查看</th>
                                                                            <th>删除</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody class="list_text">
                                                                        <tr>
                                                                            <td>你是个人ldmld杀的面庞啊，s阿萨德MVP大三MVP哦AV是打磨奥普表示到AVAV？</td>
                                                                            <td>参考啊</td>
                                                                            <td>
                                                                                <button class="btn btn-primary yy"  data-toggle="modal" data-target="#a4">
                                                                                    <span><i class="fa fa-search"></i>&nbsp;详细信息</span>
                                                                                </button>
                                                                            </td>
                                                                           <td>
                                                                                <button class="btn btn-danger"  data-toggle="modal" data-target="#a2">
                                                                                    <span><i class="glyphicon glyphicon-remove-sign"></i>&nbsp;删除</span>
                                                                                </button>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</td>
                                                                                <td>是SB</td>
                                                                                <td>
                                                                                    <button class="btn btn-primary yy"  data-toggle="modal" data-target="#a4">
                                                                                        <span><i class="fa fa-search"></i>&nbsp;详细信息</span>
                                                                                    </button>
                                                                                </td>
                                                                               <td>
                                                                                    <button class="btn btn-danger"  data-toggle="modal" data-target="#a2">
                                                                                        <span><i class="glyphicon glyphicon-remove-sign"></i>&nbsp;删除</span>
                                                                                    </button>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <button class="btn btn-primary yy"  data-toggle="modal" data-target="#a4">
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
                    <form class="form-horizontal" role="form">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            <span><i  class="glyphicon glyphicon-comment"></i></span>&nbsp;&nbsp;选项详情
                        </h4>
                    </div>
                    <div class="modal-body">
                       
                            <label><span><i class="fa fa-calendar-o"></i></span>&nbsp;题目信息</label>
                            <textarea class="form-control tabinfor" rows="10" cols="50"></textarea>
                               
                            <span><i class="glyphicon glyphicon-stats"></i>&nbsp;选项信息</span><hr> 
                            <label>选项数量</label>
                            <select  class="form-control">
                                    <option>4</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                            </select>
                            <label>选项A</label>
                            <input type="text"  class="form-control tabinfor">
                            <label>选项B</label>
                            <input type="text"  class="form-control tabinfor">
                            <label>选项C</label>
                            <input type="text"  class="form-control tabinfor">
                            <label>选项D</label>
                            <input type="text"  class="form-control tabinfor">
                            <label>选项E</label>
                            <input type="text"  class="form-control">
                            <hr>
                            <label><span><i class="fa fa-info "></i></span>&nbsp;题目答案</label>
                            <hr>
                            <input type="text"  class="form-control tabinfor">
                        
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
                        <form class="form-horizontal" role="form">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" id="myModalLabel">
                                <span><i  class="glyphicon glyphicon-comment"></i></span>&nbsp;&nbsp;选项详情
                            </h4>
                        </div>
                        <div class="modal-body">
                           
                                <label><span><i class="fa fa-calendar-o"></i></span>&nbsp;题目信息</label>
                                <textarea class="form-control tabinfor2" rows="10" cols="50"></textarea>
                                   
                                <span><i class="glyphicon glyphicon-stats"></i>&nbsp;选项信息</span><hr> 
                                <label>选项1</label>
                                <input type="text"  class="form-control tabinfor2">
                                <label>选项2</label>
                                <input type="text"  class="form-control tabinfor2">
                                <hr>
                                <label><span><i class="fa fa-info "></i></span>&nbsp;题目答案</label>
                                <hr>
                                <input type="text"  class="form-control tabinfor2">
                            
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
                            <form class="form-horizontal" role="form">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title" id="myModalLabel">
                                    <span><i  class="glyphicon glyphicon-comment"></i></span>&nbsp;&nbsp;选项详情
                                </h4>
                            </div>
                            <div class="modal-body">
                               
                                    <label><span><i class="fa fa-calendar-o"></i></span>&nbsp;题目信息</label>
                                    <textarea class="form-control tabinfor3" rows="10" cols="50"></textarea>
                                    
                                    <hr>
                                    <label><span><i class="fa fa-info "></i></span>&nbsp;题目答案及备注</label>
                                    <hr>
                                    <input type="text"  class="form-control tabinfor3">
                                
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
                                <form class="form-horizontal" role="form">
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
    <script src="assets/js/exam.js"></script>
</body>

</html>
