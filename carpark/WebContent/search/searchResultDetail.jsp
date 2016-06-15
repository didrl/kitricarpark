<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.carpark.member.model.FavoriteDto"%>
<%@page import="com.carpark.member.model.ReviewDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.carpark.common.model.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp"%>

<%
ParkingDto parkingDetail = (ParkingDto)session.getAttribute("parkingDetail");
ArrayList<ReviewDto> reviewlist = (ArrayList<ReviewDto>)session.getAttribute("reviewlist");
ParkingDetailDto parkingDetail_info = (ParkingDetailDto)session.getAttribute("parkingDetail_info");
ArrayList<Map<String,String>> availabledate = (ArrayList<Map<String,String>>)session.getAttribute("availabledate");
Map<String, String> map =(Map<String,String>)session.getAttribute("searchInfo"); 
ArrayList<FavoriteDto> favoritelist;

if(map == null || parkingDetail==null){
	%>
	<script>
	alert("세션이 종료되었습니다. 다시 시도해주세요.");
	document.location.href = "<%=root%>/index.jsp";
	</script>
	<%
}
StringBuffer sb =new StringBuffer();
int size = availabledate.size();
if(size==0){
	String tmp ="{from : new Date()}";
	sb.append(tmp);
}
else if(size<2 && size>0){
	String tmp ="{from : new Date("+availabledate.get(0).get("enddate")+")}";
	sb.append(tmp);
}else{
	for(int i=0;i<size-1;++i){
		String tmp ="{from : new Date("+availabledate.get(i).get("enddate")+"),";
		sb.append(tmp);
		tmp ="to : new Date("+availabledate.get(i+1).get("startdate")+")},";
		sb.append(tmp);
		tmp ="{from : new Date("+availabledate.get(i+1).get("enddate")+")},";
		sb.append(tmp);
	}
}

