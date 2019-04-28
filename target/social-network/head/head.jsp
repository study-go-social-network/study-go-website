<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags must be placed at the forefront, and any other content must follow it! -->
    <title>Home Page（Not login）</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link href="${APP_PATH}/static/bootstrap/css/bootstrap.css"
          rel="stylesheet">
    <link href="${APP_PATH}/static/css/css.css" rel="stylesheet">
</head>
<body>
<!--Navigation bar (head)-->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed"
                            data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                            aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span> <span
                            class="icon-bar"></span> <span class="icon-bar"></span> <span
                            class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="${APP_PATH}/index.jsp">
                        <p><b>Study GO</b></p>
                    </a>
                </div>
                <!-- Favorite the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse"
                     id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="${APP_PATH}/index.jsp">Home </a></li>
                        <li class="active"><a href="${APP_PATH}/rankingController/getRanking">User Rank </a></li>
                    </ul>
                    <form class="navbar-form navbar-left" action="${APP_PATH }/common/getArticleTitle" method="post">
                        <div class="row">
                            <div class="col-xs-9 col-md-8">
                                <input type="text" name="articleTitle" class="form-control" placeholder="Search..."
                                       required>
                            </div>
                            <div class="col-xs-3 col-md-4">
                                <button type="submit" class="btn btn-success">Search</button>
                            </div>
                        </div>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <c:if test="${empty username}">
                            <li>
                                <a data-toggle="modal" data-target="#loginModal" href="#">Login</a>
                            </li>
                        </c:if>
                        <c:if test="${!empty username}">
                            <li>
                                <a href="${APP_PATH}/forumController/getforum" data-toggle="modal" data-target="#faTie">Post</a>
                            </li>
                            <!-- pc -->
                            <li class="dropdown"><a href="#" class="dropdown-toggle"
                                                    data-toggle="dropdown" role="button" aria-haspopup="true"
                                                    aria-expanded="false">${username}<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <div class="row">
                                            <div class="col-xs-3 col-md-6 myself_img">
                                                <a href="${APP_PATH}/userController/getMyself">
                                                    <img class="img_right_logo"
                                                         src="${APP_PATH}/static/img/profile.png">
                                                </a>
                                            </div>
                                            <div class="col-xs-3 col-md-6  myself_text">
                                                <a href="${APP_PATH}/userController/getMyself">Profile</a>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="row">
                                            <div class="col-xs-3 col-md-6 myself_img">
                                                <a href="#" data-toggle="modal" data-target="#setup">
                                                    <img class="img_right_logo"
                                                         src="${APP_PATH}/static/img/setting.png">
                                                </a>
                                            </div>
                                            <div class="col-xs-6 col-md-6 myself_text">
                                                <a href="#" data-toggle="modal" data-target="#setup">Settings</a>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="row">
                                            <div class="col-xs-3 col-md-6 myself_img">
                                                <a href="${APP_PATH}/userController/userExit">
                                                    <img class="img_right_logo"
                                                         src="${APP_PATH}/static/img/exit.png">
                                                </a>
                                            </div>
                                            <div class="col-xs-6 col-md-6 myself_text">
                                                <a href="${APP_PATH}/userController/userExit">Logout</a>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </li>

                            <!-- mobile -->
                            <%-- <li id="myself_li_phones" class="dropdown"><a href="#" class="dropdown-toggle"
                                data-toggle="dropdown" role="button" aria-haspopup="true"
                                aria-expanded="false">${username}<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <div class="row">
                                            <div class="col-xs-4 col-xs-offset-1">
                                                <a class="text-info" href="${APP_PATH}/userController/getMyself">Profile</a>
                                            </div>

                                            <div class="col-xs-3">
                                                <a class="text-info" href="#" data-toggle="modal" data-target="#setup">Settings</a>
                                            </div>

                                            <div class="col-xs-3">
                                                <a class="text-info" href="${APP_PATH}/userController/userExit">Exit</a>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </li> --%>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>

<script src="${APP_PATH }/static/js/phones_pc.js"></script>
<script src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
<script src="${APP_PATH}/static/bootstrap/js/bootstrap.js"></script>
</body>
</html>