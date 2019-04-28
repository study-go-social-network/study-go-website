<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin-Subject</title>
        <%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<body>
<div class="container-fluid">
    <div class="row" style="margin-top: 70px">
        <!--Right part-->
        <div class="col-md-12 col-md-offset-0">
            <!--User management-->
            <div class="col-md-12 usermanage">
                <div class="panel panel-default ">
                    <div class="panel-heading"><b>User Management</b></div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-bordered tb-hover">
                                <thead>
                                <tr>
                                    <td>ID</td>
                                    <td>Name</td>
                                    <td>Age</td>
                                    <td>Sex</td>
                                    <td>Address</td>
                                    <td>Email</td>
                                    <td>Brief Intro</td>
                                    <td>Creation Time</td>
                                    <td>Avatar</td>
                                    <td style="text-align: center;">Operation</td>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- Start of the loop -->
                                <c:forEach var="listUser" items="${listUser }" varStatus="varStatus">
                                    <tr>
                                        <td>${varStatus.count }</td>
                                        <td>${listUser.name }</td>
                                        <td>${listUser.age }</td>
                                        <td>${listUser.sex }</td>
                                        <td>${listUser.email }</td>
                                        <td>${listUser.family }</td>
                                        <td>${listUser.intro }</td>
                                        <td>${listUser.time }</td>
                                        <td style="position: relative;width:80px; height: 80px; text-align: center;">
                                            <c:if test="${listUser.userphoto==null}">
                                                <samp class="text-warning">Default Avatar</samp>
                                            </c:if>
                                            <c:if test="${listUser.userphoto!=null}">
                                                <a href="${APP_PATH }/static/upload/user/${listUser.userphoto }"
                                                   target="_brank">
                                                    <img src="${APP_PATH }/static/upload/user/${listUser.userphoto }"
                                                         style="position: relative; width: 100%; height: 100%;">
                                                </a>
                                            </c:if>
                                        </td>

                                        <td style="text-align: center;">
                                            <c:if test="${empty adminList}">
                                                <span class="glyphicon glyphicon-ban-circle" style="color:red;"></span>
                                            </c:if>
                                            <c:if test="${!empty adminList}">
                                                <form action="${APP_PATH}/userController/deleteUser" method="post">
                                                    <input type="hidden" name="userid" value="${listUser.userid}">
                                                    <button type="submit" class="btn btn-danger btn-xs"
                                                            onclick="return user_del();">Delete
                                                    </button>
                                                </form>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <!-- End of the loop -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!--Article Management-->
            <div class="col-md-12 articlemanage" style="">
                <div class="panel panel-default ">
                    <div class="panel-heading">Article Management</div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-bordered tb-hover">
                                <thead>
                                <tr>
                                    <td>ID</td>
                                    <td>Title</td>
                                    <td>Content</td>
                                    <td>Picture</td>
                                    <td>Publisher</td>
                                    <td>Forum</td>
                                    <td>Creation Time</td>
                                    <td>Review Status</td>
                                    <td style="text-align: center;">Operation</td>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- Start of the loop -->
                                <c:forEach var="listArticle" items="${listArticle }" varStatus="varStatus">
                                    <tr>
                                        <td>
                                            <div style="width:10px;word-wrap:break-word;">${varStatus.count }</div>
                                        </td>
                                        <td>
                                            <div style="width:50px;word-wrap:break-word;">${listArticle.titles }</div>
                                        </td>
                                        <td>
                                            <div style="width:300px;word-wrap:break-word;">${listArticle.fcontent }</div>
                                        </td>
                                        <td>
                                            <div style="position: relative;width:100px;height:100px;">
                                                <c:if test="${listArticle.photo!=\"photo\" }">
                                                    <a href="${APP_PATH }/static/upload/article/${listArticle.photo }"
                                                       target="_brank">
                                                        <img src="${APP_PATH }/static/upload/article/${listArticle.photo }"
                                                             style="position: relative; width: 100%; height: 100%;">
                                                    </a>
                                                </c:if>
                                            </div>
                                        </td>
                                        <td>${listArticle.username }</td>
                                        <td>${listArticle.bname }</td>
                                        <td>${listArticle.time }</td>
                                        <td style="text-align: center;">
                                            <%--<!-- Waiting for review -->--%>
                                            <%--<c:if test="${listArticle.status==0 }">--%>
                                                <%--<button type="button" class="btn btn-warning btn-sm"--%>
                                                        <%--disabled="disabled">--%>
                                                    <%--Waiting for review...--%>
                                                <%--</button>--%>
                                            <%--</c:if>--%>
                                            <!-- Review passed -->
                                            <c:if test="${listArticle.status==1 }">
                                                <button type="button" class="btn btn-info btn-sm" disabled="disabled">
                                                    Review
                                                    passed
                                                </button>
                                            </c:if>
                                            <!-- Review failed -->
                                            <c:if test="${listArticle.status==2 }">
                                                <button type="button" class="btn btn-danger btn-sm" disabled="disabled">
                                                    Review failed
                                                </button>
                                            </c:if>
                                        </td>

                                        <td style="text-align: center;">
                                            <!-- Not login -->
                                            <c:if test="${empty adminList}">
                                                <span class="glyphicon glyphicon-ban-circle" style="color:red;"></span>
                                            </c:if>
                                            <!-- Already login -->
                                            <c:if test="${!empty adminList}">
                                                <%--<!-- Waiting for review -->--%>
                                                <%--<c:if test="${listArticle.status==0 }">--%>
                                                    <%--<form action="${APP_PATH}/articleController/articleStatus"--%>
                                                          <%--method="post">--%>
                                                        <%--<input type="hidden" name="userid"--%>
                                                               <%--value="${listArticle.userid}">--%>
                                                        <%--<input type="hidden" name="fid" value="${listArticle.fid }">--%>
                                                        <%--<input type="hidden" name="status" value="1">--%>
                                                        <%--<input type="submit" class="btn btn-info btn-sm" value="Pass"/>--%>
                                                    <%--</form>--%>
                                                    <%--<br>--%>
                                                    <%--<form action="${APP_PATH}/articleController/articleStatus"--%>
                                                          <%--method="post">--%>
                                                        <%--<input type="hidden" name="userid"--%>
                                                               <%--value="${listArticle.userid}">--%>
                                                        <%--<input type="hidden" name="fid" value="${listArticle.fid }">--%>
                                                        <%--<input type="hidden" name="status" value="2">--%>
                                                        <%--<input type="submit" class="btn btn-danger btn-sm"--%>
                                                               <%--value="Reject"/>--%>
                                                    <%--</form>--%>
                                                <%--</c:if>--%>
                                                <!-- Review passed -->
                                                <c:if test="${listArticle.status==1 }">
                                                    <form action="${APP_PATH}/articleController/articleStatus"
                                                          method="post">
                                                        <input type="hidden" name="userid"
                                                               value="${listArticle.userid}">
                                                        <input type="hidden" name="fid" value="${listArticle.fid }">
                                                        <input type="hidden" name="status" value="2">
                                                        <input type="submit" class="btn btn-danger btn-sm"
                                                               value="Reject"/>
                                                    </form>
                                                </c:if>
                                                <!-- Review failed -->
                                                <c:if test="${listArticle.status==2 }">
                                                    <form action="${APP_PATH}/articleController/articleStatus"
                                                          method="post">
                                                        <input type="hidden" name="userid"
                                                               value="${listArticle.userid}">
                                                        <input type="hidden" name="fid" value="${listArticle.fid }">
                                                        <input type="hidden" name="status" value="1">
                                                        <input type="submit" class="btn btn-info btn-sm" value="Pass"/>
                                                    </form>
                                                </c:if>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <!-- End of the loop -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!--Forum Management-->
            <div class="col-md-12 forummanage" style="">
                <div class="panel panel-default ">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-10">Forum Management</div>
                            <c:if test="${!empty adminList}">
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-success btn-sm" data-toggle="modal"
                                            data-target="#forum">Add
                                    </button>
                                </div>
                            </c:if>
                        </div>
                    </div>

                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-bordered tb-hover">
                                <thead>
                                <tr>
                                    <td>ID</td>
                                    <td>Forum Name</td>
                                    <td>Creation Time</td>
                                    <td style="text-align: center;">Operation</td>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- Start of the loop -->
                                <c:forEach var="forums" items="${forum }" varStatus="varStatus">
                                    <tr>
                                        <td>${varStatus.count}</td>
                                        <td>${forums.bname}</td>
                                        <td>${forums.btime}</td>

                                        <td style="text-align: center;">
                                            <c:if test="${empty adminList}">
                                                <span class="glyphicon glyphicon-ban-circle" style="color:red;"></span>
                                            </c:if>
                                            <c:if test="${!empty adminList}">
                                                <form action="${APP_PATH}/forumController/getUpdateForum" method="post">
                                                    <input type="hidden" name="bid" value="${forums.bid}">
                                                    <input type="hidden" name="bname" value="${forums.bname}">
                                                    <button type="submit" class="btn btn-info btn-xs"
                                                            data-toggle="modal"
                                                            data-target="#forumEdit">Update
                                                    </button>
                                                </form>
                                                <br>
                                                <form action="${APP_PATH}/forumController/deleteForum" method="post">
                                                    <input type="hidden" name="bid" value="${forums.bid}">
                                                    <button type="submit" class="btn btn-danger btn-xs"
                                                            onclick="return b_del();">Delete
                                                    </button>
                                                </form>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <!-- End of the loop -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<script src="${APP_PATH }/static/js/admin.js"></script>
<script src="${APP_PATH }/static/js/delete.js"></script>
<script>
    /**
     * User deletion confirmation
     * @returns
     */
    function user_del() {
        var msg = "Are you sure to delete this user?\n\nIt cannot be restored after deletion!";
        if (confirm(msg) == true) {
            return true;
        } else {
            return false;
        }
    }
</script>
</body>
</html>