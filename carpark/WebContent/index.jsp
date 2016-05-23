<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>

<%@include file="/common/header/init.jsp"%>
<!-- Tmap -->
<!-- Simple Celander -->
<link rel="stylesheet" href="/carpark/css/calendar/style.css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="/carpark/js/calendar/calendar.js"></script>
<!-- Simple Celander -->
<script
	src="https://apis.skplanetx.com/tmap/js?version=1&format=javascript&appKey=a4ea8cc9-e49c-308f-99de-3aadb0c70298">
	
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
		var div = $("#divformap");
		mapW = div.innerWidth(); //jquery를 이용해서 width얻기
		if (div.innerHeight() != 0)
			mapH = div.innerHeight();
		else
			mapH = window.outerHeight / 2;

		window.oncontextmenu = function() {
			return false;
		}

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
					var icon = new Tmap.Icon('https://developers.skplanetx.com/upload/tmap/marker/pin_b_m_a.png',size, offset);
					var label = new Tmap.Label("당신의 현재 위치!")

					var markers = new Tmap.Markers(cLonLat, icon, label);
					markerLayer.addMarker(markers);
					markers.popup.show()

				});
		// div : 지도가 생성될 div의 id값과 같은 값을 옵션으로 정의 합니다.
	}
	// body에 onload를 할 수 없어서 임시로 붙여놓은 함수
	function addLoadEvent(func) {
		var oldonload = window.onload;
		if (typeof window.onload != 'function') {
			window.onload = func;
		} else {
			window.onload = function() {
				oldonload();
				func();
			};
		}

	}
	addLoadEvent(init);

	// document.searchForm.action = "root%>/seachResult.html";
	function goSearchResult() {
		if (document.getElementById("citysearch").value == "") {
			alert("검색하실 도시의 이름을 입력해주세요.");
			return;
		} else if (document.getElementById("fromdatesearch").value == "") {
			alert("시작일을 입력해주세요.");
			return;
		} else if (document.getElementById("todatesearch").value == "") {
			alert("종료일을 입력해주세요.");
			return;
		} else {
			document.searchForm.action = "/carpark/member";
			document.searchForm.submit();
		}
	}
</script>

<header id="top" class="header">
	<div class="text-vertical-center">
		<div class="center-block">
			<h1>CPark</h1>
			<h3>Parking Share</h3>
			<br>
			<!--  search bar start -->
			<div class="col-sm-13">
				<!-- /input-group -->
				<form id="searchForm" class="form-inline" role="form" method="post">
					<input type="hidden" name="act" value="mvSearchResult">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="Search for..."> <span
							class="input-group-btn">
							<button class="btn btn-default" type="button">Go!</button>
						</span>
					</div>
					<div class="input-group">
						<input class="date-picker" id="fromdatesearch" type="text" />
					</div>

					<div class="input-group">
						<input class="date-picker" id="todatesearch" type="text" />
					</div>
					<div class="input-group">
						<button class="btn btn-success" type="button"
							onclick="javascript:goSearchResult();">Search</button>
					</div>
				</form>
			</div>
			<br>
			<br>
			<!--  search bar end-->
			<!-- /.col-sm-6 ____-->

		</div>
	</div>
</header>

<!-- Services -->
<!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
<section id="services" class="services bg-primary">
	<div class="container">
		<div class="row text-center">
			<div class="col-lg-10 col-lg-offset-1">
				<h2>Our Services</h2>
				<hr class="small">
				<div class="row">
					<div class="col-md-3 col-sm-6">
						<div class="service-item">
							<span class="fa-stack fa-4x"> <i
								class="fa fa-circle fa-stack-2x"></i> <i
								class="fa fa-cloud fa-stack-1x text-primary"></i>
							</span>
							<h4>
								<strong>Service Name</strong>
							</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
							<a href="#" class="btn btn-light">Learn More</a>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="service-item">
							<span class="fa-stack fa-4x"> <i
								class="fa fa-circle fa-stack-2x"></i> <i
								class="fa fa-compass fa-stack-1x text-primary"></i>
							</span>
							<h4>
								<strong>Service Name</strong>
							</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
							<a href="#" class="btn btn-light">Learn More</a>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="service-item">
							<span class="fa-stack fa-4x"> <i
								class="fa fa-circle fa-stack-2x"></i> <i
								class="fa fa-flask fa-stack-1x text-primary"></i>
							</span>
							<h4>
								<strong>Service Name</strong>
							</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
							<a href="#" class="btn btn-light">Learn More</a>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="service-item">
							<span class="fa-stack fa-4x"> <i
								class="fa fa-circle fa-stack-2x"></i> <i
								class="fa fa-shield fa-stack-1x text-primary"></i>
							</span>
							<h4>
								<strong>Service Name</strong>
							</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
							<a href="#" class="btn btn-light">Learn More</a>
						</div>
					</div>
				</div>
				<!-- /.row (nested) -->
			</div>
			<!-- /.col-lg-10 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
</section>

<!-- Callout -->
<aside class="callout">
	<div class="text-vertical-center">
		<h1>Vertically Centered Text</h1>
	</div>
</aside>


<!--  Map  -->
<div class="panel panel-default">
	<div class="panel panel-default" id="divformap">
		<section id="contact" class="map">
			<div id="map_div"></div>
			<br>
		</section>
	</div>
</div>

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
		$('a[href*=#]:not([href=#])').click(
				function() {
					if (location.pathname.replace(/^\//, '') == this.pathname
							.replace(/^\//, '')
							|| location.hostname == this.hostname) {

						var target = $(this.hash);
						target = target.length ? target : $('[name='
								+ this.hash.slice(1) + ']');
						if (target.length) {
							$('html,body').animate({
								scrollTop : target.offset().top
							}, 1000);
							return false;
						}
					}
				});
	});
	$('#map_div').on('scroll touchmove mousewheel', function(e) {
		e.preventDefault();
		e.stopPropagation();
		return false;
	});
</script>
<script src="/carpark/js/selectlist/jquery.selectlist.js"></script>
<script type="text/javascript">
	$(function() {
		$('select').selectlist({
			zIndex : 10,
			width : 100,
			height : 30
		});
	})
</script>

<!-- Footer -->
<%@include file="/common/footer.jsp"%>
<!-- /Footer -->

