<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New Forum</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
</head>
<body>
	<div class="modal fade" id="forum" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content col-md-10 col-md-offset-1">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h3 class="modal-title text-center" id="exampleModalLabel">New Forum</h3>
					<p class="text-center">An interesting forum could attract more articles!</p>
				</div>
				<div class="modal-body">
					<form id="addforum">
						<p class="text-muted">Forum：</p>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Name a forum"
								id="bname" name="bname" required>
						</div>
						<div class="text-success text-center" id="forumSuccess"
							style="position: relative; top: 0; font-size: 10px;"></div>
						<div class="text-danger text-center" id="forumExit"
							style="position: relative; top: 0; font-size: 10px;"></div>

						<div class="modal-footer">
							<button type="reset" class="btn btn-default">Clear</button>
							<button type="submit" class="btn btn-primary">Confirm</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	// Page redirect
	function go(){ 
		window.location.href="${APP_PATH}/admin/index.jsp";
	} 
	// Login authentication
	$("#addforum").submit(function(){
        // Get forum name
        var bname = $("#bname").val(); // username entered
        
        // invoke ajax
        $.ajax({            
            url:"${APP_PATH}/forumController/setForum",
            data:{bname:bname},
            type:"POST",
            dataType:"text",
            success: function(data){
                    if(data.trim()=="OK") // Add a space, prevent spaces in the content from causing errors.
                    {
                    	var str = "Forum added successfully";
        				/* Display prompt message */
        				document.getElementById("forumSuccess").innerHTML = str;
                        setTimeout(go, 500); // Page redirection after 0.5 seconds
                    }
                    else
                    {
                    	var str = "The forum name has existed";
        				/* Display prompt message */
        				document.getElementById("forumExit").innerHTML = str;
                    }
                }
            });
        
       		document.getElementById("forumExit").innerHTML = "";
        	return false;
		});
	</script>
</body>
</html>