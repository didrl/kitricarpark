<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/common/common.jsp"%>
<%@include file="/common/header/init.jsp"%>
<%
String failSvid="";
String failCkid="";
Cookie failCookie[]= request.getCookies();
if(cookie!=null){
	int len = cookie.length;
	for(int i=0;i<len;i++){
		if("myid".equals(cookie[i].getName())){
			failSvid = cookie[i].getValue(); 
			failCkid = "checked=\"checked\"";
		}
	}
}
%>
<% 
if(session.isNew()){
%>
	<div class="modal-dialog" style="padding-top: 60px;">
		<div class="modal-content">
			<div class="modal-header" style="background: #00cc00" align="center">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true"></span>
				</button>
				<h4 class="modal-title" id="myModalLabel" style="color: #FFFFFF">세션 만료! 재로그인</h4>
			</div>
			<div class="modal-body">
				
				<form name="tryloginForm" class="form-horizontal" id="tryLoginForm"
					method="post" action="<%=root%>/member">
					<input type="hidden" name="act" value="mvlogin">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">ID</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="id" value="<%=failSvid %>"
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
								<label> <input type="checkbox" name="svid" value="idsave" <%=failCkid %>> 아이디 기억
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">Sign in</button>
							<a id="custom-login-btn" href="javascript:loginWithKakao();">
								<img src="http://mud-kage.kakao.co.kr/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
							</a>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
	
<%
}else{
%>
<div class="modal-dialog" style="padding-top: 60px;">
		<div class="modal-content">
			<div class="modal-header" style="background: #00cc00" align="center">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true"></span>
				</button>
				<h4 class="modal-title" id="myModalLabel" style="color: #FFFFFF">로그인 하기</h4>
			</div>
			<div class="modal-body">
				
				<form name="tryloginForm" class="form-horizontal" id="tryLoginForm"
					method="post" action="<%=root%>/member">
					<input type="hidden" name="act" value="mvlogin">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">ID</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="id" value="<%=failSvid %>"
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
								<label> <input type="checkbox" name="svid" value="idsave" <%=failCkid %>> 아이디 기억
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">Sign in</button>
							<a id="custom-login-btn" href="javascript:loginWithKakao();">
								<img src="http://mud-kage.kakao.co.kr/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
							</a>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
	

<%
}
%>
<%@include file="/common/footer.jsp"%>

