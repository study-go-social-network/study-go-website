<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update forum</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
</head>
<body>
	<jsp:include page="/admin/head.jsp"></jsp:include>

	<div class="container" style="position: relative;top: 200px;">
		<div class="modal-content col-md-8 col-md-offset-2">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<a href="${APP_PATH}/admin/index.jsp"><span aria-hidden="true">&times;</span></a>
				</button>
				<h3 class="modal-title text-center" id="exampleModalLabel">Update forum</h3>
				<p class="text-center">An interesting forum could attract more articles!</p>
			</div>
			<div class="modal-body">
				<form id="updateForum">
					<p class="text-muted">Forum name:</p>
					<div class="form-group">
						<input type="hidden" id="bid" name="bid" value="${forumEdit.bid}">
						<input type="text" class="form-control" placeholder="Name a forum!"
							id="bname" name="bname" value="${forumEdit.bname}" required>
					</div>
					<div class="text-success text-center" id="forumSuccess"
						style="position: relative; top: 0px; font-size: 10px;"></div>
					<div class="text-danger text-center" id="forumExit"
						style="position: relative; top: 0px; font-size: 10px;"></div>

					<div class="modal-footer">
						<button type="reset" class="btn btn-default">Restore</button>
						<button type="submit" class="btn btn-primary">Confirm</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	// Page redirect
	function go(){ 
		window.location.href="${APP_PATH}/admin/index.jsp";
	} 
	// Login authentication
	$("#updateForum").submit(function(){
        // Get forum id, forum name
        var bid = $("#bid").val(); // Entered userid
        var bname = $("#bname").val(); // Entered username
        
        // Invoke ajax
        $.ajax({            
            url:"${APP_PATH}/forumController/updateForum",
            data:{bid:bid,bname:bname},
            type:"POST",
            dataType:"text",
            success: function(data){
                    if(data.trim()=="OK") // Add a space, prevent spaces in the content from causing errors
                    {
                    	var str = "Update the forum successfully";
        				/* Display prompt message */
        				document.getElementById("forumSuccess").innerHTML = str;
                        setTimeout(go, 500); // Page redirect after 0.5 seconds
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