<%--
    Document   : index
    Created on : Jun 10, 2019, 8:02:28 PM
    Author     : EKPES
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Science Education</title>
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
    <body class="hold-transition login-page">
        <div class="login-box">
            <div class="login-logo">
                <a href="home"><img src="images/newLogo4.png" class="img-responsive center-block" height="350" width="350" alt="User Image"></a>
            </div><!-- /.login-logo -->
            <div class="login-box-body">
                <c:choose>
                    <c:when test="${param.login_role ne null and param.login_role eq 0}">
                        <p class="login-box-msg" style="color: red;">Invalid username and password</p>
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
                        <p class="login-box-msg">Login to start your session</p>
                    </c:otherwise>
                </c:choose>
                <form action="login_role" method="post">

                    <div class="form-group has-feedback">
                        <input type="email" name="email" id="email" class="form-control" placeholder="Email">
                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="password" name="password" class="form-control" placeholder="Password">
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                    <div class="row">
                        <div class="col-xs-8">
                            <div class="checkbox icheck">
                                <label>
                                    <input type="checkbox" name="stayLoggedIn" value="checked"> Remember Me
                                </label>
                            </div>
                        </div><!-- /.col -->
                        <div class="col-xs-4">
                            <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
                        </div><!-- /.col -->
                    </div>
                </form>
                        <a href="emailrequest_form">I forgot my password</a>&nbsp;&nbsp;
                 <a href="student_login">Login as student</a><br>
                 <a href="admin_registration" class="text-center">Register a new lecturer</a>

            </div><!-- /.login-box-body -->
        </div><!-- /.login-box -->

        <!-- jQuery 2.1.4 -->
        <script src="js/jquery.min.js"></script>
        <!-- Bootstrap 3.3.5 -->
        <script src="js/bootstrap.min.js"></script>
        <!-- iCheck -->
        <script src="plugins/iCheck/icheck.min.js"></script>
        <script>
            $(function(){
                $('input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square-blue',
                    increaseArea: '15%' // optional
                });
                
            });
        </script>
    </body>
</html>

