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
<script type="text/javascript" src="/carpark/js/search/mapsearch.js"></script>


<header id="top" class="header">
	<div class="text-vertical-center">
		<div class="center-block">
			<h1>CPark</h1>
			<h3>Parking Share</h3>
			<br>
			<!--  search bar start -->
			<div class="col-sm-13">
				<!-- /input-group -->
				<form id="searchForm" name="searchForm" class="form-inline" role="form" method="post">
					<input type="hidden" name="act" value="mvSearchResult">
					<input type="hidden" name="search" value="">
					
					
					<div class="input-group">
						<input type="text" class="form-control" id="citysearch" name="city" placeholder="Search for...">
					</div>
					<div class="input-group">
						<input class="date-picker" id="fromdatesearch" name="from" type="text" />
					</div>

					<div class="input-group">
						<input class="date-picker" id="todatesearch" type="text" name="to"/>
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

