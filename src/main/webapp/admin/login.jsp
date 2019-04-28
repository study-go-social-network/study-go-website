<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin(Login、Registration)</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
</head>
<body>
	<!--Login modal -->
	<div class="modal fade" id="adminLoginModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="row">
					<div class="col-xs-6 col-md-6">
						<img src="${APP_PATH }/static/img/admin/login.png"
							style="position: relative; width: 100%; height: 280px">
					</div>
					<div class="col-xs-6 col-md-6">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<div class="text-center">
								<h4 class="modal-title">Admin login</h4>
							</div>
						</div>
						<div class="modal-body">
							<form action="${APP_PATH}/adminController/getLogin" method="post">
								<div class="form-group">
									<input type="text" class="form-control" name="aname"
										required="required" placeholder="Username">
								</div>
								<div class="form-group">
									<input type="password" class="form-control" name="apassword"
										required="required" placeholder="Password">
								</div>
								<!-- <p style="font-size: 10px">
									No account？ <a href="#" data-toggle="modal"
										data-target="#SignUpModal" data-dismiss="modal"
										aria-label="Close">Sign up now</a>
								</p> -->
								<div class="form-group">
									<div class="row" style="position: relative; top: 10px;">
										<div class="col-xs-5 col-md-8">
											<button type="reset" class="btn btn-default">Clear</button>
										</div>
										<div class="col-xs-7 col-md-4">
											<button type="submit" class="btn btn-primary">Login</button>
										</div>
									</div>
									<div class="text-danger text-center"
										style="position: relative; top: 20px; font-size: 10px;"></div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--Registration modal-->
	<div class="modal fade" id="SignUpModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="row">
					<div class="col-md-6">
						<img src="${APP_PATH }/static/img/admin/login.png"
							style="position: relative; width: 100%; height: 380px;">
					</div>
					<div class="col-md-6">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<div class="text-center">
								<h4 class="modal-title">Admin Registration</h4>
							</div>
						</div>
						<div class="modal-body">
							<form action="${APP_PATH}/adminController/setSignUp" method="post">
								<div class="form-group">
									<input type="text" class="form-control" name="aname"
										required="required" placeholder="Username">
								</div>
								<div class="form-group">
									<input type="password" class="form-control" name="apassword"
										id="apassword" required="required" placeholder="Password">
								</div>
								<div class="form-group">
									<input type="password" class="form-control" id="arepassword"
										required="required" placeholder="Confirm Password">
								</div>
								<p style="font-size: 10px">
									Already got an account? <a href="#" data-toggle="modal"
										data-target="#adminLoginModal"
										data-dismiss="modal" aria-label="Close">Login</a>
								</p>
								<div class="form-group">
									<div class="row" style="position: relative; top: 10px;">
										<div class="col-md-8">
											<button type="reset" class="btn btn-default">Clear</button>
										</div>
										<div class="col-md-4">
											<button type="submit" class="btn btn-primary"
												onclick="return confirmPass();">Sign Up</button>
										</div>
									</div>
								</div>
								<div class="text-danger text-center" id="confirmPassExit"
									style="position: relative; top: 10px; font-size: 10px;"></div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		// When the submit button is clicked, the confirmPass event is triggered,
		// and a bullet box will remind user to prevent the error message from being submitted.
		function confirmPass() {
			var apass = document.getElementById("apassword").value;
			var arepass = document.getElementById("arepassword").value;
			if (apass != arepass) {
				var str = "Passwords do not match!";
				/* Display prompt message */
				document.getElementById("confirmPassExit").innerHTML = str;
				/* Clear the specified input box */
				document.getElementById("apassword").value = "";
				document.getElementById("arepassword").value = "";
				/* Set the cursor to the specified text box */
				document.getElementById("apassword").focus();
				return false;
			}

			/* Clear the specified div */
			document.getElementById("confirmPassExit").innerHTML = "";
		}
	</script>
</body>
</html>