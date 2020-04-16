    <%--
    Document   : specific_result
    Created on : Jul 25, 2019, 2:19:39 AM
    Author     : EKPES
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="user" class="ScienceEdu.user.User" scope="session"/>
<jsp:useBean id="course" scope="session" class="ScienceEdu.user.Result"/>
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
                        Enter Result Here
                        <small>it all starts here</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="scienceEduPage"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Student</a></li>
                        <li><a href="result_list">Result</a></li>

                    </ol>
                </section>
                <!-- Content Header (Page header) ending -->

                <!-- Main content -->
                <section class="content">

                    <!-- Default box -->
                    <div class="box">
                        <div class="box-body box-profile">
                            <div class="fp1000">
                                <form class="form-horizontal">
                                    <div class="row">
                                        <div class="col-md-12 border-right">
                                            <div class="row">
                                                <div class="col-md-6 border-right">
                                                    <div class="form-group">
                                                        <label for="session" class="col-sm-4 control-label">Session</label>
                                                        <div class="col-sm-8">
                                                            <input class="form-control" maxlength = "9"  name="session" id="session" placeholder="e.g 2016/2017" type="text" value="">
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="semester" class="col-sm-4 control-label">Semester</label>
                                                        <div class="col-sm-8">
                                                            <input class="form-control" maxlength = "3" name="semester" id="semester" placeholder="e.g 2ND" type="text" value="">
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="row">
                                                <div class="col-md-6 border-right">
                                                    <div class="form-group">
                                                        <label for="course_code" class="col-sm-4 control-label">Course Code</label>
                                                        <div class="col-sm-8">
                                                            <input class="form-control" maxlength = "7" name="course_code" id="course_code" placeholder="e.g EDU 142" type="text" value="">
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="credit_hours" class="col-sm-4 control-label">Credit Hours</label>
                                                        <div class="col-sm-8">
                                                            <input class="form-control" maxlength = "4" name="credit_hours" id="credit_hours" placeholder="e.g 2HRS" type="text" value="">
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="form-group">
                                                <label for="course_title" class="col-sm-2 control-label">Course Title</label>
                                                <div class="col-sm-10">
                                                    <input class="form-control " name="course_title" id="course_title" placeholder="Course Title" type="text" value="">
                                                </div>
                                            </div>
                                            <!--<div class="form-group">
                                                <label for="year_of_study" class="col-sm-2 control-label">Year of Study</label>
                                                <div class="col-sm-10">
                                                    <input class="form-control" maxlength = "8" name="year_of_study" id="year_of_study" placeholder="e.g 3RD YEAR" type="text" value="">
                                                </div>
                                            </div>  -->
                                            <div class="form-group">
                                                <label for="result_released" class="col-sm-3 control-label">Result to be release to the Dept. of</label>
                                                <div class="col-sm-9">
                                                    <input class="form-control " name="result_released" id="result_released" placeholder="Result to be release to the Dept. of" type="text" value="">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6 border-right">
                                                    <div class="form-group">
                                                        <label for="no_of_pages" class="col-sm-4 control-label">No. of Pages to Upload for this result</label>
                                                        <div class="col-sm-8">
                                                            <input class="form-control " name="no_of_pages" id="no_of_pages" placeholder="No. of Pages to Upload for this result" type="number" value="1">
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">

                                                        <div class="col-sm-8">
                                                            <button class="btn btn-primary visual" id="go">Go</button>
                                                        </div>
                                                        <div id="informa">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">

                                                        <div class="col-sm-8">
                                                            <form class="form-horizontal ">
                                                                <div class="member wow bounceInUp animated animated" style="visibility: visible; animation-name: bounceInUp;">
                                                                    <div class="member-container hidden" data-wow-delay=".1s">
                                                                        <div class="inner-container">
                                                                            <div class="author-avatar">
                                                                                <img id="uploadImage" class="img-rounded center-block imgsm" src="http://192.168.0.101:8080/ProfileImage/thumbnails/${user.image_name}" alt="Team Member" width="293" height="293">

                                                                                <div class="content-box center-block3">
                                                                                    <input id="uploadBtn" class="btn btn-primary btn-large clearfix" value="Choose file" type="button">
                                                                                    <button class="btn btn-primary" id="send">Send</button>
                                                                                    <button class="btn btn-primary hidden" id="finished">Click here to Finished</button>
                                                                                    <span style="padding-left:5px;vertical-align:middle;"><small><i>PNG, JPG, or GIF (1024K max file size)</i></small></span>

                                                                                    <div id="errormsg" class="clearfix redtext" style="padding-top: 10px;"></div>

                                                                                    <!-- File Upload Progress Bar -->
                                                                                    <div id="progressOuter" class="progress progress-striped active" style="display:none;">
                                                                                        <div id="progressBar" class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                                                                        </div>
                                                                                        <div id="msgBox"></div>
                                                                                    </div>

                                                                                </div>
                                                                            </div><!-- /.author-avatar -->


                                                                        </div><!-- /.inner-container -->
                                                                    </div><!-- /.member-container -->
                                                                </div><!-- /.member -->
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <!-- Profile Image -->


                                            <!--<div class="form-group">
                                                <label for="item_name" class="col-sm-2 control-label">From Designated</label>
                                                <div class="col-sm-10">
                                                    <select class="form-control select13" style="width: 100%;" placeholder="Available Raw Material">
                                                        <option selected>Select here</option>
                                                        <option>Store Clerk</option>
                                                        <option>Factory Supervisor</option>

                                                    </select>

                                                </div>
                                            </div>-->

                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            Footer
                        </div>
                        <!-- /.box-footer-->
                    </div>
                    <!-- /.box -->

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
                $('#send').removeClass("hidden");
                $('#date_of_birth').datepicker({format: 'yyyy-mm-dd'});
                $('[data-mask]').inputmask();
                //$('.imgsm2').attr("src", "http://localhost:8080/ProfileImage/thumbnails/team_pic1.png");
                $('.imgsm').attr("src", "http://192.168.0.101:8080/ProfileImage/thumbnails/team_pic1.png");

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
                            $('.ddd').html("<img id='uploadImage' class='img-rounded center-block imgsm' src='http://192.168.0.101:8080/ProfileImage/thumbnails/" + data + "' alt='User profile picture'>");
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

                $('#go').on('click', function(event){
                    event.preventDefault();
                    var session = $('#session').val();
                    var semester = $('#semester').val();
                    var course_code = $('#course_code').val();
                    var course_title = $('#course_title').val();
                    var credit_hours = $('#credit_hours').val();
                    //var year_of_study = $('#year_of_study').val();
                    var result_released = $('#result_released').val();
                    var no_of_pages = $('#no_of_pages').val();

                    $.ajax({
                        url: 'result_servlet',
                        type: 'POST',
                        data: {session: session, semester: semester, course_code: course_code, course_title: course_title,
                            credit_hours: credit_hours, result_released: result_released, no_of_pages: no_of_pages},
                        cache: false,
                        success: function(data){
                            //alert(data);
                        },
                        error: function(data){
                        }
                    });

                    var count = 0;
                    $('#send').on('click', function(event){
                        event.preventDefault();
                        count++;
                        $.ajax({
                            url: 'SaveImageToDIr2',
                            type: 'POST',
                            data: {count: count},
                            cache: false,
                            success: function(data){
                                if(count < no_of_pages)
                                {
                                    $('#informa').html("<h4>"+data+"</h4>");

                                }else
                                {
                                    $('#informa').html("<h4>Finish</h4>");
                                    $('#send').addClass("hidden");
                                    $('#finished').removeClass("hidden");
                                }
                                //alert(data);
                                //$('#student_table').DataTable().ajax.reload(null, false);
                                // $('#info').html('Uploaded Successfully!').delay('4000').fadeOut(400);
                                // $('#modal-default2').blur();
                            },
                            error: function(data){
                            }
                        });


                    });
                });




                $('#finished').on('click', function(){
                    location.reload();
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

                var table2 = $('#student_table').DataTable({
                    Filter: true,
                    processing: true,
                    responsive: false,
                    ajax: {
                        url: 'all_student',
                        dataType: 'json'

                    },
                    columns: [
                        //{data: 'tulip_staffId'},
                        {data: 'first_name'},
                        {data: 'last_name'},
                        {data: 'other_name'},
                        {data: 'academic_session'},
                        {data: 'current_level'},
                        {data: 'matric_no'},
                        {data: 'date_of_birth'}
                    ]
                });

                $('#student_table tbody').on('click', 'tr', function(){
                    if($(this).hasClass('selected')){
                        $(this).removeClass('selected');
                    }else{
                        table2.$('tr.selected').removeClass('selected');
                        $(this).addClass('selected');
                    }
                });

                $('#go').on('click', function(event){
                    event.preventDefault();
                    $('.member-container').removeClass("hidden");
                    $('#go').prop("disabled", true);
                    $('#no_of_pages').prop("disabled", true);

                });

                $('.edit_student').click(function(){
                    var data_row = table2.row('.selected').data();
                    $('#firstnamea').val(data_row.first_name);
                    $('#lastnamea').val(data_row.last_name);
                    $('#othernamea').val(data_row.other_name);
                    $('#emaila').val(data_row.other_name);
                    $('#rolea').val(data_row.role);
                    $('#date_of_birtha').datepicker({format: 'yyyy-mm-dd'});
                    var caltime = data_row.date_of_birth;
                    $('#date_of_birtha').datepicker('update', caltime);
                    var gender = data_row.gender;
                    $('.select003a option').each(function(){
                        var data = $(this).val();

                        if(gender === data)
                        {
                            $('.select003a').val(data).trigger('change');
                        }
                    });

                    var marital_status = data_row.marital_status;
                    $('.select0003a option').each(function(){
                        var data = $(this).val();

                        if(marital_status === data)
                        {
                            $('.select0003a').val(data).trigger('change');
                        }
                    });
                    $('#addressa').val(data_row.address);
                    $('#citya').val(data_row.city);
                    $('#phonea').val(data_row.phone);
                    var current_level = data_row.current_level;
                    $('.select0033a option').each(function(){
                        var data = $(this).val();

                        if(current_level === data)
                        {
                            $('.select0033a').val(data).trigger('change');
                        }
                    });
                    $('#academic_sessiona').val(data_row.academic_session);
                    $('#departmenta').val(data_row.department);
                    $('#facultya').val(data_row.faculty);
                    $('#matric_noa').val(data_row.matric_no);
                    $('#timesa').val(data_row.image_name);
                    // $('.imgsm').attr("src", "http://localhost:8080/ProfileImage/thumbnails/" + data_row.image_name);


                    //var status = data_row.status;
                    /* $('.select2 option').each(function(){
                     var data = $(this).val();

                     if(status === data)
                     {
                     $('.select2').val(data).trigger('change');
                     }
                     });*/
                    //$('#date_of_birtha').datepicker({format: 'yyyy-mm-dd'});
                    // var caltime = data_row.date_of_birth;
                    //var m = caltime.split(" ");
                    //  $('#date_of_birtha').datepicker('update', caltime);
                    //  $('#times').html(m[1]);

                });





                $('.forAllInput').prop("disabled", true);

            });
        </script>
    </body>
</html>

