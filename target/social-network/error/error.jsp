<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Oooooops...</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
</head>
<body style="text-align: center;">
	<h1 style="color: red;font-size: 100px;">Oooooooooooooooooooooops...Something goes wrong</h1>
	<h4 style="color: #888888;font-size: 40px;">If you see this page, please<b style="color: #00aaaa;font-size: 70px;">access by the computer</b></h4>
	<b style="color: #999999;font-size: 30px;">We thought that accessing by the computer will give you the best experience.</b>
	<br>
	<b style="color: #aaaaaa;font-size: 30px;">But we didn't find your computer,</b>
	<br>
	<b style="color: #bbbbbb;font-size: 30px;">which make us very sad</b>
</body>
</html>