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
	      mapW = window.outerWidth / 2; // 지도의 가로 크기 입니다. 
	      mapH = window.outerHeight / 2; // 지도의 세로 크기 입니다. 
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
	 </script>
</head>

<body onload="init()">
	
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
		<div class="row"><!-- 같은 행에 위치해야 하는 것들은 하나의 row안에 위치 -->
		
			<!-- 좌측메뉴 -->
			<div class="col-md-3"><!-- 열은 col-md-1~12까지 -->	
			
				<div class="list-group">
  					<a href="#" class="list-group-item">
    					<h4 class="list-group-item-heading">List group item heading</h4>
    					<p class="list-group-item-text">...</p>
 					</a>
  					<a href="#" class="list-group-item">
    					<h4 class="list-group-item-heading">List group item heading</h4>
    					<p class="list-group-item-text">...</p>
 					</a>
  					<a href="#" class="list-group-item">
    					<h4 class="list-group-item-heading">List group item heading</h4>
    					<p class="list-group-item-text">...</p>
 					</a>
  					<a href="#" class="list-group-item">
    					<h4 class="list-group-item-heading">List group item heading</h4>
    					<p class="list-group-item-text">...</p>
 					</a>
  					<a href="#" class="list-group-item">
    					<h4 class="list-group-item-heading">List group item heading</h4>
    					<p class="list-group-item-text">...</p>
 					</a>
				</div>
				
			</div>
			<!-- 좌측메뉴 -->
			
			<!-- 본문내용 -->
			<div class="col-md-9">
			
				<div class="row">
					 <!-- Map -->
   						<section id="contact" class="map">
      						<div id="map_div"></div>
   						</section>
				</div>
				
			</div>
			<!-- 본문내용 -->
		
		</div>
		<!-- 본문 -->
			
		<!-- 하단 -->
		<div class="row">
			<div class="col-md-12 text-center"><span class="label label-default">하단</span></div>
		</div><hr>
		<!-- 하단 -->
		
	
	</div>



	<!-- body가 끝나는 부분에 있어야 함 -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>