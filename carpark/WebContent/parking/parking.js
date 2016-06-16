function parkingRegister() {
	if(document.parkRegisterForm.parkName.value == ""){
		alert("주차장 이름을 입력하세요");
		return;
	} else if(document.parkRegisterForm.parkCapacity.value == ""){
		alert("총 주차면수를 입력하세요");
		return;
	} else {
		document.parkRegisterForm.action = root + "/memberparking";
		document.parkRegisterForm.submit();
	}
}

function parkingSearchWindow() {
	window.open( root + "/parking/parksearch.jsp", "newWindow", "top=100, left=400, width=500, height=400, scrollbars=yes" );
}


function parkingList(pg) {
	document.common.act.value = "parkingList";
	document.common.pg.value = pg;	
	document.common.action = root + "/memberparking";
	document.common.submit();
	   
}

function parkingView(parkId) {
	document.common.act.value = "parkingView";
	document.common.parkId.value = parkId;
	document.common.action = root + "/memberparking";
	document.common.submit();
}  

function parkingDelete(parkId) {
	document.common.act.value = "parkingDelete";
	document.common.parkId.value = parkId;
	document.common.action = root + "/memberparking"
	document.common.submit();
	   
}

function searchAddress(pg) {
	if(document.parkSearchForm.parkAddress.value == "") {
		alert("주소를 입력하세요");
		return;
	} else {
		document.parkSearchForm.action = root + "/memberparking";
		document.parkSearchForm.pg.value = pg;
		document.parkSearchForm.submit();
	}
}

function selectAddress(address){
	opener.document.parkRegisterForm.parkAddress.value = address;
	self.close();
}

function windowClose() {
	window.close();
}

function parkingModify() {
	if(document.parkingModifyForm.payYn.value == "") {
		alert("평일 요금을 선택하세요")
	} else if(document.parkingModifyForm.saturPayYn.value == "") {
		alert("토요일 요금을 선택하세요")
	} else if(document.parkingModifyForm.holiPayYn.value == "") {
		alert("공휴일 요금을 선택하세요")
	} else if(document.parkingModifyForm.parkTimeRate.value == "") {
		alert("기본 주차 시간을 선택하세요")
	} else if(document.parkingModifyForm.parkRate.value == "") {
		alert("기본 요금을 선택하세요")
	} else if(document.parkingModifyForm.addParkRate.value == "") {
		alert("추가 요금을 선택하세요")
	} else if(document.parkingModifyForm.dayMaxPay.value == "") {
		alert("하루 최대 요금을 선택하세요")
	} else {
		document.parkingModifyForm.action = root + "/memberparking";
		document.parkingModifyForm.submit();
				
	}
}

function parkingMvModify(parkId) {
	document.common.act.value = "parkingMvModify";
	document.common.parkId.value = parkId;
	document.common.action = root + "/memberparking";
	document.common.submit();
}

function test() {
	var addr = document.parkRegisterForm.parkAddress.value + " " + document.parkRegisterForm.parkDetailAddress.value;
	var geocoder = new daum.maps.services.Geocoder();
	
	geocoder.addr2coord(addr, function(status, result) {

	    // 정상적으로 검색이 완료됐으면 
	    if (status === daum.maps.services.Status.OK) {
	
	        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
	        document.parkRegisterForm.coordinate.value = coords;
	        alert("사용가능합니다");
			
	    } else {
	    	alert("주소를 정확하게 입력하세요");
	    }
	}); 
}

