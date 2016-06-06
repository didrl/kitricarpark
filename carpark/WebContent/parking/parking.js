function parkingRegister() {
	if(document.parkRegisterForm.parkName.value == ""){
		alert("주차장 이름을 입력하세요");
		return;
	} else if(document.parkRegisterForm.parkCapacity.value == ""){
		alert("총 주차면수를 입력하세요");
		return;
	} else {
		document.parkRegisterForm.action = "/carpark/memberparking";
		document.parkRegisterForm.submit();
	}
}

function parkingSearchWindow() {
	window.open( root + "/parking/parksearch.jsp", "newWindow", "top=100, left=400, width=500, height=400, scrollbars=yes" );
}


function parkingList() {
	document.common.act.value = "parkingList";
	document.common.action = "/carpark/memberparking";
	document.common.submit();
	   
}

function parkingView(parkId) {
	document.common.act.value = "parkingView";
	document.common.parkId.value = parkId;
	document.common.action = "/carpark/memberparking";
	document.common.submit();
}  

function parkingDelete(parkId) {
	document.common.act.value = "parkingDelete";
	document.common.parkId.value = parkId;
	document.common.action = "/carpark/memberparking"
	document.common.submit();
	   
}

function searchAddress() {
	if(document.parkSearchForm.parkAddress.value == "") {
		alert("주소를 입력하세요");
		return;
	} else {
		document.parkSearchForm.action = "/carpark/memberparking";
		document.parkSearchForm.submit();
	}
}

function selectAddress(address){
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	
	geocoder.addr2coord(address, function(status, result) {

	    // 정상적으로 검색이 완료됐으면 
	    if (status === daum.maps.services.Status.OK) {
	
	        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
	        opener.document.parkRegisterForm.coordinate.value = coords;
			
	    } else {
	    	alert("검색 실패");
	    }
	}); 
	document.parkSearchForm.parkAddress.value = address;
	opener.document.parkRegisterForm.parkAddress.value = address;
//	self.close();
}

function windowClose() {
	window.close();
}
