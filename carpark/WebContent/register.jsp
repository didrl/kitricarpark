<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Bootstrap 101 Template</title>
	<!-- Bootstrap -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
	
	<div class="container">
	
		<!-- ��� �޴��� -->
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Ȩ</a>
				</div>
				
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
				
					<!-- �α��� ��ư -->
					<button type="button" class="btn btn-default navbar-btn" data-toggle="modal" data-target="#myLogin">
						Sign in
					</button>
	         		
	         		<!-- �α��θ�� �˾� -->
			      	<div class="modal fade" id="myLogin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			        	<div class="modal-dialog">
			            	<div class="modal-content">
			               		<div class="modal-header">
			                  		<button type="button" class="close" data-dismiss="modal">
			                     		<span aria-hidden="true">��</span><span class="sr-only">Close</span>
			                  		</button>
			                  		<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			               		</div>
				                <div class="modal-body">
				                
						       		<form class="form-horizontal">
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
							    			<div class="col-sm-10">
							      				<input type="email" class="form-control" id="inputEmail3" placeholder="Email">
							    			</div>
							  			</div>
										<div class="form-group">
										    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
										    <div class="col-sm-10">
										      <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
										    </div>
										</div>
										<div class="form-group">
										    <div class="col-sm-offset-2 col-sm-10">
										    	<div class="checkbox">
										        	<label>
										          		<input type="checkbox"> Remember me
										        	</label>
										    </div>
										    </div>
										</div>
										<div class="form-group">
										    <div class="col-sm-offset-2 col-sm-10">
										    	<button type="submit" class="btn btn-default">Sign in</button>
										    </div>
										</div>
									</form>
				                
			               		</div>
			            	</div>
			      		</div>
			    	</div>
				
					<form class="navbar-form navbar-right" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search">
						</div>
						<button type="submit" class="btn btn-default">Submit</button>
					</form>
				</div><!-- /.container-fluid -->
				
			</div>
				
		</nav>
		<!-- ��� �޴��� -->

		<!-- ���� -->		
		<div class="row">
		<!-- ���� �࿡ ��ġ�ؾ� �ϴ� �͵��� �ϳ��� row�ȿ� ��ġ -->
		
			<!-- �����޴� -->
			<div class="col-md-2"><!-- ���� col-md-1~12���� -->
				<ul class="nav nav-pills nav-stacked">
					<li><a href="">�޴�</a></li>
					<li><a href="">�޴�</a></li>
					<li><a href="">�޴�</a></li>
					<li><a href="">�޴�</a></li>
					<li><a href="">�޴�</a></li>
					<li><a href="">�޴�</a></li>
				</ul>
			</div>
			<!-- �����޴� -->
			
			
			<!-- �������� -->
			<div class="col-md-10"><!-- 12ĭ �� �����޴� 2ĭ ������ ������ -->
			<form>
				<div class="row">
					<div class="col-md-2">
						<b>������ ����</b><br>
					</div>
					<div class="col-md-10">
						<div class="btn-group btn-group-justified" role="group" aria-label="...">
				  			<div class="btn-group" role="group">
								<button type="button" class="btn btn-default">�����屸��</button>
							</div>
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-default">�����屸��</button>
							</div>
						</div>
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>ȣ��Ʈ����</b><br>
					</div>
					<div class="col-md-10">
						<div class="btn-group btn-group-justified" role="group" aria-label="...">
				  			<div class="btn-group" role="group">
								<button type="button" class="btn btn-default">����</button>
							</div>
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-default">�����</button>
							</div>
						</div>
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>Ư¡</b><br>
					</div>
					<div class="col-md-10">
						<div class="btn-group btn-group-justified" role="group" aria-label="...">
				  			<div class="btn-group" role="group">
								<button type="button" class="btn btn-default">CCTV</button>
							</div>
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-default">����</button>
							</div>
						</div>
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>��ġ</b><br>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search">
						</div>
							<button type="submit" class="btn btn-default">�˻�</button>
					</div>
				</div><hr>

				<div class="row">
					<div class="col-md-2">
						<b>����</b><br>
					</div>
					<div class="col-md-10">
						<textarea class="form-control" rows="3"></textarea>						
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>�߰�����</b><br>
					</div>
					<div class="col-md-10">
						
							<div class="form-group">
								<b>�̸�</b>
								<input type="text" class="form-control" id="exampleInputName2" placeholder="Jane Doe">
							</div><br>
							<div class="form-group">
								<b>�̸���</b>
								<input type="email" class="form-control" id="exampleInputEmail2" placeholder="jane.doe@example.com">
							</div><br>
							<div class="form-group">
								<b>��ȭ��ȣ</b>
								<input type="text" class="form-control" placeholder="Text input">
							</div>
						
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>����</b>
					</div>
					<div class="col-md-10">
						<form>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="��">
							</div>
						</form>
					</div>
				</div>
				
			</form>
			
				<div class="row">
					<center>
						<p>
		  					<button type="button" class="btn btn-primary btn-lg">���</button>
		  					<button type="button" class="btn btn-default btn-lg">���</button>
						</p>
					</center>
				</div>
				
			</div><hr>
			<!-- �������� -->
			
		</div><hr>
		<!-- ���� -->
	
			
		<!-- �ϴ� -->
		<div class="row">
			<div class="col-md-12 text-center">�ϴ�</div>
		</div>
		<!-- �ϴ� -->
		
	</div>

	<!-- body�� ������ �κп� �־�� �� -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>