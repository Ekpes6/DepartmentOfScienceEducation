<%--
    Document   : PinGenerator
    Created on : Jul 18, 2019, 9:25:24 PM
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
                        Pin Generator
                        <small>it all starts here</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="scienceEduPage"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Lecturers</a></li>
                        <li class="active">Pin Generator</li>
                    </ol>
                </section>
                <!-- Content Header (Page header) ending -->

                <!-- Main content -->
                <section class="content">

                    <!-- Default box -->
                    <div class="box">
                        <div class="box-header with-border">
                            <div class="box-body" >
                                <div type="button" class="btn btn-info create_pin" data-toggle="modal" data-target="#modal-default2">
                                    <i class="fa fa-asl-interpreting"> Generate Pin</i>
                                </div>


                                <div type="button" class="btn btn-warning edit_pin" data-toggle="modal" data-target="#modal-default02">
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
                        <div class="box-body content_print">
                            <table id="pin_table" class="table table-bordered table-striped display hover">
                                <thead>
                                    <tr>
                                        <th>Reference User</th>
                                        <th>Pin</th>
                                        <th>Status</th>
                                        <th>Date Created</th>

                                    </tr>
                                </thead>
                                <tbody>


                                </tbody>

                                <tfoot>
                                    <tr>
                                        <th>Reference User</th>
                                        <th>Pin</th>
                                        <th>Status</th>
                                        <th>Date Created</th>


                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">

                    <div class="row no-print">
                    <div class="col-xs-12">
                      <a href="#" class="btn btn-default preview"><i class="fa fa-print"></i> Print</a>

                    </div>
                  </div>
                        </div>
                        <!-- /.box-footer-->
                    </div>
                    <!-- /.box -->

                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <!-- /.generate pin modal begining-->
            <div class="modal fade in" id="modal-default2" style="display: none; padding-right: 17px;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span></button>
                            <h4 class="modal-title">Generate Pin</h4>
                        </div>
                        <div class="modal-body">
                            <section class="content">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div >
                                            <form class="form-horizontal">
                                                <div class="form-group has-feedback">
                                                    <input type="text" id="num" class="form-control disabled" placeholder="Number of Pin to Generate" name="num" value="" data-inputmask='"mask": " 9"' data-mask>
                                                    <input type="hidden" id="pin_value"   name="pin_value" value="15">
                                                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                                                </div>

                                            </form>

                                        </div><!-- /.tab-pane -->
                                    </div><!-- /.col -->
                                </div>
                            </section>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal" id="genrate" >Generate</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
             <!-- /.generate pin modal ending -->
              <!-- /.edit pin modal begining-->
            <div class="modal fade in" id="modal-default02" style="display: none; padding-right: 17px;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span></button>
                            <h4 class="modal-title">Edit Pin</h4> <div id="times"></div>
                        </div>
                        <div class="modal-body">
                            <section class="content">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div >
                                            <form class="form-horizontal">
                                                <div class="form-group">
                                                    <label for="ref_user" class="col-sm-2 control-label">Reference User</label>
                                                    <div class="col-sm-10">
                                                        <input class="form-control forAllInput" name="ref_user" id="ref_user" placeholder="Reference User" type="text">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="pin" class="col-sm-2 control-label">Pin</label>
                                                    <div class="col-sm-10">
                                                        <input class="form-control forAllInput" value="" name="pin" id="pin" placeholder="Pin" type="text">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="status" class="col-sm-2 control-label">Status</label>
                                                    <div class="col-sm-10">
                                                        <select class="form-control select2" style="width: 100%;" >
                                                            <option>Used</option>
                                                            <option>Unused</option>
                                                        </select></div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="pin_date" class="col-sm-2 control-label"> Date</label>
                                                    <div class="col-sm-10">
                                                        <div class="input-group date">
                                                            <div class="input-group-addon">
                                                                <i class="fa fa-calendar"></i>
                                                            </div>
                                                            <input class="form-control forAllInput" value="" name="pin_date" id="pin_date" placeholder="Date" type="text">
                                                        </div>
                                                        <!-- /.input group -->
                                                    </div>
                                                </div>
                                            </form>

                                        </div><!-- /.tab-pane -->
                                    </div><!-- /.col -->
                                </div>
                            </section>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal" id="save_ref">Save changes</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
               <!-- /.edit pin modal ending-->

            <!-- Control Sidebar -->
            <jsp:include page="WEB-INF/ControlSideBar/ControlSideBar.jsp"/>
            <!-- /.control-sidebar -->
            <!-- Add the sidebar's background. This div must be placed
                 immediately after the control sidebar -->
            <div class="control-sidebar-bg"></div>
        </div>
        <!-- ./wrapper -->

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
        <script src="js/jquery.PrintArea.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="js/demo.js"></script>

        <script>
            $(document).ready(function(){
                $('.sidebar-menu').tree();

                $('[data-mask]').inputmask();

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

                var table2 = $('#pin_table').DataTable({
                    Filter: true,
                    processing: true,
                    responsive: false,
                    ajax: {
                        url: 'all_generated_pin',
                        dataType: 'json'

                    },
                    columns: [
                        //{data: 'tulip_staffId'},
                        {data: 'first_name'},
                        {data: 'pin'},
                        {data: 'status'},
                        {data: 'date_generated'}
                    ]
                });

                $('#pin_table tbody').on('click', 'tr', function(){
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
                ////////////////////////
                $('.preview').click(function(){
                    var mode = 'iframe'; // popup
                var close = mode === "popup";
                var options = {mode: mode, popClose: close};
                $("div.content_print").printArea(options);
                });






                ////////////////////////////
                $('.edit_pin').click(function(){
                    var data_row = table2.row('.selected').data();
                    $('#ref_user').val(data_row.first_name);
                    $('#pin').val(data_row.pin);
                    var status = data_row.status;
                    $('.select2 option').each(function(){
                        var data = $(this).val();

                        if(status === data)
                        {
                            $('.select2').val(data).trigger('change');
                        }
                    });
                    $('#pin_date').datepicker({format: 'yyyy-mm-dd'});
                    var caltime = data_row.date_generated;
                    var m = caltime.split(" ");
                    $('#pin_date').datepicker('update', m[0]);
                    $('#times').html(m[1]);

                });

                $('#save_ref').click(function(){
                    //var data_row = table2.row('.selected').data();
                    //alert($('.select2').val());
                });

                $('.forAllInput').prop("disabled", true);

            });
        </script>
    </body>
</html>

