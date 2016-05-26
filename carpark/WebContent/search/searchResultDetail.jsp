<%@page import="com.carpark.admin.model.ParkingDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/common/common.jsp" %>
<%@include file="/common/header.jsp" %> 
<%
ParkingDto parkingDetail = (ParkingDto)request.getAttribute("parkingDetail");
%>

<!-- ****************************************************************************************************************** -->	

  
    <!-- For sendMsg Modal -->
   <%@include file="/reservation/sendMessageModal.jsp"%>
   <!-- For sendMsg Modal -->
   


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
<script type="text/javascript" src="/carpark/js/search/mapsearch.js"></script>
<script type="text/javascript">
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


<!-- ****************************************************************************************************************** -->	

<br><br><br><br>


		<!-- row -->
	<div class="container" style="text-align:center">
			<!--  search bar start -->
			<div class="col-sm-13">
					<!-- /input-group -->
					<form id="searchForm" name="searchForm" class="form-inline" role="form" method="post" >
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
			<div class="col-md-7">
				<!--  Map  -->
				<div class="panel panel-default">
			<div class="row" align="left"><h3><b>&nbsp;&nbsp;&nbsp; <%=parkingDetail.getPark_name() %>  &nbsp;&nbsp;&nbsp; 
			<i class = glyphicon glyphicon-star></i><i class = glyphicon glyphicon-star></i><i class = glyphicon glyphicon-star> </i><i class = glyphicon glyphicon-star></i><i class = glyphicon glyphicon-star-empty></i></b> 
			<%=parkingDetail.getLocation() %>
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
					<span i= glyphicon glyphicon-tag></span>잠실역 <br>
					<span i= glyphicon glyphicon-tag></span>잠실포차 <br>
					<span i= glyphicon glyphicon-tag></span>잠실 호수공원<br> 
					<span i= glyphicon glyphicon-tag></span>잠실야구장<br> 
					
						<div class="panel-footer">특징</div>
						두산팬클럽 회원의 경우,주차요금 10% 할인해 드립니다.<br>
						정기권 구매시, 더욱 저렴합니다. <br>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">상세 정보</h3>
						<span i= glyphicon glyphicon-tag>주차장대수:<%=parkingDetail.getPark_capacity() %></span>, 역과 가까움, 정기권 판매, 할인혜택 제공, 카드 가능  
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
			<div class="col-md-5">
				<div class="row">
					<!-- Date Picker panel Start -->
					<div class="panel panel-default">
					<form id="selectdateForm" name="selectdateForm" class="form-inline" role="form" method="post" >
					<input type="hidden"  name="act" value="mvReservation">
						<div class="panel-body">	
				<div class="row"><!-- From Choice Start -->
					<div class="col-md-3">
								<div class="pull-right">From : </div>
						</div>
						<div class="col-md-9" >		
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
							<div class="col-md-3">
								<div class="pull-right">T o :</div> 
								</div>
								<div class="col-md-9" >
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




<!-- ****************************************************************************************************************** -->

<%@ include file="/common/footer.jsp" %>	