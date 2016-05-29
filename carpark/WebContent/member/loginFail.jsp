<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/common/common.jsp"%>
<%@include file="/common/header/init.jsp"%>





	<div class="modal-dialog" style="padding-top: 60px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true"></span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Try Login Again</h4>
			</div>
			<div class="modal-body">
				
				<form name="tryloginForm" class="form-horizontal" id="tryLoginForm"
					method="post" action="<%=root%>/member">
					<input type="hidden" name="act" value="mvlogin">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">ID</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="id" value=""
								id="tryid" placeholder="id">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" name="pass" id="trypass"
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
							<button type="submit" class="btn btn-default"
							>Sign in</button>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>

<%@include file="/common/footer.jsp"%>

