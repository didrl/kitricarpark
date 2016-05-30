<%@page import="com.carpark.member.model.FavoriteDto"%>
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
ArrayList<FavoriteDto> favoritelist = (ArrayList<FavoriteDto>) request.getAttribute("favoritelist");

//ParkingFacilityDto parkingFacilityDto = (ParkingFacilityDto)request.getAttribute("parkingFacilityDto");

System.out.println("<><><><><><><><"+parkingDetail.getPark_id()	);
System.out.println("<><><><latitude><><><"+parkingDetail.getLatitude());
System.out.println("<><><><longtitude><><"+parkingDetail.getLongitude());
System.out.println("<><><><content><><"+parkingDetail.getContent());

int flagj=0;

for(FavoriteDto favoriteDto : favoritelist){
	if(favoriteDto.getPark_id() ==	parkingDetail.getPark_id()){
		flagj=1;
		break;
	}
}

/*
	ParkingDetailDto parkingDetail_info		: parkingDetail table info
	ParkingFacilityDto parkingFacilityDto	: parking_facility info + parking_img info
*/
%>

<!-- ****************************************************************************************************************** -->	

  
   <!-- For sendMsg Modal -->
   <%@include file="/reservation/sendMessageModal.jsp"%>
   <!-- For sendMsg Modal -->
   
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
 
 <!-- calendar -->
 <link href="/carpark/css/calendar/glDatePicker.default.css" rel="stylesheet" type="text/css">
 
 
<!-- Custom Fonts -->
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Damu map -->
<link rel="stylesheet" href="/carpark/css/roadview.css">


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
		<script src="/carpark/js/calendar/glDatePicker.min.js"></script>


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

function setfavorite(){
	var flag=<%=flagj%>;
	console.log("asdf!@!@!"+flag+"     "+"<%=flagj%>");
	if(flag!=0){
		alert("즐겨찾기에서 삭제되었습니다")
		document.location.href = "<%=root%>/member?act=delfavorite&park_id=<%=parkingDetail.getPark_id()%>";
		
	}else{
		alert("즐겨찾기에 추가되었습니다")
		document.location.href = "<%=root%>/member?act=addfavorite&park_id=<%=parkingDetail.getPark_id()%>";

	}
}

</script>


<!-- ****************************************************************************************************************** -->	

<br><br><br><br>


		<!-- row -->
	<div class="container" style="text-align:center">
