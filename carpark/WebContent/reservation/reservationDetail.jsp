<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- For sendMsg Modal -->
   <%@include file="/reservation/sendMessageModal.jsp"%>
   <!-- For sendMsg Modal -->
   <!-- For addCar Modal -->
   <%@include file="/reservation/addMyOwnCarModal.jsp"%>
   <!-- For addCar Modal -->
   <!-- For addCar Modal -->
   <%@include file="/reservation/payment.jsp"%>
   <!-- For addCar Modal -->
    
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Car Park</title>

<!-- Bootstrap Core CSS -->
<link href="/carpark/css/bootstrap.min.css" rel="stylesheet">

<!-- Seclect List CSS -->
<link rel="stylesheet" type="text/css" href="/carpark/css/jquery.selectlist.css">

<!-- Simple Celander -->
<link rel="stylesheet" href="/carpark/css/calendar/style.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="/carpark/js/calendar/calendar.js"></script>
<!-- Simple Celander -->

<link href="/carpark/css/stylish-portfolio.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,500'	rel='stylesheet' type='text/css' />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"	rel="stylesheet" />

<link rel="stylesheet" href="/carpark/css/normalize.css">
<link rel="stylesheet" href="/carpark/css/style.css">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,100,100italic'
	rel='stylesheet' type='text/css'>

