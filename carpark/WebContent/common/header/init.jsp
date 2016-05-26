<%@page import="com.carpark.member.model.MemberDto"%>
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
		<a class="navbar-brand" href="index.jsp">Car Park</a>
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
				<li><a href="#">Alert Name <span
						class="label label-default">Alert Badge</span></a></li>
				<li><a href="#">Alert Name <span
						class="label label-primary">Alert Badge</span></a></li>
				<li><a href="#">Alert Name <span
						class="label label-success">Alert Badge</span></a></li>
				<li><a href="#">Alert Name <span class="label label-info">Alert
							Badge</span></a></li>
				<li><a href="#">Alert Name <span
						class="label label-warning">Alert Badge</span></a></li>
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
				<li><a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
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

			<form class="form-signin" role="form" name="signUpForm" id="signUpForm" method="post"
					action="<%=root%>/member">
			<input type="hidden" name="act" value="mvsignup"  required="required">
			<div class="modal-body">
					<fieldset>

					<div class="form-group">
						<div class="controls">
						<label for="inputid">name</label> <input type="text"
							class="form-control" id="signupname" name="name" value=""
							placeholder="name" required="required" >
							
						</div>
					</div>
					
					
					<div class="form-group">
						<div class="controls">
						<label for="inputid">id</label> <input type="text"
							class="form-control" id="signupid" name="id" value=""
							placeholder="id" required="required">
						</div>
					</div>

					<div class="form-group">
						<label for="inputPassword">Password</label> <input type="password"
							class="form-control" id="signuppass" name="pass" value=""
							placeholder="password" required="required">
					</div>
					<div class="form-group">
						<label for="inputPasswordCheck">PasswordCheck</label> <input
							type="password" class="form-control" id="signuppasswordcheck"
							name="passwordcheck" value="" placeholder="passwordcheck"
							required="required">
					</div>
					
					
					<div class="form-group">
						<div class="controls">
						<label for="inputid">email</label> <input type="text"
							class="form-control" id="signupemail" name="email" value=""
							placeholder="email" required="required">
						</div>
					</div>
					
					
					<div class="form-group">
						<div class="controls">
						<label for="inputid">전화번호</label> <input type="text"
							class="form-control" id="signupphone" name="phone" value=""
							placeholder="tel" required="required">
						</div>
					</div>
					
					
					<div class="form-group">
						<label for="inputCarInfo">CarInfo</label> <input type="text"
							class="form-control" id="signupcarInfo" name=carInfo value=""
							placeholder="carInfo" required="required">
					</div>
					</fieldset>

			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-default"
				>Register</button>
				<button type="button" class="btn btn-default" data-dismiss="modal"
					onclick="javascript:formclear();">Cancel</button>
			</div>
				</form>
		</div>
	</div>
</div>

