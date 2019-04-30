<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ranking</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>

    <link href="${APP_PATH}/static/css/css.css" rel="stylesheet">
</head>
<body>
    <div class="table-responsive">
        <table align="center" border="3" width="70%" style="text-align:center; background-color: #ffffff;">
            <tr>
                <th style="text-align:center;">Name</th>
                <th style="text-align:center;">Study Time</th>
                <th style="text-align:center;">Rating</th>
                <th style="text-align:center;">Post Number</th>
                <th style="text-align:center;">Favorite Number</th>
                <th style="text-align:center;">Follow Number</th>
                <th style="text-align:center;">Level</th>
                <th style="text-align:center;">Study Success</th>
                <th style="text-align:center;">Total</th>
            </tr>
            <c:forEach items="${rs }" var="r" varStatus="st">
                <tr>
                    <td>${r.username}</td>
                    <td>${r.time}</td>
                    <td>${r.rate}</td>
                    <td>${r.postnum}</td>
                    <td>${r.favoritenum}</td>
                    <td>${r.follownum}</td>
                    <td>${r.level}</td>
                    <td>${r.sstime}</td>
                    <td>${r.total}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div id="usermanual">
        <button type="button" class="btn btn-info">
            <a href="https://drive.google.com/open?id=1pBjM4Q9Bzpek6stHO5apiaKj1Mf34rkK" style="color:inherit;"
               target="_blank">Help</a>
        </button>
    </div>
</body>
</html>