<!-- Custom CSS -->
<link href="/carpark/css/shop-item.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/carpark/font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<!-- Navigation Start-->
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
	<br>
	<!-- Page Content -->
	<div class="container" style="text-align:center">

		<div class="row">

			<!-- Left Section Start -->
			<div class="col-md-7 col-lg-7 col-sm-7">
				<div class="panel panel-default"> <!--  Left panel div Start -->
				<div class="panel-body"> <!--  Left panel body Start -->
				<div>	<h3><a href="" > 선택한 주차장 이름</a></h3></div>
				<div>주차장 내용들</div><br><br>
				<div><h3>언제 주차를 하길 원하십니까?</h3></div><br>
				<div class="row"><!-- From Choice Start -->
					<div class="col-md-3 col-lg-3 col-sm-3">
						<div class="pull-right">예약 구분 : </div>
					</div>
					<div class="col-md-8 col-lg-8 col-sm-8" >
					연속 예약 <input type="radio" name="resercheck" value="multireservation"> 하루 예약 <input type="radio" name="resercheck" value="singlereservation">
					</div>
				</div><br>
				<!--  radio button에 의한 Multi reservation Start-->
				<div id="multireservation">	
				<div class="row"><!-- From Choice Start -->
					<div class="col-md-3 col-lg-3 col-sm-3">
								<div class="pull-right">From : </div>
						</div>
						<div class="col-md-8 col-lg-8 col-sm-8" >		
								<input class="date-picker" id="fromdate" type="text"  />
								<select id="fromTime" name="fromTime">
								  <option value="0">00:00</option><option value="1">01:00</option><option value="2">02:00</option>
								  <option value="3">03:00</option> <option value="4">04:00</option><option value="5">05:00</option>
								  <option value="6">06:00</option><option value="7">07:00</option><option value="8">08:00</option>
								  <option value="9">09:00</option><option value="10">10:00</option><option value="11">11:00</option>
								  <option value="12">12:00</option><option value="13">13:00</option><option value="14">14:00</option>
								  <option value="15">15:00</option> <option value="16">16:00</option><option value="17">17:00</option>
								  <option value="18">18:00</option><option value="19">19:00</option> <option value="20">20:00</option>
								  <option value="21">21:00</option><option value="22">22:00</option><option value="23">23:00</option>
								</select>
							</div>
					</div><!-- From Choice End -->
					<div class="row"><!-- To Choice Start -->
							<div class="col-md-3 col-lg-3 col-sm-3">
								<div class="pull-right">T o :</div> 
								</div>
								<div class="col-md-8 col-lg-8 col-sm-8" >
								<input class="date-picker" id="todate" type="text" />
								<select id="toTime" name="toTime">
								  <option value="0">00:00</option><option value="1">01:00</option><option value="2">02:00</option>
								  <option value="3">03:00</option> <option value="4">04:00</option><option value="5">05:00</option>
								  <option value="6">06:00</option><option value="7">07:00</option><option value="8">08:00</option>
								  <option value="9">09:00</option><option value="10">10:00</option><option value="11">11:00</option>
								  <option value="12">12:00</option><option value="13">13:00</option><option value="14">14:00</option>
								  <option value="15">15:00</option> <option value="16">16:00</option><option value="17">17:00</option>
								  <option value="18">18:00</option><option value="19">19:00</option> <option value="20">20:00</option>
								  <option value="21">21:00</option><option value="22">22:00</option><option value="23">23:00</option>
								</select>
								</div>
					</div>	<!-- To Choice End -->	
					</div> <!--  radio button에 의한 Multi reservation End-->
					
					<div class="row" id="singlereservation"> <!--  radio button에 의한 Single reservation Start-->
					<div class="col-md-3 col-lg-3 col-sm-3">
								<div class="pull-right">Date : </div>
						</div>
						<div class="col-md-8 col-lg-8 col-sm-8" >		
								<input class="date-picker" id="fromdate" type="text"  />
								<select id="dateTime" name="dateTime">
								  <option value="0">00:00</option><option value="1">01:00</option><option value="2">02:00</option>
								  <option value="3">03:00</option> <option value="4">04:00</option><option value="5">05:00</option>
								  <option value="6">06:00</option><option value="7">07:00</option><option value="8">08:00</option>
								  <option value="9">09:00</option><option value="10">10:00</option><option value="11">11:00</option>
								  <option value="12">12:00</option><option value="13">13:00</option><option value="14">14:00</option>
								  <option value="15">15:00</option> <option value="16">16:00</option><option value="17">17:00</option>
								  <option value="18">18:00</option><option value="19">19:00</option> <option value="20">20:00</option>
								  <option value="21">21:00</option><option value="22">22:00</option><option value="23">23:00</option>
								</select>
							</div>
					</div><!--  radio button에 의한 Single reservation End--> <br>
					<div><h3>어떤 차량을 주차 하길 원하십니까?</h3></div><br>
					<div class="row" > <!-- Select Car div Start-->
					<div class="col-md-3 col-lg-3 col-sm-3">
								<div class="pull-right">등록 차량 </div>
						</div>
						<div class="col-md-8 col-lg-8 col-sm-8" >		
								<selectlong  id="mycarlist" name="mycarlist" >
								  <option value="등록차량1">레인지 로버</option>
								  <option value="등록차량2">전기차</option>
								</selectlong>
								<button type="button" class="btn btn-success"  data-toggle="modal" data-target="#addCar">
                  				 + 차량 등록 
               				</button>
							</div>
					</div><!-- Select Reason div End--> <br>
						<div><h3>이용 목적이 무엇입니까?</h3></div><br>
					<div class="row" > <!-- Select Car div Start-->
					<div class="col-md-3 col-lg-3 col-sm-3">
								<div class="pull-right">이용 목적</div>
						</div>
						<div class="col-md-8 col-lg-8 col-sm-8" >		
								<selectlong  id="reasonlist" name="reasonlist" >
								  <option value="business">업무</option>
								  <option value="trip">여행</option>
								  <option value="visit">방문</option>
								  <option value="ext">기타</option>
								</selectlong>
							</div>
					</div><!-- Select Reason div End--> <br>
					</div><!--  Left panel body End -->
							<button type="button" class="btn btn-success"  data-toggle="modal" data-target="#payment">
                  				 결제하기 
               				</button>
				</div><!--  Left panel div End -->
			</div> 
			<!-- Left Section End -->

			<!-- Right Section Start -->
			<div class="col-md-5 col-lg-5 col-sm-5">
				<div class="row">
					<div class="well">
						<div class="panel-body">
						<b>고객 유의사항</b><br>
						현재 보고있는 주차장 이용 시<br>
						발생할 수 있는 법적 책임은<br>
						서비스를 제공하는 CarPark가 아닌<br>
						주차장을 제공하는<br>
						제공자와 해당 주차장을 이용하는<br>
						본인에게 있습니다.<br>
						</div>
						<div class="text-center">
					
               				                 <!-- msg모달 팝업 -->
                  <div class="modal fade" id="msgToHost" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                              <div class="modal-header">
                                 <button type="button" class="close" data-dismiss="modal">
                                    <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                                 </button>
                                 <h4 class="msgToHost" id="msgToHostModal">쪽지 보내기</h4>
                              </div>
                            <div class="modal-body">
                            
                               <form class="form-horizontal">
                              <div class="form-group">
                                 <label for="inputMsgSubject" class="col-sm-2 control-label">제목</label>
                                  <div class="col-sm-10">
                                       <input type="text" class="form-control" id="inputMsgSubject" placeholder="MsgSubject">
                                  </div>
                                </div>
                              <div class="form-group">
                                  <label for="inputMsgContent" class="col-sm-2 control-label">내용</label>
                                  <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputMsgContent" placeholder="MsgContent">
                                  </div>
                              </div>
                              <div class="form-group">
                                  <div class="col-sm-offset-2 col-sm-10">
                                     <button type="sendMsg" class="btn btn-default">보내기</button>
                                  </div>
                              </div>
                           </form>
                            
                              </div>
                        </div>
                     </div>
                </div>
                <!-- msg모달 팝업 -->
							<br>
						</div>
						</div>
					<!-- host info panel End -->
					<div class="panel panel-default">
						<div class="panel-body">
						<h3>사용 가능 일</h3>
							<div id="c">
								<div id="disp">
									<div id="prev" class="nav">←</div>
									<div id="month"></div>
									<div id="next" class="nav">→</div>
								</div>
								<div id="cal"></div>
							</div>
							<!-- /#c -->
							<script src="/carpark/js/calendar/index.js"></script>
						</div>
					</div>
					<!-- clelander panel End -->
				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->
	<div class="container">

		<hr>

		<!-- Footer -->
		<footer>
			<div class="container" >
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
</div>
		<!-- jQuery -->
		<script src="/carpark/js/jquery.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="/carpark/js/bootstrap.min.js"></script>

		<!-- Custom Theme JavaScript -->
		<script>
			// Closes the sidebar menu
			$("#menu-close").click(function(e) {
				e.preventDefault();
				$("#sidebar-wrapper").toggleClass("active");
			});

			// Opens the sidebar menu
			$("#menu-toggle").click(function(e) {
				e.preventDefault();
				$("#sidebar-wrapper").toggleClass("active");
			});

			// Scrolls to the selected menu item on the page
			$(function() {
				$('a[href*=#]:not([href=#])')
						.click(
								function() {
									if (location.pathname.replace(/^\//, '') == this.pathname
											.replace(/^\//, '')
											|| location.hostname == this.hostname) {

										var target = $(this.hash);
										target = target.length ? target
												: $('[name='
														+ this.hash.slice(1)
														+ ']');
										if (target.length) {
											$('html,body').animate({
												scrollTop : target.offset().top
											}, 1000);
											return false;
										}
									}
								});
			});
			$(function(){
				$('select').selectlist({
					zIndex: 10,
					width: 100,
					height: 30
				});		
			})
			$(function(){
				$('selectlong').selectlist({
					zIndex: 10,
					width: 200,
					height: 30
				});		
			})
			
		</script>
		<script src="/carpark/js/selectlist/jquery.selectlist.js"></script>
</body>
</body>
</html>