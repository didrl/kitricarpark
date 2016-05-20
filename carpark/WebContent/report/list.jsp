<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
    <!-- Bootstrap Core CSS -->
    <link href="/parking/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/parking/css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/parking/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

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
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">SB Admin</a>
            </div>
            
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
            
            
                <!-- 검색 -->
                <form class="navbar-form navbar-left" role="search">
        			<div class="form-group">
          				<input type="text" class="form-control" placeholder="Search">
        			</div>
        			<button type="submit" class="btn btn-default">검색</button>
      			</form>
                <!-- 검색 -->
            
            
            
                <!-- 메세지 -->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu message-dropdown">
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading">
                                            <strong>메세지1</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> 메세지 시간</p>
                                        <p>메세지 내용</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading">
                                            <strong>메세지2</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> 메세지 시간</p>
                                        <p>메세지 내용</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading">
                                            <strong>메세지3</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> 메세지 시간</p>
                                        <p>메세지 내용</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-footer">
                            <a href="#">쪽지목록</a>
                        </li>
                    </ul>
                </li>
                <!-- 메세지 -->
                

                
                <!-- 개인메뉴 -->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> John Smith <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
                <!-- 개인메뉴 -->
            </ul>
            
            <!-- 사이드바 -->
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li>
                        <a href=""><i class="fa fa-fw"></i> 개인정보</a>
                    </li>
                    <li>
                        <a href=""><i class="fa fa-fw"></i> 즐겨찾기</a>
                    </li>
                    <li>
                        <a href=""><i class="fa fa-fw"></i> 예약내역</a>
                    </li>
                    <li>
                        <a href=""><i class="fa fa-fw"></i> 쪽지확인</a>
                    </li>
                    <li>
                        <a href=""><i class="fa fa-fw"></i> 문의하기</a>
                    </li>
                    <li>
                        <a href=""><i class="fa fa-fw"></i> 신고하기</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
            <!-- 사이드바 -->
        </nav>


		<!-- 메인 -->
        <div id="page-wrapper">
        
        
 

			<!-- 신고리스트 -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            신고내역
                        </h1>
                    
                    </div>
                </div>
                
                
	            <!-- 신고하기 -->
	            <p>
				<button type="button" class="btn btn-default" data-toggle="modal" data-target="#report">
					신고
				</button>
				</p>
		         		
		        <!-- 신고 모달 -->
				<div class="modal fade" id="report" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				    <div class="modal-dialog">
				        <div class="modal-content">
				           	<div class="modal-header">
				               	<button type="button" class="close" data-dismiss="modal">
				                    <span aria-hidden="true">×</span><span class="sr-only">Close</span>
				                </button>
				                <center>
					                <h4 class="modal-title" id="myModalLabel">신고하기</h4>
				                </center>
				            </div>
				               	
					        <div class="modal-body">
							    <div class="row">
									<div class="col-md-2">
										<b>신고목록</b>
									</div>
			                        <div class="form-group">
			                        	<label>Selects</label>
			                            <select class="form-control">
			                            	<option>1</option>
			                                <option>2</option>
			                                <option>3</option>
			                                <option>4</option>
			                                <option>5</option>
			                            </select>
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
				<!-- 신고 모달 -->

                <div class="list-group">
				  <a href="#" class="list-group-item">신고1</a>
				  <a href="#" class="list-group-item">신고2</a>
				  <a href="#" class="list-group-item">신고3</a>
				  <a href="#" class="list-group-item">신고4</a>
				  <a href="#" class="list-group-item">신고5</a>
				  <a href="#" class="list-group-item">신고6</a>
				  <a href="#" class="list-group-item">신고7</a>
				  <a href="#" class="list-group-item">신고8</a>
				  <a href="#" class="list-group-item">신고9</a>
				</div>
                
            </div>
            <!-- /.container-fluid -->
            <!-- 신고리스트 -->

            

        </div>
        <!-- /#page-wrapper -->
		<!-- 메인 -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/parking/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/parking/js/bootstrap.min.js"></script>

</body>

</html>
