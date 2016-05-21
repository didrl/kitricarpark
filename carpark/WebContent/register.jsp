<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Bootstrap 101 Template</title>
	<!-- Bootstrap -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
	
	<div class="container">
	
		<!-- 상단 메뉴바 -->
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
					<a class="navbar-brand" href="#">홈</a>
				</div>
				
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
				
					<!-- 로그인 버튼 -->
					<button type="button" class="btn btn-default navbar-btn" data-toggle="modal" data-target="#myLogin">
						Sign in
					</button>
	         		
	         		<!-- 로그인모달 팝업 -->
			      	<div class="modal fade" id="myLogin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			        	<div class="modal-dialog">
			            	<div class="modal-content">
			               		<div class="modal-header">
			                  		<button type="button" class="close" data-dismiss="modal">
			                     		<span aria-hidden="true">×</span><span class="sr-only">Close</span>
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
		<!-- 상단 메뉴바 -->

		<!-- 본문 -->		
		<div class="row">
		<!-- 같은 행에 위치해야 하는 것들은 하나의 row안에 위치 -->
		
			<!-- 좌측메뉴 -->
			<div class="col-md-2"><!-- 열은 col-md-1~12까지 -->
				<ul class="nav nav-pills nav-stacked">
					<li><a href="">메뉴</a></li>
					<li><a href="">메뉴</a></li>
					<li><a href="">메뉴</a></li>
					<li><a href="">메뉴</a></li>
					<li><a href="">메뉴</a></li>
					<li><a href="">메뉴</a></li>
				</ul>
			</div>
			<!-- 좌측메뉴 -->
			
			
			<!-- 본문내용 -->
			<div class="col-md-10"><!-- 12칸 중 좌측메뉴 2칸 제외한 나머지 -->
			<form>
				<div class="row">
					<div class="col-md-2">
						<b>주차장 구분</b><br>
					</div>
					<div class="col-md-10">
						<div class="btn-group btn-group-justified" role="group" aria-label="...">
				  			<div class="btn-group" role="group">
								<button type="button" class="btn btn-default">주차장구분</button>
							</div>
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-default">주차장구분</button>
							</div>
						</div>
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>호스트구분</b><br>
					</div>
					<div class="col-md-10">
						<div class="btn-group btn-group-justified" role="group" aria-label="...">
				  			<div class="btn-group" role="group">
								<button type="button" class="btn btn-default">개인</button>
							</div>
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-default">사업자</button>
							</div>
						</div>
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>특징</b><br>
					</div>
					<div class="col-md-10">
						<div class="btn-group btn-group-justified" role="group" aria-label="...">
				  			<div class="btn-group" role="group">
								<button type="button" class="btn btn-default">CCTV</button>
							</div>
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-default">무인</button>
							</div>
						</div>
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>위치</b><br>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search">
						</div>
							<button type="submit" class="btn btn-default">검색</button>
					</div>
				</div><hr>

				<div class="row">
					<div class="col-md-2">
						<b>설명</b><br>
					</div>
					<div class="col-md-10">
						<textarea class="form-control" rows="3"></textarea>						
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>추가정보</b><br>
					</div>
					<div class="col-md-10">
						
							<div class="form-group">
								<b>이름</b>
								<input type="text" class="form-control" id="exampleInputName2" placeholder="Jane Doe">
							</div><br>
							<div class="form-group">
								<b>이메일</b>
								<input type="email" class="form-control" id="exampleInputEmail2" placeholder="jane.doe@example.com">
							</div><br>
							<div class="form-group">
								<b>전화번호</b>
								<input type="text" class="form-control" placeholder="Text input">
							</div>
						
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>가격</b>
					</div>
					<div class="col-md-10">
						<form>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="원">
							</div>
						</form>
					</div>
				</div>
				
			</form>
			
				<div class="row">
					<center>
						<p>
		  					<button type="button" class="btn btn-primary btn-lg">등록</button>
		  					<button type="button" class="btn btn-default btn-lg">취소</button>
						</p>
					</center>
				</div>
				
			</div><hr>
			<!-- 본문내용 -->
			
		</div><hr>
		<!-- 본문 -->
	
			
		<!-- 하단 -->
		<div class="row">
			<div class="col-md-12 text-center">하단</div>
		</div>
		<!-- 하단 -->
		
	</div>

	<!-- body가 끝나는 부분에 있어야 함 -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>