<%--
    Document   : header
    Created on : Jul 13, 2019, 4:23:51 PM
    Author     : EKPES
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="user" class="ScienceEdu.user.User" scope="session"/>
<c:set var="skinColor" scope="session" value="${user.role eq 'Lecturer' ? 'skin-blue' : (user.role eq 'Student' || user.role eq 'Admin' ? 'skin-green' :  'skin-purple') }"/>
<header class="main-header">
    <!-- Logo -->
    <a href="../../index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>Sc.</b>EDU</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Science</b>EDUCATION</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->

          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <div class="user-image aaa"><img src="http://192.168.0.101:8080/ProfileImage/thumbnails/${user.image_name}" class="user-image nuImage3" alt="Image"></div>
              <span class="hidden-xs">${user.first_name} ${user.last_name}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header bbb">
                 <img src="http://192.168.0.101:8080/ProfileImage/thumbnails/${user.image_name}" class="img-circle nuImage" alt="Image">

                <p>
                    ${user.first_name} ${user.last_name} - ${user.designation}
                  <small>Member since Nov. 2012</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">Followers</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Sales</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Friends</a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="logout" class="btn btn-default btn-flat">Log out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
