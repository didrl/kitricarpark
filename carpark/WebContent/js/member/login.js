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
	document.location.href=root+"/memberparking?act=parkList"
}

function myParkingRegister(){
	document.location.href=root+"/parking/register.jsp"
//	document.location.href=root+"/memberparking?act=parkRegister"
}
