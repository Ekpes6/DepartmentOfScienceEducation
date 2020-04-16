<%--
    Document   : 500
    Created on : Jul 20, 2019, 5:07:28 PM
    Author     : EKPES
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Error 500 | SCIENCE EDUCATION </title>
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

        <style type="text/css">
            .err-label {
                color: #330000;
                font-weight: bold;
                text-align: right;
                width: 150px;
                vertical-align: top;
            }
            .err-value {
                color: #000000;
                padding-left: 10px;
            }
            .stacktrace li:hover {
                background-color: black;
                color: #00cc00;
            }
        </style>
    </head>
    <!--
    BODY TAG OPTIONS:
    =================
    Apply one or more of the following classes to get the
    desired effect
    |---------------------------------------------------------|
    | SKINS         | skin-blue                               |
    |               | skin-black                              |
    |               | skin-purple                             |
    |               | skin-yellow                             |
    |               | skin-red                                |
    |               | skin-green                              |
    |---------------------------------------------------------|
    |LAYOUT OPTIONS | fixed                                   |
    |               | layout-boxed                            |
    |               | layout-top-nav                          |
    |               | sidebar-collapse                        |
    |               | sidebar-mini                            |
    |---------------------------------------------------------|
    -->
    <body class="hold-transition skin-purple sidebar-mini">
        <div class="wrapper">
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper firstMenu">
                <!-- Content Header (Page header) -->
                <section class="content-header firstMenu">
                    <div style="margin-bottom: 10px;">
                        <img alt="logo" src="dist/img/logo.png"/>
                    </div>
                    <h1>
                        Error 500
                        <small>Internal Server Error</small>
                    </h1>
                </section>
                <section class="secondMenu">
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Dashboard</a></li>
                        <li class="active">Error 500</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">

                    <div class="error-page">
                        <h2 class="headline text-red">Error 500</h2>
                        <div class="error-content">
                            <h3><i class="fa fa-warning text-red"></i> Oops! Something went wrong.</h3>
                            <p>
                                We will work on fixing that right away.
                                Meanwhile, you may <a href="home">return to dashboard</a> or <a href="#">contact the web developers.</a>
                            </p>
                        </div>
                    </div><!-- /.error-page -->

                </section><!-- /.content -->
                <!-- /.content -->
<!-- The embedding of the exception below is key! -->
<c:set var="throwable"  value="${requestScope['javax.servlet.error.exception']}"/>
<c:set var="statusCode"  value="${requestScope['javax.servlet.error.status_code']}"/>
<c:set var="servletName"  value="${requestScope['javax.servlet.error.servlet_name']}"/>
<c:set var="causeStr"  value="Unknown"/>
<c:choose>
    <c:when test="${throwable eq null and statusCode eq null}">
                <h2>Error information is missing</h2>
    </c:when>
    <c:otherwise>
        <c:set var="requestUri"  value="${requestScope['javax.servlet.error.request_uri']}"/>
        <c:set var="cause" value="${throwable.cause}"/>
        <c:if test="${servletName eq null}">
            <c:set var="servletName"  value="Unknown"/>
        </c:if>
        <c:if test="${requestUri eq null}">
            <c:set var="requestUri"  value="Unknown"/>
        </c:if>
        <c:if test="${cause ne null}">
            <c:set var="causeStr"  value="${cause.getClass().getName()}"/>
        </c:if>
        <c:choose>
            <c:when test="${statusCode ne 500}">
                <h3>Error Details</h3>
                <table>
                    <tr>
                        <td class="err-label">Status Code: </td>
                        <td class="err-value">${statusCode}</td>
                    </tr>
                    <tr>
                        <td class="err-label">Requested URI: </td>
                        <td class="err-value">${requestUri}</td>
                    </tr>
                </table>
            </c:when>
            <c:otherwise>
                <h3>Exception Details</h3>
                <table>
                    <tr>
                        <td class="err-label">Servlet Name: </td>
                        <td class="err-value">${servletName}</td>
                    </tr>
                    <tr>
                        <td class="err-label">Exception Name: </td>
                        <td class="err-value">${throwable.getClass().getName()}</td>
                    </tr>
                    <tr>
                        <td class="err-label">Requested URI: </td>
                        <td class="err-value">${requestUri}</td>
                    </tr>
                    <tr>
                        <td class="err-label">Exception Message: </td>
                        <td class="err-value">${throwable.message}</td>
                    </tr>
                    <tr>
                        <td class="err-label">Caused by: </td>
                        <td class="err-value">${causeStr}</td>
                    </tr>
                </table>
                <h3>Stack Trace</h3>
                <ul class="stacktrace">
                <c:forEach var="ste" items="${throwable.stackTrace}">
                    <li>at ${ste}</li>
                </c:forEach>
                </ul>
                <h3>Cause: Stack Trace</h3>
                <c:if test="${cause ne null}">
                    <ul class="stacktrace">
                    <c:forEach var="ste" items="${cause.stackTrace}">
                        <li>at ${ste}</li>
                    </c:forEach>
                    </ul>
                </c:if>
                <c:set var="innerCause" value="${cause.cause}"/>
                <c:if test="${innerCause ne null}">
                    <h3>Inner Cause: Stack Trace</h3>
                    <ul class="stacktrace">
                    <c:forEach var="ste" items="${innerCause.stackTrace}">
                        <li>at ${ste}</li>
                    </c:forEach>
                    </ul>
                </c:if>
                <c:set var="internalCause" value="${innerCause.cause}"/>
                <c:if test="${internalCause ne null}">
                    <h3>Internal Cause: Stack Trace</h3>
                    <ul class="stacktrace">
                    <c:forEach var="ste" items="${internalCause.stackTrace}">
                        <li>at ${ste}</li>
                    </c:forEach>
                    </ul>
                </c:if>
            </c:otherwise>
        </c:choose>
    </c:otherwise>
</c:choose>
            </div><!-- /.content-wrapper -->

            <jsp:include page="WEB-INF/fragments/footer.jsp"/>
            <!-- Control Sidebar -->
            <jsp:include page="WEB-INF/fragments/control-sidebar.jsp"/>
            <!-- /.control-sidebar -->
            <!-- Add the sidebar's background. This div must be placed
                 immediately after the control sidebar -->
            <div class="control-sidebar-bg"></div>
        </div><!-- ./wrapper -->

        <!-- REQUIRED JS SCRIPTS -->
        <jsp:include page="WEB-INF/fragments/scripts.jsp"/>

        <!-- Optionally, you can add Slimscroll and FastClick plugins.
             Both of these plugins are recommended to enhance the
             user experience. Slimscroll is required when using the
             fixed layout. -->
    </body>
</html>