<%@include file="/common/searchBar.jsp"%>
		
			<!-- Left Section Start -->
			<div class="col-md-7">
				<!--  Map  -->
				<div class="panel panel-default">
					<div class="row" align="left">
						<h3><b>&nbsp;&nbsp;&nbsp; <%=parkingDetail.getPark_name()%>  &nbsp;&nbsp;&nbsp; 
							<i class = glyphicon glyphicon-star></i><i class = glyphicon glyphicon-star></i><i class = glyphicon glyphicon-star> </i><i class = glyphicon glyphicon-star></i><i class = glyphicon glyphicon-star-empty></i></b> 
							<%=parkingDetail.getLocation()%>
							<a href="#" onclick="javascript:setfavorite();"><img id="favoriteimg" height="30"  src="/carpark/img/heart.jpg"></a>
						</h3>
					</div>
				</div>	
				<div class="panel panel-default" id="daummap">
					<div class="panel-body">
						<div id="container">
						    <div id="rvWrapper">
						        <div id="roadview" style="width:100%;height:100%;"></div> <!-- 로드뷰를 표시할 div 입니다 -->							        <div id="close" title="로드뷰닫기" onclick="closeRoadview()"><span class="img"></span></div>
						    </div>
						    <div id="mapWrapper">
						        <div id="map" style="width:100%; height:350px;"></div> <!-- 지도를 표시할 div 입니다 -->
						        <div id="roadviewControl" onclick="setRoadviewRoad()"><span>로드뷰</span></div>							    </div>
							</div>
							
							<!-- Daum map script-->
							
						<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=c2d873676f2c4854b2b2c62e165a629d"></script>
						<script>
							var overlayOn = false, // 지도 위에 로드뷰 오버레이가 추가된 상태를 가지고 있을 변수
						    container = document.getElementById('container'), // 지도와 로드뷰를 감싸고 있는 div 입니다
						    mapWrapper = document.getElementById('mapWrapper'), // 지도를 감싸고 있는 div 입니다
						    mapContainer = document.getElementById('map'), // 지도를 표시할 div 입니다 
						    rvContainer = document.getElementById('roadview'); //로드뷰를 표시할 div 입니다
							
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							    mapOption = { 
							        center: new daum.maps.LatLng(<%=parkingDetail.getLatitude()%>, <%=parkingDetail.getLongitude()%>), // 지도의 중심좌표
							        level: 3 // 지도의 확대 레벨
							    };
							
							var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
							
							
							
							// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
							var mapTypeControl = new daum.maps.MapTypeControl();

							// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
							// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
							map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
							
							// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
							var zoomControl = new daum.maps.ZoomControl();
							map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
							
							//마우스 휠로 지도 확대,축소 가능여부를 설정합니다
							map.setZoomable(false);  
							
							// 지도 타입 정보를 가지고 있을 객체입니다
							// map.addOverlayMapTypeId 함수로 추가된 지도 타입은
							// 가장 나중에 추가된 지도 타입이 가장 앞에 표시됩니다
							// 이 예제에서는 지도 타입을 추가할 때 지적편집도, 지형정보, 교통정보, 자전거도로 정보 순으로 추가하므로
							// 자전거 도로 정보가 가장 앞에 표시됩니다
							var mapTypes = {    
							    traffic :  daum.maps.MapTypeId.TRAFFIC,
							    bicycle : daum.maps.MapTypeId.BICYCLE
							    
							};
							
							// 체크 박스를 선택하면 호출되는 함수입니다
							function setOverlayMapTypeId() {
							    var chkTraffic = document.getElementById('chkTraffic'),
							        chkBicycle = document.getElementById('chkBicycle');					    
							    // 지도 타입을 제거합니다
							    for (var type in mapTypes) {
							        map.removeOverlayMapTypeId(mapTypes[type]);    
							    }
							 // 교통정보 체크박스가 체크되어있으면 지도에 교통정보 지도타입을 추가합니다
							    if (chkTraffic.checked) {
							        map.addOverlayMapTypeId(mapTypes.traffic);    
							    }
							    // 자전거도로정보 체크박스가 체크되어있으면 지도에 자전거도로정보 지도타입을 추가합니다
							    if (chkBicycle.checked) {
							        map.addOverlayMapTypeId(mapTypes.bicycle);    
							    }
							}
							
							// 지도에 마커를 생성하고 표시한다
							var marker = new daum.maps.Marker({
							    position: new daum.maps.LatLng(<%=parkingDetail.getLatitude()%>, <%=parkingDetail.getLongitude()%>), // 마커의 좌표
							    map: map // 마커를 표시할 지도 객체
							});

							// 마커 위에 표시할 인포윈도우를 생성한다
							var infowindow = new daum.maps.InfoWindow({
							    content : '<div style="padding:5px;">찾으신 주차장 :D</div>' // 인포윈도우에 표시할 내용
							});

							// 인포윈도우를 지도에 표시한다
							infowindow.open(map, marker);
							
							//for roadview marker start
							// 로드뷰 객체를 생성합니다 
							var rv = new daum.maps.Roadview(rvContainer); 

							// 좌표로부터 로드뷰 파노라마 ID를 가져올 로드뷰 클라이언트 객체를 생성합니다 
							var rvClient = new daum.maps.RoadviewClient(); 

							// 로드뷰에 좌표가 바뀌었을 때 발생하는 이벤트를 등록합니다 
							daum.maps.event.addListener(rv, 'position_changed', function() {

							    // 현재 로드뷰의 위치 좌표를 얻어옵니다 
							    var rvPosition = rv.getPosition();

							    // 지도의 중심을 현재 로드뷰의 위치로 설정합니다
							    map.setCenter(rvPosition);

							    // 지도 위에 로드뷰 도로 오버레이가 추가된 상태이면
							    if(overlayOn) {
							        // 마커의 위치를 현재 로드뷰의 위치로 설정합니다
							        roadmarker.setPosition(rvPosition);
							    }
							});
							
							
							// 마커 이미지를 생성합니다
							var markImage = new daum.maps.MarkerImage(
							    'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/roadview_wk.png',
							    new daum.maps.Size(35,39), {
							    //마커의 좌표에 해당하는 이미지의 위치를 설정합니다.
							    //이미지의 모양에 따라 값은 다를 수 있으나, 보통 width/2, height를 주면 좌표에 이미지의 하단 중앙이 올라가게 됩니다.
							    offset: new daum.maps.Point(14, 39)
							});

							// 드래그가 가능한 마커를 생성합니다
							var roadmarker = new daum.maps.Marker({
							    image : markImage,
							    position: mapCenter,
							    draggable: true
							});

							// 마커에 dragend 이벤트를 등록합니다
							daum.maps.event.addListener(roadmarker, 'dragend', function(mouseEvent) {

							    // 현재 마커가 놓인 자리의 좌표입니다 
							    var position = roadmarker.getPosition();

							    // 마커가 놓인 위치를 기준으로 로드뷰를 설정합니다
							    toggleRoadview(position);
							});
							
							//지도에 클릭 이벤트를 등록합니다
							daum.maps.event.addListener(map, 'click', function(mouseEvent){
							    
							    // 지도 위에 로드뷰 도로 오버레이가 추가된 상태가 아니면 클릭이벤트를 무시합니다 
							    if(!overlayOn) {
							        return;
							    }

							    // 클릭한 위치의 좌표입니다 
							    var position = mouseEvent.latLng;

							    // 마커를 클릭한 위치로 옮깁니다
							    marker.setPosition(position);

							    // 클릭한 위치를 기준으로 로드뷰를 설정합니다
							    toggleRoadview(position);
							});

							// 전달받은 좌표(position)에 가까운 로드뷰의 파노라마 ID를 추출하여
							// 로드뷰를 설정하는 함수입니다
							function toggleRoadview(position){
							    rvClient.getNearestPanoId(position, 50, function(panoId) {
							        // 파노라마 ID가 null 이면 로드뷰를 숨깁니다
							        if (panoId === null) {
							            toggleMapWrapper(true, position);
							        } else {
							         toggleMapWrapper(false, position);

							            // panoId로 로드뷰를 설정합니다
							            rv.setPanoId(panoId, position);
							        }
							    });
							}

							// 지도를 감싸고 있는 div의 크기를 조정하는 함수입니다
							function toggleMapWrapper(active, position) {
							    if (active) {

							        // 지도를 감싸고 있는 div의 너비가 100%가 되도록 class를 변경합니다 
							        container.className = '';

							        // 지도의 크기가 변경되었기 때문에 relayout 함수를 호출합니다
							        map.relayout();

							        // 지도의 너비가 변경될 때 지도중심을 입력받은 위치(position)로 설정합니다
							        map.setCenter(position);
							    } else {

							        // 지도만 보여지고 있는 상태이면 지도의 너비가 50%가 되도록 class를 변경하여
							        // 로드뷰가 함께 표시되게 합니다
							        if (container.className.indexOf('view_roadview') === -1) {
							            container.className = 'view_roadview';

							            // 지도의 크기가 변경되었기 때문에 relayout 함수를 호출합니다
							            map.relayout();

							            // 지도의 너비가 변경될 때 지도중심을 입력받은 위치(position)로 설정합니다
							            map.setCenter(position);
							        }
							    }
							}

							// 지도 위의 로드뷰 도로 오버레이를 추가,제거하는 함수입니다
							function toggleOverlay(active) {
							    if (active) {
							        overlayOn = true;

							        // 지도 위에 로드뷰 도로 오버레이를 추가합니다
							        map.addOverlayMapTypeId(daum.maps.MapTypeId.ROADVIEW);

							        // 지도 위에 마커를 표시합니다
							        roadmarker.setMap(map);

							        // 마커의 위치를 지도 중심으로 설정합니다 
							        roadmarker.setPosition(map.getCenter());

							        // 로드뷰의 위치를 지도 중심으로 설정합니다
							        toggleRoadview(map.getCenter());
							    } else {
							        overlayOn = false;

							        // 지도 위의 로드뷰 도로 오버레이를 제거합니다
							        map.removeOverlayMapTypeId(daum.maps.MapTypeId.ROADVIEW);

							        // 지도 위의 마커를 제거합니다
							        roadmarker.setMap(null);
							    }
							}

							// 지도 위의 로드뷰 버튼을 눌렀을 때 호출되는 함수입니다
							function setRoadviewRoad() {
							    var control = document.getElementById('roadviewControl');

							    // 버튼이 눌린 상태가 아니면
							    if (control.className.indexOf('active') === -1) {
							        control.className = 'active';

							        // 로드뷰 도로 오버레이가 보이게 합니다
							        toggleOverlay(true);
							    } else {
							        control.className = '';

							        // 로드뷰 도로 오버레이를 제거합니다
							        toggleOverlay(false);
							    }
							}

							// 로드뷰에서 X버튼을 눌렀을 때 로드뷰를 지도 뒤로 숨기는 함수입니다
							function closeRoadview() {
							    var position = marker.getPosition();
							    toggleMapWrapper(true, position);
							}
							//for roadview marker end
							
							</script>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">상세 정보</h3>  
					</div>
					<div class="panel-body">
						<p>
						    <input type="checkbox" id="chkTraffic" onclick="setOverlayMapTypeId()" /> 주위 교통상황을 지도에서 확인하세요     
						    <input type="checkbox" id="chkBicycle" onclick="setOverlayMapTypeId()" /> 자동차에서 자전거로! 자전거 도로 정보 보기
						</p>
						<p>
						    <input type="checkbox" id="chkRoadview" onclick="setOverlayMapTypeId()" /> 생생한 주차장 위치 보기
						</p>
						<p><%=parkingDetail.getContent()%></p>	
					</div>
					<div class="panel-footer">상세 사진</div>
					<a href="원본사진"><img src="/carpark/img/tmpcar/car1.jpg"></a>
					<a href="원본사진"><img src="/carpark/img/tmpcar/car2.jpg"></a>
					<a href="원본사진"><img src="/carpark/img/tmpcar/car3.jpg"></a>
				</div>
				
				<div class="panel panel-default">
					<div class="panel-heading">위치 미리보기</div>
					<div class="panel-body">
					
					<!-- Daum road View start -->
						
						
						<!-- Daum road View End -->
						<!-- Street View start -->
						<iframe width="300" height="200" frameborder="1" style="border: 0"
							src="https://www.google.com/maps/embed/v1/streetview?key=AIzaSyB3d8wlcwuwvoXDFp4vd4ghi9nDnuDt4Hw&location=46.414382,10.013988&heading=210&pitch=10&fov=35">
						</iframe>
						<!-- Street View End -->
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">주변 정보</div>
					<div class="panel-body">
						<!-- Daum road View start -->
						
						
						<!-- Daum road View End -->
						<!-- Street View start -->
						<iframe width="300" height="200" frameborder="1" style="border: 0"
							src="https://www.google.com/maps/embed/v1/streetview?key=AIzaSyB3d8wlcwuwvoXDFp4vd4ghi9nDnuDt4Hw&location=46.414382,10.013988&heading=210&pitch=10&fov=35">
						</iframe>
						<!-- Street View End -->
					</div>
				</div>
				
				<!-- Review Start-->
				<div class="panel panel-default">
					<div class="panel-heading"> 
						<b>Review</b>
							<div class="text-right">
								<a class="btn btn-success">Leave a Review</a>
							</div>
					</div>
					<div class="panel-body">
							<hr></hr>
