<%@page import="com.carpark.member.model.MemberDto"%>
<%@page import="com.carpark.member.model.MessageDto, java.net.URLDecoder"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<%
String svid="";
String ckid="";
Cookie cookie[]= request.getCookies();
if(cookie!=null){
	int len = cookie.length;
	for(int i=0;i<len;i++){
		if("myid".equals(cookie[i].getName())){
			svid = URLDecoder.decode(cookie[i].getValue(),"UTF-8"); 
			ckid = "checked=\"checked\"";
		}
	}
}
%>
<!-- kakao.js -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>  
<script>
function logout(){
	document.location.href=root+"/member?act=mvlogout";
}
</script>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="<%=root %>/index.jsp">Car Park</a>
	</div>
	<!-- Top Menu Items -->
	<ul class="nav navbar-right top-nav">

		
<%
if(memberDto!=null){
	if(memberDto.getUser_flag()!=10){
%>
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown"><i class="fa fa-envelope"></i> <b
				class="caret"></b></a>
			<ul class="dropdown-menu message-dropdown">
				<li>
					<a href="javascript:messageReceiveList();">받은쪽지함</a>
				</li>
				<li>
					<a href="javascript:messageSendList();">보낸쪽지함</a>
				</li>
			</ul>
		</li>
		
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown"><i class="fa fa-bell"></i> <b
				class="caret"></b></a>
			<ul class="dropdown-menu alert-dropdown">
				<li><a href="<%=root%>/call?act=mvzip">제보하기</a></li>
				
				
			</ul></li>
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown"><i class="fa fa-user"></i> <%=memberDto.getUser_id() %> <b
				class="caret"></b></a>
			<ul class="dropdown-menu">
				<li><a href="<%=root%>/member?act=mvprofile"><i class="fa fa-fw fa-user"></i> profile</a></li>
				<li><a href="<%=root%>/member?act=mvmessage"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
				</li>
				<li><a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a></li>
				<li class="divider"></li>
				<li><a id="logout" href="javascript:logout();"><i class="fa fa-fw fa-power-off"></i> Log
						Out</a></li>
			</ul></li>		
<%
	}else{	//관리자
		%>
		<li class="dropdown">
		<!--<a href="#" class="dropdown-toggle"
			data-toggle="dropdown">
			<i class="fa fa-envelope"></i> <b
				class="caret"></b></a>
			<ul class="dropdown-menu message-dropdown">
				 <li class="message-preview"><a href="#">
						<div class="media">
							<span class="pull-left"> <img class="media-object"
								src="http://placehold.it/50x50" alt="">
							</span>
							<div class="media-body">
							</div>
						</div>
				</a></li>
				<li class="message-preview"><a href="#">
						<div class="media">
							<span class="pull-left"> <img class="media-object"
								src="http://placehold.it/50x50" alt="">
							</span>
							<div class="media-body">
							</div>
						</div>
				</a></li>
				 
				<li class="message-preview"><a href="#">
						<div class="media">
							<span class="pull-left"> <img class="media-object"
								src="http://placehold.it/50x50" alt="">
							</span>
							<div class="media-body">
							</div>
						</div>
				</a></li>
				<li class="message-footer"><a href="javascript:messageReceiveList();">Read All New
						Messages</a></li>
			</ul>-->
			</li>
		
		<!--<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown"><i class="fa fa-bell"></i> <b
				class="caret"></b></a>
			 <ul class="dropdown-menu alert-dropdown">
				<li><a href="#" data-toggle="modal" data-target="#messageReply">제보하기 <span
						class="label label-default">Alert Badge</span></a></li>
				<li class="divider"></li>
				<li><a href="<%=root%>/qna.jsp">  QnA  <span
						class="label label-primary">Alert Badge</span></a></li>
			
				
			</ul></li> -->
					
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown"><i class="fa fa-user"></i> <%=memberDto.getUser_id() %> <b
				class="caret"></b></a>
			<ul class="dropdown-menu">
				
				<li id="logoutBtn"><a href="<%=root%>/member?act=mvlogout"><i class="fa fa-fw fa-power-off"></i> Log
						Out</a></li>
			</ul></li>
				
<%
	}
}else{
%>
		<li>
			<button type="button" class="btn btn-default navbar-btn" id="login"
				data-toggle="modal" data-target="#myLogin">Login</button>
			&nbsp;&nbsp;
		</li>
		<li>
			<button type="button" class="btn btn-default navbar-btn" 
				data-toggle="modal" data-target="#mySignUp">SignUp</button>
		</li>
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown"><i class="fa fa-user"></i> 아이디 <b
				class="caret"></b></a>
			<ul class="dropdown-menu">
				
				<li><a href="<%=root%>/member?act=mvlogin"><i class="fa fa-fw fa-power-off"></i> Log
						in</a></li>
			</ul></li>
<%
}
%>	
		
	</ul>
	<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->

	<!-- /.navbar-collapse -->
</nav>




