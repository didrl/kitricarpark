function detailprofile(){
	document.location.href=root+"/member?act=mvProfileDetail";
}

function reservationInfo(){
	document.location.href=root+"/reservation?act=reservationList";
}

function mycoin(){
	document.location.href=root+"/member?act=mvcoin";
}

function confirm(){
	document.signUpForm.reset();
}

function myowncarinfo(){
	document.location.href=root+"/member?act=mvMyOwnCar";
}

function myfavoriteparking(){
	document.location.href=root+"/favorite?act=favoritelist";
}

function loginConfirm(){
	document.loginForm.reset();
}

function myParking(){
	document.location.href=root+"/memberparking?act=parkList";
}

function infocheck(){
	
	if(document.getElementById("username").value == "") {
		alert("이름 입력!");
		return;
	} else if(document.getElementById("userid").value == "") {
		alert("아이디 입력!");
		$("#userid").focus();
		return;
	} else if(document.getElementById("InputPassword1").value  == "") {
		alert("비밀번호 입력!");
		$("#InputPassword1").focus();
		return;
	} else if(document.getElementById("InputPassword2").value != document.getElementById("InputPassword1").value) {
		alert("비밀번호 확인!");
		$("#InputPassword2").focus();
		return;
		
	}else if(document.getElementById("InputEmail").value  == ""){
		alert("이메일 입력!");
		$("#InputEmail").focus();
		return;
	}else if(document.getElementById("userphone").value  == ""){
		alert("휴대폰 번호 입력!");
		$("#userphone").focus();
		return;
	}else {
		document.signUpForm.action=root+"/member?act=mvsignup";
		document.signUpForm.submit();
	}
}


function myParkingRegister(){
	document.location.href=root+"/parking/register.jsp"
//	document.location.href=root+"/memberparking?act=parkRegister"
}

function addrSearch(){
	if(document.parkSearchForm.parkAddress.value == "") {
		alert("주소를 입력하세요");
		return;
	} else {
		document.parkSearchForm.action = "<%=root%>/memberparking";
		document.parkSearchForm.submit();
	}
}
