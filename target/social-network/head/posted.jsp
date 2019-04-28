<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
    uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Post</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
</head>
<body>
	<div class="container">
		<div class="modal fade" id="faTie" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content col-md-11">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h3 class="modal-title text-center" id="exampleModalLabel">Write down your article</h3>
						<p class="text-center">An interesting article get more attention and comments</p>
						<p class="text-center text-danger">Attention: The article you post need to be approved by the
							administrator before they could be displayed on the homepage.</p>
					</div>
					<div class="modal-body">
						<form action="${APP_PATH }/articleController/setArticle" method="post" enctype="multipart/form-data">
							<p class="text-muted">Write down your title：</p>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="title"
									id="titles" name="titles" required>
							</div>

							<p class="text-muted">Select Forum：</p>
							<div class="form-group">
								<select class="form-control" name="bname">
									<c:forEach var="forum" items="${forum }">
										<option>${forum.bname }</option>
									</c:forEach>
								</select>
							</div>

							<p class="text-muted">Write down your content：</p>
							<div class="form-group">
								<textarea class="form-control" placeholder="content" id="fcontent"
									name="fcontent" style="position: relative; height: 200px;" required></textarea>
							</div>

							<p class="text-muted">Choose your picture locally：</p>
							<div class="form-group">
								<div id="f_preview">
									<a href="#"> <img
										style="position: relative; width: 100%; height: 100%;"
										id="f_imghead" src="${APP_PATH }/static/img/uploadPhoto.png"
										onclick="$('#f_previewImg').click();">
									</a>
								</div>
								<input type="file" onchange="f_previewImage(this)"
									style="display: none;" id="f_previewImg" name="photo">
							</div>

							<div class="modal-footer">
								<button type="reset" class="btn btn-default">Clear</button>
								<button type="submit" class="btn btn-primary">Post</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src="${APP_PATH }/static/js/images.js"></script>
</body>
</html>