<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>首页</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="assets/js/login.js"></script>
    <link rel="stylesheet" href="assets/css/login2.css">
    <link rel="stylesheet" href="assets/css/index.css">
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
</head>
<body>
<div class="bg">
    <div id="big_box">
        <!-- 登陆注册按钮 -->
        <div class="container" id="options">
            <!-- <div class="row"> -->
            <div class="col-md-4 col-md-offset-9" id="choose">
                <div class="col-md-6 b-btn a-btn" id="login">
                    <span>登陆</span>
                </div>
                <div class="col-md-6 b-btn a-btn" id="register">
                    <span>注册</span>
                </div>
            </div>
        </div>

    </div>
    <div class="container" id="title">
        <img src="assets/images/title-border.png" >
        <!-- <img src="img/title.png" alt="一站式作业服务平台" id="title-word">
        <img src="img/border.png" id="title-border"> -->
    </div>
    <!-- 登陆 -->
    <div class="container" id="box_login">
        <a href="#" class="close" data-dismiss="alert" id="close_login">
            &times;
        </a>
        <form role="form" class="form-horizontal form_login" action="loginServlet" method="get">
            <div class="col-md-4 col-md-offset-4">
                <h1 id="title_welcome">Welcome</h1>
            </div>
            <div class="form-group">
                <div class="col-md-offset-3 col-md-6">

                </div>
            </div>
            <div class="form-group">
                <div class="input-user">
                    <input type="text" placeholder="用户名" class="form-control input_username" name="id">
                </div>
            </div>
            <div class="form-group">
                <div>
                    <input type="password" placeholder="密码" class="form-control input_pw" name="pw">
                </div>
            </div>
            <div class="form-group">
                <div>
                    <button type="submit" class="btn btn-default btn_login"  data-toggle="modal" data-target="#myModal" >Login</button>
                </div>
            </div>
        </form>
    </div>
    <!-- 注册 -->
    <div class="container" id="box_reg">
        <a href="#" class="close" data-dismiss="alert" id="close_reg">
            &times;
        </a>
        <form role="form" class="form-horizontal form_login" method="post" action="registerServlet">
            <div class="col-md-4 col-md-offset-4">
                <h1 id="title_register">Register</h1>
            </div>
            <div class="form-group">
                <div class="col-md-offset-3 col-md-6">
                    <div class="radio option-stu-tea">
                        <label class="radio-inline lab_stu">
                             <input type="radio" value="Student" name="iden" >学生
                        </label>
                        <label class="radio-inline lab_tea">
                            <input type="radio" value="Teacher" name="iden" >教师
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="input-user">
                    <input type="text" placeholder="姓名" class="form-control input_username" name="rename">
                </div>
            </div>

            <div class="form-group">
                <div>
                    <input type="text" placeholder="账户" class="form-control input_username" name="reid">
                </div>
            </div>
            <div class="form-group">
                <div>
                    <input type="password" placeholder="密码" class="form-control input_pw" name="repw">
                </div>
            </div>
            <div class="form-group">
                <div>
                    <button type="submit" class="btn btn-dafault btn_reg">Register</button>
                </div>
            </div>
        </form>
    </div>
</div>
</div>
<!-- 背景气泡 -->
<ul class="bg-bubbles">
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
</ul>
    <!-- 弹出框 -->
    <%
        if(application.getAttribute("flag")==null){
            application.setAttribute("flag","hidden");
        }

    %>
    <div class="mode" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false"
         style="z-index: 999999;position: fixed;left:35%;top: 0px;visibility: ${flag} ">
        <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="clo()">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            提示信息
                        </h4>
                    </div>
                    <div class="modal-body" style="color: red;">
                       <h3> ${message}</h3>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clo()">确认</button>
                    </div>
                </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

</body>
<script>
    function clo() {
        document.getElementById("myModal").style.visibility="hidden";
    }
    <%
    application.removeAttribute("message");
    application.removeAttribute("flag");
    %>
    $(document).ready(function(){

        var win_height = $(window).innerHeight();
        $(".bg").css({"height":win_height});


        $('#login').click(function(){
            $('#box_login').fadeIn(1500);
            $('#box_reg').css('display','none');
            $('#title').css('display','none');
            $('.icon_stu').attr('src', 'img/stu1.png');
            $('.icon_tea').attr('src', 'img/tea1.png');
            $('.bg-bubbles').css('display','block');
        })
        $('#register').click(function(){
            $('#box_reg').fadeIn(1500);
            $('#box_login').css('display','none');
            $('#title').css('display','none');
            $('.icon_stu').attr('src', 'img/stu1.png');
            $('.icon_tea').attr('src', 'img/tea1.png');
            $('.bg-bubbles').css('display','block');
        })
        $('#close_login').click(function(){
            $('#box_login').css('display','none');
            $('#title').css('display','block');
            $('.icon_stu').attr('src', 'img/stu1.png');
            $('.icon_tea').attr('src', 'img/tea1.png');
            $('.bg-bubbles').css('display','none');
        })
        $('#close_reg').click(function(){
            $('#box_reg').css('display','none');
            $('#title').css('display','block');
            $('.icon_stu').attr('src', 'img/stu1.png');
            $('.icon_tea').attr('src', 'img/tea1.png');
            $('.bg-bubbles').css('display','none');
        })

        var image=new Array(4);
        var n;
        image[1]="assets/images/bg4.png";
        image[2]="assets/images/bg2.jpg";
        image[3]="assets/images/bg.jpg";
        $(".bg").css({"background-image":"url("+image[1]+")"})
    })
</script>
</html>