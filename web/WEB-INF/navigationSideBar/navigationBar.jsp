<%--
    Document   : navigationBar
    Created on : Jul 13, 2019, 4:10:28 PM
    Author     : EKPES
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="user" class="ScienceEdu.user.User" scope="session"/>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image bbb">
                <img src="http://192.168.0.101:8080/ProfileImage/thumbnails/${user.image_name}" class="img-circle nuImage" alt="Image">
            </div>
            <div class="pull-left info">
                <p>${user.first_name} ${user.last_name}</p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- search form -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search...">
                <span class="input-group-btn">
                    <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                    </button>
                </span>
            </div>
        </form>
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">MAIN NAVIGATION</li>
            <!--<li class="treeview">
              <a href="#">
                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
              <ul class="treeview-menu">
                <li><a href="../../index.html"><i class="fa fa-circle-o"></i> Dashboard v1</a></li>
                <li><a href="../../index2.html"><i class="fa fa-circle-o"></i> Dashboard v2</a></li>
              </ul>
            </li>-->
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-pie-chart"></i>
                    <span>Student</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <c:if test="${(user.role eq 'Lecturer') || (user.role eq 'HOD') || (user.role eq 'Exam Officer')|| (user.role eq 'Staff')}">
                        <li><a href="register_student"><i class="fa fa-eraser"></i> Student Registration</a></li>
                        <li><a href="edit_student"><i class="fa fa-edit"></i> Edit Student Record</a></li>
                        </c:if>
                        <c:if test="${(user.role eq 'Student')}">
                        <li><a href="myprofile"><i class="fa fa-paint-brush"></i> My Profile</a></li>
                        </c:if>

                    <c:if test="${(user.role eq 'Lecturer')|| (user.role eq 'HOD') || (user.role eq 'Exam Officer') || (user.role eq 'Staff')}">
                        <li><a href="result_list"><i class="fa fa-y-combinator-square"></i> Enter Results</a></li>
                         <li><a href="emanual"><i class="fa fa-book"></i> Enter Results Manually</a></li>
                        </c:if>
                        <c:if test="${(user.role eq 'Lecturer')|| (user.role eq 'HOD') || (user.role eq 'Exam Officer') || (user.role eq 'Student')}">
                        <li><a href="check_result"><i class="fa fa-check"></i>Check Results</a></li>
                         <li><a href="my_result"><i class="fa fa-check"></i>My Results</a></li>
                        </c:if>

                    <!--<li><a href="#"><i class="fa fa-circle-o"></i> Result Charts</a></li>-->
                </ul>
            </li>
            <c:if test="${(user.role eq 'Lecturer')}">
                <!--<li class="treeview">
                    <a href="#">
                        <i class="fa fa-laptop"></i>
                        <span>Courses</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="../UI/general.html"><i class="fa fa-circle-o"></i> Biology</a></li>
                        <li><a href="../UI/buttons.html"><i class="fa fa-circle-o"></i> Chemistry</a></li>
                        <li><a href="../UI/sliders.html"><i class="fa fa-circle-o"></i> Mathematics </a></li>
                        <li><a href="../UI/timeline.html"><i class="fa fa-circle-o"></i> Physics</a></li>


                    </ul>
                </li>-->
            </c:if>

            <li class="treeview">
                <c:if test="${(user.role eq 'Lecturer') || (user.role eq 'HOD') || (user.role eq 'Exam Officer') || (user.role eq 'Staff')}">
                <a href="#">
                    <i class="fa fa-edit"></i> <span>Lecturers</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                 </c:if>
                <ul class="treeview-menu">
                    <!--<li><a href="../forms/general.html"><i class="fa fa-circle-o"></i> General Profile</a></li>
                    <li><a href="../forms/advanced.html"><i class="fa fa-circle-o"></i> Advanced Elements</a></li>-->
                    <c:if test="${(user.role eq 'Lecturer') || (user.role eq 'HOD') || (user.role eq 'Exam Officer')}">
                        <li><a href="lecturers_registration"><i class="fa fa-eraser"></i> Lecturers Registration</a></li>
                        <li><a href="ecourses"><i class="fa fa-y-combinator-square"></i> Enter Courses</a></li>
                   
                        </c:if>

                    <c:if test="${(user.role eq 'Lecturer') || (user.role eq 'HOD') || (user.role eq 'Exam Officer') || (user.role eq 'Staff')}">
                        <li><a href="lecturers_profile"><i class="fa fa-paint-brush"></i> Lecturers Profile</a></li>
                        <li><a href="generate_pin"><i class="fa fa-gears"></i> Pin Generator</a></li>
                        </c:if>

                </ul>
            </li>
			<c:if test="${(user.role eq 'Lecturer')|| (user.role eq 'HOD') || (user.role eq 'Exam Officer') || (user.role eq 'Staff')}">
               <li class="treeview">
                    <a href="#">
                        <i class="fa fa-laptop"></i>
                        <span>Credentials</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="upload_my_credentials"><i class="fa fa-upload"></i> Upload My Credentials</a></li>
                        <li><a href="check_credentials"><i class="fa fa-check"></i> Check Credentials</a></li>
                </ul>
                </li>
            </c:if>




            <!--<li><a href="https://adminlte.io/docs"><i class="fa fa-book"></i> <span>Documentations</span></a></li>-->

        </ul>

    </section>
    <!-- /.sidebar -->
</aside>