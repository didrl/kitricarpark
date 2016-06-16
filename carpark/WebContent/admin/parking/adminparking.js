function adminParkingRegister() {
	if(document.adminParkingRegisterForm.parkName.value == ""){
		alert("주차장 이름을 입력하세요");
		return;
	} else if(document.adminParkingRegisterForm.parkCapacity.value == ""){
		alert("총 주차면수를 입력하세요");
		return;
	} else {
		document.adminParkingRegisterForm.action = root + "/adminparking";
		document.adminParkingRegisterForm.submit();
	}
}

function adminParkingSearchWindow() {
	window.open( root + "/admin/parking/parksearch.jsp", "newWindow", "top=100, left=400, width=500, height=400, scrollbars=yes" );
}

function adminParkingView(parkId) {
	document.common.act.value = "adminParkingView";
	document.common.parkId.value = parkId;
	document.common.action = root + "/adminparking";
	document.common.submit();
}  

function adminParkingDelete(parkId) {
	document.common.act.value = "adminParkingDelete";
	document.common.parkId.value = parkId;
	document.common.key.value = "park_public";
	document.common.word.value = "1";
	document.common.visit.value = "1";
	document.common.action = root + "/adminparking"
	document.common.submit();
	   
}

function adminSearchAddress(pg) {
	if(document.adminParkSearchForm.parkAddress.value == "") {
		alert("주소를 입력하세요");
		return;
	} else {
		document.adminParkSearchForm.action = root + "/adminparking";
		document.adminParkSearchForm.pg.value = pg;
		document.adminParkSearchForm.submit();
	}
}

function adminSelectAddress(address){
	opener.document.adminParkingRegisterForm.parkAddress.value = address;
	self.close();
}

function windowClose() {
	window.close();
}

function adminParkingModify() {
	if(document.adminParkingModifyForm.payYn.value == "") {
		alert("평일 요금을 선택하세요")
	} else if(document.adminParkingModifyForm.saturPayYn.value == "") {
		alert("토요일 요금을 선택하세요")
	} else if(document.adminParkingModifyForm.holiPayYn.value == "") {
		alert("공휴일 요금을 선택하세요")
	} else if(document.adminParkingModifyForm.parkTimeRate.value == "") {
		alert("기본 주차 시간을 선택하세요")
	} else if(document.adminParkingModifyForm.parkRate.value == "") {
		alert("기본 요금을 선택하세요")
	} else if(document.adminParkingModifyForm.addParkRate.value == "") {
		alert("추가 요금을 선택하세요")
	} else if(document.adminParkingModifyForm.dayMaxPay.value == "") {
		alert("하루 최대 요금을 선택하세요")
	} else {
		document.adminParkingModifyForm.action = root + "/adminparking";
		document.adminParkingModifyForm.submit();
				
	}
}

function adminParkingMvModify(parkId) {
	document.common.act.value = "adminParkingMvModify";
	document.common.parkId.value = parkId;
	document.common.action = root + "/adminparking";
	document.common.submit();
}

//주차장 리스트
function adminParkList(pg, flag, visit) {
	document.common.act.value = "adminParkList";
	document.common.pg.value = pg;
	document.common.flag.value = flag;
	document.common.visit.value = visit;
	document.common.action = root + "/adminparking";
	document.common.submit();
}


function adminParkingVisit(parkId) {
	document.common.act.value = "adminParkingVisit";
	document.common.parkId.value = parkId;
	document.common.action = root + "/adminparking";
	document.common.submit();
}


function admintest() {
	var addr = document.adminParkingRegisterForm.parkAddress.value + " " + document.adminParkingRegisterForm.parkDetailAddress.value;
	var geocoder = new daum.maps.services.Geocoder();
	
	geocoder.addr2coord(addr, function(status, result) {

	    // 정상적으로 검색이 완료됐으면 
	    if (status === daum.maps.services.Status.OK) {
	
	        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
	        document.adminParkingRegisterForm.coordinate.value = coords;
	        alert("사용가능합니다");
			
	    } else {
	    	alert("주소를 정확하게 입력하세요");
	    }
	}); 
}

function moveRegister() {
	document.common.act.value = "moveRegister";
	document.common.action = root + "/adminparking";
	document.common.submit();
}



