<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String root = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SB Admin - Bootstrap Admin Template</title>

<!-- Bootstrap Core CSS -->
<link href="/project/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/project/css/sb-admin.css" rel="stylesheet">
<link href="/project/css/stylish-portfolio.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/project/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	
	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html">SB Admin</a>
		</div>

		<!-- Top Menu Items -->
		<ul class="nav navbar-right top-nav">
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
					<li class="message-footer"><a href="#">Read All New
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
					<li><a href="#">Alert Name <span
							class="label label-danger">Alert Badge</span></a></li>
					<li class="divider"></li>
					<li><a href="#">View All</a></li>
				</ul></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"><i class="fa fa-user"></i> John Smith <b
					class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#"><i class="fa fa-fw fa-user"></i> Profile</a></li>
					<li><a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
					</li>
					<li><a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
					</li>
					<li class="divider"></li>
					<li><a href="#"><i class="fa fa-fw fa-power-off"></i> Log
							Out</a></li>
				</ul></li>
		</ul>

		<!-- /.navbar-collapse --> </nav>
		
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">주차장 예약</h1>
						<ol class="breadcrumb">
							<li><i class="fa fa-dashboard"></i> <a href="index.html">Dashboard</a>
							</li>
							<li class="active"><i class="fa fa-edit"></i> Forms</li>
						</ol>
					</div>
				</div>
				<!-- /.row -->


				<div class="row">
					<div class="col-lg-6">
						<form role="form">
							<div class="form-group">
								<label> </label> <input class="form-control"
									placeholder="Full name">
								<p class="help-block">Example block-level help text here.</p>
							</div>

							<div class="form-group">
								<label>예약날짜 </label>
								<div class="row">
									<div class="col-xs-4">
										<label>년도</label> <input type="text" class="form-control"
											placeholder="year">
									</div>
									<div class="col-xs-3">
										<label>월</label> <input type="text" class="form-control"
											placeholder="month">
									</div>
									<div class="col-xs-3">
										<label>일</label> <input type="text" class="form-control"
											placeholder="day">
									</div>
								</div>
							</div>


							<div class="form-group">
								<label>방문목적</label> <input class="form-control">
							</div>


							<div class="form-group">
								<label for="exampleInputName2">전화번호</label> <input type="text"
									class="form-control" id="exampleInputName2"
									placeholder="Jane Doe">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail2">Email</label> <input
									type="email" class="form-control" id="exampleInputEmail2"
									placeholder="jane.doe@example.com">
							</div>
							
						</div>
						<!-- /.col-lg-6 -->
						
						<!-- .col-lg-6 -->	
						<div class="col-lg-6">
							<div class="form-group">
								<label>호스트에게 남길 메세지</label>
							</div>

							<div class="form-group">
								<textarea class="form-control" rows="3"></textarea>
							</div>


							<div class="form-group">
								<div class="checkbox">
									<label> <input type="checkbox" value="">페이스북에 공유
									</label>
								</div>
							</div>


							<div class="form-group">
								<label>Inline Radio Buttons</label> <label class="radio-inline">
									<input type="radio" name="optionsRadiosInline"
									id="optionsRadiosInline1" value="option1" checked>1
								</label> <label class="radio-inline"> <input type="radio"
									name="optionsRadiosInline" id="optionsRadiosInline2"
									value="option2">2
								</label> <label class="radio-inline"> <input type="radio"
									name="optionsRadiosInline" id="optionsRadiosInline3"
									value="option3">3
								</label>
							</div>

							<div class="form-group">
								<button type="submit" class="btn btn-default">예약</button>
								<button type="reset" class="btn btn-default">취소</button>
							</div>

							</div>
						</form>
					
					<!-- /.col-lg-6 -->
				</div>
				<!-- /.row -->

			</div>
			<!-- /.container-fluid -->

		</div>
		<!-- /#page-wrapper -->
		
	</div>
	<!-- /#wrapper -->

	<!-- Footer -->
	<footer>
	<div class="container">
		<div class="row">
			<div class="col-lg-10 col-lg-offset-1 text-center">
				<h4>
					<strong>Start Bootstrap</strong>
				</h4>
				<p>
					3481 Melrose Place<br>Beverly Hills, CA 90210
				</p>
				<ul class="list-unstyled">
					<li><i class="fa fa-phone fa-fw"></i> (123) 456-7890</li>
					<li><i class="fa fa-envelope-o fa-fw"></i> <a
						href="mailto:name@example.com">name@example.com</a></li>
				</ul>
				<br>
				<ul class="list-inline">
					<li><a href="#"><i class="fa fa-facebook fa-fw fa-3x"></i></a>
					</li>
					<li><a href="#"><i class="fa fa-twitter fa-fw fa-3x"></i></a>
					</li>
					<li><a href="#"><i class="fa fa-dribbble fa-fw fa-3x"></i></a>
					</li>
				</ul>
				<hr class="small">
				<p class="text-muted">Copyright &copy; Your Website 2014</p>
			</div>
		</div>
	</div>
	</footer>
	<!-- jQuery -->
	<script src="/project/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/project/js/bootstrap.min.js"></script>
</body>

</html>
