<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin-Head</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link href="${APP_PATH }/static/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="${APP_PATH }/static/css/base.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expanded="false">
            <span class="sr-only">Toggle navigation</span> <span
                class="icon-bar"></span> <span class="icon-bar"></span> <span
                class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="${APP_PATH }/common/getAll_Admin"><b>Administrator</b></a>
    </div>

    <div class="collapse navbar-collapse"
         id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav navbar-left">
            <li class="active"><a id="usermanage" href="#">User Management</a></li>
            <li class="active"><a id="articlemanage" href="#">Article Management</a></li>
            <li class="active"><a id="forummanage" href="#">Forum Management</a></li>
        </ul>

        <!-- Determine whether to login, this is the content displayed when not logged in -->
        <ul class="nav navbar-nav navbar-right">
            <c:if test="${empty adminList}">
                <li>
                    <!-- Upper right -->
                    <a href="#"
                       data-toggle="modal" data-target="#adminLoginModal">
                        Login
                    </a>
                </li>
            </c:if>
            <!-- Determine whether to login, this is the content displayed when logging in. -->
            <c:if test="${!empty adminList}">
                <!-- Logout of administrator login -->
                <li>
                    <!-- Upper right -->
                    <a class="dropdown-toggle" href="${APP_PATH }/adminController/adminExit">
                        Logout
                    </a>
                </li>
                <!-- Login administrator information -->
                <li>
                    <!-- Upper right -->
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <img class="img-circle pull-left img-responsive nav-user-img"
                             src="${APP_PATH }/static/img/admin/user.jpg"/>
                        &nbsp;Admin-${adminList.aname }
                    </a>

                    <!-- Upper right (open) -->
                    <ul class="dropdown-menu dropdown-menu-right clearfix"
                        style="padding-top: 0;">
                        <li class="user-li-head"><span> <img
                                class="img-circle nav-user-img-dropdown center-block"
                                src="${APP_PATH }/static/img/admin/user.jpg"/></span>
                            <p></p>
                            <p class="text-center">
                                <span>Administrator</span>
                            </p>
                            <p class="text-center">
                                <span>${adminList.aname}</span>
                            </p>
                            <p class="text-center">
                                <small><span>${adminList.atime}</span></small>
                            </p>
                        </li>
                    </ul>
                </li>
            </c:if>
        </ul>
    </div>
</nav>

<script src="${APP_PATH }/static/js/jquery-3.3.1.min.js"></script>
<script src="${APP_PATH }/static/bootstrap/js/bootstrap.js"></script>
<script src="${APP_PATH }/static/bootstrap/js/npm.js"></script>
</body>
</html>