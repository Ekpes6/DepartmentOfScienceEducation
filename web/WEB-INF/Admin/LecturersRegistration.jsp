<%--
    Document   : LecturersRegistration
    Created on : Jul 29, 2019, 9:22:39 AM
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
                        Register a new Lecturer or Staff
                        <small>it all starts here</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="scienceEduPage"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Lecturer</a></li>
                        <li class="active">Lecturers Registration</li>
                    </ol>
                </section>
                <!-- Content Header (Page header) ending -->

                <!-- Main content -->
                <section class="content">

                    <!-- Default box -->
                    <div class="box">
                        <div class="box-header with-border">
                            <div class="box-body" >
                                <div type="button" class="btn btn-info open_lectuer" data-toggle="modal" data-target="#modal-default3">
                                    <i class="fa fa-asl-interpreting">Add Lecturer or Staff</i>
                                </div>


                                <div type="button" class="btn btn-warning edit_lecturer" data-toggle="modal" data-target="#modal-edit_lecturer">
                                    <i class="fa fa-pencil"> Edit</i>
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
                            <table id="lecturer_table" class="table table-bordered table-striped display hover">
                                <thead>
                                    <tr>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Other Name</th>
                                        <th>Email</th>
                                        <th>Date of Birth</th>
                                        <th>Highest Level of Education</th>
                                        <th>Major Field of Study</th>


                                    </tr>
                                </thead>
                                <tbody>


                                </tbody>

                                <tfoot>
                                    <tr>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Other Name</th>
                                        <th>Email</th>
                                        <th>Date of Birth</th>
                                        <th>Highest Level of Education</th>
                                        <th>Major Field of Study</th>


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
            <!-- /.add student modal begining-->
            <div class="modal fade in" id="modal-default3" style="display: none; padding-right: 17px;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span></button>
                            <h4 class="modal-title">Add Lecturer or Staff</h4><div id="msge"></div>
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
                                                                <select class="form-control select0033b" style="width: 100%;">
                                                                    <option>HOD</option>
                                                                    <option>Exam Officer</option>
                                                                    <option>Lecturer</option>
                                                                    <option>Staff</option>
                                                                </select>
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
                                                            <label for="designation" class="col-sm-4 control-label">Designation</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="designation" id="designation" placeholder="Designation" type="text">
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
                                                                <input class="form-control" value="" name="highest_level_of_education" id="highest_level_of_education" placeholder="Highest Level of Eduation" type="text">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="major_field_of_study" class="col-sm-4 control-label">Major Field of Study</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="major_field_of_study" id="major_field_of_study" placeholder="Major Field of Study" type="text">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="institution_attended" class="col-sm-4 control-label">Institution Attended</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="institution_attended" id="institution_attended" placeholder="Institution Attended" type="text">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="all_academic_certificates" class="col-sm-4 control-label">list all academic certificates</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="all_academic_certificates" id="all_academic_certificates" placeholder="e.g FSLC, WAEC, NECO, Jamb, NYSC etc " type="text">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="rank_one" class="col-sm-4 control-label">Rank One</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="rank_one" id="rank_one" placeholder="Rank One" type="text">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="rank_two" class="col-sm-4 control-label">Rank Two</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="rank_two" id="rank_two" placeholder="Rank Two" type="text" >
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
                                                            <button class="btn btn-primary pull-right navigatio_nbtn" data-toggle="tab" aria-expanded="false" id="save_lecturer" data-dismiss="modal">Save Changes</button>
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
            <!-- /.add student modal ending -->
            <!-- /.edit student modal begining-->
            <div class="modal fade in" id="modal-edit_lecturer" style="display: none; padding-right: 17px;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span></button>
                            <h4 class="modal-title">Edit Lecturer or Staff</h4> <div id="timesa"></div>
                        </div>
                        <div class="modal-body">
                            <section class="content">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="nav-tabs-custom">
                                            <ul class="nav nav-tabs">

                                                <li class="active"><a data-toggle="tab" aria-expanded="true" href="#personal_informationb">Personal Information</a></li>
                                                <li class=""><a data-toggle="tab" aria-expanded="false" href="#Personal_Information_2b">Personal Information 2</a></li>
                                                <li class=""><a href="#academic_infob" data-toggle="tab" aria-expanded="false">Academic Information</a></li>
                                                <li class=""><a href="#profile_imagesb" data-toggle="tab" aria-expanded="false">Profile Image</a></li>


                                            </ul>
                                            <div class="tab-content">
                                                <div class="tab-pane fade active in" id="personal_informationb">
                                                    <form class="form-horizontal">
                                                        <div class="form-group">
                                                            <label for="firstnameb" class="col-sm-4 control-label">First Name</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="firstnameb" id="firstnameb" placeholder="First Name" type="text" >
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="lastnameb" class="col-sm-4 control-label">Last Name</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="lastnameb" id="lastnameb" placeholder="Last Name" type="text" >
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="othernameb" class="col-sm-4 control-label">Other Name</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="othernameb" id="othernameb" placeholder="Other Name" type="text">
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="email" class="col-sm-4 control-label">Email</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="emailb" id="emailb" placeholder="Email" type="email">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="date_of_birthb" class="col-sm-4 control-label">Date Of Birth</label>
                                                            <div class="col-sm-8">
                                                                <div class="input-group date">
                                                                    <div class="input-group-addon">
                                                                        <i class="fa fa-calendar"></i>
                                                                    </div>
                                                                    <input class="form-control" value="" name="date_of_birthb" id="date_of_birthb" placeholder="Date Of Birth" type="text">
                                                                </div>
                                                                <!-- /.input group -->
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="rolec" class="col-sm-4 control-label">Role</label>
                                                            <div class="col-sm-8">
                                                                <select class="form-control select0033c" style="width: 100%;">
                                                                    <option>HOD</option>
                                                                    <option>Exam Officer</option>
                                                                    <option>Lecturer</option>
                                                                    <option>Staff</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="col-sm-offset-2 col-sm-10 ">
                                                                <button class="btn btn-primary pull-right navigatio_nbtn" data-toggle="tab" aria-expanded="true" href="#">Next</button>
                                                            </div>
                                                        </div>
                                                    </form>

                                                </div><!-- /.tab-pane -->

                                                <div class="tab-pane fade" id="Personal_Information_2b">
                                                    <form class="form-horizontal">
                                                        <div class="form-group">
                                                            <label for="genderb" class="col-sm-4 control-label" placeholder="Gender">Gender</label>
                                                            <div class="col-sm-8">
                                                                <select class="form-control select003b" style="width: 100%;">
                                                                    <option>Male</option>
                                                                    <option>Female</option>
                                                                </select></div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="marital_statusb" class="col-sm-4 control-label">Marital Status</label>
                                                            <div class="col-sm-8">
                                                                <select class="form-control select0003b" style="width: 100%;">
                                                                    <option>Single</option>
                                                                    <option>Married</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="addressb" class="col-sm-4 control-label">Address</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="addressb" id="addressb" placeholder="Address">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="cityb" class="col-sm-4 control-label">City</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="cityb" id="cityb" placeholder="City" type="text">
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="phoneb" class="col-sm-4 control-label">Phone</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="phoneb" id="phoneb" placeholder="Phone" type="text">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="designationb" class="col-sm-4 control-label">Designation</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="designationb" id="designationb" placeholder="Designation" type="text">
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
                                                <div class="tab-pane fade" id="academic_infob">
                                                    <form class="form-horizontal">
                                                        <div class="form-group">
                                                            <label for="highest_level_of_educationb" class="col-sm-4 control-label">Highest Level of Eduation</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="highest_level_of_educationb" id="highest_level_of_educationb" placeholder="Highest Level of Eduation" type="text">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="major_field_of_studyb" class="col-sm-4 control-label">Major Field of Study</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="major_field_of_studyb" id="major_field_of_studyb" placeholder="Major Field of Study" type="text">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="institution_attendedb" class="col-sm-4 control-label">Institution Attended</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="institution_attendedb" id="institution_attendedb" placeholder="Institution Attended" type="text">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="all_academic_certificatesb" class="col-sm-4 control-label">list all academic certificates</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="all_academic_certificatesb" id="all_academic_certificatesb" placeholder="e.g FSLC, WAEC, NECO, Jamb, NYSC etc " type="text">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="rank_oneb" class="col-sm-4 control-label">Rank One</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="rank_oneb" id="rank_oneb" placeholder="Rank One" type="text">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="rank_twob" class="col-sm-4 control-label">Rank Two</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" value="" name="rank_twob" id="rank_twob" placeholder="Rank Two" type="text" >
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
                                                <div class="tab-pane fade" id="profile_imagesb">
                                                    <!-- Profile Image -->
                                                    <form class="form-horizontal">
                                                        <div class="member wow bounceInUp animated animated" style="visibility: visible; animation-name: bounceInUp;">
                                                            <div class="member-container" data-wow-delay=".1s">
                                                                <div class="inner-container">
                                                                    <div class="author-avatar">
                                                                        <img id="uploadImage" class="img-rounded center-block imgsm" src="http://192.168.0.101:8080/ProfileImage/thumbnails/${user.image_name}" alt="Team Member" width="293" height="293">

                                                                        <div class="content-box center-block3">
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
                                                            <button class="btn btn-primary pull-right navigatio_nbtn" data-toggle="tab" aria-expanded="false" id="save_edited_lecturer" data-dismiss="modal">Save Changes</button>
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

                $('#save_lecturer').on('click', function(){
                    var first_name = $('#firstname').val();
                    var last_name = $('#lastname').val();
                    var other_name = $('#othername').val();
                    var email = $('#email').val();
                    var date_of_birth = $('#date_of_birth').val();
                    var role = $('.select0033b').val();
                    var gender = $('.select003').val();
                    var marital_status = $('.select0003').val();
                    var address = $('#address').val();
                    var city = $('#city').val();
                    var phone = $('#phone').val();
                    var designation = $('#designation').val();
                    var highest_level_of_education = $('#highest_level_of_education').val();
                    var major_field_of_study = $('#major_field_of_study').val();
                    var institution_attended = $('#institution_attended').val();
                    var all_academic_certificates = $('#all_academic_certificates').val();
                    var rank_one = $('#rank_one').val();
                    var rank_two = $('#rank_two').val();


                    $.ajax({
                        url: 'save_lecturer_data',
                        type: 'POST',
                        data: {first_name: first_name, last_name: last_name, other_name: other_name, email: email,
                            date_of_birth: date_of_birth, role: role, gender: gender, marital_status: marital_status,
                            address: address, city: city, phone: phone, designation: designation,
                            highest_level_of_education: highest_level_of_education, major_field_of_study: major_field_of_study,
                            institution_attended: institution_attended, all_academic_certificates: all_academic_certificates, rank_one: rank_one, rank_two: rank_two},
                        cache: false,
                        success: function(data){

                            alert(data);
                            $.ajax({
                                url: 'saveimagedir',
                                type: 'POST',
                                cache: false,
                                success: function(dataRecords){
                                    alert(dataRecords);
                                    $('#lecturer_table').DataTable().ajax.reload(null, false);
                                    // $('#info').html('Uploaded Successfully!').delay('4000').fadeOut(400);
                                    // $('#modal-default2').blur();
                                },
                                error: function(data){
                                }
                            });
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

                var table2 = $('#lecturer_table').DataTable({
                    Filter: true,
                    processing: true,
                    responsive: false,
                    scrollY: 300,
                    scrollX: false,
                    ajax: {
                        url: 'all_lecturer',
                        dataType: 'json'

                    },
                    columns: [
                        //{data: 'tulip_staffId'},
                        {data: 'first_name'},
                        {data: 'last_name'},
                        {data: 'other_name'},
                        {data: 'email'},
                        {data: 'date_of_birth'},
                        {data: 'highest_level_education'},
                        {data: 'major_field_of_study'}
                    ]
                });

                $('#lecturer_table tbody').on('click', 'tr', function(){
                    if($(this).hasClass('selected')){
                        $(this).removeClass('selected');
                    }else{
                        table2.$('tr.selected').removeClass('selected');
                        $(this).addClass('selected');
                    }
                });

                $('#genrate').on('click', function(event){
                    event.preventDefault();

                    var num = $('#num').val();
                    var st_num = num.replace(/\D/g, '');
                    var pin_value = $('#pin_value').val();
                    if(st_num < 1)
                    {
                        alert("You can not enter null values");
                    }else
                    {
                        $.ajax({
                            url: 'student_pin',
                            type: 'POST',
                            data: {num: st_num, pin_value: pin_value},
                            cache: false,
                            success: function(dataRecords){
                                $('#pin_table').DataTable().ajax.reload(null, false);
                                $('#num').val("");
                                alert(dataRecords);

                            },
                            error: function(xhr, status, error){
                                var acc = []
                                $.each(xhr, function(index, value){
                                    acc.push(index + ': ' + value);
                                });
                                alert(JSON.stringify(acc));
                            }
                        });



                    }
                    // alert("am here " + st_num + " " + pin_value);
                });

                $('.edit_lecturer').click(function(){
                    var data_row = table2.row('.selected').data();
                    $('#firstnameb').val(data_row.first_name);
                    $('#lastnameb').val(data_row.last_name);
                    $('#othernameb').val(data_row.other_name);
                    $('#emailb').val(data_row.other_name);
                    $('#roleb').val(data_row.role);
                    $('#date_of_birthb').datepicker({format: 'yyyy-mm-dd'});
                    var caltime = data_row.date_of_birth;
                    $('#date_of_birthb').datepicker('update', caltime);
                    var gender = data_row.gender;
                    $('.select003b option').each(function(){
                        var data = $(this).val();

                        if(gender === data)
                        {
                            $('.select003b').val(data).trigger('change');
                        }
                    });

                    var marital_status = data_row.marital_status;
                    $('.select0003b option').each(function(){
                        var data = $(this).val();

                        if(marital_status === data)
                        {
                            $('.select0003b').val(data).trigger('change');
                        }
                    });
                    $('#addressb').val(data_row.address);
                    $('#cityb').val(data_row.city);
                    $('#phoneb').val(data_row.phone);
                    $('#highest_level_of_educationb').val(data_row.highest_level_education);
                    $('#major_field_of_studyb').val(data_row.institution_attended);
                    $('#institution_attendedb').val(data_row.institution_attended);
                    $('#all_academic_certificatesb').val(data_row.all_academic_certificates);
                    $('#designationb').val(data_row.designation);
                    $('#rank_oneb').val(data_row.rank_one);
                    $('#rank_twob').val(data_row.rank_two);
                    $('#timesb').val(data_row.image_name);
                    $('.imgsm').attr("src", "http://192.168.0.101:8080/ProfileImage/thumbnails/" + data_row.image_name);

                });

//

//////////////save edited lecturer or staff
                $('#save_edited_lecturer').click(function(){
                    var data_row = table2.row('.selected').data();
                    var first_name = $('#firstnameb').val();
                    var last_name = $('#lastnameb').val();
                    var other_name = $('#othernameb').val();
                    var email = $('#emailb').val();
                    var role = $('#roleb').val();
                    var date_of_birth = $('#date_of_birthb').val();
                    var gender = $('.select003b').val();

                    var marital_status = $('.select0003b').val();
                    var address = $('#addressb').val();
                    var city = $('#cityb').val();
                    var phone = $('#phoneb').val();
                    var highest_level_of_education = $('#highest_level_of_educationb').val();
                    var major_field_of_study = $('#major_field_of_studyb').val();
                    var institution_attended = $('#institution_attendedb').val();
                    var all_academic_certificates = $('#all_academic_certificatesb').val();
                    var designation = $('#designationb').val(data_row.designation);
                    var rank_one = $('#rank_oneb').val(data_row.rank_one);
                    var rank_two = $('#rank_twob').val(data_row.rank_two);
                    $('#timesb').val(data_row.image_name);
                    $('.imgsm').attr("src", "http://192.168.0.101:8080/ProfileImage/thumbnails/" + data_row.image_name);

                    $.ajax({
                        url: 'save_edited_lecturer_data',
                        type: 'POST',
                        data: {first_name: first_name, last_name: last_name, other_name: other_name, email: email,
                            date_of_birth: date_of_birth, role: role, gender: gender, marital_status: marital_status,
                            address: address, city: city, phone: phone, designation: designation,
                            highest_level_of_education: highest_level_of_education, major_field_of_study: major_field_of_study,
                            institution_attended: institution_attended, all_academic_certificates: all_academic_certificates, rank_one: rank_one, rank_two: rank_two},
                        cache: false,
                        success: function(data){

                            alert(data);

                        },
                        error: function(data){
                        }
                    });

                });


                $('.forAllInput').prop("disabled", true);

            });
        </script>
    </body>
</html>
