<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Rank</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link href="${APP_PATH }/static/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="${APP_PATH }/static/img/favicon.ico" rel='icon' type='image/x-icon'/>
</head>
<body>
    <!-- Home page-head -->
	<jsp:include page="/head/head.jsp"></jsp:include>
    <!-- Profile-login / registration -->
	<jsp:include page="/login/login.jsp"></jsp:include>
	<!-- Profile-post an article -->
	<jsp:include page="/head/posted.jsp"></jsp:include>
	<!-- Profile-profile settings -->
	<jsp:include page="/head/setup.jsp"></jsp:include>

	<div class="wrapper fade-in">
		<!-- Ranking -->
		<jsp:include page="/content/rank.jsp"></jsp:include>
	</div>

	<script type="text/javascript" color="0,0,255" opacity='0.8' zIndex="-2" count="100" src="${APP_PATH }/static/js//canvas-nest.js"></script>
</body>
</html>
