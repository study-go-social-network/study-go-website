<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Upload Avatar</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
</head>
<body>
	<div class="container">
		<div class="modal fade" id="userPhoto" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content col-md-6 col-md-offset-3">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h3 class="modal-title text-center" id="exampleModalLabel">Upload Your Avatar</h3>
						<p class="text-center">Let us see your handsome/pretty face</p>
					</div>
					<div class="modal-body">
						<form action="${APP_PATH }/avatarController/setUserPhoto" method="post" enctype="multipart/form-data">
							<p class="text-muted">Choose your avatar locally:</p>
							<div class="form-group">
								<div id="user_preview">
									<a href="#">
										<img class="img-thumbnail" style="position: relative; width: 100%; height: 100%;"
										id="user_imghead" src="${APP_PATH }/static/img/uploadPhoto.png"
										onclick="$('#user_previewImg').click();">
									</a>
								</div>
								<input type="file" onchange="user_previewImage(this)"
									style="display: none;" id="user_previewImg" name="photo">
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Back</button>
								<button type="submit" class="btn btn-primary">Save</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src="${APP_PATH }/static/js/images_photo.js"></script>
</body>
</html>