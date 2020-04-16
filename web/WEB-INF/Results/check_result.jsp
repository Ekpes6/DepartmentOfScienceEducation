<%--
    Document   : CheckResult
    Created on : Jul 27, 2019, 2:19:57 PM
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
        <style>
            div.img {
                margin: 5px;
                border: 1px solid #ccc;
                float: left;
                width: 180px;
            }

            div.img:hover {
                border: 1px solid #777;
            }

            div.img img {
                width: 100%;
                height: auto;
            }

            div.desc {
                padding: 15px;
                text-align: center;
            }
        </style>
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
                        Check Result Here
                        <small>it all starts here</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="scienceEduPage"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Student</a></li>
                        <li><a href="check_result">Check Result</a></li>

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
                                                        <label for="semester" class="col-sm-4 control-label">Session</label>
                                                        <div class="col-sm-8">
                                                            <select class="form-control session" style="width: 100%;" placeholder="Session">
                                                                <option selected>Select here</option>

                                                            </select>

                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="semester" class="col-sm-4 control-label">Semester</label>
                                                        <div class="col-sm-8">
                                                            <select class="form-control semester" style="width: 100%;" placeholder="Semester">
                                                                <option selected>Select here</option>

                                                            </select>

                                                        </div>
                                                    </div>

                                                </div>

                                            </div>
                                            <div class="row">
                                                <div class="col-md-6 border-right">
                                                    <div class="form-group">
                                                        <label for="course_code" class="col-sm-4 control-label">Course Code</label>
                                                        <div class="col-sm-8">
                                                            <select class="form-control course_code" style="width: 100%;" placeholder="Course Code">
                                                                <option selected>Select here</option>

                                                            </select>

                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="course_title" class="col-sm-4 control-label">Course Title</label>
                                                        <div class="col-sm-8">
                                                            <select class="form-control course_title" style="width: 100%;" placeholder="Course Title">
                                                                <option selected>Select here</option>

                                                            </select>

                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <!-- <div class="form-group">
                                                <label for="year_of_study" class="col-sm-4 control-label">Year of Study</label>
                                                <div class="col-sm-8">
                                                    <select class="form-control year_of_study" style="width: 100%;" placeholder="Year of Study">
                                                        <option selected>Select here</option>

                                                    </select>

                                                </div>
                                            </div> -->

                                            <button class="btn btn-primary" id="retrieve">Retrieve Result</button>
                                        </div>
                                    </div>
                                </form>

                            </div>
                            <!-- Profile Image -->
                            <div class="inner-container mmm">
                                <div class="author-avatar imgsm">
                                </div>
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
                //$('.imgsm').attr("src", "http://localhost:8080/ProfileImage/thumbnails/team_pic1.png");
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
                $('.session').select2({
                    tags: true
                });
                $('.semester').select2({
                    tags: true
                });
                $('.course_code').select2({
                    tags: true
                });
                $('.course_title').select2({
                    tags: true
                });
               /* $('.year_of_study').select2({
                    tags: true
                });*/
                //Get All available Session
                $.ajax({
                    url: 'session_check',
                    type: 'GET',
                    cache: false,
                    // data: {company_name: company_name},
                    success: function(data){
                        for(var i = 0; i < data.aaData.length; i++){
                            var k = data.aaData[i].session;
                            var option = new Option(k, k);
                            $('.session').append($(option));
                            //Selection of each items on the select tag
                            $(".session").each(function(index)
                            {
                                $(this).change(function(event)
                                {
                                    event.stopPropagation();
                                    event.stopImmediatePropagation();
                                    var m = $(this).val();
                                    if(m !== 'Select here')
                                    {
                                        // $('#avail_qty').prop("value", "0");check_semester
                                        //$('#company_email').val("");
                                        //alert(m);
                                        /*   $.ajax({
                                         url: 'launch_search',
                                         type: 'POST',
                                         data: {search_fromSession: m},
                                         cache: false,
                                         success: function(dataRecords){
                                         alert(dataRecords);
                                         //$('#student_table').DataTable().ajax.reload(null, false);
                                         // $('#info').html('Uploaded Successfully!').delay('4000').fadeOut(400);
                                         // $('#modal-default2').blur();
                                         },
                                         error: function(data){
                                         }
                                         });*/
                                    }
                                });
                            });
                        }

                    },
                    error: function(xhr, status, error){
                        var acc = [];
                        $.each(xhr, function(index, value){
                            acc.push(index + ': ' + value);
                        });
                        alert(JSON.stringify(acc));
                    }
                });
                ///////////////end

                //Get All available Semester
                $.ajax({
                    url: 'check_semester',
                    type: 'GET',
                    cache: false,
                    // data: {company_name: company_name},
                    success: function(data){
                        for(var i = 0; i < data.aaData.length; i++){
                            var k = data.aaData[i].semester;
                            var option = new Option(k, k);
                            $('.semester').append($(option));
                            //Selection of each items on the select tag
                            $(".semester").each(function(index)
                            {
                                $(this).change(function(event)
                                {
                                    event.stopPropagation();
                                    event.stopImmediatePropagation();
                                    var m = $(this).val();
                                    if(m !== 'Select here')
                                    {
                                        // $('#avail_qty').prop("value", "0");
                                        //$('#company_email').val("");
                                        // alert(m);
                                        /*   $.ajax({
                                         url: 'launch_search',
                                         type: 'POST',
                                         data: {search_fromSession: m},
                                         cache: false,
                                         success: function(dataRecords){
                                         alert(dataRecords);
                                         //$('#student_table').DataTable().ajax.reload(null, false);
                                         // $('#info').html('Uploaded Successfully!').delay('4000').fadeOut(400);
                                         // $('#modal-default2').blur();
                                         },
                                         error: function(data){
                                         }
                                         });*/
                                    }
                                });
                            });
                        }

                    },
                    error: function(xhr, status, error){
                        var acc = [];
                        $.each(xhr, function(index, value){
                            acc.push(index + ': ' + value);
                        });
                        alert(JSON.stringify(acc));
                    }
                });
                ///////////////end

                //Get All available Course Code
                $.ajax({
                    url: 'check_course_code',
                    type: 'GET',
                    cache: false,
                    // data: {company_name: company_name},
                    success: function(data){
                        for(var i = 0; i < data.aaData.length; i++){
                            var k = data.aaData[i].course_code;
                            var option = new Option(k, k);
                            $('.course_code').append($(option));
                            //Selection of each items on the select tag
                            $(".course_code").each(function(index)
                            {
                                $(this).change(function(event)
                                {
                                    event.stopPropagation();
                                    event.stopImmediatePropagation();
                                    var m = $(this).val();
                                    if(m !== 'Select here')
                                    {
                                        // $('#avail_qty').prop("value", "0");
                                        //$('#company_email').val("");
                                        // alert(m);
                                        /*   $.ajax({
                                         url: 'launch_search',
                                         type: 'POST',
                                         data: {search_fromSession: m},
                                         cache: false,
                                         success: function(dataRecords){
                                         alert(dataRecords);
                                         //$('#student_table').DataTable().ajax.reload(null, false);
                                         // $('#info').html('Uploaded Successfully!').delay('4000').fadeOut(400);
                                         // $('#modal-default2').blur();
                                         },
                                         error: function(data){
                                         }
                                         });*/
                                    }
                                });
                            });
                        }

                    },
                    error: function(xhr, status, error){
                        var acc = [];
                        $.each(xhr, function(index, value){
                            acc.push(index + ': ' + value);
                        });
                        alert(JSON.stringify(acc));
                    }
                });
                ///////////////end

                //Get All available Course Title
                $.ajax({
                    url: 'check_course_title',
                    type: 'GET',
                    cache: false,
                    // data: {company_name: company_name},
                    success: function(data){
                        for(var i = 0; i < data.aaData.length; i++){
                            var k = data.aaData[i].course_tittle;
                            var option = new Option(k, k);
                            $('.course_title').append($(option));
                            //Selection of each items on the select tag
                            $(".course_title").each(function(index)
                            {
                                $(this).change(function(event)
                                {
                                    event.stopPropagation();
                                    event.stopImmediatePropagation();
                                    var m = $(this).val();
                                    if(m !== 'Select here')
                                    {
                                        // $('#avail_qty').prop("value", "0");
                                        //$('#company_email').val("");
                                        //alert(m);
                                        /*   $.ajax({
                                         url: 'launch_search',
                                         type: 'POST',
                                         data: {search_fromSession: m},
                                         cache: false,
                                         success: function(dataRecords){
                                         alert(dataRecords);
                                         //$('#student_table').DataTable().ajax.reload(null, false);
                                         // $('#info').html('Uploaded Successfully!').delay('4000').fadeOut(400);
                                         // $('#modal-default2').blur();
                                         },
                                         error: function(data){
                                         }
                                         });*/
                                    }
                                });
                            });
                        }

                    },
                    error: function(xhr, status, error){
                        var acc = [];
                        $.each(xhr, function(index, value){
                            acc.push(index + ': ' + value);
                        });
                        alert(JSON.stringify(acc));
                    }
                });
                ///////////////end

                //Get All available Year of Study
              /*  $.ajax({
                    url: 'check_year_of_study',
                    type: 'GET',
                    cache: false,
                    // data: {company_name: company_name},
                    success: function(data){
                        for(var i = 0; i < data.aaData.length; i++){
                            var k = data.aaData[i].year_of_study;
                            var option = new Option(k, k);
                            $('.year_of_study').append($(option));
                            //Selection of each items on the select tag
                            $(".year_of_study").each(function(index)
                            {
                                $(this).change(function(event)
                                {
                                    event.stopPropagation();
                                    event.stopImmediatePropagation();
                                    var m = $(this).val();
                                    if(m !== 'Select here')
                                    {
                                        // $('#avail_qty').prop("value", "0");
                                        //$('#company_email').val("");
                                        //alert(m);
                                        /*   $.ajax({
                                         url: 'launch_search',
                                         type: 'POST',
                                         data: {search_fromSession: m},
                                         cache: false,
                                         success: function(dataRecords){
                                         alert(dataRecords);
                                         //$('#student_table').DataTable().ajax.reload(null, false);
                                         // $('#info').html('Uploaded Successfully!').delay('4000').fadeOut(400);
                                         // $('#modal-default2').blur();
                                         },
                                         error: function(data){
                                         }
                                         });
                                    }
                                });
                            });
                        }

                    },
                    error: function(xhr, status, error){
                        var acc = [];
                        $.each(xhr, function(index, value){
                            acc.push(index + ': ' + value);
                        });
                        alert(JSON.stringify(acc));
                    }
                });*/
                ///////////////end

                //////////////retrieving the images from its selected sessions etc
                $('#retrieve').on('click', function(event){
                    event.preventDefault();
                    var session = $('.session').val();
                    var semester = $('.semester').val();
                    var course_code = $('.course_code').val();
                    var course_title = $('.course_title').val();
                    //var year_of_study = $('.year_of_study').val();
                    $('.mmm').empty();
                    $.ajax({
                        url: 'retrieve_images',
                        type: 'POST',
                        data: {session: session, semester: semester, course_code: course_code, course_title: course_title},
                        cache: false,
                        success: function(data){
                            if(data.toString() === "No valid Entry" || data.toString() === "No Record Found!")
                            {

                                    $('.mmm').html("<h4>"+data+"</h4>");

                            }else
                            {
                                 for(var i = 0; i < data.aaData.length; i++){
                                    var k = data.aaData[i].reult_image;
                                    $('.mmm').append("<div class='thumbnail img'><a target='_blank' href='http://192.168.0.101:8080/ProfileImage/originals/" + k + "'><img src='http://192.168.0.101:8080/ProfileImage/thumbnails/" + k + "' alt='Results' width='300' height='200'> </a> <div class='desc'></div></div>");
                                    // $('.mmm').html(" <div class='author-avatar'><img id='uploadImage' class='img-rounded center-block imgsm' src='http://localhost:8080/ProfileImage/thumbnails/'" + k + " alt='Team Member' width='293' height='293'> </div>");
                                    //$('.imgsm').attr("src", "http://localhost:8080/ProfileImage/thumbnails/"+k).append();
                                }
                               // $.iaoAlert({msg: data, type: "warning", position: 'bottom-right', closeOnClick: true, alertTime: "8000", mode: "dark"});

                            }

                        },
                        error: function(data){
                        }
                    });


                });

                /////////////////////////////////////////////////////////ending



                $('#go').on('click', function(event){
                    event.preventDefault();
                    var session = $('#session').val();
                    var semester = $('#semester').val();
                    var course_code = $('#course_code').val();
                    var course_title = $('#course_title').val();
                    var credit_hours = $('#credit_hours').val();
                    var year_of_study = $('#year_of_study').val();
                    var result_released = $('#result_released').val();
                    var no_of_pages = $('#no_of_pages').val();
                    $.ajax({
                        url: 'result_servlet',
                        type: 'POST',
                        data: {session: session, semester: semester, course_code: course_code, course_title: course_title,
                            credit_hours: credit_hours, year_of_study: year_of_study, result_released: result_released, no_of_pages: no_of_pages},
                        cache: false,
                        success: function(data){
                            alert(data);
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
                                    $('#informa').html("<h4>" + data + "</h4>");
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


