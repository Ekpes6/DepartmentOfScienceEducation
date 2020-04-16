<%--
    Document   : AdminRegistration
    Created on : Jul 15, 2019, 2:32:31 PM
    Author     : EKPES
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Admin Registration</title>
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
        <link rel="stylesheet" href="css/blue.css">
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

            <div class="register-box-body" style=" overflow-x: hidden; overflow-y: auto; height: 400px;">
                <div >
                    <c:choose>
                        <c:when test="${signupError ne null}">
                            <p class="login-box-msg" style="color: red; font-size: 20px; ">${signupError}</p>
                        </c:when>
                        <c:otherwise>
                            <p class="login-box-msg">Register a new Lecturer</p>
                        </c:otherwise>
                    </c:choose>
                    <form action="registration_page" method="post">
                        <div class="form-group has-feedback">
                            <input type="text" id="firstname" class="form-control" placeholder="First Name" name="firstname" required>

                            <span class="glyphicon glyphicon-user form-control-feedback"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <input type="text" id="lastname" class="form-control" placeholder="Last Name" name="lastname" required>
                            <span class="glyphicon glyphicon-user form-control-feedback"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <input type="text" id="othername" class="form-control" placeholder="Other Name" name="othername" required>
                            <span class="glyphicon glyphicon-user form-control-feedback"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <select  class="form-control"  name="gender" required>
                                <option selected disabled>Select Your Gender</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>

                        </div>
                        <div class="form-group has-feedback">
                            <select  class="form-control"  name="marital_status" required>
                                <option selected disabled>Select Your Marital Status</option>
                                <option value="Single">Single</option>
                                <option value="Married">Married</option>
                            </select>

                        </div>
                        <div class="form-group has-feedback">
                            <input type="email" class="form-control" placeholder="Email" name="email" required>
                            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                        </div>
                        
                        <div class="form-group has-feedback">
                            <input type="password" class="form-control" placeholder="Password" id="password" name="password" required>
                            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <input type="password" class="form-control" placeholder="Retype password" id="confirm_password" name="confirm_password" required>
                            <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <input type="text" class="form-control" placeholder="Designation" name="designation" required>
                            <span class="glyphicon glyphicon-globe form-control-feedback"></span>
                        </div>
                        <!--<div class="form-group has-feedback">
                            <input type="text" class="form-control" placeholder="City" name="city" required>
                            <span class="glyphicon glyphicon-circle-arrow-down form-control-feedback"></span>
                        </div>-->
                        <div class="form-group has-feedback">
                            <input type="text" class="form-control" placeholder="Phone" name="phone" required>
                            <span class="glyphicon glyphicon-phone form-control-feedback"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <select  class="form-control"  name="role" required>
                                <option selected disabled>Select Your Role</option>
                                <option>HOD</option>
                                <option>Exam Officer</option>
                                <option>Lecturer</option>
                                <option>Staff</option>
                            </select>

                        </div>

                        <div class="row">

                            <div class="col-xs-4">
                                <button type="submit" class="btn btn-primary btn-block btn-flat">Register</button>
                            </div><!-- /.col -->
                        </div>
                    </form>
                    <a href="main_home" class="text-center">I already have a membership</a>
                </div><!-- /.form-box -->
            </div>


        </div><!-- /.register-box -->

        <!-- jQuery 2.1.4 -->
        <script src="js/jQuery-2.2.3.min.js"></script>
        <!-- Bootstrap 3.3.5 -->
        <script src="js/bootstrap.min.js"></script>
        <!-- iCheck -->
        <script src="js/icheck.min.js"></script>
        <script>
            $(function(){
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


