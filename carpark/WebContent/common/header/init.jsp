<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="/index.jsp">Car Park</a>
	</div>
	<!-- Top Menu Items -->
	<ul class="nav navbar-right top-nav">

		
<%
if(memberDto!=null){
%>
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown"><i class="fa fa-envelope"></i> <b
				class="caret"></b></a>
			<ul class="dropdown-menu message-dropdown">
				<li class="message-preview"><a href="#">
						<div class="media">
							<span class="pull-left"> <img class="media-object"
								src="http://placehold.it/50x50" alt="">
							</span>
							<div class="media-body">
								<h5 class="media-heading">
									<strong>John Smith</strong>
								</h5>
								<p class="small text-muted">
									<i class="fa fa-clock-o"></i> Yesterday at 4:32 PM
								</p>
								<p>Lorem ipsum dolor sit amet, consectetur...</p>
							</div>
						</div>
				</a></li>
				<li class="message-preview"><a href="#">
						<div class="media">
							<span class="pull-left"> <img class="media-object"
								src="http://placehold.it/50x50" alt="">
							</span>
							<div class="media-body">
								<h5 class="media-heading">
									<strong>John Smith</strong>
								</h5>
								<p class="small text-muted">
									<i class="fa fa-clock-o"></i> Yesterday at 4:32 PM
								</p>
								<p>Lorem ipsum dolor sit amet, consectetur...</p>
							</div>
						</div>
				</a></li>
				<li class="message-preview"><a href="#">
						<div class="media">
							<span class="pull-left"> <img class="media-object"
								src="http://placehold.it/50x50" alt="">
							</span>
							<div class="media-body">
								<h5 class="media-heading">
									<strong>John Smith</strong>
								</h5>
								<p class="small text-muted">
									<i class="fa fa-clock-o"></i> Yesterday at 4:32 PM
								</p>
								<p>Lorem ipsum dolor sit amet, consectetur...</p>
							</div>
						</div>
				</a></li>
				<li class="message-footer"><a href="javascript:messageReceiveList();">Read All New
						Messages</a></li>
			</ul></li>
		
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown"><i class="fa fa-bell"></i> <b
				class="caret"></b></a>
			<ul class="dropdown-menu alert-dropdown">
				<li><a href="#" data-toggle="modal" data-target="#messageReply">제보하기 <span
						class="label label-default">Alert Badge</span></a></li>
				<li><a href="<%=root%>/qna.jsp">  QnA  <span
						class="label label-primary">Alert Badge</span></a></li>
				<li><a href="#">Alert Name <span class="label label-danger">Alert
							Badge</span></a></li>
				<li class="divider"></li>
				<li><a href="#">View All</a></li>
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
				<li><a href="<%=root%>/member?act=mvlogout"><i class="fa fa-fw fa-power-off"></i> Log
						Out</a></li>
			</ul></li>		
<%
}else{
%>
		<li>
			<button type="button" class="btn btn-default navbar-btn"
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
				<li><a href="<%=root%>/member?act=mvprofile"><i class="fa fa-fw fa-user"></i> profile</a></li>
				<li><a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
				</li>
				<li><a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a></li>
				<li class="divider"></li>
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
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			
			
				<form name="loginForm" class="form-horizontal" id="loginForm"
					method="post" action="<%=root%>/member">
					<input type="hidden" name="act" value="mvlogin">
					<div class="modal-body">

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">ID</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="id" value=""
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
								<label> <input type="checkbox"> Remember me
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">Sign in</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<!-- join modal popup -->
<div class="modal fade" id="mySignUp" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">x</span><span class="sr-only">Close</span>
				</button>
				<h2 class="modal-title" id="myModalLabel">회원가입</h2>
			</div>
			<div class="modal-body">
				<form class="form-signin" role="form" name="signUpForm"
					id="signUpForm" method="post" action="<%=root%>/member">
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
							<input type="tel" class="form-control" name="phone" id="username" required="required"
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
						<button type="submit" class="btn btn-info">
							회원가입<i class="fa fa-check spaceLeft"></i>
						</button>
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







    <!-- 제보 Modal Start -->
		<div class="modal fade" id="messageReply" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" style="background-color: #00cc00" align="center">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="" id="messageReplyModal" style="color: #FFFFFF">주차장 제보 하기</h4>
					</div>
					<div class="modal-body">

						<!-- main -->
						<div id="page-wrapper">
							<div class="container-fluid">

								<!-- 쪽지보내기 -->
								<div class="form-group">
									<form class="form-horizontal" name="writeForm" method="post" action="">
										<input type="hidden" name="act" value="messageWrite">
										<input type="hidden" name="bcode" value="2"> 
										<input type="hidden" name="pg" value="1"> 
										<input type="hidden" name="key" value=""> 
										<input type="hidden" name="word" value="">

										<div class="form-group">
											<label for="receiver">받는사람</label> <input type="text"
												class="form-control" id="receiver" placeholder="Cpark 관리자"
												style="text-align: center;"  disabled="disabled"  name="receiver" value="">
										</div>
										<div class="form-group">
											<label for="subject">제목</label> <input type="text"
												class="form-control" id="subject" placeholder="제목"
												name="subject">
										</div>
										<div class="form-group">
											<label for="content">내용</label>
											<textarea class="form-control" rows="10" id="content"
												name="content"></textarea>
										</div>

										<div class="form-group text-center">
											<input class="btn btn-default" type="button" value="제보하기"
												onclick="javascript:messageWrite();">
										</div>

									</form>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!-- 제보 Modal End -->






<script type="text/javascript">
var id = document.getElementById("userid").value; 

$('#idcheck').click(function(id){
	$.ajax({
		type :"POST",
		url : "/carpark/member",
		dataType : "json",
		data : {
			"act" : "mvidcheck",
			"id" : id
		},
		successs: function(data){
			alert("성공입니다.");
			console.log(data);
		},
		error: function(data){
			alert("에러입니다");
			console.log(data);
		}
	});
});

</script>

