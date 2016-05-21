<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>

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
		<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav side-nav">
				<li><a href="index.html"><i class="fa fa-fw fa-dashboard"></i>
						Dashboard</a></li>

				<li><a href="javascript:;" data-toggle="collapse"
					data-target="#profile"><i class="fa fa-fw fa-arrows-v"></i> 프로필
						<i class="fa fa-fw fa-caret-down"></i></a>
					<ul id="profile" class="collapse">
						<li><a href="#">프로필수정</a></li>
						<li><a href="#">feedback</a></li>
						<li><a href="#">자동차정보</a></li>
					</ul></li>

				<li><a href="javascript:;" data-toggle="collapse"
					data-target="#reservation"><i class="fa fa-fw fa-arrows-v"></i>
						예약 <i class="fa fa-fw fa-caret-down"></i></a>
					<ul id="reservation" class="collapse">
						<li><a href="#">예약하기</a></li>
						<li><a href="#">예약받기</a></li>
					</ul></li>

				<li><a href="javascript:;" data-toggle="collapse"
					data-target="#message"><i class="fa fa-fw fa-arrows-v"></i> 메세지
						<i class="fa fa-fw fa-caret-down"></i></a>
					<ul id="message" class="collapse">
						<li><a href="#">보낸메세지</a></li>
						<li><a href="#">받은메세지</a></li>
					</ul></li>

				<li><a href="javascript:;" data-toggle="collapse"
					data-target="#parking"><i class="fa fa-fw fa-arrows-v"></i> 주차장
						<i class="fa fa-fw fa-caret-down"></i></a>
					<ul id="parking" class="collapse">
						<li><a href="#">주차장 등록</a></li>
						<li><a href="#">내 주차장</a></li>
					</ul></li>

				<li><a href="blank-page.html"><i class="fa fa-fw fa-file"></i>
						My Coin</a></li>
				<li><a href="index-rtl.html"><i
						class="fa fa-fw fa-dashboard"></i> 친구초대</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse --> </nav>

		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">상세프로필</h1>
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
								<label>Full Name</label> <input class="form-control"
									placeholder="Full name">
								<p class="help-block">Example block-level help text here.</p>
							</div>

							<div class="form-group">
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
								<label>비밀번호</label> <input class="form-control">
							</div>

							<div class="form-group">
								<label>비밀번호확인</label> <input class="form-control">
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


							<div class="form-group">
								<label>Company Name</label> <input class="form-control">
								<p class="help-block">Example block-level help text here.</p>
							</div>
					</div>
					<!-- /.col-lg-6 -->

					<div class="col-lg-6">

						<div class="form-group">
							<label class="checkbox-inline"> <input type="checkbox">사업자등록번호체크

							</label>
						</div>

						<div class="form-group">
							<label>프로필 사진 선택</label> <input type="file">
						</div>

						<div class="form-group">
							<label>소개글</label>
							<textarea class="form-control" rows="3"></textarea>
						</div>

						<div class="form-group">
							<label>Checkboxes</label>
							<div class="checkbox">
								<label> <input type="checkbox" value="">Checkbox
									1
								</label>
							</div>
							<div class="checkbox">
								<label> <input type="checkbox" value="">Checkbox
									2
								</label>
							</div>
							<div class="checkbox">
								<label> <input type="checkbox" value="">Checkbox
									3
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
							<button type="submit" class="btn btn-default">수정</button>
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
  <%@include file="/common/footer.jsp" %>
  <!-- /Footer -->
	

</body>

</html>
