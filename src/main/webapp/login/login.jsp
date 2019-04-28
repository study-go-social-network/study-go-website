<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags must be placed at the forefront, and any other content must follow it! -->
<title>Login、Registration</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
</head>

<body>
	<!-- <button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#loginModal">Popup modal box</button> -->

	<!--Login modal-->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="row">
					<div class="col-xs-6 col-md-6">
						<img src="${APP_PATH }/static/img/login.png"
							style="position: relative; width: 100%; height: 280px">
					</div>
					<div class="col-xs-6 col-md-6">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<div class="text-center">
								<h4 class="modal-title">Login</h4>
							</div>
						</div>
						<div class="modal-body">
							<form id="login">
								<div class="form-group">
									<input type="text" class="form-control" name="name" id="name"
										required="required" placeholder="Username">
								</div>
								<div class="form-group">
									<input type="password" class="form-control" name="password" id="password"
										required="required" placeholder="Password">
								</div>
								<p style="font-size: 10px">
									Didn't get an account yet? <a href="#" data-toggle="modal"
										data-target="#SignUpModal" data-dismiss="modal"
										aria-label="Close" class="text-success">Sign up now</a>
								</p>
								<div class="form-group">
									<div class="row" style="position: relative; top: 10px;">
										<div class="col-xs-5 col-md-8">
											<button type="reset" class="btn btn-default">Clear</button>
										</div>
										<div class="col-xs-7 col-md-4">
											<button type="submit" class="btn btn-primary">Login</button>
										</div>
									</div>
									<div class="text-success text-center" id="loginSuccess"
										style="position: relative; top: 20px; font-size: 10px;"></div>
									<div class="text-danger text-center" id="loginExit"
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
					<div class="col-xs-6 col-md-6">
						<img src="${APP_PATH }/static/img/login.png"
							style="position: relative; width: 100%; height: 380px;">
					</div>
					<div class="col-xs-6 col-md-6">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<div class="text-center">
								<h4 class="modal-title">Sign Up</h4>
							</div>
						</div>
						<div class="modal-body">
							<form id="register">
								<div class="form-group">
									<input type="text" class="form-control" name="name" id="name2"
										required="required" placeholder="Username">
									<div class="text-danger text-center" id="registerName"
										style="position: relative; top: 8px; font-size: 10px;"></div>
								</div>
								<div class="form-group">
									<input type="password" class="form-control" name="password"
										id="password2" required="required" placeholder="Password">
								</div>
								<div class="form-group">
									<input type="password" class="form-control" id="repassword"
										required="required" placeholder="Confirm password">
								</div>
								<div class="form-group">
									<input type="email" class="form-control" name="email" id="email"
										required="required" placeholder="Email">
								</div>
								<p style="font-size: 10px">
									Already got an account? <a href="#" data-toggle="modal" data-target="#loginModal"
										data-dismiss="modal" aria-label="Close" class="text-success">Login</a>
								</p>
								<div class="form-group">
									<div class="row" style="position: relative; top: 10px;">
										<div class="col-xs-5 col-md-8">
											<button type="reset" class="btn btn-default">Clear</button>
										</div>
										<div class="col-xs-7 col-md-4">
											<button type="submit" class="btn btn-primary">Enter</button>
										</div>
									</div>
								</div>
								<div class="text-success text-center" id="registerSuccess"
									style="position: relative; top: 20px; font-size: 10px;"></div>
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
	// Page redirect
	function go(){ 
		window.location.href="${APP_PATH}/index.jsp";
	} 
	// Login authentication
	$("#login").submit(function(){
        // Get the username and password
        var name = $("#name").val(); // entered username
        var password = $("#password").val();// entered password
        
        // invoke ajax
        $.ajax({            
            url:"${APP_PATH}/userController/getLoginAjax",
            data:{name:name,password:password},
            type:"POST",
            dataType:"text",
            success: function(data){
                    if(data.trim()=="OK") // Add a space, prevent spaces in the content from causing errors.
                    {
                    	var str = "Sign in successful!";
        				// Display prompt message
        				document.getElementById("loginSuccess").innerHTML = str;
                        setTimeout(go, 500); // Page redirect after 0.5 seconds
                    }
                    else
                    {
                    	var str = "Wrong username or password!";
        				// Display prompt message
        				document.getElementById("loginExit").innerHTML = str;
                    }
                }
            });
        
       		document.getElementById("loginExit").innerHTML = "";
        	return false;
		});
	
		// Registration authentication
		$("#register").submit(function() {
			// Get username, password, confirmation password, and email value
	        var name = $("#name2").val(); // entered username
	        var pass = $("#password2").val(); // entered password
	        var repass = $("#repassword").val(); // entered confirmation password
	        var email = $("#email").val(); // entered email
	        
	      	// invoke ajax
	        $.ajax({            
	            url:"${APP_PATH}/userController/setSignUp",
	            data:{name:name,pass:pass,email:email,repass:repass},
	            type:"POST",
	            dataType:"text",
	            success: function(data){
	                    if(data.trim()=="OK") // Add a space, prevent spaces in the content from causing errors
	                    {
	                    	var str = "Registration Successful";
	        				/* Display prompt message */
	        				document.getElementById("registerSuccess").innerHTML = str;
	                        setTimeout(go, 500); // Page redirect after 0.5 seconds
	                    }else if (data.trim()=="PASS") {
	                    	var str = "Passwords do not match";
	        				/* Display prompt message */
	        				document.getElementById("confirmPassExit").innerHTML = str;
	        				/* Clear the specified input box */
	        				document.getElementById("password2").value = "";
	        				document.getElementById("repassword").value = "";
	        				/* Set the cursor to the specified text box */
	        				document.getElementById("password2").focus();
	                    }else if (data.trim()=="NO") {
	                    	var str = "The username already exists！";
	        				/* Display prompt message */
	        				document.getElementById("registerName").innerHTML = str;
	                    }
	                }
	            });
	        
			/* Clear the specified div */
			document.getElementById("confirmPassExit").innerHTML = "";
			document.getElementById("registerName").innerHTML = "";
			return false;
		});
	</script>

</body>
</html>