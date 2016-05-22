<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
·Î±×ÀÎ ½ÇÆĞ
</body>
</html>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/header/init.jsp"%>

ë¡œê·¸ì¸ ì‹¤íŒ¨ ì•„ì´ë”” ì°¾ê¸°


	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true"></span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Try Login Again</h4>
			</div>
			<div class="modal-body">

				<form name="loginForm" class="form-horizontal" id="login"
					method="post" action="">
					<input type="hidden" name="act" value="mvlogin">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">ID</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="id" value=""
								id="id" placeholder="id">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" name="pass" id="pass"
								placeholder="Password">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="checkbox">
								<label> <input type="checkbox"> Remember me
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" class="btn btn-default"
								onclick="javascript:mvlogin();">Sign in</button>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>

<%@include file="/common/footer.jsp"%>
>>>>>>> 0b7271da2013bb240a81f07d16cf97e2fb563860
