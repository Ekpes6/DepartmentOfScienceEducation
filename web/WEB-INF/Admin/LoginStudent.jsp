<%--
    Document   : LoginStudent
    Created on : Jul 15, 2019, 3:05:17 PM
    Author     : EKPES
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Student Login</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="icon" href="favicon.png" type="image/png">
        <!-- Bootstrap 3.3.5 -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="css/AdminLTE.min.css">
        <!-- iCheck -->
        <link rel="stylesheet" href="plugins/iCheck/square/blue.css">
        <link rel="shortcut icon" type="image/x-icon" href="images/bbc.png">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="hold-transition register-page">
        <div class="register-box">
            <div class="register-logo">
               <a href="home"><img src="images/newLogo4.png" class="img-responsive center-block" height="350" width="350" alt="User Image"></a>
            </div>

            <div class="register-box-body">
                <c:choose>
                    <c:when test="${param.login_role ne null and param.login_role eq 0}">
                        <p class="login-box-msg" style="color: red;">Invalid matric no or pin code</p>
                    </c:when>
                    <c:when test="${param.login_role ne null and param.login_role eq 1}">
                        <p class="login-box-msg" style="color: green;">You have logged out successfully</p>
                    </c:when>
                    <c:when test="${param.login_role ne null and param.login_role eq 3}">
                        <p class="login-box-msg" style="color: orangered;">Your session has expired</p>
                    </c:when>
                    <c:when test="${param.ok eq 1}" >
                        <p class="login-box-msg" style="color: blue;">Your account creation was succesfull. Please Login to continue. </p>
                    </c:when>
                    <c:when test="${error ne null}">
                        <p class="login-box-msg" style="color: #249608; font-size: 20px; ">${error}</p>
                    </c:when>
                    <c:otherwise>
                         <p class="login-box-msg">Student Login</p>
                    </c:otherwise>
                </c:choose>

                <form action="student_login_area" method="post">
                    <div class="form-group has-feedback">
                        <input type="text" id="matric_no" class="form-control" placeholder="Matric No" name="matric_no" required>
                        <span class="glyphicon glyphicon-user form-control-feedback"></span>
                    </div>

                    <div class="form-group has-feedback">
                        <input type="password" class="form-control" placeholder="Pin" id="pin" name="pin" required>
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>


                    <div class="row">

                        <div class="col-xs-4">
                            <button type="submit" class="btn btn-primary btn-block btn-flat">Login</button>
                        </div><!-- /.col -->
                    </div>
                </form>

            </div><!-- /.form-box -->
        </div><!-- /.register-box -->

        <!-- jQuery 2.1.4 -->
        <script src="js/jQuery-2.2.3.min.js"></script>
        <!-- Bootstrap 3.3.5 -->
        <script src="js/bootstrap.min.js"></script>
        <!-- iCheck -->
        <script src="plugins/iCheck/icheck.min.js"></script>
        <script>
            $(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square-blue',
                    increaseArea: '20%' // optional
                });
            });
        </script>
         <!-- #### CUSTOM VALIDATION SCRIPT -->
        <script type="text/javascript">
            window.onload = function(){
                document.getElementById("password").onchange = validatePassword;
                document.getElementById("confirm_password").onchange = validatePassword;
            };
            function validatePassword(){
                var pass2 = document.getElementById("confirm_password").value;
                var pass1 = document.getElementById("password").value;
                if(pass1 !== pass2)
                    document.getElementById("confirm_password").setCustomValidity("Passwords Don't Match");
                else
                    document.getElementById("confirm_password").setCustomValidity('');//empty string means no validation error
            }
        </script>
    </body>
</html>