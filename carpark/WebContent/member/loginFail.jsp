<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>

<%@include file="/common/common.jsp"%>
<%@include file="/common/header/init.jsp"%>

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

