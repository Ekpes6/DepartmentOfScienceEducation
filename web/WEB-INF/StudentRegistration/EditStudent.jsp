<%--
    Document   : loadButton
    Created on : Nov 22, 2019, 7:46:16 PM
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
                        Edit Previous Student
                        <small>it all starts here</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="scienceEduPage"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Student</a></li>
                        <li class="active">Edit Student</li>
                    </ol>
                </section>
                <!-- Content Header (Page header) ending -->

                <!-- Main content -->
                <section class="content">

                    <!-- Default box -->
                    <div class="box">
                        <div class="box-header with-border">
                            <div class="box-body" >
                                <div type="button" class="btn btn-warning edit_student" data-toggle="modal" data-target="#modal-edit_student">
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
                                        <th><input name="select_all" value="1" type="checkbox"></th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Other Name</th>
                                        <th>Image Name</th>
                                        <th>Academic Session</th>
                                        <th>Unit</th>
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
                                        <th>Image Name</th>
                                        <th>Academic Session</th>
                                        <th>Unit</th>
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
                            <h4 class="modal-title">Edit Student</h4> <div id="timesa"></div>
                        </div>
                        <div class="modal-body">
                            <section class="content">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="nav-tabs-custom">
                                            <ul class="nav nav-tabs">

                                                <li class="active"><a data-toggle="tab" aria-expanded="true" href="#personal_informationa">Personal Information</a></li>
                                                <li class=""><a data-toggle="tab" aria-expanded="false" href="#Personal_Information_2a">Personal Information 2</a></li>
                                                <li class=""><a href="#academic_infoa" data-toggle="tab" aria-expanded="false">Academic Information</a></li>
                                                <li class=""><a href="#profile_imagesa" data-toggle="tab" aria-expanded="false">Profile Image</a></li>


                                            </ul>
                                            <div class="tab-content">
                                                <div class="tab-pane fade active in" id="personal_informationa">
                                                    <form class="form-horizontal">
                                                        <div class="form-group">
                                                            <label for="inputName" class="col-sm-4 control-label">First Name</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="firstname" id="firstnamea" placeholder="First Name" type="text" >
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="inputName" class="col-sm-4 control-label">Last Name</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="lastname" id="lastnamea" placeholder="Last Name" type="text" >
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="inputName" class="col-sm-4 control-label">Other Name</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="othername" id="othernamea" placeholder="Other Name" type="text">
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="inputEmail" class="col-sm-4 control-label">Email</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="email" id="emaila" placeholder="Email" type="email">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="date_of_birth" class="col-sm-4 control-label">Date Of Birth</label>
                                                            <div class="col-sm-8">
                                                                <div class="input-group date">
                                                                    <div class="input-group-addon">
                                                                        <i class="fa fa-calendar"></i>
                                                                    </div>
                                                                    <input class="form-control" value="" name="date_of_birth" id="date_of_birtha" placeholder="Date Of Birth" type="text">
                                                                </div>
                                                                <!-- /.input group -->
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="role" class="col-sm-4 control-label">Role</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control forAllInput" value="" name="role" id="rolea" placeholder="role" type="text" disabled>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="col-sm-offset-2 col-sm-10 ">
                                                                <button class="btn btn-primary pull-right navigatio_nbtn" data-toggle="tab" aria-expanded="true" href="#">Next</button>
                                                            </div>
                                                        </div>
                                                    </form>

                                                </div><!-- /.tab-pane -->

                                                <div class="tab-pane fade" id="Personal_Information_2a">
                                                    <form class="form-horizontal">
                                                        <div class="form-group">
                                                            <label for="gender" class="col-sm-4 control-label" placeholder="Gender">Gender</label>
                                                            <div class="col-sm-8">
                                                                <select class="form-control select003a" style="width: 100%;">
                                                                    <option>Male</option>
                                                                    <option>Female</option>
                                                                </select></div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="marital_status" class="col-sm-4 control-label">Marital Status</label>
                                                            <div class="col-sm-8">
                                                                <select class="form-control select0003a" style="width: 100%;">
                                                                    <option>Single</option>
                                                                    <option>Married</option>
                                                                </select></div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="address" class="col-sm-4 control-label">Address</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="address" id="addressa" placeholder="Address">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="city" class="col-sm-4 control-label">City</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="city" id="citya" placeholder="City" type="text">
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="phone" class="col-sm-4 control-label">Phone</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="phone" id="phonea" placeholder="Phone" type="text">
                                                                <input class="form-control" value="" name="genIda" id="genIda" type="hidden">
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
                                                <div class="tab-pane fade" id="academic_infoa">
                                                    <form class="form-horizontal">
                                                        <div class="form-group">
                                                            <label for="current_level" class="col-sm-4 control-label" placeholder="Current Level">Current Level</label>
                                                            <div class="col-sm-8">
                                                                <select class="form-control select0033a" style="width: 100%;">
                                                                    <option>Level 100</option>
                                                                    <option>Level 200</option>
                                                                    <option>Level 300</option>
                                                                    <option>Level 400</option>
                                                                </select></div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="matric_no" class="col-sm-4 control-label">Matric No</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="matric_no" id="matric_noa" placeholder="Matric No" type="text">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="academic_session" class="col-sm-4 control-label">Academic Session</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="academic_session" id="academic_sessiona" placeholder="e.g 2017/2018" type="text">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="unit" class="col-sm-4 control-label">Unit</label>
                                                            <div class="col-sm-8">
                                                             <select class="form-control unita" style="width: 100%;">
                                                                <option selected>Select here</option>
                                                                <option >BIOLOGY</option>
                                                                <option>CHEMISTRY</option>
                                                                <option>MATHEMATICS</option>
                                                                <option>PHYSICS</option>
                                                                <option>NIL</option>
                                                            </select>

                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="department" class="col-sm-4 control-label">Department</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control forAllInput" value="" name="department" id="departmenta" placeholder="Department" type="text" disabled="">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="faculty" class="col-sm-4 control-label">Faculty</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control forAllInput" value="" name="faculty" id="facultya" placeholder="Faculty" type="text" disabled="">
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
                                                <div class="tab-pane fade" id="profile_imagesa">
                                                    <!-- Profile Image -->
                                                    <form class="form-horizontal">
                                                        <div class="member wow bounceInUp animated animated" style="visibility: visible; animation-name: bounceInUp;">
                                                            <div class="member-container" data-wow-delay=".1s">
                                                                <div class="inner-container">
                                                                    <div class="author-avatar">
                                                                        <img id="uploadImage" class="img-rounded center-block imgsm" src="http://192.168.0.101:8080/ProfileImage/thumbnails/${user.image_name}" alt="Team Member" width="293" height="293">

                                                                        <div class="content-box center-block3">
                                                                            <input id="uploadBtn" class="btn btn-primary btn-large clearfix" value="Choose file" type="button">
                                                                            <span style="padding-left:5px;vertical-align:middle;"><small><i>PNG, JPG, or GIF (1024K max file size)</i></small></span>

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
                                                            <button class="btn btn-primary pull-right navigatio_nbtn" data-toggle="tab" aria-expanded="false" id="save_edited_student" data-dismiss="modal">Save Changes</button>
                                                        </div>
                                                    </div>

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
                            <h2 class="modal-title" style="text-align: center;">Confirmation Entry</h2>
                        </div>
                        <div class="modal-body">

                            <div style="text-align: center;">
                                <h3><span id="message">This record has been successfully updated!</span></h3>

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
                        url: 'all_student',
                        dataType: 'json'

                    },
                    "columnDefs": [
            {
                "targets": [0, 4, 6, 9, 10, 11, 12,13, 14, 15, 16, 17, 18, 19],
                "visible": false
            }
        ],
                    columns: [
                    {data: 'gen_info_id'},
                    {data: 'first_name'},
                    {data: 'last_name'},
                    {data: 'other_name'},
                    {data: 'image_name'},
                    {data: 'academic_session'},
                    {data: 'unit'},
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

                $('.edit_student').click(function(event){
                    event.preventDefault();
                    var data_row = table2.row('.selected').data();
                    $('#firstnamea').val(data_row.first_name);
                    $('#lastnamea').val(data_row.last_name);
                    $('#othernamea').val(data_row.other_name);
                    $('#emaila').val(data_row.email);
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

                    var unit = data_row.unit;
                    $('.unita option').each(function(){
                        var data = $(this).val();

                        if(unit === data)
                        {
                            $('.unita').val(data).trigger('change');
                        }
                    });
                    $('#departmenta').val(data_row.department);
                    $('#facultya').val(data_row.faculty);
                    $('#matric_noa').val(data_row.matric_no);
                    $('#timesa').val(data_row.image_name);
                    $('#genIda').val(data_row.gen_info_id);

                    $('.imgsm').attr("src", "http://localhost:8080/ProfileImage/thumbnails/" + data_row.image_name);
                  // var info = $('#msgBox').val();

                    ///////save edited Student
                    $('#save_edited_student').click(function(event){
                        //event.stopPropagation();
                        var first_name = $('#firstnamea').val();
                        var last_name = $('#lastnamea').val();
                        var other_name = $('#othernamea').val();
                        var email = $('#emaila').val();
                        var role = $('#rolea').val();
                        var date_of_birth = $('#date_of_birtha').val();
                        var gender = $('.select003a').val();

                        var marital_status = $('.select0003a').val();
                        var address = $('#addressa').val();
                        var city = $('#citya').val();
                        var phone = $('#phonea').val();
                        var current_level = $('.select0033a').val();
                        var academic_session = $('#academic_sessiona').val();
                        var unit = $('.unita').val();
                        var department = $('#departmenta').val();
                        var faculty = $('#facultya').val();
                        var matric_no = $('#matric_noa').val();
                        var genInfoId = $('#genIda').val();


                        $.ajax({
                            url: 'save_edited_student_data',
                            type: 'POST',
                            data: {first_name: first_name, last_name: last_name, other_name: other_name, email: email,
                                date_of_birth: date_of_birth, role: role, gender: gender, marital_status: marital_status,
                                address: address, city: city, phone: phone, current_level: current_level,
                                academic_session: academic_session, unit: unit, department: department,
                                faculty: faculty, matric_no: matric_no, genInfoId: genInfoId},
                            cache: false,
                            success: function(data){
                                var nuId = data_row.gen_info_id;
                                var nuphone = data_row.phone;
                                //////////////////
                                //alert(data_row.image_name);
                                $.ajax({
                                    url: 'saveimagedir5',
                                    type: 'POST',
                                    data: {nuId: nuId, nuphone: nuphone},
                                    cache: false,
                                    success: function(dataRecords){
                                        $('#modal-default_update').show();

                                        $('#student_table').DataTable().ajax.reload(null, false);

                                    },
                                    error: function(data){
                                    }
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

                //////////////Delete edited Student
                $('#modClose0428').on('click', function(){
                    var data_row = table2.row('.selected').data();
                    var genInfoId = data_row.gen_info_id;


                    $.ajax({
                        url: 'delete_record',
                        type: 'POST',
                        data: {genInfoId: genInfoId},
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
