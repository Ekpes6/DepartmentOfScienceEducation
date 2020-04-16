<%--
    Document   : physics_unit
    Created on : Dec 10, 2019, 6:36:31 PM
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
                        Enter Student Result for Physics Unit
                        <small>it all starts here</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="scienceEduPage"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Student</a></li>
                        <li class="active">Physics Unit</li>
                    </ol>
                </section>
                <!-- Content Header (Page header) ending -->

                <!-- Main content -->
                <section class="content">

                    <!-- Default box -->
                    <div class="box">
                        <div class="box-header with-border no-print">
                            <div class="box-body">
                                <div type="button" class="btn btn-info add" data-toggle="modal" data-target="#modal-default3">
                                    <i class="fa fa-asl-interpreting">Add Student</i>
                                </div>
                                <div type="button" class="btn btn-default preview" >
                                    <i class="fa fa-print">Print</i>
                                </div>

                            </div>

                        </div>
                        <div class="box-body">
                            <table id="student_table" class="table table-bordered table-striped display hover">
                                <thead>
                                    <tr>
                                        <th><input name="select_all" value="1" type="checkbox"></th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Other Name</th>
                                         <th>Image</th>
                                        <th>Academic Session</th>
                                        <th>Current Level</th>
                                        <th>Matric No</th>
                                        <th>Date of Birth</th>

                                        <th>Email</th>
                                        <th>Role</th>
                                        <th>Gender</th>
                                        <th>Marital Status</th>
                                        <th>Address</th>
                                        <th>City</th>
                                        <th>Phone Number</th>

                                        <th>Department</th>
                                        <th>Faculty</th>

                                        <th>Id</th>

                                    </tr>
                                </thead>
                                <tbody>


                                </tbody>

                                <tfoot>
                                    <tr>
                                        <th></th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Other Name</th>
                                         <th>Image</th>
                                        <th>Academic Session</th>
                                        <th>Current Level</th>
                                        <th>Matric No</th>
                                        <th>Date of Birth</th>

                                        <th>Email</th>
                                        <th>Role</th>
                                        <th>Gender</th>
                                        <th>Marital Status</th>
                                        <th>Address</th>
                                        <th>City</th>
                                        <th>Phone Number</th>

                                        <th>Department</th>
                                        <th>Faculty</th>

                                        <th>Id</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            Footer
                        </div>
                        <!-- Table row -->
                        <div class="box-body content_print hidden">
                        <div class="row">
                            <div class="col-xs-12 table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>S/n</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Other Name</th>
                                            <th>Academic Session</th>
                                            <th>Current Level</th>
                                            <th>Matric No</th>
                                            <th>Date of Birth</th>

                                            <th>Email</th>
                                            <!-- <th>Role</th> -->
                                            <th>Gender</th>
                                            <th>Marital Status</th>
                                            <th>Address</th>
                                            <th>City</th>
                                            <th>Phone Number</th>

                                             <!-- <th>Department</th> -->
                                             <!-- <th>Faculty</th> -->
                                            <th>Image</th>

                                        </tr>
                                    </thead>
                                    <tbody id="addData">

                                    </tbody>
                                </table>
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                        <!-- /.box-footer-->
                        </div>
                    </div>
                    <!-- /.box -->

                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <!-- /.add student modal begining-->
            <div class="modal fade in" id="modal-default3" style="display: none; padding-right: 17px;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span></button>
                            <h4 class="modal-title">Add Student</h4><div id="msge"></div>
                        </div>
                        <div class="modal-body">
                            <section class="content">
                                <div class="row">
                                    <div class="col-md-12">
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
                                                                <input class="form-control" value="" name="firstname" id="firstname" placeholder="First Name" type="text" >
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="inputName" class="col-sm-4 control-label">Last Name</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="lastname" id="lastname" placeholder="Last Name" type="text" >
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="inputName" class="col-sm-4 control-label">Other Name</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="othername" id="othername" placeholder="Other Name" type="text">
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="inputEmail" class="col-sm-4 control-label">Email</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="email" id="email" placeholder="Email" type="email">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="date_of_birth" class="col-sm-4 control-label">Date Of Birth</label>
                                                            <div class="col-sm-8">
                                                                <div class="input-group date">
                                                                    <div class="input-group-addon">
                                                                        <i class="fa fa-calendar"></i>
                                                                    </div>
                                                                    <input class="form-control" value="" name="date_of_birth" id="date_of_birth" placeholder="Date Of Birth" type="text">
                                                                </div>
                                                                <!-- /.input group -->
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="role" class="col-sm-4 control-label">Role</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="STUDENT" name="role" id="role" placeholder="role" type="text" disabled>
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
                                                                <select class="form-control select003" style="width: 100%;">
                                                                    <option>Male</option>
                                                                    <option>Female</option>
                                                                </select></div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="marital_status" class="col-sm-4 control-label">Marital Status</label>
                                                            <div class="col-sm-8">
                                                                <select class="form-control select0003" style="width: 100%;">
                                                                    <option>Single</option>
                                                                    <option>Married</option>
                                                                </select></div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="address" class="col-sm-4 control-label">Address</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="address" id="address" placeholder="Address">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="city" class="col-sm-4 control-label">City</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="city" id="city" placeholder="City" type="text">
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="phone" class="col-sm-4 control-label">Phone</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="phone" id="phone" placeholder="Phone" type="text">
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
                                                            <label for="current_level" class="col-sm-4 control-label" placeholder="Current Level">Current Level</label>
                                                            <div class="col-sm-8">
                                                                <select class="form-control select0033" style="width: 100%;">
                                                                    <option>Level 100</option>
                                                                    <option>Level 200</option>
                                                                    <option>Level 300</option>
                                                                    <option>Level 400</option>
                                                                </select></div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="matric_no" class="col-sm-4 control-label">Matric No</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="matric_no" id="matric_no" placeholder="Matric No" type="text">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="academic_session" class="col-sm-4 control-label">Academic Session</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="academic_session" id="academic_session" placeholder="e.g 2017/2018" type="text">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="department" class="col-sm-4 control-label">Department</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control forAllInput" value="SCIENCE EDUCATION" name="department" id="department" placeholder="Department" type="text" disabled="">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="faculty" class="col-sm-4 control-label">Faculty</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control forAllInput" value="EDUCATION" name="faculty" id="faculty" placeholder="Faculty" type="text" disabled="">
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
                                                    <!-- Profile Image -->
                                                    <form class="form-horizontal">
                                                        <div class="member wow bounceInUp animated animated" style="visibility: visible; animation-name: bounceInUp;">
                                                            <div class="member-container" data-wow-delay=".1s">
                                                                <div class="inner-container">
                                                                    <div class="author-avatar">
                                                                        <img id="uploadImage" class="img-rounded center-block imgsm2" src="http://192.168.0.101:8080/ProfileImage/thumbnails/${user.image_name}" alt="Team Member" width="293" height="293">

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


                                                                </div><!-- /.inner-container -->
                                                            </div><!-- /.member-container -->
                                                        </div><!-- /.member -->
                                                    </form>

                                                    <!--<div class="form-group">
                                                         <div class="col-sm-offset-2 col-sm-10">
                                                             <button type="submit" class="btn btn-danger">Submit</button>
                                                         </div>
                                                     </div>-->
                                                    <div class="form-group">
                                                        <div class="col-sm-offset-2 col-sm-10 ">
                                                            <button class="btn btn-primary navigatio_nbtn2" data-toggle="tab" aria-expanded="false" href="#">Previous</button>
                                                            <button class="btn btn-primary pull-right navigatio_nbtn" data-toggle="tab" aria-expanded="false" id="save_student" data-dismiss="modal">Save Changes</button>
                                                        </div>
                                                    </div>

                                                </div><!-- /.tab-pane -->


                                            </div><!-- /.tab-content -->
                                        </div><!-- /.tab-pane -->
                                    </div><!-- /.col -->
                                </div>
                            </section>
                        </div>
                        <div class="modal-footer">
                            <!--<button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal" id="genrate" >Generate</button>-->
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <div class="modal fade in" id="modal-default_big" style="display: none; padding-right: 17px;" >
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span></button>
                            <h3 class="modal-title">Duplicate Entry</h3>
                        </div>
                        <div class="modal-body">

                            <div >
                                <span id="message">This record already exist</span>

                            </div><!-- /.tab-pane -->

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" id="modClose_big" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>

            <div class="modal fade in" id="modal-default_big2" style="display: none; padding-right: 17px;" >
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span></button>
                            <h3 class="modal-title">Confirmation Entry</h3>
                        </div>
                        <div class="modal-body">

                            <div >
                                <span id="message">This record has been successfull entered!</span>

                            </div><!-- /.tab-pane -->

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" id="modClose_big0" data-dismiss="modal">Ok</button>

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
        <script src="js/jquery.PrintArea.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="js/demo.js"></script>
        <script>
            function updateDataTableSelectAllCtrl(table2){
                var $table = table2.table().node();
                var $chkbox_all = $('tbody input[type="checkbox"]', $table);
                var $chkbox_checked = $('tbody input[type="checkbox"]:checked', $table);
                var chkbox_select_all = $('thead input[name="select_all"]', $table).get(0);

                // If none of the checkboxes are checked
                if($chkbox_checked.length === 0){
                    chkbox_select_all.checked = false;
                    if('indeterminate' in chkbox_select_all){
                        chkbox_select_all.indeterminate = false;
                    }

                    // If all of the checkboxes are checked
                }else if($chkbox_checked.length === $chkbox_all.length){
                    chkbox_select_all.checked = true;
                    if('indeterminate' in chkbox_select_all){
                        chkbox_select_all.indeterminate = false;
                    }

                    // If some of the checkboxes are checked
                }else{
                    chkbox_select_all.checked = true;
                    if('indeterminate' in chkbox_select_all){
                        chkbox_select_all.indeterminate = true;
                    }
                }
            }
            $(document).ready(function(){
                var rows_selected = [];
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
                            $('.bbb').prepend("<img class='img-circle' src='http://192.168.0.101:8080/ProfileImage/thumbnails/" + data + "' alt='User profile picture'>");
                            $('.aaa').html("<img src='http://192.168.0.101:8080/ProfileImage/thumbnails/" + data + "' class='user-image' alt='Image'>");
                            // $.iaoAlert({msg: data, type: "warning", position: 'bottom-right', closeOnClick: true, alertTime: "8000", mode: "dark"});

                        }

                    },
                    error: function(data){
                    }
                });
                /////////////////////
                $('#save_student').on('click', function(){
                    var first_name = $('#firstname').val();
                    var last_name = $('#lastname').val();
                    var other_name = $('#othername').val();
                    var email = $('#email').val();
                    var date_of_birth = $('#date_of_birth').val();
                    var role = $('#role').val();
                    var gender = $('.select003').val();
                    var marital_status = $('.select0003').val();
                    var address = $('#address').val();
                    var city = $('#city').val();
                    var phone = $('#phone').val();
                    var current_level = $('.select0033').val();
                    var matric_no = $('#matric_no').val();
                    var academic_session = $('#academic_session').val();
                    var department = $('#department').val();
                    var faculty = $('#faculty').val();
                    $.ajax({
                        url: 'save_student_data',
                        type: 'POST',
                        data: {first_name: first_name, last_name: last_name, other_name: other_name, email: email,
                            date_of_birth: date_of_birth, role: role, gender: gender, marital_status: marital_status,
                            address: address, city: city, phone: phone, current_level: current_level,
                            matric_no: matric_no, academic_session: academic_session, department: department, faculty: faculty},
                        cache: false,
                        success: function(data){


                            $.ajax({
                                url: 'saveimagedir',
                                type: 'POST',
                                cache: false,
                                success: function(dataRecords){
                                    $('#modal-default_big2').show();
                                    $('#student_table').DataTable().ajax.reload(null, false);
                                    // $('#info').html('Uploaded Successfully!').delay('4000').fadeOut(400);
                                    // $('#modal-default2').blur();
                                    $('#firstname').val("");
                                    $('#date_of_birth').val("");
                                    $('#email').val("");
                                    $('#lastname').val("");
                                    $('#address').val("");
                                    $('#city').val("");
                                    $('#phone').val("");
                                    $('#othername').val("");
                                    $('#matric_no').val("");
                                    $('#academic_session').val("");
                                    $('.imgsm2').attr("src", "http://192.168.0.101:8080/ProfileImage/thumbnails/team_pic1.png");
                                },
                                error: function(data){
                                    //alert(data);
                                }
                            });
                        },
                        error: function(data){
                            $('#modal-default_big').show();
                            //alert("Duplicate entry! This record alreay exist");
                        }
                    });
                });
                $("#modClose_big").on('click', function(){
                    $('#modal-default_big').hide();
                });
                $(".close").on('click', function(){
                    $('#modal-default_big').hide();
                    $('#modal-default_big2').hide();
                });
                $("#modClose_big0").on('click', function(){
                    $('#modal-default_big2').hide();
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
                $("#datepicker").datepicker({format: 'yyyy-mm-dd'});
                // Setup - add a text input to each footer cell
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
                    ajax: {
                        url: 'all_student',
                        dataType: 'json'

                    },
                    /* colReorder: { enable: true },
                     dom: 'Bfrtip',
                     buttons: [
                     {
                     extend: 'colvis',
                     collectionLayout: 'fixed two-column'
                     }

                     ],*/
                    'columnDefs': [{
                            'targets': 0,
                            'searchable': false,
                            'orderable': false,
                            'width': '1%',
                            'className': 'dt-body-center',
                            'render': function(data, type, full, meta){
                                return '<input type="checkbox">';
                            }
                           }],
                    'order': [[1, 'asc']],
                    'rowCallback': function(row, data, dataIndex){
                        // Get row ID
                        var rowId = data[0];

                        // If row ID is in the list of selected row IDs
                        if($.inArray(rowId, rows_selected) !== -1){
                            $(row).find('input[type="checkbox"]').prop('checked', true);
                            $(row).addClass('selected');
                        }
                    },
                    columns: [
                        {data: 'gen_info_id'},
                        {data: 'first_name'},
                        {data: 'last_name'},
                        {data: 'other_name'},
                        {data: 'image_name', 'render': function(data, type, full, meta){
                                return "<img src='http://localhost:8080/ProfileImage/thumbnails/" + data + "' class='user-image' width='50' height='50'>";
                            }},
                        {data: 'academic_session'},
                        {data: 'current_level'},
                        {data: 'matric_no'},
                        {data: 'date_of_birth'},
                        {data: 'email'},
                        {data: 'role'},
                        {data: 'gender'},
                        {data: 'marital_status'},
                        {data: 'address'},
                        {data: 'city'},
                        {data: 'phone'},
                        {data: 'department'},
                        {data: 'faculty'},

                        {data: 'gen_info_id'}
                    ]
                });
                // Handle click on checkbox
                $('#student_table tbody').on('click', 'input[type="checkbox"]', function(e){
                    var $row = $(this).closest('tr');

                    // Get row data
                    var data = table2.row($row).data();

                    // Get row ID
                    var rowId = data[0];

                    // Determine whether row ID is in the list of selected row IDs
                    var index = $.inArray(rowId, rows_selected);

                    // If checkbox is checked and row ID is not in list of selected row IDs
                    if(this.checked && index === -1){
                        rows_selected.push(rowId);

                        // Otherwise, if checkbox is not checked and row ID is in list of selected row IDs
                    }else if(!this.checked && index !== -1){
                        rows_selected.splice(index, 1);
                    }

                    if(this.checked){
                        $row.addClass('selected');
                    }else{
                        $row.removeClass('selected');
                    }

                    // Update state of "Select all" control
                    updateDataTableSelectAllCtrl(table2);

                    // Prevent click event from propagating to parent
                    e.stopPropagation();
                });

                // Handle click on table cells with checkboxes
                $('#student_table').on('click', 'tbody td, thead th:first-child', function(e){
                    $(this).parent().find('input[type="checkbox"]').trigger('click');
                });

                // Handle click on "Select all" control
                $('thead input[name="select_all"]', table2.table().container()).on('click', function(e){
                    if(this.checked){
                        $('#student_table tbody input[type="checkbox"]:not(:checked)').trigger('click');
                    }else{
                        $('#student_table tbody input[type="checkbox"]:checked').trigger('click');
                    }

                    // Prevent click event from propagating to parent
                    e.stopPropagation();
                });

                // Handle table draw event
                table2.on('draw', function(){
                    // Update state of "Select all" control
                    updateDataTableSelectAllCtrl(table2);
                });


                /*   $('#student_table tbody').on('click', 'tr', function(){
                 $(this).toggleClass('selected');
                 });*/


                table2.columns().every(function(){
                    var that = this;
                    $('input', this.footer()).on('keydown', function(ev){
                        if(ev.keyCode === 13){ //only on enter keypress (code 13)
                            that.search(this.value).draw();
                        }
                    });
                });

                ////////////////////////
                $('.preview').click(function(e){
                    $('div.content_print').removeClass('hidden');
                    $('#addData').empty();
                    var dataArray = [];
                    var lent = table2.rows('.selected').data().length;
                    var dataob = table2.rows('.selected').data();
                    var num = 1;
                    for(var i = 0; i < lent; i++)
                    {
                        var nuNum = num +i;
                        //var aim = ((lent * nuNum)/nuNum)- num;
                        var mtag = "<tr>";
                         mtag += "<td>" + nuNum + "</td>";
                        mtag += "<td>" + dataob[i].first_name + "</td>";
                        mtag += "<td>" + dataob[i].last_name + "</td>";
                        mtag += "<td>" + dataob[i].other_name + "</td>";
                        mtag += "<td>" + dataob[i].academic_session + "</td>";
                        mtag += "<td>" + dataob[i].current_level + "</td>";
                        mtag += "<td>" + dataob[i].matric_no + "</td>";
                        mtag += "<td>" + dataob[i].date_of_birth + "</td>";
                        mtag += "<td>" + dataob[i].email + "</td>";
                        //mtag += "<td>" + dataob[i].role + "</td>";
                        mtag += "<td>" + dataob[i].gender + "</td>";
                        mtag += "<td>" + dataob[i].marital_status + "</td>";
                        mtag += "<td>" + dataob[i].address + "</td>";
                        mtag += "<td>" + dataob[i].city + "</td>";
                        mtag += "<td>" + dataob[i].phone + "</td>";
                        //mtag += "<td>" + dataob[i].department + "</td>";
                       // mtag += "<td>" + dataob[i].faculty + "</td>";
                        mtag += "<td><img src='http://localhost:8080/ProfileImage/thumbnails/" + dataob[i].image_name + "' class='user-image' width='50' height='50'></td>";
                        mtag += "</tr>";

                        dataArray.unshift({dataArr: mtag});
                    }
                    //alert(dataArray[3].dataArr);
                    for(var k = 0; k < dataArray.length; k++)
                    {
                        var nuData = dataArray[k].dataArr;
                        //var option = new Option(nuData);
                        $('#addData').prepend(nuData);

                        //alert(dataArray[k].dataArr);
                    }


                    var mode = 'iframe'; // popup
                     var close = mode === "popup";
                     var options = {mode: mode, popClose: close};
                     $("div.content_print").printArea(options);
                     $('div.content_print').addClass('hidden');

                    // Prevent click event from propagating to parent
                    e.stopPropagation();
                });
                $('.forAllInput').prop("disabled", true);
            });
        </script>
    </body>
</html>

