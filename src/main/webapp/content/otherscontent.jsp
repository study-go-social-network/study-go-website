<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Others Personal Home Page</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
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
						<c:if test="${othersListUser.userphoto==null }">
						<img class="img-thumbnail"
							style="position: relative; width: 140px; height: 140px; left: 10px; top: -20px;"
							src="${APP_PATH }/static/img/head.png">
						</c:if>
						<c:if test="${othersListUser.userphoto!=null }">
							<img class="img-thumbnail"
								style="position: relative; width: 140px; height: 140px; left: 10px; top: -20px;"
								src="${APP_PATH }/static/upload/user/${othersListUser.userphoto }">
						</c:if>
					</div>
					<div class="col-md-8">
						<div class="row">
							<div class="col-md-12">
								<!-- Name -->
								<b style="font-size: 22px;">${othersListUser.name }</b>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-12">
								<b>Brief Intro</b> &nbsp;&nbsp;&nbsp; <span>${othersListUser.intro }</span>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-12">
								<b>Sex</b> &nbsp;&nbsp;&nbsp; <span>${myListUser.sex }</span>
								<br>
								<br>
								<b>Age</b> &nbsp;&nbsp;&nbsp; <span>${myListUser.age }</span>
							</div>
						</div>
						<br>
					</div>
				</div>
			</div>
		</div>

		<!--Lower Part-->
		<div class="row" style="position: relative; top: 10px;">
			<div class="col-md-10 col-md-offset-1"
				style="background-color: #ffffff; border-radius: 2px;">
				<div>
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#home"
							aria-controls="home" role="tab" data-toggle="tab">News Feed</a></li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">
						<br>
						<c:if test="${othersListArticles==\"[]\" }">
							<br><br><br><br>
							<div class="text-center">
								<img alt="No Articles" src="${APP_PATH }/static/img/article.png">
								<p style="color: #999999">I am lazy, not posting anything yet...</p>
							</div>
							<br><br><br><br>
						</c:if>
						<!-- Article loop - start -->
						<c:forEach var="othersListArticle" items="${othersListArticles }">
							<!-- Show only articles that have passed the review -->
							<c:if test="${othersListArticle.status==1 }">
								<div role="tabpanel" class="tab-pane active" id="home">
									<div class="row">
										<div class="col-xs-5 col-md-2 col-md-offset-10 col-xs-offset-7"
											style="position: relative;">
											<!-- Time -->
											<small>${othersListArticle.time }</small>
										</div>
									
										<div class="col-xs-12 col-md-12">
											<h4>
												<!-- Title -->
												<b>${othersListArticle.titles }</b>
											</h4>
										</div>
										<div class="col-xs-12 col-md-12">
											<!-- Content -->
											<p>${othersListArticle.fcontent }</p>
										</div>
										<div class="col-xs-12 col-md-12">
											<c:if test="${othersListArticle.photo!=\"photo\" }">
												<a href="${APP_PATH }/static/upload/article/${othersListArticle.photo }" target="_blank">
													<img src="${APP_PATH }/static/upload/article/${othersListArticle.photo }"
														style="position: relative; width: 30%; height: 30%;">
												</a>
											</c:if>
										</div>
									</div>
		
									<!--Comment - loop start-->
									<c:set var="othersListComment_Fid" value="othersListComment_${othersListArticle.fid }"></c:set>
									<c:forEach var="othersComment_list" items="${map[othersListComment_Fid]}">
										<hr style="position: relative; margin-top: 2px;height:1px;border:none;border-top:1px dashed #dddddd;">
										<div class="row" style="position: relative; margin-top: -10px;">
											<div class="col-md-11">
												<a href="${APP_PATH}/userController/getOthers?userid=${othersComment_list.userid }" class="a_p">
													<!-- Commenter name -->
													<b>${othersComment_list.name }</b>
												</a>
												&nbsp;&nbsp;&nbsp;
												<!-- Time -->
												<small>${othersComment_list.time }</small>
												<!-- Commenter content -->
												<p>${othersComment_list.pcontent }</p>
											</div>
										</div>
									</c:forEach>
									<!-- Comment - end of loop -->
								</div>
							<hr style="height:1px;border:none;border-top:1px solid #bbbbbb;">
							</c:if>
						</c:forEach>
						<!-- Article loop - end -->
					</div>
				</div>
			</div>
		</div>
		<div id="usermanual">
			<button type="button" class="btn btn-info">
				<a href="https://drive.google.com/open?id=1pBjM4Q9Bzpek6stHO5apiaKj1Mf34rkK" style="color:inherit;" target="_blank">Help</a>
			</button>
		</div>
	</div>
<script src="${APP_PATH }/static/js/floater.js"></script>
</body>
</html>