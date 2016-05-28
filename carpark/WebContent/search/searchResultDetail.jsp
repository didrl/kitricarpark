<%@page import="com.carpark.member.model.ReviewDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.carpark.admin.model.ParkingDto"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp"%>

<%
ParkingDto parkingDetail = (ParkingDto)request.getAttribute("parkingDetail");
ArrayList<ReviewDto> reviewlist = (ArrayList<ReviewDto>)request.getAttribute("reviewlist");
ParkingDetailDto parkingDetail_info = (ParkingDetailDto)request.getAttribute("parkingDetail_info");
//ParkingFacilityDto parkingFacilityDto = (ParkingFacilityDto)request.getAttribute("parkingFacilityDto");

/*
	ParkingDetailDto parkingDetail_info		: parkingDetail table info
	ParkingFacilityDto parkingFacilityDto	: parking_facility info + parking_img info
*/
%>

<!-- ****************************************************************************************************************** -->	

  
   <!-- For sendMsg Modal -->
   <%@include file="/reservation/sendMessageModal.jsp"%>
   <!-- For sendMsg Modal -->
   


<!-- Seclect List CSS

<link rel="stylesheet" type="text/css" href="/carpark/css/jquery.selectlist.css">
 -->

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
function goReservation() {
	if(document.selectdateForm.fromdate.value == ""){
		alert("대상을 입력하세요");
		return;
	} else if(document.selectdateForm.todate.value == "") {
		alert("제목을 입력하세요");
		return;	
	} else{
		document.selectdateForm.action = "/carpark/reservation";
		document.selectdateForm.submit();
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
<%
for(ReviewDto reviewDto : reviewlist){
	int avgpoint = (int) reviewDto.getAvgPoint();
%>
						<div class="row">
							<div class="col-md-12">
<% 
	for(int i = 0;i<avgpoint;++i){
%>
								<span class="glyphicon glyphicon-star"></span>
<% 
	}
	for(int i = 0;i<5-avgpoint;++i){
%>
								<span class="glyphicon glyphicon-star-empty"></span>
<% 
	}
%> 
								<%=reviewDto.getUser_id() %> <span class="pull-right">작성일 : <%=reviewDto.getLogtime() %></span>
								<p><%=reviewDto.getSubject()%></p>
								<p><%=reviewDto.getContent()%></p>
							</div>
						</div>
<%
}
%>

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
					<input type="hidden"  name="park_id" value="<%=parkingDetail.getPark_id()%>">
					<input type="hidden"  name="park_name" value="<%=parkingDetail.getPark_name()%>">
					<input type="hidden"  name="host_id" value="<%=parkingDetail.getPark_name()%>">
						<div class="panel-body">	
				<div class="row"><!-- From Choice Start -->
					<div class="col-md-3">
								<div class="pull-right">From : </div>
						</div>
						<div class="col-md-9" >		
								<input class="date-picker" id="fromdate" name="fromdate" type="text" />
								<select id="srfromTime" name="srfromTime">
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
								<input class="date-picker" id="todate"   name="todate" type="text" />
								<select id="srtoTime" name="srtoTime">
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

								<button type="button" onclick="javascript:goReservation();" class="btn btn-success" id="goreser" name="goreser"">

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
						<div class="panel-body">호스트 : <%=parkingDetail.getOwner_id() %></div>
						<div class="text-center">
							 <button type="button" class="btn btn-success"  id="sendMsgToHost" name="sendMsgToHost" data-toggle="modal" data-target="#msgToHost">
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
			/*
			$('#goreser').on('click', function (event) {
				  var button = $(event.relatedTarget) // Button that triggered the modal
				  $.ajax({
						type:"POST",
						url:'/carpark/reservation',
			            data:{
			            	act : "mvReservation",
			            	park_id : "<%=parkingDetail.getPark_id()%>",
			            	fromTime : $("#srfromTime").val(),
			            	toTime : $("#srtoTime").val(),
			            	fromdate : $("#fromdate").val(),
			            	todate : $("#todate").val()
			            },
			            success:function(data){
			            }
			        })

				})
			*/
			// 맵 위에서 마우스 휠, 키보드 방향키가 동작하지 않도록 막음
			$('#map_div').on('scroll touchmove mousewheel', function(e){
				e.preventDefault();
				e.stopPropagation();
				return false;
			});
			
			//review
			$('#sendMsgToHost').on('click', function (event) {
				
				<%if(memberDto !=null){%>
                  var user_id = <%=memberDto.getUser_id()%> ;
				console.log("uidasdf :"+user_id);
				  var button = $(event.relatedTarget) // Button that triggered the modal
			        $("#receiver").val("<%=parkingDetail.getOwner_id()%>");
			        $("#subject").val("");
			        $("#content").empty();
		        	$("#sendmsguser_id").val(user_id);
		        	$("#sendmsgpark_id").val("<%=parkingDetail.getPark_id()%>");
			        $("#receiver").prop("disabled", true);
			        $('#msgToHost').show();
				<%}else{%>
					alert("로그인 후 이용할 수 있습니다.");
					return;
					<%}%>
				})
			
		</script>
<!-- 		<script src="/carpark/js/selectlist/jquery.selectlist.js"></script> 
		<script type="text/javascript">
			$(function(){
				$('select').selectlist({
					zIndex: 10,
					width: 100,
					height: 30
				});		
			})
</script>


-->

<!-- ****************************************************************************************************************** -->

<%@ include file="/common/footer.jsp" %>	