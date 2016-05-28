
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
							
							