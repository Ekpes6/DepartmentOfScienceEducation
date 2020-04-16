<%--
    Document   : entercouse-JSP
    Created on : Dec 12, 2019, 9:06:41 PM
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
                        Enter Courses
                        <small>it all starts here</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="scienceEduPage"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Lecturer</a></li>
                        <li class="active">Enter Courses</li>
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
                                                <div class="col-md-3 border-right">
                                                    <div class="form-group">
                                                        <label for="course_code" class="col-sm-4 control-label">Course Code</label>
                                                        <div class="col-sm-8">
                                                            <input class="form-control" maxlength = "7"  name="course_code" id="course_code" placeholder="e.g GSS 111" type="text" value="">
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="course_title" class="col-sm-4 control-label">Course Title</label>
                                                        <div class="col-sm-8">
                                                            <input class="form-control" maxlength = "300" name="course_title" id="course_title" placeholder="e.g Anti-Corruption" type="text" value="">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="credit_hrs" class="col-sm-4 control-label">Credit Hours</label>
                                                        <div class="col-sm-8">
                                                            <input class="form-control" maxlength = "4" name="credit_hrs" id="credit_hrs" placeholder="e.g 1HRS" type="text" value="">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <div type="button" class="btn btn-default input_course" >
                                                            <i class="fa fa-send">Submit</i>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div>

                    </div>
                    <!-- /.box -->
                    <!-- Default box -->
                    <div class="box">
                        <div class="box-header with-border">
                            <div class="box-body" >
                                <div type="button" class="btn btn-warning edit_course_info" data-toggle="modal" data-target="#modal-edit_student">
                                    <i class="fa fa-pencil"> Edit</i>
                                </div>

                                <div type="button" class="btn btn-danger remove_ex" data-toggle="modal" data-target="#modal-default0427">
                                    <i class="fa fa-remove"> Delete</i>
                                </div>
                            </div>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                                        title="Collapse">
                                    <i class="fa fa-minus"></i></button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                    <i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <table id="student_table" class="table table-bordered table-striped display hover">
                                <thead>
                                    <tr>
                                        <th>Course Code</th>
                                        <th>Course Title</th>
                                        <th>Credit Hours</th>
                                        <th>Course Date</th>

                                    </tr>
                                </thead>
                                <tbody>


                                </tbody>

                                <tfoot>
                                    <tr>
                                        <th>Course Code</th>
                                        <th>Course Title</th>
                                        <th>Credit Hours</th>
                                        <th>Course Date</th>

                                    </tr>
                                </tfoot>
                            </table>
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
           <!-- /.edit student modal begining-->
            <div class="modal fade in" id="modal-edit_student" style="display: none; padding-right: 17px;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span></button>
                            <h4 class="modal-title">Edit Course Information</h4> <div id="timesa"></div>
                        </div>
                        <div class="modal-body">
                            <section class="content">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="nav-tabs-custom">

                                            <div class="tab-content">
                                                <div class="tab-pane fade active in">
                                                    <form class="form-horizontal">
                                                        <div class="form-group">
                                                            <label for="course_code1" class="col-sm-4 control-label">Course Code</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" maxlength = "7"  name="course_code1" id="course_code1" type="text" value="" >
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="course_title1" class="col-sm-4 control-label">Course Title</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" maxlength = "300" name="course_title1" id="course_title1" type="text" value="" >
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="credit_hrs1" class="col-sm-4 control-label">Credit Hours</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" maxlength = "4" name="credit_hrs1" id="credit_hrs1"  type="text" value="">
                                                            </div>
                                                        </div>

                                                       <div class="form-group">
                                                            <div type="button" class="col-sm-offset-2 col-sm-10 btn btn-primary pull-right save_edited_courseInfo" data-dismiss="modal" href="#">
                                                            <i class="fa fa-save"> Submit</i>
                                                            </div>
                                                        </div>
                                                    </form>

                                                </div><!-- /.tab-pane -->


                                            </div><!-- /.tab-content -->
                                        </div><!-- /.tab-pane -->
                                    </div><!-- /.col -->
                                </div>
                            </section>
                        </div>

                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.edit student modal ending-->
            <div class="modal fade in" id="modal-default0427" style="display: none; padding-right: 17px;" >
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span></button>
                            <h3 class="modal-title">Confirmation box</h3>
                        </div>
                        <div class="modal-body">

                            <div >
                                <span id="message">Do you wish to delete this record</span>

                            </div><!-- /.tab-pane -->

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" id="modClose0428" data-dismiss="modal">Yes</button>
                            <button type="button" class="btn btn-default pull-right" id="modClose0429" data-dismiss="modal">No</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
             <div class="modal fade in" id="modal-default_update" style="display: none; padding-right: 17px;" >
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span></button>
                            <h3 class="modal-title">Confirmation Entry</h3>
                        </div>
                        <div class="modal-body">

                            <div >
                                <span id="message">This record has been successfully updated!</span>

                            </div><!-- /.tab-pane -->

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" id="modClose_update" data-dismiss="modal">Ok</button>

                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>


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
        <script src="js/jquery-1.12.4.min.js"></script>
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
                $('.imgsm2').attr("src", "http://192.168.0.101:8080/ProfileImage/thumbnails/team_pic1.png");

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

                $('#student_table tfoot th').each(function(){
            var title = $(this).text();
            if(title === "Date of Birth")
            {
            $(this).html('<input type="text" id="datepicker" placeholder="Search ' + title + '" />');
            }else if(title === "Due Date")
            {
            $(this).html('<input type="text" id="datepicker2" placeholder="Search ' + title + '" />');
            }else
            {
            $(this).html('<input type="text" placeholder="Search ' + title + '" />');
            }

            });

                var table2 = $('#student_table').DataTable({
                    Filter: true,
                    processing: true,
                    responsive: false,
                    scrollY: 300,
                    scrollX: false,
                    //deferRender: true,
                    //serverSide: true,
                   // searcheable: false,
                    ajax: {
                        url: 'all_course_info',
                        dataType: 'json'

                    },
                  /*  "columnDefs": [
            {
                "targets": [0, 4, 8, 9, 10, 11, 12,13, 14, 15, 16, 17, 18],
                "visible": false
            }
        ],*/
                    columns: [
                    {data: 'course_code'},
                    {data: 'course_title'},
                    {data: 'credit_hrs'},
                    {data: 'course_date'}
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

                table2.columns().every(function(){
            var that = this;
            $('input', this.footer()).on('keydown', function(ev){
            if(ev.keyCode === 13){ //only on enter keypress (code 13)
            that.search(this.value).draw();
            }
            });
            });
                $('.input_course').on('click', function(event){
                    event.preventDefault();

                    var course_code = $('#course_code').val();
                    var course_title = $('#course_title').val();
                    var credit_hrs = $('#credit_hrs').val();


                    $.ajax({
                        url: 'enter_courses',
                        type: 'POST',
                        data: {course_code: course_code, course_title: course_title,credit_hrs: credit_hrs},
                        cache: false,
                        success: function(data){
                            alert(data);
                           $('#course_code').val("");
                            $('#course_title').val("");
                            $('#credit_hrs').val("");
                            $('#student_table').DataTable().ajax.reload(null, false);
                        },
                        error: function(data){
                        }
                    });



                });

                $('.edit_course_info').click(function(event){
                    event.preventDefault();
                    var data_row = table2.row('.selected').data();
                    $('#course_code1').val(data_row.course_code);
                    $('#course_title1').val(data_row.course_title);
                    $('#credit_hrs1').val(data_row.credit_hrs);

                    ///////save edited Student
                    $('.save_edited_courseInfo').click(function(event){
                        //event.stopPropagation()
                        var course_code = $('#course_code1').val();
                        var course_title = $('#course_title1').val();
                        var credit_hrs = $('#credit_hrs1').val();
                        var nuId = data_row.course_infoId;

                        $.ajax({
                            url: 'save_edited_info',
                            type: 'POST',
                            data: {course_code: course_code, course_title: course_title, credit_hrs: credit_hrs, nuId: nuId},
                            cache: false,
                            success: function(data){
                            alert(data);
                            $('#student_table').DataTable().ajax.reload(null, false);

                            },
                            error: function(xhr, status, error){
                                var acc = [];
                                $.each(xhr, function(index, value){
                                    acc.push(index + ': ' + value);
                                });
                                alert(JSON.stringify(acc));
                            }
                        });

                        event.preventDefault();
                        event.stopImmediatePropagation();

                    });

                   // event.stopPropagation();
//////////////////////
                });

                $("#modClose_update").on('click', function(){
                    $('#modal-default_update').hide();
                });
                $(".close").on('click', function(){
                    $('#modal-default_update').hide();

                });

                //////////////Delete edited courseInfo
                $('#modClose0428').on('click', function(){
                    var data_row = table2.row('.selected').data();
                    var course_infoId = data_row.course_infoId;


                    $.ajax({
                        url: 'delete_course_info',
                        type: 'POST',
                        data: {genInfoId: course_infoId},
                        cache: false,
                        success: function(data){
                            $('#student_table').DataTable().ajax.reload(null, false);


                        },
                        error: function(xhr, status, error){
                            var acc = [];
                            $.each(xhr, function(index, value){
                                acc.push(index + ': ' + value);
                            });
                            alert(JSON.stringify(acc));
                        }
                    });

                });





                $('.forAllInput').prop("disabled", true);

            });
        </script>
    </body>
</html>