<%
for(ReviewDto reviewDto : reviewlist){
	int avgpoint = (int) reviewDto.getAvgPoint();
%>
							<div class="row">
								<div class="col-md-12">
									<p><%=reviewDto.getUser_id() %></p>
									<span class="pull-right">작성일 : <%=reviewDto.getLogtime() %></span>
							</div>
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
							<div class="row">
									<p><%=reviewDto.getSubject()%></p>
							</div>
							<div class="row">
									<p><%=reviewDto.getContent()%></p>
									<p>-------------------------------------------</p>
								</div>
							</div>
	<%
	}
	%>
	
						</div>
					</div>
				</div>
					<!-- Review End-->
			
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
					<input type="hidden"  name="host_id" value="<%=parkingDetail.getOwner_id()%>">
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

								<button type="button" onclick="javascript:goReservation();" class="btn btn-success" id="goreser" name="goreser">
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
							 <button type="button" class="btn btn-success"  id="sendMsgToHost" name="sendMsgToHost" data-toggle="modal"  data-target="#msgToHost">
                  				Send Message
               				</button>
               
							<br>
						</div>
						</div>
					<!-- host info panel End -->
					<!--  clelander panel  -->
					<div class="panel panel-default">
						<div class="panel-body" id="datepanelbody">
    						</div>
						</div>
					</div>
					<!--  clelander panel End  -->
				</div>
			</div>
		
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
	
			
			//review
			$('#sendMsgToHost').on('click', function (event) {
		 		<%//if(memberDto !=null){%>
			        $("#receiver").val("<%=parkingDetail.getOwner_id()%>");
			        $("#subject").val("");
			        $("#content").empty();
		        	$("#sendmsguser_id").val("<%=memberDto.getUser_id()%>");
		        	$("#sendmsgpark_id").val("<%=parkingDetail.getPark_id()%>");
			        $("#receiver").prop("disabled", true);
		     //    $("#msgToHost").load("<%=root%>/reservation/sendMessageModal.jsp");
				<%//}else{%>
					//alert("로그인 후 이용할 수 있습니다.");
					//return;
				 	<%//}}%>
				})
			
		</script>


    <script type="text/javascript">
        $(window).load(function()
        {
            $('#datepanelbody').glDatePicker(
           {
            showAlways: true,
            allowMonthSelect: false,
            allowYearSelect: false,
            prevArrow: '',
            nextArrow: '',
            selectedDate: new Date(),
            selectableDateRange: [
                { from: new Date(2013, 8, 1),
                    to: new Date(2013, 8, 10) },
                { from: new Date(2013, 8, 19),
                    to: new Date(2013, 8, 22) },
            ],
            selectableDates: [
                { date: new Date(2013, 8, 24) },
                { date: new Date(2013, 8, 30) }
            ]
           });
        });
        

    </script>
		


<!--  ******************************************************************************************************************  -->

<%@ include file="/common/footer.jsp" %>