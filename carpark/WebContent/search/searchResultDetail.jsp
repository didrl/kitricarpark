<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- For sendMsg Modal -->
   <%@include file="/reservation/sendMessageModal.jsp"%>
   <!-- For sendMsg Modal -->
   
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

<!-- Tmap -->
<script src="https://apis.skplanetx.com/tmap/js?version=1&format=javascript&appKey=a4ea8cc9-e49c-308f-99de-3aadb0c70298">
</script>
<script type="text/javascript">
	var map;
	var mapW, mapH; // 지도의 가로, 세로 크기(Pixel단위) 를 지정 합니다. 
	var cLonLat, zoom; //중심 좌표와 지도레벨을 정의 합니다. 
	var latitude, longitude;
	//pr_3857 인스탄스 생성.
	var pr_3857 = new Tmap.Projection("EPSG:3857");

	//pr_4326 인스탄스 생성.
	var pr_4326 = new Tmap.Projection("EPSG:4326");

	function get3857LonLat(coordX, coordY) {
		return new Tmap.LonLat(coordX, coordY).transform(pr_4326, pr_3857);
	}

	function get4326LonLat(coordX, coordY) {
		return new Tmap.LonLat(coordX, coordY).transform(pr_3857, pr_4326);
	}

	function setVariables() {
		cLonLat = new Tmap.LonLat(longitude, latitude).transform(pr_4326,
				pr_3857);
		//              cLonLat = new Tmap.LonLat(longitude,latitude).transform(pr_3857, pr_4326);
		//중심점 좌표 입니다. EPSG3857 좌표계 형식 입니다. 

		zoom = 16; // zoom level입니다.  0~19 레벨을 서비스 하고 있습니다. 
//		mapW = window.outerWidth /2; // 지도의 가로 크기 입니다. 
//		mapH = window.outerHeight/2; // 지도의 가로 크기 입니다.
		 window.oncontextmenu= function(){
	         ﻿           return false; 
	         }
		var div = $("#divformap");
		mapW =   div.innerWidth();			//jquery를 이용해서 width얻기
		if(div.innerHeight() != 0)
			mapH = div.innerHeight();
		else
			mapH = window.outerHeight / 2;
	}

	function init() {
		navigator.geolocation
				.getCurrentPosition(function(position) {
					latitude = position.coords.latitude;
					longitude = position.coords.longitude;
					setVariables();
					map = new Tmap.Map({
						div : 'map_div',
						width : mapW,
						height : mapH,
						animation : true
					});
					map.setCenter(cLonLat, zoom);
				
					var markerLayer = new Tmap.Layer.Markers("MarkerLayer");
					map.addLayer(markerLayer);

					var size = new Tmap.Size(24, 38);
					var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
					var icon = new Tmap.Icon(
							'https://developers.skplanetx.com/upload/tmap/marker/pin_b_m_a.png',
							size, offset);
					var label = new Tmap.Label("당신의 현재 위치!")

					var markers = new Tmap.Markers(cLonLat, icon, label);
					markerLayer.addMarker(markers);
					markers.popup.show()

				});
		// div : 지도가 생성될 div의 id값과 같은 값을 옵션으로 정의 합니다.
	}
	// document.searchForm.action = "root%>/seachResult.html";
	function goSearchResult() {
		if(document.getElementById("citysearch").value  == "") {
			alert("검색하실 도시의 이름을 입력해주세요.");
			return;
		} else if(document.getElementById("fromdatesearch").value  == "") {
			alert("시작일을 입력해주세요.");
			return;
		}else if(document.getElementById("todatesearch").value  == "") {
			alert("종료일을 입력해주세요.");
			return;
		}else{
			document.searchForm.action = "/carpark/member";
			document.searchForm.submit();
		}
	}
	function goReservation() {
		document.selectdateForm.action = "/carpark/member";
		document.selectdateForm.submit();
	}
	
	//쪽지보내기
	function messageWrite() {
		if(document.messageForm.receiver.value == ""){
			alert("대상을 입력하세요");
			return;
		} else if(document.messageForm.subject.value == "") {
			alert("제목을 입력하세요");
			return;	
		} else if(document.messageForm.content.value == "") {
			alert("내용을 입력하세요");
			return;
		} else{
			document.messageForm.action = "/carpark/message";
			document.messageForm.submit();
		}
	}
	
</script>


</head>

