<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
    <!-- Admin page-head -->
    <jsp:include page="/admin/head.jsp"></jsp:include>
    <!-- Administrator page-login / registration -->
    <jsp:include page="/admin/login.jsp"></jsp:include>
    <!-- Administrator-body content -->
    <div class="wrapper fade-in">
        <jsp:include page="/admin/content.jsp"></jsp:include>
        <!-- Admin page-post an article -->
        <jsp:include page="/admin/forum.jsp"></jsp:include>
    </div>


<script type="text/javascript" color="0,0,255" opacity='0.8' zIndex="-2" count="300"
        src="${APP_PATH }/static/js//canvas-nest.js"></script>
</body>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin (Background)</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link href="${APP_PATH }/static/img/favicon.ico" rel='icon' type='image/x-icon'/>
    <link href="${APP_PATH }/static/css/base.css" rel="stylesheet"/>
    <link href="${APP_PATH }/static/bootstrap/css/bootstrap.css" rel="stylesheet"/>
</head>
</html>