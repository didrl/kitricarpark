//TMap

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
		cLonLat = new Tmap.LonLat(longitude, latitude).transform(pr_4326,	pr_3857);
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
		console.log("W :" + mapW+"  H : "+mapH);
		
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
	
	
	   // body에 onload를 할 수 없어서 임시로 붙여놓은 함수
	   function addLoadEvent(func) {
		   console.log("In the onload js");
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
	
	function goResultDetail() {
		document.parkListForm.action = "/carpark/member";
		document.parkListForm.submit();
	}
	