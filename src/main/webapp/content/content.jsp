<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Subject Content</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>

    <link href="${APP_PATH}/static/css/css.css" rel="stylesheet">
</head>
<body>
<!--Subject-->
<div class="container">
    <div class="row">
        <!--Left part-->
        <div id="content_left">
            <div class="left_part">
                <div class="hidden">
                    <c:forEach var="listArticle" items="${listArticle }">
                        <!-- Show only posts that have passed the review -->
                        <c:if test="${listArticle.status==1 }">
                            <div class="row show_article">
                                <div class="col-md-12 show_article_go">
                                    <div class="row">
                                        <div class="col-xs-7 col-md-9"
                                             style="position: relative; padding-top: 10px;">
                                            <small>From:
                                                <c:url value="${APP_PATH }/common/getArticleBname" var="bnameurl">
                                                    <c:param name="bname" value="${listArticle.bname }"/>
                                                </c:url>
                                                <a href="${bnameurl }">${listArticle.bname }</a>
                                            </small>
                                        </div>
                                        <div class="col-xs-5 col-md-3"
                                             style="position: relative; padding-top: 10px;">
                                            <small>${listArticle.time }</small>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-xs-2 col-md-1">
                                            <a href="${APP_PATH}/userController/getOthers?userid=${listArticle.userid }">
                                                <c:if test="${listArticle.userphoto==null }">
                                                    <img class="img_head" alt="Brand"
                                                         src="${APP_PATH}/static/img/head.png">
                                                </c:if>
                                                <c:if test="${listArticle.userphoto!=null }">
                                                    <img class="img_head" alt="Brand"
                                                         src="${APP_PATH }/static/upload/user/${listArticle.userphoto }">
                                                </c:if>
                                            </a>
                                        </div>
                                        <div class="col-xs-6 col-md-8">
                                            <a class="a_b"
                                               href="${APP_PATH}/userController/getOthers?userid=${listArticle.userid }">
                                                <h5 class="bottom_left_name">
                                                    <!-- Author name -->
                                                    <b>${listArticle.username }</b>
                                                </h5>
                                            </a>
                                        </div>
                                        <div class="col-xs-4 col-md-3">
                                            <!-- The follow button is displayed after the user logs in.
                                                 If the user is logged in, the follow button is not displayed. -->
                                            <c:if test="${!empty username && listArticle.username!=username}">
                                                <!-- Initialize follow_record to "false" each time the post is traversed -->
                                                <c:set var="follow_record" value="false"></c:set>
                                                <!-- Traverse the follow table information -->
                                                <c:forEach var="follow" items="${follow }">
                                                    <!-- Determine whether the user corresponding to the post is followed,
                                                    and if so, save "true" to "follow_record" --->
                                                    <c:if test="${follow.userid==userid && follow.beuserid==listArticle.userid }">
                                                        <form action="${APP_PATH }/followController/deleteFollow"
                                                              method="post">
                                                            <input type="hidden" name="gid" value="${follow.gid }">
                                                            <input type="hidden" name="beuserid"
                                                                   value="${listArticle.userid }">
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <button type="submit" class="btn btn-sm unfollow">
                                                                Unfollow
                                                            </button>
                                                        </form>
                                                        <!-- Assign "true" to follow_record when the user is followed -->
                                                        <c:set var="follow_record" value="true"></c:set>
                                                    </c:if>
                                                </c:forEach>
                                                <!-- Determine if there is "false" in follow_record,
                                                there is a user indicating that the post has not been followed -->
                                                <c:if test="${follow_record==\"false\" }">
                                                    <form action="${APP_PATH }/followController/setFollow"
                                                          method="post">
                                                        <input type="hidden" name="userid" value="${userid }">
                                                        <input type="hidden" name="beuserid"
                                                               value="${listArticle.userid }">
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <button type="submit" class="btn btn-info btn-sm">
                                                            <samp class="glyphicon glyphicon-plus"></samp> Follow
                                                        </button>
                                                    </form>
                                                </c:if>
                                            </c:if>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <a class="bottom_left_aaa a_b" href="#">
                                                <h4>
                                                    <!-- Article Title -->
                                                    <b>${listArticle.titles }</b>
                                                </h4>
                                            </a>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <!-- Article content -->
                                            <p>${listArticle.fcontent }</p>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <c:if test="${listArticle.photo!=\"photo\" }">
                                                <a href="${APP_PATH}/static/upload/article/${listArticle.photo }"
                                                   target="_blank">
                                                    <img class="img_content"
                                                         src="${APP_PATH}/static/upload/article/${listArticle.photo }">
                                                </a>
                                            </c:if>
                                        </div>
                                    </div>

                                    <br>
                                    <div class="row" style="position: relative;top: -10px;">
                                        <div class="col-xs-10 col-md-6">
                                            <div class="col-xs-5 col-md-6">
                                                <small>${listArticle.sum } comments</small>
                                            </div>
                                            <div class="col-xs-7 col-md-6">
                                                <!-- The heart-shaped favorite is displayed only after the user logs in.
                                                     If the user does not login as the user,
                                                     the heart-shaped favorite won't displayed. -->
                                                <c:if test="${!empty username && listArticle.username!=username }">
                                                    <!-- Initialize favorite_record to "false" each time the post is traversed -->
                                                    <c:set var="favorite_record" value="false"></c:set>
                                                    <!-- Traverse the favorite information -->
                                                    <c:forEach var="favorite" items="${favorite }">
                                                        <!-- Determine if the article is bookmarked,
                                                        and if so, save "true" to "favorite_record"--->
                                                        <c:if test="${favorite.userid==userid && favorite.fid==listArticle.fid}">
                                                            <form action="${APP_PATH }/favoriteController/deleteFavorite"
                                                                  method="post">
                                                                <input type="hidden" name="sid"
                                                                       value="${favorite.sid }">
                                                                <input type="hidden" name="fid"
                                                                       value="${listArticle.fid}">
                                                                <button type="submit"
                                                                        style="border: none;background-color: #ffffff;">
                                                                    <samp title="Cancel favorite"
                                                                          class="glyphicon glyphicon-heart favorite_end"></samp>
                                                                </button>
                                                            </form>
                                                            <!-- Assign "true" to favorote_record -->
                                                            <c:set var="favorite_record" value="true"></c:set>
                                                        </c:if>
                                                    </c:forEach>
                                                    <!-- Determine whether there is "false" in the favorite_record,
                                                    and if so, it means that the corresponding user has not been followed -->
                                                    <c:if test="${favorite_record==\"false\" }">
                                                        <form action="${APP_PATH }/favoriteController/setFavorite"
                                                              method="post">
                                                            <input type="hidden" name="userid" value="${userid }">
                                                            <input type="hidden" name="fid"
                                                                   value="${listArticle.fid }">
                                                            <button type="submit"
                                                                    style="border: none;background-color: #ffffff;">
                                                                <samp title="favorite"
                                                                      class="glyphicon glyphicon-heart favorite"></samp>
                                                            </button>
                                                        </form>
                                                    </c:if>
                                                </c:if>
                                                <!-- The text favorite is displayed when the user is not logged in. -->
                                                <c:if test="${empty username && listArticle.username!=username }">
                                                    <small>Add to favorite<br>after logging in</small>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- The comment box is displayed after the user logs in -->
                                    <c:if test="${!empty username}">
                                        <!--Comment box-->
                                        <div class="row" style="position: relative; margin-top: 10px;">
                                            <div class="col-xs-12 col-md-12">
                                                <form action="${APP_PATH }/commentController/setComment">
                                                    <div class="col-xs-10 col-md-11">
                                                        <input type="hidden" name="userid" value="${userid }">
                                                        <input type="hidden" name="fid" value="${listArticle.fid }">
                                                        <input type="text" class="form-control"
                                                               id="pcontent" name="pcontent"
                                                               placeholder="Write your comment..." required>
                                                    </div>
                                                    <div class="col-xs-2 col-md-1">
                                                        <button type="submit" class="btn btn-success"
                                                                style="position: relative; left: -25px;">Reply
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </c:if>

                                    <!-- Comment display (loop here)-->
                                    <c:set var="listComment_Fid" value="listComment_${listArticle.fid }"></c:set>
                                    <c:forEach var="comment_list" items="${map[listComment_Fid]}">
                                        <hr style="position: relative; margin-top: 5px;">
                                        <div class="row" style="position: relative; margin-top: -10px;">
                                            <div class="col-md-12">
                                                <a class="a_p"
                                                   href="${APP_PATH}/userController/getOthers?userid=${comment_list.userid }">
                                                    <!-- Commenter name -->
                                                    <b>${comment_list.name}</b>
                                                </a>
                                                &nbsp;&nbsp;&nbsp;
                                                <!-- Time -->
                                                <small>${comment_list.time }</small>
                                                <!-- Comment content -->
                                                <p>${comment_list.pcontent}</p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <!--Comment display (loop-end)-->

                                    <br>
                                    <div class="row">
                                        <div class="col-md-12"
                                             style="position: relative; background-color: #eee; height: 10px;"></div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="list">Loading...</div>
                <div class="text-center more">
                    <a class="text-info" href="javascript:;" onClick="left_part.loadMore();">Click ---> To load
                        more</a>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12"
                     style="position: relative; background-color: #eee; height: 30px;"></div>
            </div>
        </div>


        <!--Right part-->
        <div id="content_right">
            <div class="row">
                <div class="col-md-12"
                     style="position: relative; padding-top: 10px;">
                    <b>All Forum</b>
                    <hr>
                </div>
            </div>

            <!-- All forums - start loop -->
            <div class="row">
                <c:forEach var="forum" items="${forum }" varStatus="status">
                    <div class="col-xs-4 col-md-4">
                        <c:url value="${APP_PATH }/common/getArticleBname" var="bnameurl">
                            <c:param name="bname" value="${forum.bname }"/>
                        </c:url>
                        <a href="${bnameurl }">
                            <div class="text-center">
                                <img class="img_right_logo_forum" src="${APP_PATH}/static/img/backside.png">
                                <p>${forum.bname }</p>
                            </div>
                        </a>
                    </div>
                    <!-- Add some line breaks every 3 times -->
                    <c:if test="${status.count%3==0 }">
                        <br><br><br><br>
                    </c:if>
                </c:forEach>
            </div>
            <!-- All forums - end loop -->

            <div class="row">
                <div class="col-md-12"
                     style="position: relative; background-color: #eee; height: 10px;"></div>
            </div>

            <div class="row">
                <div class="col-md-12"
                     style="position: relative; padding-top: 10px;">
                    <b>Popular</b>
                    <hr>
                </div>
            </div>

            <c:forEach var="listArticle" items="${listArticle }">
                <!-- Show only articles that have passed the review -->
                <c:if test="${listArticle.status==1 && listArticle.sum>1 }">
                    <div class="row">
                        <div class="col-md-12">
                            <a href="${APP_PATH }/articleController/getArticleFid?fid=${listArticle.fid }">${listArticle.titles }</a>
                        </div>
                        <div class="col-md-12">
                            <br>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>

        <div id="usermanual">
            <button type="button" class="btn btn-info">
                <a href="https://drive.google.com/open?id=1pBjM4Q9Bzpek6stHO5apiaKj1Mf34rkK" style="color:inherit;" target="_blank">Help</a>
            </button>
        </div>
    </div>
</div>


<jsp:include page="/content/top.jsp"></jsp:include>

<script src="${APP_PATH }/static/js/phones_pc.js"></script>
<script src="${APP_PATH }/static/js/load_more.js"></script>
<script src="${APP_PATH }/static/js/floater.js"></script>
</body>
</html>