<body onload="init()">

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
	

	<!-- Page Content -->
	<div class="container" style="text-align:center">
			<!--  search bar start -->
			<div class="col-sm-13">
					<!-- /input-group -->
					<form id="searchForm" class="form-inline" role="form" method="post" >
						<input type="hidden"  name="act" value="mvSearchResult">
						<div class="input-group">
							<input type="text" class="form-control" id="citysearch" placeholder="Search for..."> 
							<span 	class="input-group-btn">
								<button class="btn btn-default" type="button">Go!</button>
							</span>
						</div>
						<div class="input-group">
								<input class="date-picker" id="fromdatesearch" type="text"  />
						</div>
	
						<div class="input-group">
								<input class="date-picker" id="todatesearch" type="text"  />
						</div>
						<div class="input-group">
							<button class="btn btn-success" type="button" onclick="javascript:goSearchResult();">Search</button>
						</div>
					</form>
				</div>
				<br><br>
				<!--  search bar end-->
		<div class="row">
			<!-- Left Section Start -->
			<div class="col-md-7 col-lg-7 col-sm-7">
				<!--  Map  -->
				<div class="panel panel-default">
			<div class="row" align="left"><h3><b>&nbsp;&nbsp;&nbsp; 주차장 이름</b> 지역명
			<a href=""><img height="30"  src="/carpark/img/heart.jpg"></a></h3>
			</div>
				<div class="panel panel-default" id="divformap">
				<section id="contact" class="map" >
					<div id="map_div"></div><br>
				</section>
				</div>
				<div>	<h3>상세 정보를 입력하시면 예약이 더욱 쉬워집니다!</h3></div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">주변 정보</div>
					<div class="panel-body">
					ㅁㄴㅇㅁㄴㅇㅁㄴㅇ<br>
					ㅁㄴㅇㅁㄴㅇㅁㄴㅇ<br>
						<div class="panel-footer">특징</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">상세 정보</h3>
					</div>
					<div class="panel-body">
						<!-- Street View start -->
						<iframe width="300" height="200" frameborder="1" style="border: 0"
							src="https://www.google.com/maps/embed/v1/streetview?key=AIzaSyB3d8wlcwuwvoXDFp4vd4ghi9nDnuDt4Hw&location=46.414382,10.013988&heading=210&pitch=10&fov=35">
						</iframe>
						<!-- Street View End -->
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-body">
					<a href="원본사진"><img src="/carpark/img/tmpcar/car1.jpg"></a>
					<a href="원본사진"><img src="/carpark/img/tmpcar/car2.jpg"></a>
					<a href="원본사진"><img src="/carpark/img/tmpcar/car3.jpg"></a>
					</div>
					<div class="panel-footer">Panel footer</div>
				</div>


					<!-- Review Start-->
					<div class="well">
					<b>Review</b>
						<div class="text-right">
							<a class="btn btn-success">Leave a Review</a>
						</div>

						<hr>

						<div class="row">
							<div class="col-md-12">
								<span class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star-empty"></span> Anonymous <span
									class="pull-right">10 days ago</span>
								<p>This product was great in terms of quality. I would
									definitely buy another!</p>
							</div>
						</div>

						<hr>

						<div class="row">
							<div class="col-md-12">
								<span class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star-empty"></span> Anonymous <span
									class="pull-right">12 days ago</span>
								<p>I've alredy ordered another one!</p>
							</div>
						</div>

						<hr>

						<div class="row">
							<div class="col-md-12">
								<span class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star-empty"></span> Anonymous <span
									class="pull-right">15 days ago</span>
								<p>I've seen some better than this, but not at this price. I
									definitely recommend this item.</p>
							</div>
						</div>
					</div>
					<!-- Review End-->
			</div>
			<!-- Left Section End -->

			<!-- Right Section Start -->
			<div class="col-md-5 col-lg-5 col-sm-5">
				<div class="row">
					<!-- Date Picker panel Start -->
					<div class="panel panel-default">
					<form id="selectdateForm" class="form-inline" role="form" method="post" >
					<input type="hidden"  name="act" value="mvReservation">
						<div class="panel-body">	
				<div class="row"><!-- From Choice Start -->
					<div class="col-md-3 col-lg-3 col-sm-3">
								<div class="pull-right">From : </div>
						</div>
						<div class="col-md-9 col-lg-9 col-sm-9" >		
								<input class="date-picker" id="fromdate" type="text" />
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
								<div class="col-md-9 col-lg-9 col-sm-9" >
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
					</div>	<!-- To Choice End --><br>
								<button type="button" class="btn btn-success" onclick="javascript:goReservation();">
                  				 예약하기 
               				</button>
					</div> <!--  radio button에 의한 Multi reservation End-->
					</form>
					</div>
					<!-- Date Picker panel End -->
					<div class="panel panel-default">
						<div class="panel-body">
							<img src="/carpark/img/tmpimg.JPG" width="350" height="250">
						</div>
					</div>
					<!-- img panel End -->
					<div class="well">
						<div class="panel-body">호스트 정보</div>
						<div class="text-center">
							 <button type="button" class="btn btn-success"  data-toggle="modal" data-target="#msgToHost">
                  				Send Message
               				</button>
               
							<br>
						</div>
						</div>
					<!-- host info panel End -->
					<div class="panel panel-default">
						<div class="panel-body">
							<div id="c">
							<h3>사용 가능 일</h3>
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
			// 맵 위에서 마우스 휠, 키보드 방향키가 동작하지 않도록 막음
			$('#map_div').on('scroll touchmove mousewheel', function(e){
				e.preventDefault();
				e.stopPropagation();
				return false;
			});
			
		</script>
		<script src="/carpark/js/selectlist/jquery.selectlist.js"></script>
		<script type="text/javascript">
			$(function(){
				$('select').selectlist({
					zIndex: 10,
					width: 100,
					height: 30
				});		
			})
</script>
</body>
</body>
</html>