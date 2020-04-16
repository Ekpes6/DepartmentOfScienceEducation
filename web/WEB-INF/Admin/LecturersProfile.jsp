<%--
    Document   : LecturersProfile
    Created on : Jul 29, 2019, 9:17:11 AM
    Author     : EKPES
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="user" class="ScienceEdu.user.User" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>SCIENCE EDUCATION PORTAL</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.7 -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="css/ionicons.min.css">
        <!-- Datatables -->
        <jsp:include page="WEB-INF/ScriptTag/css.jsp"/>
        <!-- Theme style -->
        <link rel="stylesheet" href="css/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="css/_all-skins.min.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Google Font -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    </head>
    <body class="hold-transition skin-black-light sidebar-mini fixed">
        <!-- Site wrapper -->
        <div class="wrapper">
            <!-- header -->
            <jsp:include page="WEB-INF/HeaderBar/header.jsp"/>
            <!-- header ending -->
            <!-- =============================================== -->

            <!-- Left side column. contains the sidebar -->
            <jsp:include page="WEB-INF/navigationSideBar/navigationBar.jsp"/>

            <!-- =============================================== -->

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        My Profile
                        <small>it all starts here</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="scienceEduPage"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Lecturer/Staff</a></li>
                        <li class="active">My Profile</li>
                    </ol>
                </section>
                <!-- Content Header (Page header) ending -->

                <!-- Main content -->
                <section class="content">

                    <div class="row">
                        <div class="col-md-3">

                            <!-- Profile Image -->
                            <div class="box box-primary">
                                <div class="box-body box-profile">
                                    <div class="ccc">
                                    <img class="profile-user-img img-responsive img-circle nuImage2" src="http://192.168.0.101:8080/ProfileImage/thumbnails/${user.image_name}" alt="User profile picture">
                                    </div>
                                    <h3 class="profile-username text-center">${user.first_name} ${user.last_name}</h3>
                                    <p class="text-muted text-center"></p>

                                    <ul class="list-group list-group-unbordered">
                                        <li class="list-group-item">
                                            <b>Role</b> <a class="pull-right">${user.role}</a>
                                        </li>
                                        <li class="list-group-item">
                                            <b>Email</b> <a class="pull-right">${user.email}</a>
                                        </li>

                                    </ul>

                                    <a href="#" class="btn btn-primary btn-block"><b>Follow</b></a>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->

                        </div><!-- /.col -->
                        <div class="col-md-9">
                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">

                                    <li class="active"><a data-toggle="tab" aria-expanded="true" href="#personal_information">Personal Information</a></li>
                                    <li class=""><a data-toggle="tab" aria-expanded="false" href="#Personal_Information_2">Personal Information 2</a></li>
                                    <li class=""><a href="#academic_info" data-toggle="tab" aria-expanded="false">Academic Information</a></li>
                                    <li class=""><a href="#profile_images" data-toggle="tab" aria-expanded="false">Profile Image</a></li>


                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane fade active in" id="personal_information">
                                        <form class="form-horizontal">
                                            <div class="form-group">
                                                <label for="inputName" class="col-sm-4 control-label">First Name</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" value="${user.first_name}" name="firstname" id="firstname" placeholder="First Name" type="text" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputName" class="col-sm-4 control-label">Last Name</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" value="${user.last_name}" name="lastname" id="lastname" placeholder="Last Name" type="text" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputName" class="col-sm-4 control-label">Other Name</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" value="${user.other_name}" name="othername" id="othername" placeholder="Other Name" type="text"disabled>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="inputEmail" class="col-sm-4 control-label">Email</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" value="${user.email}" name="email" id="email" placeholder="Email" type="email" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="date_of_birth" class="col-sm-4 control-label">Date Of Birth</label>
                                                <div class="col-sm-8">
                                                    <div class="input-group date">
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-calendar"></i>
                                                        </div>
                                                        <input class="form-control" value="${user.date_of_birth}" name="date_of_birth" id="date_of_birth" placeholder="Date Of Birth" type="text" disabled>
                                                    </div>
                                                    <!-- /.input group -->
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="role" class="col-sm-4 control-label">Role</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" value="${user.role}" name="role" id="role" placeholder="role" type="text" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-offset-2 col-sm-10 ">
                                                    <button class="btn btn-primary pull-right navigatio_nbtn" data-toggle="tab" aria-expanded="true" href="#">Next</button>
                                                </div>
                                            </div>
                                        </form>

                                    </div><!-- /.tab-pane -->

                                    <div class="tab-pane fade" id="Personal_Information_2">
                                        <form class="form-horizontal">
                                            <div class="form-group">
                                                <label for="gender" class="col-sm-4 control-label" placeholder="Gender">Gender</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" value="${user.gender}" name="current_level" id="gender" placeholder="Gender" type="text" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="marital_status" class="col-sm-4 control-label">Marital Status</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" value="${user.marital_status}" name="marital_status" id="marital_status" placeholder="Marital Status" type="text" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="address" class="col-sm-4 control-label">Address</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" value="${user.address}" name="address" id="address" placeholder="Address" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="city" class="col-sm-4 control-label">City</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" value="${user.city}" name="city" id="city" placeholder="City" type="text" disabled>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="phone" class="col-sm-4 control-label">Phone</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" value="${user.phone}" name="phone" id="phone" placeholder="Phone" type="text" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-offset-2 col-sm-10 ">
                                                    <button class="btn btn-primary navigatio_nbtn2" data-toggle="tab" aria-expanded="false" href="#">Previous</button>
                                                    <button class="btn btn-primary pull-right navigatio_nbtn" data-toggle="tab" aria-expanded="false" href="#">Next</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="tab-pane fade" id="academic_info">
                                        <form class="form-horizontal">
                                            <div class="form-group">
                                                <label for="highest_level_of_education" class="col-sm-4 control-label">Highest Level of Eduation</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" value="${user.highest_level_education}" name="highest_level_of_education" id="highest_level_of_education" placeholder="Highest Level of Eduation" type="text" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="major_field_of_study" class="col-sm-4 control-label">Major Field of Study</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" value="${user.major_field_of_study}" name="major_field_of_study" id="major_field_of_study" placeholder="Major Field of Study" type="text" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="institution_attended" class="col-sm-4 control-label">Institution Attended</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" value="${user.institution_attended}" name="institution_attended" id="institution_attended" placeholder="Institution Attended" type="text" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="all_academic_certificates" class="col-sm-4 control-label">list all academic certificates</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control forAllInput" value="${user.all_academic_certificates}" name="all_academic_certificates" id="all_academic_certificates" placeholder="list all academic certificates" type="text" disabled="">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="rank_one" class="col-sm-4 control-label">Rank One</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control forAllInput" value="${user.rank_one}" name="rank_one" id="rank_one" placeholder="Rank One" type="text" disabled="">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="rank_two" class="col-sm-4 control-label">Rank Two</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control forAllInput" value="${user.rank_two}" name="rank_two" id="rank_two" placeholder="Rank Two" type="text" disabled="">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-offset-2 col-sm-10 ">
                                                    <button class="btn btn-primary navigatio_nbtn2" data-toggle="tab" aria-expanded="false" href="#">Previous</button>
                                                    <button class="btn btn-primary pull-right navigatio_nbtn" data-toggle="tab" aria-expanded="false" href="#">Next</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div><!-- /.tab-pane -->
                                    <div class="tab-pane fade" id="profile_images">

                                        <form class="form-horizontal">
                                            <div class="member wow bounceInUp animated animated" style="visibility: visible; animation-name: bounceInUp;">
                                                <div class="member-container" data-wow-delay=".1s">
                                                    <div class="inner-container">
                                                        <div class="author-avatar">
                                                            <div class="center-block ddd">
                                                            <img id="uploadImage" class="img-rounded center-block imgsm nuImage0" src="http://192.168.0.101:8080/ProfileImage/thumbnails/${user.image_name}" alt="Team Member" width="293" height="293">
                                                            </div>
                                                            <div class="content-box center-block3">
                                                                <input id="uploadBtn" class="btn btn-primary btn-large clearfix" value="Choose file" type="button">
                                                                <span style="padding-left:5px;vertical-align:middle;"><small><i>PNG, JPG, or GIF (1024K max file size)</i></small></span>

                                                                <div id="errormsg" class="clearfix redtext" style="padding-top: 10px;"></div>

                                                                <!-- File Upload Progress Bar -->
                                                                <div id="progressOuter" class="progress progress-striped active" style="display:none;">
                                                                    <div id="progressBar" class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                                                    </div>
                                                                    <div id="msgBox"></div>
                                                                </div>

                                                                <div class="form-group">
                                                                    <div class="col-sm-offset-2 col-sm-10 ">

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div><!-- /.author-avatar -->
                                                        <div class="form-group">
                                                            <div class="col-sm-offset-2 col-sm-10 ">
                                                                <button class="btn btn-primary navigatio_nbtn2" data-toggle="tab" aria-expanded="false" href="#">Previous</button>
                                                                <button class="btn btn-primary pull-right navigatio_nbtn" data-toggle="tab" aria-expanded="false" id="save_image_lecturer" data-dismiss="modal">Save Image</button>
                                                            </div>
                                                        </div>

                                                    </div><!-- /.inner-container -->
                                                </div><!-- /.member-container -->
                                            </div><!-- /.member -->
                                        </form>



                                    </div><!-- /.tab-pane -->


                                </div><!-- /.tab-content -->
                            </div><!-- /.tab-pane -->
                        </div>


                    </div>
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->



            <!-- Control Sidebar -->
            <jsp:include page="WEB-INF/ControlSideBar/ControlSideBar.jsp"/>
            <!-- /.control-sidebar -->
            <!-- Add the sidebar's background. This div must be placed
                 immediately after the control sidebar -->
            <div class="control-sidebar-bg"></div>
        </div>
        <!-- ./wrapper -->
        <script src="js/SimpleAjaxUploader.js"></script>
        <script src="js/ImageUploaderScript.js"></script>

        <!-- jQuery 3 -->
        <script src="js/jquery.min.js"></script>
        <!-- Bootstrap 3.3.7 -->
        <script src="js/bootstrap.min.js"></script>
        <!-- SlimScroll -->
        <script src="js/jquery.slimscroll.min.js"></script>
        <jsp:include page="WEB-INF/ScriptTag/scripts.jsp"/>
        <!-- FastClick -->
        <script src="js/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="js/adminlte.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="js/demo.js"></script>
        <script>
            $(document).ready(function(){
                $('.sidebar-menu').tree();
                $('#date_of_birth').datepicker({format: 'yyyy-mm-dd'});
                $('[data-mask]').inputmask();
                //$('.imgsm2').attr("src", "http://localhost:8080/ProfileImage/thumbnails/team_pic1.png");
                ////////
                $.ajax({
                    url: 'retrieve_images_personal',
                    type: 'POST',
                    // data: {email: email},
                    cache: false,
                    success: function(data){
                        if(data.toString() === "No valid Entry" || data.toString() === "No Record Found!")
                        {

                            $('.bbb').prepend("<img class='img-circle' src='http://192.168.0.101:8080/ProfileImage/thumbnails/team_pic1.png' alt='User profile picture'>");

                        }else
                        {
                            $('.aaa').find('.nuImage3').remove();
                            $('.bbb').find('.nuImage').remove();
                            $('.ccc').find('.nuImage2').remove();
                            $('.ddd').find('.nuImage0').remove();
                            $('.ddd').html("<img id='uploadImage' class='img-rounded center-block imgsm' src='http://192.168.0.101:8080/ProfileImage/thumbnails/" + data + "' alt='User profile picture' width='293' height='293'>");
                            $('.ccc').html("<img class='profile-user-img img-responsive img-circle' src='http://192.168.0.101:8080/ProfileImage/thumbnails/" + data + "' alt='User profile picture'>");
                            $('.bbb').prepend("<img class='img-circle' src='http://192.168.0.101:8080/ProfileImage/thumbnails/" + data + "' alt='User profile picture'>");
                            $('.aaa').html("<img src='http://192.168.0.101:8080/ProfileImage/thumbnails/" + data + "' class='user-image' alt='Image'>");
                            // $.iaoAlert({msg: data, type: "warning", position: 'bottom-right', closeOnClick: true, alertTime: "8000", mode: "dark"});

                        }

                    },
                    error: function(data){
                    }
                });
                /////////////////////
                $("#save_image_lecturer").on("click", function(){
                    $.ajax({
                        url: 'saveimagedir3',
                        type: 'POST',
                        cache: false,
                        success: function(dataRecords){
                            alert(dataRecords);
                            //    $('#lecturer_table').DataTable().ajax.reload(null, false);
                            // $('#info').html('Uploaded Successfully!').delay('4000').fadeOut(400);
                            // $('#modal-default2').blur();
                            ////////
                            $.ajax({
                                url: 'retrieve_images_personal',
                                type: 'POST',
                                // data: {email: email},
                                cache: false,
                                success: function(data){
                                    if(data.toString() === "No valid Entry" || data.toString() === "No Record Found!")
                                    {

                                        $('.bbb').html("<img class='img-circle' src='http://192.168.0.101:8080/ProfileImage/thumbnails/team_pic1.png' alt='User profile picture'>");

                                    }else
                                    {
                                         $('.aaa').find('.nuImage3').remove();
                                        $('.bbb').find('.nuImage').remove();
                                        $('.ccc').find('.nuImage2').remove();
                                        $('.ddd').find('.nuImage0').remove();
                                        //$('.eee').find('.nuImage1').remove();
                                        //$('.eee').html("<img class='img-circle' src='http://localhost:8080/ProfileImage/thumbnails/" + data + "' alt='User profile picture'>");
                                        $('.ddd').html("<img id='uploadImage' class='img-rounded center-block imgsm' src='http://192.168.0.101:8080/ProfileImage/thumbnails/" + data + "' alt='User profile picture' width='293' height='293'>");
                                        $('.ccc').html("<img class='profile-user-img img-responsive img-circle' src='http://192.168.0.101:8080/ProfileImage/thumbnails/" + data + "' alt='User profile picture'>");
                                        //$('.bbb').prepend("<img class='img-circle' src='http://localhost:8080/ProfileImage/thumbnails/" + data + "' alt='User profile picture'>");
                                        $('.aaa').html("<img src='http://192.168.0.101:8080/ProfileImage/thumbnails/" + data + "' class='user-image' alt='Image'>");
                                        // $.iaoAlert({msg: data, type: "warning", position: 'bottom-right', closeOnClick: true, alertTime: "8000", mode: "dark"});

                                    }

                                },
                                error: function(data){
                                }
                            });
                            /////////////////////
                        },
                        error: function(data){
                        }
                    });
                });


                $(".navigatio_nbtn").each(function(index){
                    $(this).click(function(){
                        var incr = parseInt(index) + 1;
                        //  alert(incr);
                        $('.nav-tabs li:eq(' + incr + ') a').tab('show');
                        //$('.nav-tabs a[href="#correspondence_address"]').tab('show');

                    });

                });

                $(".navigatio_nbtn2").each(function(index){
                    $(this).click(function(){
                        var incr = parseInt(index) + 1;
                        var decr = incr - 1;
                        // alert(incr-1);
                        $('.nav-tabs li:eq(' + decr + ') a').tab('show');
                        //$('.nav-tabs a[href="#correspondence_address"]').tab('show');

                    });

                });

                $('.forAllInput').prop("disabled", true);

            });
        </script>
    </body>
</html>
