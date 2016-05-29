function parkingRegister() {
	if(document.parkRegisterForm.parkType.value == ""){
		alert("주차장 구분을 선택하세요");
		return;
	} else if(document.parkRegisterForm.parkName.value == ""){
		alert("주차장 이름을 입력하세요");
		return;
	} else if(document.parkRegisterForm.ssgName.value == ""){
		alert("주소를 입력하세요");
		return;
	} else if(document.parkRegisterForm.emdName.value == ""){
		alert("주소를 입력하세요");
		return;
	} else if(document.parkRegisterForm.payYn.value == ""){
		alert("평일 유료/무료를 선택하세요");
		return;
	} else if(document.parkRegisterForm.saturPayYn.value == ""){
		alert("토요일 유료/무료를 선택하세요");
		return;
	} else if(document.parkRegisterForm.holiPayYn.value == ""){
		alert("공휴일 유료/무료를 선택하세요");
		return;
	} else if(document.parkRegisterForm.parkCapacity.value == ""){
		alert("총 주차면수를 입력하세요");
		return;
	}  else if(document.parkRegisterForm.parkTimeRate.value == ""){
		alert("기본 주차시간을 선택하세요");
		return;
	} else if(document.parkRegisterForm.parkRate.value == ""){
		alert("기본 주차요금을 선택하세요");
		return;
	} else if(document.parkRegisterForm.addParkRate.value == ""){
		alert("추가 단위요금을 선택하세요");
		return;
	} else if(document.parkRegisterForm.dayMaxPay.value == ""){
		alert("하루 최대요금을 선택하세요");
		return;
	} else{
		document.parkRegisterForm.action = "/carpark/parking";
		document.parkRegisterForm.submit();
	}
}

function parkTypePublic() {
	document.parkRegisterForm.value = publicParking;
}

function parkTypePrivate() {
	document.parkRegisterForm.value = privateParking;
}

function parkTypePersonal() {
	document.parkRegisterForm.value = personalParking;
}

function parkSearch() {
	
}