int flagrs=0;
int flagb=0;
String user_id="";
if(memberDto != null){
	user_id = memberDto.getUser_id();
	flagb=1;
	favoritelist = (ArrayList<FavoriteDto>) session.getAttribute("favoritelist");
	
	for(FavoriteDto favoriteDto : favoritelist){
		if(favoriteDto.getPark_id() ==	parkingDetail.getPark_id()){
			flagrs=1;
			break;
		}
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
   
   <!-- For sendMsg Modal -->
   <%@include file="/module/review_modal.jsp"%>
   <!-- For sendMsg Modal -->

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
<link rel="stylesheet" href="/carpark/css/aroundinfo.css">
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=c2d873676f2c4854b2b2c62e165a629d&libraries=services"></script>
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

function writeReview(){
	
}

function goReservation() {
	var flagr=0;
	flagr=<%=flagb%>
	if(flagr!=0){
		if($("#fromdate").val() == ""){
			alert("대상을 입력하세요");
			return;
		} else if($("#todate").val()== "") {
			alert("제목을 입력하세요");
			return;	
		}else if($("#fromdate").val()==$("#todate").val()){
			if($("srfromTime").val()>$("srtoTime").val() || $("srfromTime option:selected").val()==$("srtoTime option:selected").val()){
				alert("날짜를 확인하고 다시 시도해주세요.");
				return;
			}
		}else{
			document.selectdateForm.action = "/carpark/reservation";
			document.selectdateForm.submit();
		}
	}else{
		alert("로그인 후 이용할 수 있습니다.");
		return;
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
	var flagf=0;
	var flagr =0;
	flagr =<%=flagrs%>;
	flagf=<%=flagb%>;
	console.log("ff : "+ flagr +"\t" + <%=flagb%>);
	if(flagf!=0){
		if(flagr!=0){
			alert("즐겨찾기에서 삭제되었습니다")
			document.location.href = "<%=root%>/favorite?act=delfavorite&park_id=<%=parkingDetail.getPark_id()%>";
			
		}else{
			alert("즐겨찾기에 추가되었습니다")
			document.location.href = "<%=root%>/favorite?act=addfavorite&park_id=<%=parkingDetail.getPark_id()%>";
	
		}
	}else{
		alert("로그인 후 이용할 수 있습니다.");
		return;
	}
}

</script>


<!-- ****************************************************************************************************************** -->	

<br><br><br><br>


		<!-- row -->
	<div class="container" style="text-align:center">
<%@include file="/common/searchBar.jsp"%>
		<br><br>
			<!-- Left Section Start -->
			<div class="col-md-7">
				<!--  Map  -->
				<div class="panel panel-default">
					<div class="row" align="left">
						<h3><b>&nbsp;&nbsp;&nbsp; <%=parkingDetail.getPark_name()%>  &nbsp;&nbsp;&nbsp; 
							<i class = glyphicon glyphicon-star></i><i class = glyphicon glyphicon-star></i><i class = glyphicon glyphicon-star> </i><i class = glyphicon glyphicon-star></i><i class = glyphicon glyphicon-star-empty></i></b> 
							<%=parkingDetail.getDetailAddr() %>
							<a href="javascript:setfavorite();"><img height="25"  src="/carpark/img/green-heart.png"></a>
						</h3>
					</div>
				</div>	
				<div class="panel panel-default" id="daummap">
					<div class="panel-body">
						<div id="container">
						    
						    <div id="mapWrapper">
						        <div id="searchmap" style="width:100%; height:350px;"></div> <!-- 지도를 표시할 div 입니다 --> 
							</div>
							
							
							<!-- Daum map script-->
							
						<script>
							
							var mapContainer = document.getElementById('searchmap'), // 지도를 표시할 div 
							    mapOption = { 
							        center: new daum.maps.LatLng(<%=parkingDetail.getLatitude()%>, <%=parkingDetail.getLongitude()%>), // 지도의 중심좌표
							        level: 3 // 지도의 확대 레벨
							    };
							
							var searchmap = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
							
							// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
							var mapTypeControl = new daum.maps.MapTypeControl();

							// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
							// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
							searchmap.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
							
							// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
							var zoomControl = new daum.maps.ZoomControl();
							searchmap.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
							
							//마우스 휠로 지도 확대,축소 가능여부를 설정합니다
							searchmap.setZoomable(false);  
							
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
							        searchmap.removeOverlayMapTypeId(mapTypes[type]);    
							    }
							 // 교통정보 체크박스가 체크되어있으면 지도에 교통정보 지도타입을 추가합니다
							    if (chkTraffic.checked) {
							        searchmap.addOverlayMapTypeId(mapTypes.traffic);    
							    }
							    // 자전거도로정보 체크박스가 체크되어있으면 지도에 자전거도로정보 지도타입을 추가합니다
							    if (chkBicycle.checked) {
							        searchmap.addOverlayMapTypeId(mapTypes.bicycle);    
							    }
							}
							
							// 지도에 마커를 생성하고 표시한다
							var marker = new daum.maps.Marker({
							    position: new daum.maps.LatLng(<%=parkingDetail.getLatitude()%>, <%=parkingDetail.getLongitude()%>), // 마커의 좌표
							    map: searchmap // 마커를 표시할 지도 객체
							});

							// 마커 위에 표시할 인포윈도우를 생성한다
							var infowindow = new daum.maps.InfoWindow({
							    content : '<div style="padding:5px;">찾으신 주차장 :D</div>' // 인포윈도우에 표시할 내용
							});

							// 인포윈도우를 지도에 표시한다
							infowindow.open(searchmap, marker);
							</script>
					</div>
					
					
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">상세 정보</h3>  
					</div>
					<div class="panel-body">
						<p align="left" >
						    <input type="checkbox" id="chkTraffic" onclick="setOverlayMapTypeId()" /> 주위 교통상황을 지도에서 확인하세요     
						    <br><input type="checkbox" id="chkBicycle" onclick="setOverlayMapTypeId()" /> 자동차에서 자전거로! 자전거 도로 정보 보기
						</p>
					
						<p><%=parkingDetail.getContent()%></p>	
					</div>
					<div class="panel-footer">상세 사진</div>
					<a href="원본사진"><img src="/carpark/img/tmpcar/car1.jpg"></a>
					<a href="원본사진"><img src="/carpark/img/tmpcar/car2.jpg"></a>
					<a href="원본사진"><img src="/carpark/img/tmpcar/car3.jpg"></a>
					<!-- 
					<div id="roadview" style="width:100%;height:300px"></div>
					 -->
					<script>
					/* var rvContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
					var rv = new daum.maps.Roadview(rvContainer); //로드뷰 객체
					var rvClient = new daum.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

					//지도의 중심좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
					rvClient.getNearestPanoId(mapCenter, 50, function(panoId) {
					    rv.setPanoId(panoId, mapCenter); //panoId와 중심좌표를 통해 로드뷰 실행
					});
					
					daum.maps.event.addListener(rv, 'init', function() {

					    

					    //rvCustomOverlay.setAltitude(2); //커스텀 오버레이의 고도값을 설정합니다.(로드뷰 화면 중앙이 0입니다)
					    rvCustomOverlay.setMap(rv);

					    var projection = rv.getProjection(); // viewpoint(화면좌표)값을 추출할 수 있는 projection 객체를 가져옵니다.
					    
					    // 커스텀오버레이의 position과 altitude값을 통해 viewpoint값(화면좌표)를 추출합니다.
					    var viewpoint = projection.viewpointFromCoords(rvCustomOverlay.getPosition(), rvCustomOverlay.getAltitude());

					    rv.setViewpoint(viewpoint); //커스텀 오버레이를 로드뷰의 가운데에 오도록 로드뷰의 시점을 변화 시킵니다.
					}); */
					</script>
					
				</div>
				
						<div class="panel panel-default">
					<div class="panel-heading">주변 정보</div>
					<div class="panel-body">
											<!-- Daum category Map start -->
						<div class="map_wrap">
							    <div id="aroundmap" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
							    <ul id="category">
							        <li id="BK9" data-order="0"><span class="category_bg bank"></span>은행 </li>       
							        <li id="MT1" data-order="1"><span class="category_bg mart"></span>마트</li>  
							        <li id="PM9" data-order="2"><span class="category_bg pharmacy"></span>약국</li>  
							        <li id="OL7" data-order="3"><span class="category_bg oil"></span>주유소</li>  
							        <li id="CE7" data-order="4"><span class="category_bg cafe"></span>카페</li>  
							        <li id="CS2" data-order="5"><span class="category_bg store"></span>편의점</li>      
							    </ul>
						</div>
						
<script>
// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    markers = [], // 마커를 담을 배열입니다
    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
 
var mapContainer2 = document.getElementById('aroundmap'), // 지도를 표시할 div 
    mapOption2 = {
        center: new daum.maps.LatLng(<%=parkingDetail.getLatitude()%>, <%=parkingDetail.getLongitude()%>), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var aroundmap = new daum.maps.Map(mapContainer2, mapOption2); 

var zoomControl2 = new daum.maps.ZoomControl();
aroundmap.addControl(zoomControl2, daum.maps.ControlPosition.RIGHT);

//지도에 마커를 생성하고 표시한다
var marker2 = new daum.maps.Marker({
    position: new daum.maps.LatLng(<%=parkingDetail.getLatitude()%>, <%=parkingDetail.getLongitude()%>), // 마커의 좌표
    map: aroundmap // 마커를 표시할 지도 객체
});

// 마커 위에 표시할 인포윈도우를 생성한다
var infowindow2 = new daum.maps.InfoWindow({
    content : '<div style="padding:5px;">찾으신 주차장 :D</div>' // 인포윈도우에 표시할 내용
});

// 인포윈도우를 지도에 표시한다
infowindow2.open(aroundmap, marker2);


// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places(aroundmap); 

// 지도에 idle 이벤트를 등록합니다
daum.maps.event.addListener(aroundmap, 'idle', searchPlaces);

// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
contentNode.className = 'placeinfo_wrap';

// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 daum.maps.event.preventMap 메소드를 등록합니다 
addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', daum.maps.event.preventMap);

// 커스텀 오버레이 컨텐츠를 설정합니다
placeOverlay.setContent(contentNode);  

// 각 카테고리에 클릭 이벤트를 등록합니다
addCategoryClickEvent();

// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// 카테고리 검색을 요청하는 함수입니다
function searchPlaces() {
    if (!currCategory) {
        return;
    }
    // 커스텀 오버레이를 숨깁니다 
    placeOverlay.setMap(null);
    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB( status, data, pagination ) {
    if (status === daum.maps.services.Status.OK) {
        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
        displayPlaces(data.places);
    } else if (status === daum.maps.services.Status.ZERO_RESULT) {
        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
    } else if (status === daum.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
    }
}

// 지도에 마커를 표출하는 함수입니다
function displayPlaces(places) {
    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
    var order = document.getElementById(currCategory).getAttribute('data-order');
    for ( var i=0; i<places.length; i++ ) {
            // 마커를 생성하고 지도에 표시합니다
            var marker2 = addMarker(new daum.maps.LatLng(places[i].latitude, places[i].longitude), order);
            // 마커와 검색결과 항목을 클릭 했을 때
            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
            (function(marker2, place) {
                daum.maps.event.addListener(marker2, 'click', function() {
                    displayPlaceInfo(place);
                });
            })(marker2, places[i]);
    }
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, order) {
    var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(27, 28),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(72, 208), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker2 = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker2.setMap(aroundmap); // 지도 위에 마커를 표출합니다
    markers.push(marker2);  // 배열에 생성된 마커를 추가합니다

    return marker2;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo (place) {
    var content2 = '<div class="placeinfo">' +
                    '   <a class="title" href="' + place.placeUrl + '" target="_blank" title="' + place.title + '">' + place.title + '</a>';   

    if (place.newAddress) {
        content2 += '    <span title="' + place.newAddress + '">' + place.newAddress + '</span>' +
                    '  <span class="jibun" title="' + place.address + '">(지번 : ' + place.address + ')</span>';
    }  else {
        content2 += '    <span title="' + place.address + '">' + place.address + '</span>';
    }                
   
    content2 += '    <span class="tel">' + place.phone + '</span>' + 
                '</div>' + 
                '<div class="after"></div>';

    contentNode.innerHTML = content2;
    placeOverlay.setPosition(new daum.maps.LatLng(place.latitude, place.longitude));
    placeOverlay.setMap(aroundmap);  
}


// 각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

// 카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
    var id = this.id,
        className = this.className;

    placeOverlay.setMap(null);

    if (className === 'on') {
        currCategory = '';
        changeCategoryClass();
        removeMarker();
    } else {
        currCategory = id;
        changeCategoryClass(this);
        searchPlaces();
    }
}

// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
    var category = document.getElementById('category'),
        children = category.children,
        i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }

    if (el) {
        el.className = 'on';
    } 
} 
</script>
						
						<!-- Daum road View End -->
						<!-- Street View start
						<iframe width="300" height="200" frameborder="1" style="border: 0"
							src="https://www.google.com/maps/embed/v1/streetview?key=AIzaSyB3d8wlcwuwvoXDFp4vd4ghi9nDnuDt4Hw&location=46.414382,10.013988&heading=210&pitch=10&fov=35">
						</iframe> -->
						<!-- Street View End -->
					</div>
				</div>

					<!-- Review Start-->
				<div class="panel panel-default">
					<div class="panel-heading"> 
						<b> 후 기 </b>
							
					</div>
					<div class="panel-body">
						<div align="right">
							<button type="button" class="btn btn-success"  id="reviewToParkingbt" name="reviewToParking"  data-target="#reviewToParking" >
                  				후기 남기기
               				</button>
               			</div>
							<hr></hr>
<%
if(reviewlist.size()>0){
	for(ReviewDto reviewDto : reviewlist){
		int avgpoint = (int) reviewDto.getAvgPoint();
%>
							<div class="row">
								<div class="col-md-12">
									<div class="text-center">
										<%=reviewDto.getSubject()%>
									</div>
								
									<div class="text-right">
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
									</div>
								</div>	
							</div>
							<div class ="row">
								<div class="col-md-12">
									<div class="text-left">
										작성일 : <%=reviewDto.getLogtime() %>
									</div>
									<div class="text-right">
										<%=reviewDto.getUser_id()%>
									</div>
								</div>	
							</div>		
							<div class="row">
								<div class="col-md-12">
									<div class="text-left">
										<p><%=reviewDto.getContent()%></p>
									</div>
									<div class="text-center">
										<p>-------------------------------------------</p>
									</div>
								</div>
							</div>
<%
	}
}else{
%>
	작성된 후기가 없습니다.
<%
}
%>
						</div>
					</div>
				</div>
				</div>
					<!-- Review End-->
					
			<!-- Left Section End -->

			<!-- Right Section Start -->
			<div class="container" style="text-align:right">
				<div class="col-md-5">
					<div class="row">
						<!-- Date Picker panel Start -->
						<div class="panel panel-default">
						<form id="selectdateForm" name="selectdateForm" class="form-inline" role="form" method="post" >
						<input type="hidden"  name="act" value="mvReservation">
						<input type="hidden"  name="park_id" value="<%=parkingDetail.getPark_id()%>">
						<input type="hidden"  name="park_name" value="<%=parkingDetail.getPark_name()%>">
						<input type="hidden"  name="host_id" value="<%=parkingDetail.getOwner_id()%>">
							<div class="panel-body" align="center">	
					<div class="row"><!-- From Choice Start -->
					<label>
									From : 
									<input id="fromdate" name="fromdate" type="text" />
									<select readonly="readonly" id="srfromTime" name="srfromTime">
									  <option value="0">00:00</option><option value="1">01:00</option><option value="2">02:00</option>
									  <option value="3">03:00</option> <option value="4">04:00</option><option value="5">05:00</option>
									  <option value="6">06:00</option><option value="7">07:00</option><option value="8">08:00</option>
									  <option value="9">09:00</option><option value="10">10:00</option><option value="11">11:00</option>
									  <option value="12">12:00</option><option value="13">13:00</option><option value="14">14:00</option>
									  <option value="15">15:00</option> <option value="16">16:00</option><option value="17">17:00</option>
									  <option value="18">18:00</option><option value="19">19:00</option> <option value="20">20:00</option>
									  <option value="21">21:00</option><option value="22">22:00</option><option value="23">23:00</option>
									</select>
								</label>
						</div><!-- From Choice End -->
						<div class="row"><!-- To Choice Start -->
								<label>	T &nbsp;&nbsp;   o :  
								<input readonly="readonly" id="todate"   name="todate" type="text" />
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
								</label>
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
					<div class="well" align="center">
						<div class="panel-body">관리자 아이디 : <%=parkingDetail.getOwner_id() %></div>
						<div class="text-center">
							 <button type="button" class="btn btn-success"  id="sendMsgToHost" name="sendMsgToHost"   data-target="#msgToHost" >
                  				메세지 보내기
               				</button>
               				
<%
if(memberDto != null) {//공영주차장이 아닐때
%>
							 <button type="button" class="btn btn-success"  id="report" name="report" data-toggle="modal"  data-target="#reportWrite"  onclick="javascript:reportId('<%=parkingDetail.getOwner_id() %>', '<%=parkingDetail.getPark_id() %>', '<%=parkingDetail.getPark_name() %>');">
                  				신고하기
               				</button>
<%
}
%>

							</div>
							</div>
<%@include file="/report/write.jsp" %>
						<!-- host info panel End -->
					<!--  clelander panel  -->
					<div class="panel panel-default" align="center">
					<h3>사용 가능 일</h3>
						<div class="panel-body" id="datepanelbody">
    						</div>
						</div>
						<!-- clelander panel End -->
				</div>
			
		</div>
	<!-- /.container -->
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
	
			
			//Msg to Host
			$("#sendMsgToHost").on("click", function (event) {
				var flagm=0;
				var user_id="";
				userid=user_id;
				flagm=<%=flagb%>;
		 		if(flagm != 0){
			        $("#receiver").val("<%=parkingDetail.getOwner_id()%>");
			        $("#subject").val("");
			        $("#content").empty();
		        	$("#sendmsguser_id").val(userid);
		        	$("#sendmsgpark_id").val("<%=parkingDetail.getPark_id()%>");
			        $("#receiver").prop("readonly", true);
			        $("#msgToHost").modal("show");
				}else{
					$("#msgToHost").modal("hide");
					alert("로그인 후 이용할 수 있습니다.");
					return;
				}
				})
				
							//review to parking
			$("#reviewToParkingbt").on("click", function (event) {
				var flagm=0;
				var user_id="";
				userid=user_id;
				flagm=<%=flagb%>;
		 		if(flagm != 0){
			        $("#park_name_review").val("<%=parkingDetail.getPark_name()%>");
		 			$("#review_avaled_id").val("<%=parkingDetail.getOwner_id()%>");
			        $("#subject_review").val("");
			        $("#content_review").empty();
		        	$("#review_user_id").val(userid);
		        	$("#review_park_id").val("<%=parkingDetail.getPark_id()%>");
			        $("#park_name_review").prop("readonly", true);
			        $("#reviewToParking").modal("show");
				}else{
					$("#reviewToParking").modal("hide");
					alert("로그인 후 이용할 수 있습니다.");
					return;
				}
				})
				
		$('#fromdate').val("<%=map.get("from")%>");
		$('#todate').val("<%=map.get("to")%>");
		var today = new Date();
	 	var datelimit = new Date(today);
	 	datelimit.setDate(today.getDate() + 62);



	 	$('#fromdate').glDatePicker({
	 	    showAlways: false,
	 	    allowMonthSelect: true,
	 	    allowYearSelect: true,
	 	    selectedDate: today,
	 	   selectableDateRange: [<%=sb.toString()%>],
	 	    onClick: function (target, cell, date, data) {
	 	        target.val(date.getFullYear() + '/' + (date.getMonth() + 1) + '/' + date.getDate());

	 	        if (data != null) {
	 	            alert(data.message + '\n' + date);
	 	        }
	 	    }
	 	}).glDatePicker(true);


	 	var tosr = $('#todate').glDatePicker(
	 	{
	 	    showAlways: false,
	 	    onClick: function (target, cell, date, data) {
	 	        target.val(date.getFullYear() + '/' + (date.getMonth() + 1) + '/' + date.getDate());

	 	        if (data != null) {
	 	            alert(data.message + '\n' + date);
	 	        }
	 	    }
	 	}).glDatePicker(true);

	 	$('#todate').click(function() {
	 	    var fechaFrom = new Date($("#fromdate").val());
	 	    var toLimit = new Date();
	 	    toLimit.setDate(fechaFrom.getDate() + 31);
	 	    tosr.options.selectableDateRange = [{
	 	        from: fechaFrom,
	 	        to: toLimit
	 	    }, ],
	 	    tosr.options.showAlways = false;
	 	    tosr.render();
	 	});
			
		</script>


    <script type="text/javascript">
        $(window).load(function()
        {
        	var len = <%=availabledate.size()%>
            $('#datepanelbody').glDatePicker(
           {
            showAlways: true,
            allowMonthSelect: false,
            allowYearSelect: false,
            prevArrow: '',
            nextArrow: '',
            selectedDate: new Date(),
            selectableDateRange: [<%=sb.toString()%>]
           });
        });
        

    </script>
		


<!--  ******************************************************************************************************************  -->

<%@ include file="/common/footer.jsp" %>