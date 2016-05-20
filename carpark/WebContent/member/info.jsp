<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
					data-target="#profile"><i class="fa fa-fw fa-arrows-v"></i>
						������ <i class="fa fa-fw fa-caret-down"></i></a>
					<ul id="profile" class="collapse">
						<li><a href="#">�����ʼ���</a></li>
						<li><a href="#">feedback</a></li>
						<li><a href="#">�ڵ�������</a></li>
					</ul></li>
					
				<li><a href="javascript:;" data-toggle="collapse"
					data-target="#reservation"><i class="fa fa-fw fa-arrows-v"></i>
						���� <i class="fa fa-fw fa-caret-down"></i></a>
					<ul id="reservation" class="collapse">
						<li><a href="#">�����ϱ�</a></li>
						<li><a href="#">����ޱ�</a></li>
					</ul></li>
					
				<li><a href="javascript:;" data-toggle="collapse"
					data-target="#message"><i class="fa fa-fw fa-arrows-v"></i>
						�޼��� <i class="fa fa-fw fa-caret-down"></i></a>
					<ul id="message" class="collapse">
						<li><a href="#">�����޼���</a></li>
						<li><a href="#">�����޼���</a></li>
					</ul></li>
					
				<li><a href="javascript:;" data-toggle="collapse"
					data-target="#parking"><i class="fa fa-fw fa-arrows-v"></i>
						������ <i class="fa fa-fw fa-caret-down"></i></a>
					<ul id="parking" class="collapse">
						<li><a href="#">������ ���</a></li>
						<li><a href="#">�� ������</a></li>
					</ul></li>
					
				<li><a href="blank-page.html"><i class="fa fa-fw fa-file"></i>
						My Coin</a></li>
				<li><a href="index-rtl.html"><i
						class="fa fa-fw fa-dashboard"></i> ģ���ʴ�</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse --> </nav>

		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Profile</h1>
						<ol class="breadcrumb">
							<li><i class="fa fa-dashboard"></i> <a href="index.html">Dashboard</a>
							</li>
							<li class="active"><i class="fa fa-edit"></i> Profile</li>
						</ol>
					</div>
				</div>
				<!-- /.row -->
				
				<!-- form container -->
				<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<form role="form">
							<div class="form-group">
								
								<label ><h3>�� ����</h3></label><br> 
							
								<img src="<%=root%>/img/bg.jpg" class="img-circle" width="200" height="200" border="5">
							</div>
							<div class="form-group">
                             	
                             	<img src="<%=root%>/img/car.png" width="25" height="25">
                                	<label for="disabledSelect">
                                		<h4>Bookings Made : </h4>
                                	</label><br>
                               
                                <img src="<%=root%>/img/home.png" width="25" height="25">
                                	<label for="disabledSelect">
                                		<h4>Bookings Received : </h4>
                                	</label><br>    
                            </div>
						</form>
					</div>

					<div class="col-lg-4">

						<form role="form">


							<div class="form-group">
                                    <label for="disabledSelect">�̸�</label>
                                    <input class="form-control" id="disabledInput" type="text" placeholder="�̸�" disabled>
                            </div>

							<div class="form-group">
                                    <label for="disabledSelect">�г���</label>
                                    <input class="form-control" id="disabledInput" type="text" placeholder="�г���" disabled>
                            </div>

							<div class="form-group">
                                    <label for="disabledSelect">ȸ���̸�</label>
                                    <input class="form-control" id="disabledInput" type="text" placeholder="ȸ���̸�" disabled>
                            </div>
                            
                            <div class="form-group">
                                <label>�������</label>
                                <input class="form-control" id="disabledInput" type="text" placeholder="Disabled input" disabled>
                                <p class="help-block">Example block-level help text here.</p>
                            </div>

						</form>
					</div>

				</div>
				</div>
				<!-- /.row -->
				<!-- /.form container -->
						

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
                    <h4><strong>Start Bootstrap</strong>
                    </h4>
                    <p>3481 Melrose Place<br>Beverly Hills, CA 90210</p>
                    <ul class="list-unstyled">
                        <li><i class="fa fa-phone fa-fw"></i> (123) 456-7890</li>
                        <li><i class="fa fa-envelope-o fa-fw"></i>  <a href="mailto:name@example.com">name@example.com</a>
                        </li>
                    </ul>
                    <br>
                    <ul class="list-inline">
                        <li>
                            <a href="#"><i class="fa fa-facebook fa-fw fa-3x"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-twitter fa-fw fa-3x"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-dribbble fa-fw fa-3x"></i></a>
                        </li>
                    </ul>
                    <hr class="small">
                    <p class="text-muted">Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </div>
    </footer>
  <!-- /Footer -->

	<!-- jQuery -->
	<script src="/carpark/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/carpark/js/bootstrap.min.js"></script>

</body>

</html>
