<%--
    Document   : emanual_result
    Created on : Dec 13, 2019, 1:32:14 PM
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
                        Enter Student Result Manually
                        <small>it all starts here</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="scienceEduPage"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Lecturer</a></li>
                        <li class="active">Enter Students Result Manually</li>
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
                                                        <label for="name_of_student" class="col-sm-4 control-label">NAME OF STUDENT</label>
                                                        <div class="col-sm-8">
                                                            <select class="form-control name_of_student" style="width: 100%;" placeholder="Names of Student">
                                                                <option selected>Select here</option>

                                                            </select>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-md-3 border-right">
                                                    <div class="form-group">
                                                        <label for="matric_no" class="col-sm-4 control-label">MATRIC NO</label>
                                                        <div class="col-sm-8">
                                                            <input class="form-control forAllInput" maxlength = "15"  name="matric_no" id="matric_no" placeholder="e.g 18/069441057" type="text" value="">
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-md-3 border-right">
                                                    <div class="form-group">
                                                        <label for="course_code" class="col-sm-4 control-label">COURSE CODE</label>
                                                        <div class="col-sm-8">
                                                            <select class="form-control course_code" style="width: 100%;" >
                                                                <option selected>Select here</option>

                                                            </select>
                                                        </div>
                                                    </div>

                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 border-right">
                                            <div class="row">
                                                <div class="col-md-4 border-right">
                                                    <div class="form-group">
                                                        <label for="course_title" class="col-sm-4 control-label">COURSE TITLE</label>
                                                        <div class="col-sm-8">
                                                            <input class="form-control forAllInput" maxlength = "300" name="course_title" id="course_title" placeholder="e.g Anti-Corruption" type="text" value="">
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-md-3 border-right">
                                                    <div class="form-group">
                                                        <label for="credit_hrs" class="col-sm-4 control-label">CREDIT HOURS</label>
                                                        <div class="col-sm-8">
                                                            <select class="form-control forAllInput credit_hrs" style="width: 100%;">
                                                                <option selected>Select here</option>
                                                                <option>1HRS</option>
                                                                <option>2HRS</option>
                                                                <option>3HRS</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-md-2 border-right">
                                                    <div class="form-group">
                                                        <label for="session" class="col-sm-4 control-label">Session</label>
                                                        <div class="col-sm-8">
                                                            <input class="form-control" maxlength = "15"  name="session" id="session" placeholder="e.g 2018/2019" type="text" value="">
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-md-3 border-right">
                                                    <div class="form-group">
                                                        <label for="semester" class="col-sm-4 control-label">Semester</label>
                                                        <div class="col-sm-8">
                                                            <select class="form-control semester" style="width: 100%;">
                                                                <option selected>Select here</option>
                                                                <option >1ST</option>
                                                                <option>2ND</option>
                                                                <option>EXTRA YEAR</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 border-right">
                                            <div class="row">
                                                <div class="col-md-2 border-right">
                                                    <div class="form-group">
                                                        <label for="ca" class="col-sm-4 control-label">CA</label>
                                                        <div class="col-sm-8">
                                                            <input class="form-control" maxlength = "7"  name="ca" id="ca" placeholder="e.g 21" type="number" value="">
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-md-2 border-right">
                                                    <div class="form-group">
                                                        <label for="exam" class="col-sm-4 control-label">EXAM</label>
                                                        <div class="col-sm-8">
                                                            <input class="form-control" maxlength = "4"  name="exam" id="exam" placeholder="e.g 67" type="number" value="">
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-md-2 border-right">
                                                    <div class="form-group">
                                                        <label for="total" class="col-sm-4 control-label">TOTAL</label>
                                                        <div class="col-sm-8">
                                                            <input class="form-control forAllInput" maxlength = "4"  name="total" id="total" type="number" value="">
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-md-2">
                                                    <div class="form-group">
                                                        <label for="grade" class="col-sm-4 control-label">GRADE</label>
                                                        <div class="col-sm-8">
                                                            <input class="form-control forAllInput" maxlength = "1" name="grade" id="grade" placeholder="e.g A, B" type="text" value="">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="form-group">
                                                        <label for="remark" class="col-sm-4 control-label">REMARK</label>
                                                        <div class="col-sm-8">
                                                            <input class="form-control forAllInput" maxlength = "5" name="remark" id="remark" placeholder="e.g Fail" type="text" value="">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="form-group">
                                                        <div type="button" class="btn btn-default input_exam_score">
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
                                <div type="button" class="btn btn-warning edit_exam_info" data-toggle="modal" data-target="#modal-edit_student">
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
                                        <th>NAME OF STUDENT</th>
                                        <th>MATRIC NO</th>
                                        <th>CA</th>
                                        <th>EXAM</th>
                                        <th>TOTAL</th>
                                        <th>GRADE</th>
                                        <th>REMARK</th>

                                    </tr>
                                </thead>
                                <tbody>


                                </tbody>

                                <tfoot>
                                    <tr>
                                        <th>NAME OF STUDENT</th>
                                        <th>MATRIC NO</th>
                                        <th>CA</th>
                                        <th>EXAM</th>
                                        <th>TOTAL</th>
                                        <th>GRADE</th>
                                        <th>REMARK</th>

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
                            <h4 class="modal-title">Edit Exam Information</h4> <div id="timesa"></div>
                        </div>
                        <div class="modal-body">
                            <section class="content">
                                <div class="row">
                                    <div class="col-md-12">
                                        <form class="form-horizontal">
                                            <div class="row">
                                                <div class="col-md-12 border-right">
                                                    <div class="row">
                                                        <div class="col-md-12 border-right">
                                                            <div class="form-group">
                                                                <label for="name_of_student1" class="col-sm-3 control-label">Full Name</label>
                                                                <div class="col-sm-9">
                                                                    <input class="form-control forAllInput" name="name_of_student1" id="name_of_student1" type="text" value="" >
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="matric_no1" class="col-sm-3 control-label">MATRIC NUMBER</label>
                                                                <div class="col-sm-9">
                                                                    <input class="form-control forAllInput" name="matric_no1" id="matric_no1" type="text" value="" >
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12 border-right">
                                                    <div class="row">
                                                        <div class="col-md-4 border-right">
                                                            <div class="form-group">
                                                                <label for="course_code1" class="col-sm-5 control-label">COURSE CODE</label>
                                                                <div class="col-sm-7">
                                                                    <input class="form-control forAllInput" name="course_code1" id="course_code1"  type="text" value="">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8 border-right">
                                                            <div class="form-group">
                                                                <label for="course_title1" class="col-sm-4 control-label">COURSE TITLE</label>
                                                                <div class="col-sm-8">
                                                                    <input class="form-control forAllInput" name="course_title1" id="course_title1" type="text" value="" >
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12 border-right">
                                                    <div class="row">
                                                        <div class="col-md-6 border-right">
                                                            <div class="form-group">
                                                                <label for="session1" class="col-sm-5 control-label">SESSION</label>
                                                                <div class="col-sm-7">
                                                                    <input class="form-control forAllInput" maxlength = "9" name="session1" id="session1"  type="text" value="">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 border-right">
                                                            <div class="form-group">
                                                                <label for="semester1" class="col-sm-5 control-label">SEMESTER</label>
                                                                <div class="col-sm-7">
                                                                    <input class="form-control forAllInput" maxlength = "7"  name="semester1" id="semester1" type="text" value="" >
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12 border-right">
                                                    <div class="row">
                                                        <div class="col-md-4 border-right">
                                                            <div class="form-group">
                                                                <label for="ca1" class="col-sm-5 control-label">CA</label>
                                                                <div class="col-sm-7">
                                                                    <input class="form-control" maxlength = "4" name="ca1" id="ca1"  type="number" value="">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4 border-right">
                                                            <div class="form-group">
                                                                <label for="exam1" class="col-sm-5 control-label">EXAM</label>
                                                                <div class="col-sm-7">
                                                                    <input class="form-control" maxlength = "4"  name="exam1" id="exam1" type="number" value="" >
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4 border-right">
                                                            <div class="form-group">
                                                                <label for="total1" class="col-sm-5 control-label">TOTAL</label>
                                                                <div class="col-sm-7">
                                                                    <input class="form-control forAllInput" name="total1" id="total1" type="text" value="" >
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12 border-right">
                                                    <div class="row">
                                                        <div class="col-md-6 border-right">
                                                            <div class="form-group">
                                                                <label for="grade1" class="col-sm-5 control-label">GRADE</label>
                                                                <div class="col-sm-7">
                                                                    <input class="form-control forAllInput" name="grade1" id="grade1"  type="text" value="">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 border-right">
                                                            <div class="form-group">
                                                                <label for="remark1" class="col-sm-5 control-label">REMARK</label>
                                                                <div class="col-sm-7">
                                                                    <input class="form-control forAllInput" name="remark1" id="remark1" type="text" value="" >
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <div type="button" class="col-sm-offset-2 col-sm-10 btn btn-primary pull-right save_edited_examInfo" data-dismiss="modal" href="#">
                                                    <i class="fa fa-save"> Submit</i>
                                                </div>
                                            </div>
                                        </form>

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
                $('.name_of_student').select2({
                    tags: true
                });

                $('.course_code').select2({
                    tags: true
                });
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

                ////////////////List of all students begining from lastname, firstname and othernames

                $.ajax({
                    url: 'all_student_names',
                    type: 'GET',
                    //data: {serial: serial},
                    cache: false,
                    success: function(data){
                        //alert(JSON.stringify(data.aaData[1].item_name));
                        for(var i = 0; i < data.aaData.length; i++){
                            var k = data.aaData[i].last_name + " " + data.aaData[i].first_name + " " + data.aaData[i].other_name;
                            var option = new Option(k, k);
                            $('.name_of_student').append($(option));
                            //alert(k);

                            //do something with k or data...
                        }

                        //Selection of each items on the select tag
                        $(".name_of_student").each(function(index)
                        {
                            $(this).change(function()
                            {
                                var m = $(this).val();
                                if(m === 'Select here')
                                {
                                    $('#matric_no').val("NIL");

                                }else
                                {
                                    var arr0 = m.split(" ");
                                    var oname = arr0[2];
                                    var fname = arr0[1];
                                    var lname = arr0[0];
                                    $.ajax({
                                        url: 'get_matric_no',
                                        type: 'POST',
                                        data: {oname: oname, lname: lname, fname: fname},
                                        cache: false,
                                        success: function(data){
                                            $('#matric_no').val(data);

                                        },
                                        error: function(xhr, status, error){
                                            var acc = [];
                                            $.each(xhr, function(index, value){
                                                acc.push(index + ': ' + value);
                                            });
                                            alert(JSON.stringify(acc));
                                        }
                                    });
                                }
                            });
                        });


                    },
                    error: function(xhr, status, error){
                        var acc = [];
                        $.each(xhr, function(index, value){
                            acc.push(index + ': ' + value);
                        });
                        alert(JSON.stringify(acc));
                    }
                });
                /////////////////////////////////////////////

                ///////////////List of all Course codes

                $.ajax({
                    url: 'all_course_codes',
                    type: 'GET',
                    //data: {serial: serial},
                    cache: false,
                    success: function(data){
                        //alert(JSON.stringify(data.aaData[1].item_name));
                        for(var i = 0; i < data.aaData.length; i++){
                            var k = data.aaData[i].course_code;
                            var option = new Option(k, k);
                            $('.course_code').append($(option));
                            //alert(k);

                            //do something with k or data...
                        }

                        //Selection of each items on the select tag
                        $(".course_code").each(function(index)
                        {
                            $(this).change(function()
                            {
                                var m = $(this).val();
                                if(m === 'Select here')
                                {
                                    $('#course_title').val("NIL");

                                }else
                                {
                                    $.ajax({
                                        url: 'get_course_title',
                                        type: 'POST',
                                        data: {course_code: m},
                                        cache: false,
                                        success: function(data){
                                            var arr1 = data.split(":");
                                            var cot = arr1[0];
                                            var crh = arr1[1];

                                            $('#course_title').val(cot);
                                            $('.credit_hrs').val(crh).trigger('change');

                                        },
                                        error: function(xhr, status, error){
                                            var acc = [];
                                            $.each(xhr, function(index, value){
                                                acc.push(index + ': ' + value);
                                            });
                                            alert(JSON.stringify(acc));
                                        }
                                    });
                                }
                            });
                        });


                    },
                    error: function(xhr, status, error){
                        var acc = [];
                        $.each(xhr, function(index, value){
                            acc.push(index + ': ' + value);
                        });
                        alert(JSON.stringify(acc));
                    }
                });
                /////////////////////////////////////////////

                $('#exam').on('keyup', function(){

                    var countinous_assesment = parseInt($("#ca").val());
                    var exam = parseInt($("#exam").val());
                    var total = countinous_assesment + exam;
                    $("#total").val(total);
                    if(total >= 70 || total === 100)
                    {
                        $("#grade").val("A");
                        $("#remark").val("PASS");
                    }else if(total >= 60 || total === 69)
                    {
                        $("#grade").val("B");
                        $("#remark").val("PASS");
                    }else if(total >= 50 || total === 59)
                    {
                        $("#grade").val("C");
                        $("#remark").val("PASS");
                    }else if(total >= 45 || total === 49)
                    {
                        $("#grade").val("D");
                        $("#remark").val("PASS");
                    }else if(total >= 40 || total === 44)
                    {
                        $("#grade").val("E");
                        $("#remark").val("PASS");
                    }else if(total <= 39)
                    {
                        $("#grade").val("F");
                        $("#remark").val("FAIL");
                    }

                });

                $('#ca').on('keyup', function(){

                    var countinous_assesment = parseInt($("#ca").val());
                    var exam = parseInt($("#exam").val());
                    var total = countinous_assesment + exam;
                    $("#total").val(total);

                    if(total >= 70 || total === 100)
                    {
                        $("#grade").val("A");
                        $("#remark").val("PASS");
                    }else if(total >= 60 || total === 69)
                    {
                        $("#grade").val("B");
                        $("#remark").val("PASS");
                    }else if(total >= 50 || total === 59)
                    {
                        $("#grade").val("C");
                        $("#remark").val("PASS");
                    }else if(total >= 45 || total === 49)
                    {
                        $("#grade").val("D");
                        $("#remark").val("PASS");
                    }else if(total >= 40 || total === 44)
                    {
                        $("#grade").val("E");
                        $("#remark").val("PASS");
                    }else if(total <= 39)
                    {
                        $("#grade").val("F");
                        $("#remark").val("FAIL");
                    }

                });

                /////////////submit exam scores
                $('.input_exam_score').on('click', function(event){
                    event.preventDefault();

                    var full_name_of_student = $('.name_of_student').val();
                    var matric_no = $('#matric_no').val();
                    var course_code = $('.course_code').val();
                    var course_title = $('#course_title').val();
                    var credit_hrs = $('.credit_hrs').val();
                    var semester = $('.semester').val();
                    var session = $('#session').val();
                    var ca = $('#ca').val();
                    var exam = $('#exam').val();
                    var total = $('#total').val();
                    var grade = $('#grade').val();
                    var remark = $('#remark').val();



                    $.ajax({
                        url: 'save_exam_score',
                        type: 'POST',
                        data: {full_name_of_student: full_name_of_student, matric_no: matric_no, course_code: course_code, course_title: course_title, credit_hrs: credit_hrs, semester: semester, session: session, ca: ca, exam: exam, total: total, grade: grade, remark: remark},
                        cache: false,
                        success: function(data){
                            alert(data);
                            $('.name_of_student').val("Select here").trigger('change');
                            $('.course_code').val("Select here").trigger('change');
                            $('#course_title').val("");
                            $('#matric_no').val("");
                            $('.credit_hrs').val("Select here").trigger('change');
                            $('.semester').val("Select here").trigger('change');
                            $('#session').val("");
                            $('#ca').val("");
                            $('#exam').val("");
                            $('#total').val("");
                            $('#grade').val("");
                            $('#remark').val("");
                            $('#student_table').DataTable().ajax.reload(null, false);
                        },
                        error: function(data){
                        }
                    });



                });


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
                    scrollX: true,
                    deferRender: true,
                    serverSide: true,
                    // searcheable: false,
                    ajax: {
                        url: 'all_exam_score',
                        dataType: 'json'

                    },
                    /*  "columnDefs": [
                     {
                     "targets": [0, 4, 8, 9, 10, 11, 12,13, 14, 15, 16, 17, 18],
                     "visible": false
                     }
                     ],*/
                    columns: [
                        {data: 'full_name'},
                        {data: 'matric_no'},
                        {data: 'continous_assesment'},
                        {data: 'exam_score'},
                        {data: 'total_score'},
                        {data: 'grade'},
                        {data: 'remark'}
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
                        if(ev.keyCode === 13){ //only on enter keypress (code 13)name_of_student
                            that.search(this.value).draw();
                        }
                    });
                });


                $('.edit_exam_info').click(function(event){
                    event.preventDefault();
                    var data_row = table2.row('.selected').data();
                    $('#name_of_student1').val(data_row.full_name);
                    $('#matric_no1').val(data_row.matric_no);
                    $('#course_code1').val(data_row.course_code);
                    $('#course_title1').val(data_row.course_title);
                     //$('#credit_hrs1').val(data_row.credit_hrs);
                    $('#ca1').val(data_row.continous_assesment);
                    $('#exam1').val(data_row.exam_score);
                    $('#total1').val(data_row.total_score);

                    $('#semester1').val(data_row.semester);
                    $('#session1').val(data_row.academic_session);

                    $('#grade1').val(data_row.grade);
                    $('#remark1').val(data_row.remark);

                    /////////////////////continous assesment and exam score events

                    $('#exam1').on('keyup', function(event){
                        event.preventDefault();
                        var countinous_assesment = parseInt($("#ca1").val());
                        var exam = parseInt($("#exam1").val());
                        var total = countinous_assesment + exam;
                        $("#total1").val(total);
                        if(total >= 70 || total === 100)
                        {
                            $("#grade1").val("A");
                            $("#remark1").val("PASS");
                        }else if(total >= 60 || total === 69)
                        {
                            $("#grade1").val("B");
                            $("#remark1").val("PASS");
                        }else if(total >= 50 || total === 59)
                        {
                            $("#grade1").val("C");
                            $("#remark1").val("PASS");
                        }else if(total >= 45 || total === 49)
                        {
                            $("#grade1").val("D");
                            $("#remark1").val("PASS");
                        }else if(total >= 40 || total === 44)
                        {
                            $("#grade1").val("E");
                            $("#remark1").val("PASS");
                        }else if(total <= 39)
                        {
                            $("#grade1").val("F");
                            $("#remark1").val("FAIL");
                        }

                    });

                    $('#ca1').on('keyup', function(event){
                        event.preventDefault();
                        var countinous_assesment = parseInt($("#ca1").val());
                        var exam = parseInt($("#exam1").val());
                        var total = countinous_assesment + exam;
                        $("#total1").val(total);

                        if(total >= 70 || total === 100)
                        {
                            $("#grade1").val("A");
                            $("#remark1").val("PASS");
                        }else if(total >= 60 || total === 69)
                        {
                            $("#grade1").val("B");
                            $("#remark1").val("PASS");
                        }else if(total >= 50 || total === 59)
                        {
                            $("#grade1").val("C");
                            $("#remark1").val("PASS");
                        }else if(total >= 45 || total === 49)
                        {
                            $("#grade1").val("D");
                            $("#remark1").val("PASS");
                        }else if(total >= 40 || total === 44)
                        {
                            $("#grade1").val("E");
                            $("#remark1").val("PASS");
                        }else if(total <= 39)
                        {
                            $("#grade1").val("F");
                            $("#remark1").val("FAIL");
                        }

                    });
                    //////////////////////////////////////////////////////////////

                    ///////save edited Student
                    $('.save_edited_examInfo').click(function(event){
                        // event.stopPropagation()
                        var full_name = $('#name_of_student1').val();
                        var matric_no = $('#matric_no1').val();
                        var course_code = $('#course_code1').val();
                        var course_title = $('#course_title1').val();
                        //var credit_hrs = $('#credit_hrs1').val();
                        var ca = $('#ca1').val();
                        var exam_score = $('#exam1').val();
                        var total_score = $('#total1').val();

                        var semester = $('#semester1').val();
                        var academic_session = $('#session1').val();

                        var grade = $('#grade1').val();
                       var remark =  $('#remark1').val();
                        var nuId = data_row.examId;

                        $.ajax({
                            url: 'save_edited_exam',
                            type: 'POST',
                            data: {full_name: full_name, matric_no: matric_no, course_code: course_code,
                                course_title: course_title, credit_hrs: data_row.credit_hrs, ca: ca, exam_score: exam_score, total_score: total_score,
                                semester: semester, academic_session: academic_session, grade: grade,  remark: remark, nuId: nuId},
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
                    var exam_infoId = data_row.examId;


                    $.ajax({
                        url: 'delete_exam_info',
                        type: 'POST',
                        data: {exam_infoId: exam_infoId},
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

