<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
		<nav class="navbar-inverse">
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
		
			<!-- 좌측메뉴 -->
			<div class="col-md-2">
				좌측메뉴
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
			<div class="col-md-10">
			
			
			<!-- 리뷰 등록 -->
			<div class="row">
				<button type="button" class="btn btn-default" data-toggle="modal" data-target="#review">
					리뷰등록
				</button>
			</div>
	         		
	        <!-- 리뷰모달 팝업 -->
			<div class="modal fade" id="review" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			    <div class="modal-dialog">
			        <div class="modal-content">
			           	<div class="modal-header">
			               	<button type="button" class="close" data-dismiss="modal">
			                    <span aria-hidden="true">×</span><span class="sr-only">Close</span>
			                </button>
			                <center>
				                <h4 class="modal-title" id="myModalLabel">리뷰 등록</h4>
			                </center>
			            </div>
			               	
				        <div class="modal-body">
						    <div class="row">
								<div class="col-md-2">
									<b>별점</b>
								</div>
								<div class="col-md-10">
									<label class="radio-inline">
									  	<input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 1
									</label>
									<label class="radio-inline">
									 	<input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 2
									</label>
									<label class="radio-inline">
										<input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> 3
									</label>
									<label class="radio-inline">
										<input type="radio" name="inlineRadioOptions" id="inlineRadio4" value="option4"> 4
									</label>
									<label class="radio-inline">
										<input type="radio" name="inlineRadioOptions" id="inlineRadio5" value="option5"> 5
									</label>
								</div>
							</div><hr>
					
							<div class="row">
								<div class="form-group">
									<div class="col-md-2">
										<label for="form-title">제목</label>
									</div>
									<div class="col-md-10">
										<input type="text" class="form-control" name="title" id="form-title" placeholder="제목을 적어주세요.">
									</div>
								</div>
							</div><hr>
							
							<div class="row">
								<div class="form-group">
									<div class="col-md-2">
										<label for="form-author">내용</label>
									</div>
									<div class="col-md-10">
										<textarea class="form-control" rows="10" name="description"  id="form-author" placeholder="본문을 적어주세요."></textarea>
									</div>
								</div>
							</div><hr>	
						
							<div class="row">
								<center>
									<p>
					  					<button type="button" class="btn btn-primary btn-lg">등록</button>
									</p>
								</center>
							</div>	
						</div>
						               		
					</div>
				</div>
			</div>
			<!-- 리뷰 모달 -->
			
			<!-- 리뷰 목록 -->
			
			
				
			</div><hr>
			<!-- 본문내용 -->
			
		</div><hr>
		<!-- 본문 -->
			
		
		<!-- 하단 -->
		<div class="row">
			<div class="text-center">하단</div>
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