<!-- login modal popup -->
<div class="modal fade" id="myLogin" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="background: #00cc00" align="center">
				<button type="button" class="close" data-dismiss="modal" onclick="javascript:loginConfirm();">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="myModalLabel" style="color: #FFFFFF">로그인</h4>
			</div>
			
			
				<form name="loginForm" class="form-horizontal" id="loginForm"
					method="post" action="<%=root%>/member">
					<input type="hidden" name="act" value="mvlogin">
					<div class="modal-body">

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">ID</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="id" value="<%=svid %>"
								id="id" placeholder="id" required="required">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
						<div class="col-sm-10">

							<input type="password" class="form-control" name="pass" value=""
								id="pass" placeholder="Password" required="required">

						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="checkbox">
								<label> <input type="checkbox" name="svid" value="idsave" <%=ckid%>> Remember me
								</label>
							</div>
						</div>
					</div>
					<div class="form-group" align="center">
						<div class="col-sm-offset-2 col-sm-10 form-inline" style="padding-right: 100px">
							<button type="submit" class="btn btn-default" style="width: 50%;">Sign in</button><br>
						</div>
					</div>
					<div align="center">
						<a id="custom-login-btn" href="javascript:loginWithKakao();">
								<img src="http://mud-kage.kakao.co.kr/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
						</a>
					</div>
					
				</div>
			</form>
		</div>
	</div>
</div>
<!-- /login modal popup -->

<!-- join modal popup -->
<div class="modal fade" id="mySignUp" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="background: #00cc00" align="center">
				<button type="button" class="close" data-dismiss="modal" onclick="javascript:confirm();">
					<span aria-hidden="true">x</span><span class="sr-only">Close</span>
				</button>
				<h2 class="modal-title" id="myModalLabel" style="color: #FFFFFF">회원가입</h2>
			</div>
			<div class="modal-body">
				<form class="form-signin" role="form" name="signUpForm"
					id="signUpForm" method="post" action="">
					<input type="hidden" name="act" value="mvsignup">

					<div class="form-group">
						<label for="username">이름</label> <input type="text"
							class="form-control" name="name" id="username" required="required"
							placeholder="이름을 입력해 주세요">
					</div>

					<div class="form-group">
						<label for="username">id</label>
						<div class="input-group">
							<input type="text" class="form-control" name="id" id="userid"
								placeholder="id" required="required"> <span class="input-group-btn">
								<button class="btn btn-success" id="idcheck">
									id 체크<i class="fa fa-edit spaceLeft"></i>
								</button>
							</span>
						</div>
						<p id="chid"></p>
					</div>

					<div class="form-group">
						<label for="InputPassword1">비밀번호</label> <input type="password"
							class="form-control" name="pass" id="InputPassword1" required="required"
							placeholder="비밀번호">
					</div>

					<div class="form-group">
						<label for="InputPassword2">비밀번호 확인</label> <input type="password"
							class="form-control" name="passwordcheck" id="InputPassword2" required="required"
							placeholder="비밀번호 확인">
						<p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
					</div>

					<div class="form-group">
						<label for="InputEmail">이메일 주소</label> <input type="email"
							class="form-control" name="email" id="InputEmail" required="required"
							placeholder="이메일 주소">
					</div>


					<div class="form-group">
						<label for="username">휴대폰 인증</label>
						<div class="input-group">
							<input type="tel" class="form-control" name="phone" id="userphone" required="required"
								placeholder="- 없이 입력해 주세요"> <span
								class="input-group-btn">
								<button class="btn btn-success">
									인증번호 전송<i class="fa fa-mail-forward spaceLeft"></i>
								</button>
							</span>
						</div>
					</div>

					<div class="form-group">
						<label>약관 동의</label>
						<div data-toggle="buttons">
							<label class="btn btn-primary active"> <span
								class="fa fa-check"></span> <input id="agree" type="checkbox"
								autocomplete="off">
							</label> <a href="#">개인정보 이용약관</a>에 동의합니다.
						</div>
					</div>
					<div class="form-group text-center">
						<button type="button" class="btn btn-info" onclick="infocheck()">
							회원가입<i class="fa fa-check spaceLeft"></i>
						</button>
<!-- 						<button type="submit" class="btn btn-info"> -->
<!-- 							회원가입<i class="fa fa-check spaceLeft"></i> -->
<!-- 						</button> -->
						<button type="button" class="btn btn-warning" data-dismiss="modal"
						onclick="javascript:formclear();">
							가입취소<i class="fa fa-times spaceLeft"></i>
						</button>
					</div>
					
				</form>
			</div>
		</div>
	</div>
</div>
<!-- /join modal popup -->



<!-- ajax idcheck -->
<script type="text/javascript">
$('#idcheck').click(function(){
var id = document.getElementById("userid").value; 
	$.ajax({
		type :"GET",
		url : "/carpark/member?act=mvidcheck",
		dataType : "json",
		data : {
			"idcheck" : id
		},
		 success: function(data) {
		      console.log('성공 - ', data);
		      idcheck(data);
		    },
		 error: function(xhr) {
		      console.log('실패 - ', xhr);
		    }
	});
});

function idcheck(data){
	if(data.id == 1)
		document.getElementById("chid").innerHTML = "아이디를 사용하실 수 있습니다.";
	else{
		document.getElementById("chid").innerHTML ="아이디를 사용할 수 없습니다.";
	}
}
</script>
<!-- /ajax idcheck -->



