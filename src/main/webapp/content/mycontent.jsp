<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Personal Home Page</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link href="${APP_PATH}/static/css/css.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <!--Upper part-->
    <div class="row">
        <div class="col-md-10 col-md-offset-1"
             style="background-color: #ffffff; border-radius: 2px;">
            <div class="row">
                <div>
                    <img
                            style="position: relative; width: 100%; height: 500px; border-top-left-radius: 2px; border-top-right-radius: 2px;"
                            src="${APP_PATH }/static/img/hello.jpg">
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <a href="#" data-toggle="modal" data-target="#userPhoto">
                        <c:if test="${myListUser.userphoto==null }">
                            <img class="img-thumbnail"
                                 style="position: relative; width: 140px; height: 140px; left: 10px; top: -20px;"
                                 src="${APP_PATH }/static/img/head.png">
                        </c:if>
                        <c:if test="${myListUser.userphoto!=null }">
                            <img class="img-thumbnail"
                                 style="position: relative; width: 140px; height: 140px; left: 10px; top: -20px;"
                                 src="${APP_PATH }/static/upload/user/${myListUser.userphoto }">
                        </c:if>
                    </a>
                </div>
                <div class="col-md-12 col-xs-12">
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Username -->
                            <b style="font-size: 22px;">${myListUser.name }</b>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-12">
                            <b>Location</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span>${myListUser.family }</span>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-12">
                            <b>Brief Intro</b> &nbsp;&nbsp;&nbsp; <span>${myListUser.intro }</span>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-12">
                            <b>Email</b> &nbsp;&nbsp;&nbsp; <span>${myListUser.email }</span>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-10 col-xs-7">
                            <b>Sex</b> &nbsp;&nbsp;&nbsp; <span>${myListUser.sex }</span>
                            <br>
                            <br>
                            <b>Age</b> &nbsp;&nbsp;&nbsp; <span>${myListUser.age }</span>
                        </div>
                        <br>
                        <div class="col-md-2 col-xs-2">
                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#edit">
                                Edit
                            </button>
                        </div>
                    </div>
                    <br>

                </div>
            </div>
        </div>
    </div>

    <!--Lower part-->
    <div class="row" style="position: relative; top: 10px;">
        <div class="col-md-10 col-md-offset-1"
             style="background-color: #ffffff; border-radius: 2px;">
            <div>
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <!-- News feed -->
                    <c:forEach items="${myListArticles }" varStatus="varStatus">
                        <c:set var="count_Article" value="${varStatus.count }"></c:set>
                    </c:forEach>
                    <!-- Reply -->
                    <c:forEach items="${myComments_reply }" varStatus="varStatus">
                        <c:set var="count_Comment" value="${varStatus.count }"></c:set>
                    </c:forEach>
                    <!-- Favorite -->
                    <c:forEach var="myListFavorite" items="${myListFavorites }" varStatus="varStatus">
                        <c:set var="count_Favorite" value="${varStatus.count }"></c:set>
                    </c:forEach>

                    <li role="presentation" class="active">
                        <a href="#home" aria-controls="home" role="tab" data-toggle="tab">News Feed
                            <samp>${count_Article }</samp></a>
                    </li>
                    <li role="presentation">
                        <a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Reply
                            <samp>${count_Comment }</samp></a>
                    </li>
                    <li role="presentation">
                        <a href="#follow" aria-controls="follow" role="tab" data-toggle="tab">Following</a>
                    </li>
                    <li role="presentation">
                        <a href="#favorite" aria-controls="favorite" role="tab" data-toggle="tab">Favorite
                            <samp>${count_favorite }</samp></a>
                    </li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                    <br>
                    <!-- Article loop - start (news feed) -->
                    <div role="tabpanel" class="tab-pane active" id="home">
                        <c:if test="${myListArticles==\"[]\" }">
                            <br><br><br><br>
                            <div class="text-center">
                                <img alt="No Articles" src="${APP_PATH }/static/img/article.png">
                                <p style="color: #999999">You are lazy, not posting anything yet...</p>
                            </div>
                            <br><br><br><br>
                        </c:if>
                        <c:forEach var="myListArticle" items="${myListArticles }">
                            <!--News feed-->
                            <div class="row">
                                <div class="col-xs-7 col-md-6">
                                    <!-- Article review status -->
                                    <small>Review Status：</small>
                                    <!-- Waiting for review -->
                                    <c:if test="${myListArticle.status==0 }">
                                        <small class="btn-warning">Waiting for review...</small>
                                    </c:if>
                                    <!-- Review passed -->
                                    <c:if test="${myListArticle.status==1 }">
                                        <small class="text-success"><b>Review passed</b></small>
                                    </c:if>
                                    <!-- Review failed -->
                                    <c:if test="${myListArticle.status==2 }">
                                        <small class="btn-danger">Review failed</small>
                                    </c:if>
                                </div>
                                <div class="col-xs-5 col-md-2 col-md-offset-4"
                                     style="position: relative;">
                                    <!-- Time -->
                                    <small>${myListArticle.time }</small>
                                </div>

                                <div class="col-xs-12 col-md-12">
                                    <h4>
                                        <!-- Title -->
                                        <b>${myListArticle.titles }</b>
                                    </h4>
                                </div>
                                <div class="col-xs-12 col-md-12">
                                    <!-- Content -->
                                    <p>${myListArticle.fcontent }</p>
                                </div>
                                <div class="col-xs-12 col-md-12">
                                    <c:if test="${myListArticle.photo!=\"photo\" }">
                                        <a href="${APP_PATH }/static/upload/article/${myListArticle.photo }"
                                           target="_blank">
                                            <img src="${APP_PATH }/static/upload/article/${myListArticle.photo }"
                                                 style="position: relative; width: 30%; height: 30%;">
                                        </a>
                                    </c:if>
                                </div>
                                <div class="col-xs-7 col-md-10"></div>
                                <div class="col-xs-2 col-md-1">
                                    <form action="${APP_PATH }/articleController/getUpdateArticle">
                                        <input type="hidden" name="fid" value="${myListArticle.fid }">
                                        <input type="hidden" name="titles" value="${myListArticle.titles }">
                                        <input type="hidden" name="bname" value="${myListArticle.bname }">
                                        <input type="hidden" name="fcontent" value="${myListArticle.fcontent }">
                                        <input type="hidden" name="photo" value="${myListArticle.photo }">

                                        <button type="submit" class="btn btn-info btn-sm">Update</button>
                                    </form>
                                </div>
                                <div class="col-xs-3 col-md-1">
                                    <form action="${APP_PATH }/articleController/deleteArticle">
                                        <input type="hidden" name="fid" value="${myListArticle.fid }">
                                        <input type="hidden" name="userid" value="${myListArticle.userid}">
                                        <button type="submit" class="btn btn-danger btn-sm" onclick="return f_del();">
                                            Delete
                                        </button>
                                    </form>
                                </div>
                            </div>

                            <!--Comment - loop start (news feed)-->
                            <c:set var="myListComment_Fid" value="myListComment_${myListArticle.fid }"></c:set>
                            <c:forEach var="myComment_list" items="${map[myListComment_Fid]}">
                                <hr style="position: relative; margin-top: 2px;height:1px;border:none;border-top:1px dashed #dddddd;">
                                <div class="row" style="position: relative; margin-top: -10px;">
                                    <div class="col-xs-9 col-md-11">
                                        <a href="${APP_PATH}/userController/getOthers?userid=${myComment_list.userid }"
                                           class="a_p">
                                            <!-- Commenter name -->
                                            <b>${myComment_list.name }</b>
                                        </a>
                                        &nbsp;&nbsp;&nbsp;
                                        <small>${myComment_list.time }</small>
                                        <!-- Commenter content -->
                                        <p>${myComment_list.pcontent }</p>
                                    </div>
                                    <div class="col-xs-3 col-md-1">
                                        <form action="${APP_PATH }/commentController/deleteComment">
                                            <input type="hidden" name="cid" value="${myComment_list.cid }">
                                            <button type="submit" class="btn btn-danger btn-sm"
                                                    onclick="return p_del();">Delete
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </c:forEach>
                            <!--Comment - end of loop (news feed)-->
                            <hr style="height:1px;border:none;border-top:1px solid #bbbbbb;">
                        </c:forEach>
                        <!-- Article loop - end (news feed) -->
                    </div>

                    <!--Reply-->
                    <!-- Article loop - start (news feed) -->
                    <div role="tabpanel" class="tab-pane" id="profile">
                        <c:if test="${myComments_reply==\"[]\" }">
                            <br><br><br><br>
                            <div class="text-center">
                                <img alt="Did not comment on the post" src="${APP_PATH }/static/img/comment.png">
                                <p style="color: #999999">You are lazy, not commenting on any articles yet.</p>
                            </div>
                            <br><br><br><br>
                        </c:if>
                        <c:forEach var="myComment_reply" items="${myComments_reply }">
                            <c:set var="myArticle_Fid" value="myArticle_${myComment_reply.fid }"></c:set>
                            <!-- Show only articles that have passed the review -->
                            <c:if test="${map_reply[myArticle_Fid].status==1 }">
                                <div class="row">
                                    <div class="col-xs-7 col-md-6">
                                        <!-- Author -->
                                        <small>Author：${map_reply[myArticle_Fid].username }</small>
                                    </div>
                                    <div class="col-xs-5 col-md-2 col-md-offset-4"
                                         style="position: relative;">
                                        <!-- Time -->
                                        <small>${map_reply[myArticle_Fid].time }</small>
                                    </div>

                                    <div class="col-xs-12 col-md-12">
                                        <h4>
                                            <!-- Title -->
                                            <b>${map_reply[myArticle_Fid].titles}</b>
                                        </h4>
                                    </div>
                                    <div class="col-xs-12 col-md-12">
                                        <!-- Content -->
                                        <p>${map_reply[myArticle_Fid].fcontent}</p>
                                    </div>
                                    <div class="col-xs-12 col-md-12">
                                        <c:if test="${map_reply[myArticle_Fid].photo!=\"photo\" }">
                                            <a href="${APP_PATH }/static/upload/article/${map_reply[myArticle_Fid].photo }"
                                               target="_blank">
                                                <img src="${APP_PATH }/static/upload/article/${map_reply[myArticle_Fid].photo }"
                                                     style="position: relative; width: 30%; height: 30%;">
                                            </a>
                                        </c:if>
                                    </div>
                                </div>

                                <!--Comment - loop start (reply)-->
                                <c:set var="myListComment_Fid"
                                       value="myListComment_reply_${myComment_reply.fid }"></c:set>
                                <c:forEach var="myComment_list" items="${map_reply_p[myListComment_Fid]}">
                                    <hr style="position: relative; margin-top: 2px;height:1px;border:none;border-top:1px dashed #dddddd;">
                                    <div class="row" style="position: relative; margin-top: -10px;">
                                        <div class="col-xs-10 col-md-11">
                                            <a href="${APP_PATH}/userController/getOthers?userid=${myComment_list.userid }"
                                               class="a_p">
                                                <!-- Commenter name -->
                                                <b>${myComment_list.name }</b>
                                            </a>
                                            &nbsp;&nbsp;&nbsp;
                                            <!-- Time -->
                                            <small>${myComment_list.time }</small>
                                            <!-- Commenter content -->
                                            <p>${myComment_list.pcontent }</p>
                                        </div>
                                        <!-- If the reviewer is the user,
                                             you can modify your own comments, otherwise you can't -->
                                        <c:if test="${myComment_list.userid==userid }">
                                            <form action="${APP_PATH }/commentController/deleteComment">
                                                <input type="hidden" name="cid" value="${myComment_list.cid }">
                                                <button type="submit" class="btn btn-danger btn-sm"
                                                        onclick="return p_del();">Delete
                                                </button>
                                            </form>
                                        </c:if>
                                    </div>
                                </c:forEach>
                                <!--Comment - end of loop (reply)-->
                                <hr style="height:1px;border:none;border-top:1px solid #bbbbbb;">
                            </c:if>
                        </c:forEach>
                        <!-- Article loop - end (reply) -->
                    </div>


                    <!--Follow-->
                    <div role="tabpanel" class="tab-pane" id="follow">
                        <ul class="nav nav-tabs" role="tablist">
                            <!-- Following -->
                            <c:forEach var="myListFollow" items="${myListFollows }" varStatus="varStatus">
                                <c:set var="icare_count" value="${varStatus.count }"></c:set>
                            </c:forEach>
                            <!-- Follower -->
                            <c:forEach var="myListFollow" items="${myListFollows_be }" varStatus="varStatus">
                                <c:set var="careme_count" value="${varStatus.count }"></c:set>
                            </c:forEach>
                            <li role="presentation" class="active">
                                <a href="#icare" aria-controls="icare" role="tab" data-toggle="tab">Following
                                    <samp>${icare_count }</samp></a>
                            </li>
                            <li role="presentation">
                                <a href="#careme" aria-controls="careme" role="tab" data-toggle="tab">Follower
                                    <samp>${careme_count }</samp></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="icare">
                                <c:if test="${myListFollows==\"[]\" }">
                                    <br><br><br><br>
                                    <div class="text-center">
                                        <img alt="No follow" src="${APP_PATH }/static/img/follow.png">
                                        <p style="color: #999999">Maybe you haven’t met someone you’re interested in
                                            yet...</p>
                                    </div>
                                    <br><br><br><br>
                                </c:if>
                                <c:if test="${myListFollows!=\"[]\" }">
                                    <br>
                                    <c:forEach var="myListFollow" items="${myListFollows }">
                                        <div class="row">
                                            <div class="col-xs-3 col-md-2">
                                                <a href="${APP_PATH}/userController/getOthers?userid=${myListFollow.userid }">
                                                    <!-- The user has updated the avatar -->
                                                    <c:if test="${myListFollow.userphoto!=null }">
                                                        <img class="img-thumbnail" alt="Brand"
                                                             style="position:relative;width: 70px;height: 70px;"
                                                             src="${APP_PATH }/static/upload/user/${myListFollow.userphoto }">
                                                    </c:if>
                                                    <!-- The user has not updated the avatar, only the default avatar -->
                                                    <c:if test="${myListFollow.userphoto==null }">
                                                        <img class="img-thumbnail" alt="Brand"
                                                             style="position:relative;width: 70px;height: 70px;"
                                                             src="${APP_PATH }/static/img/head.png">
                                                    </c:if>
                                                </a>
                                            </div>
                                            <div class="col-xs-5 col-md-8">
                                                <a class="a_b"
                                                   href="${APP_PATH}/userController/getOthers?userid=${myListFollow.userid }">
                                                    <!-- Aurhor name -->
                                                    <b style="font-size: 16px;">${myListFollow.name }</b>
                                                </a>
                                                <br>
                                                <samp>${myListFollow.intro }</samp>
                                                <br>
                                                <samp>Follower: <b class="text-success">${myListFollow.followcount }</b></samp>
                                            </div>
                                            <div class="col-xs-4 col-md-2 follow">
                                                <form action="${APP_PATH }/followController/deleteFollowMyself">
                                                    <a href="#">
                                                        <input type="hidden" name="userid" value="${userid }">
                                                        <input type="hidden" name="beuserid"
                                                               value="${myListFollow.userid }">
                                                        <button type="submit" class="btn button2 btn-sm"
                                                                style="width:80px;">Unfollow
                                                        </button>
                                                        <button type="submit" class="btn" style="width:80px;">Followed
                                                        </button>
                                                    </a>
                                                </form>
                                            </div>
                                        </div>
                                        <hr>
                                    </c:forEach>
                                </c:if>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="careme">
                                <c:if test="${myListFollows_be==\"[]\" }">
                                    <br><br><br><br>
                                    <div class="text-center">
                                        <img alt="No one following you" src="${APP_PATH }/static/img/follow.png">
                                        <p style="color: #999999">Come on! Catch people's eyes!</p>
                                    </div>
                                    <br><br><br><br>
                                </c:if>
                                <c:if test="${myListFollows_be!=\"[]\" }">
                                    <br>
                                    <c:forEach var="myListFollow_be" items="${myListFollows_be }">
                                        <div class="row">
                                            <div class="col-xs-3 col-md-2">
                                                <a href="${APP_PATH}/userController/getOthers?userid=${myListFollow_be.userid }">
                                                    <!-- The user has updated the avatar -->
                                                    <c:if test="${myListFollow_be.userphoto!=null }">
                                                        <img class="img-thumbnail" alt="Brand"
                                                             style="position:relative;width: 70px;height: 70px;"
                                                             src="${APP_PATH }/static/upload/user/${myListFollow_be.userphoto }">
                                                    </c:if>
                                                    <!-- The user has not updated the avatar, only the default avatar -->
                                                    <c:if test="${myListFollow_be.userphoto==null }">
                                                        <img class="img-thumbnail" alt="Brand"
                                                             style="position:relative;width: 70px;height: 70px;"
                                                             src="${APP_PATH }/static/img/head.png">
                                                    </c:if>
                                                </a>
                                            </div>
                                            <!--  <div class="col-xs-5 col-md-8" style="margin-left: -70px;"> -->
                                            <div class="col-xs-9 col-md-8">
                                                <a class="a_b"
                                                   href="${APP_PATH}/userController/getOthers?userid=${myListFollow_be.userid }">
                                                    <!-- Author name -->
                                                    <b style="font-size: 16px;">${myListFollow_be.name }</b>
                                                </a>
                                                <br>
                                                <samp>${myListFollow_be.intro }</samp>
                                                <br>
                                                <samp>Follower: <b
                                                        class="text-success">${myListFollow_be.followcount }</b></samp>
                                            </div>
                                        </div>
                                        <hr>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </div>

                    <!-- Favorite -->
                    <div role="tabpanel" class="tab-pane" id="favorite">
                        <c:if test="${myListFavorites==\"[]\" }">
                            <br><br><br><br>
                            <div class="text-center">
                                <img alt="No Favorite" src="${APP_PATH }/static/img/follow.png">
                                <p style="color: #999999">Find something interesting!</p>
                            </div>
                            <br><br><br><br>
                        </c:if>
                        <c:if test="${myListFavorites!=\"[]\" }">
                            <br>
                            <c:forEach var="myListFavorite" items="${myListFavorites }">
                                <div class="row">
                                    <div class="col-xs-2 col-md-1">
                                        <form action="${APP_PATH }/favoriteController/deleteFavoriteByUseridAndFid"
                                              method="post">
                                            <input type="hidden" name="userid" value="${userid }">
                                            <input type="hidden" name="fid" value="${myListFavorite.fid }">
                                            <button type="submit" style="border: none;background-color: #ffffff;">
                                                <samp title="Cancel Favorite"
                                                      class="glyphicon glyphicon-heart favorite_end"></samp>
                                            </button>
                                        </form>
                                    </div>
                                    <div class="col-xs-10 col-md-9">
                                        <a href="${APP_PATH }/articleController/getArticleFid?fid=${myListFavorite.fid }">${myListFavorite.titles }</a>
                                    </div>
                                    <div class="col-xs-5 col-md-2 col-xs-offset-7">
                                        <small>${myListFavorite.time }</small>
                                    </div>
                                </div>
                                <hr>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="usermanual">
        <a href="https://drive.google.com/open?id=1pBjM4Q9Bzpek6stHO5apiaKj1Mf34rkK" style="color:inherit;" target="_blank">
            <button type="button" class="btn btn-info">
                H
                <br>
                E
                <br>
                L
                <br>
                P
            </button>
        </a>
    </div>
</div>
<br>
</div>

<script src="${APP_PATH }/static/js/delete.js"></script>
<script src="${APP_PATH }/static/js/floater.js"></script>
</body>
</html>