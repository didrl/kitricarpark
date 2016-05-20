<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

<title>Car Park</title>

    <!-- Bootstrap Core CSS -->
    <link href="/carpark/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/carpark/css/shop-item.css" rel="stylesheet">

<!-- Simple Celander -->
<link rel="stylesheet" href="/carpark/css/calendar/style.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="/carpark/js/calendar/calendar.js"></script>
<!-- Simple Celander -->

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
<script
	src="https://apis.skplanetx.com/tmap/js?version=1&format=javascript&appKey=a4ea8cc9-e49c-308f-99de-3aadb0c70298"></script>
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
//		mapW = window.outerWidth / 2; // 지도의 가로 크기 입니다. 
//		mapH = window.outerHeight / 2; // 지도의 세로 크기 입니다. 
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
	function goSearch() {
		document.searchForm.action = "/carpark/search/seachResult.html";
		document.searchForm.submit();
	}
</script>

</head>

<body onload="init()">

    <!-- Navigation Start-->
    <!-- 기존것으로 하면 위에 공백 
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">	
    -->
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
					<form id="searchForm" class="form-inline" role="form" >
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="Search for..."> <span
							class="input-group-btn">
							<button class="btn btn-default" type="button">Go!</button>
						</span>
					</div>
					<div class="input-group">
							<input class="date-picker" id="fromdate" type="text"  />
					</div>

					<div class="input-group">
							<input class="date-picker" id="fromdate" type="text"  />
					</div>
					<div class="input-group">
						<button class="btn btn-success" type="button">Search</button>
					</div>

					</form>
				</div>
				<br><br>
				<!--  search bar end-->
		<!-- Left List Group Strat -->		
   		<div class="col-md-4">
				<h3><b>도시이름 </b>&nbsp;&nbsp;검색 결과</h3>
				<ul class="list-group">
					<a href="#" class="list-group-item">
						<h4 class="list-group-item-heading">Kitri 지하주차장</h4>
						<div class="ratings">
                        <p class="pull-right">
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            (4점)
                        </p>
                    </div>
						<p class="list-group-item-text">역에서 도보로 3분 다양한 회사들 밀집</p>
					</a>
					<a href="#" class="list-group-item">
						<h4 class="list-group-item-heading">대륭포스트 2차</h4>
						<div class="ratings">
                        <p class="pull-right">
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            (4점)
                        </p>
                    </div>
						<p class="list-group-item-text">주변에 커피집이 많고 키트리 옆집</p>
					</a>
					<a href="#" class="list-group-item">
						<h4 class="list-group-item-heading">착한커피 건물</h4>
						<div class="ratings">
                        <p class="pull-right">
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            (4점)
                        </p>
                    </div>
						<p class="list-group-item-text">커피 1000원</p>
					</a>
				</ul>
			</div>
			<!-- Left List Group End -->
			
			<!-- Right Section -->
            <div class="col-md-8">
				
				<!-- Map -->
                <div class="thumbnail">
                <div class="panel panel-default" id="divformap">
                    <section id="contact" class="map">
						<div id="map_div"></div>
					</section>
				</div>
                    <div class="caption-full">
                        <h4><a href="#">Product Name</a>
                        </h4>
                        <p>See more snippets like these online store reviews at <a target="_blank" href="http://bootsnipp.com">Bootsnipp - http://bootsnipp.com</a>.</p>
                        <p>Want to make these reviews work? Check out
                            <strong><a href="http://maxoffsky.com/code-blog/laravel-shop-tutorial-1-building-a-review-system/">this building a review system tutorial</a>
                            </strong>over at maxoffsky.com!</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
                    </div>
                    <div class="ratings">
                        <p class="pull-right">3 reviews</p>
                        <p>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            4.0 stars
                        </p>
                    </div>
                </div>

                <div class="well">

                    <div class="text-right">
                        <a class="btn btn-success">Leave a Review</a>
                    </div>

                    <hr>

                    <div class="row">
                        <div class="col-md-12">
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            Anonymous
                            <span class="pull-right">10 days ago</span>
                            <p>This product was great in terms of quality. I would definitely buy another!</p>
                        </div>
                    </div>

                    <hr>

                    <div class="row">
                        <div class="col-md-12">
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            Anonymous
                            <span class="pull-right">12 days ago</span>
                            <p>I've alredy ordered another one!</p>
                        </div>
                    </div>

                    <hr>

                    <div class="row">
                        <div class="col-md-12">
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            Anonymous
                            <span class="pull-right">15 days ago</span>
                            <p>I've seen some better than this, but not at this price. I definitely recommend this item.</p>
                        </div>
                    </div>

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
											: $('[name=' + this.hash.slice(1)
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

</html>