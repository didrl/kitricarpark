function mvlogin() {
	
	if(document.getElementById("id").value==""){
		alert("id를 입력해주세요!!");
		return;
	}else if(document.getElementById("pass").value==""){
		alert("password를 입력해주세요!!");
		return;
	}else{
		document.loginForm.action=root+"/member";
		document.loginForm.submit();
	}	
}

function mvsignup(){
	if(document.getElementById("signupid").value==""){
		alert("id를 입력해주세요!!");
		return;
	}else if(document.getElementById("signuppass").value==""){
		alert("password를 입력해주세요!!");
		return;
	}else if(document.getElementById("signuppasswordcheck").value==""){
		alert("passwordCheck를 입력해주세요!!");
		return;
	}else if(document.getElementById("signuppass").value!=document.getElementById("signuppasswordcheck").value){
		alert("password가 다릅니다.");
		return;
	}else if(document.getElementById("signupcarInfo").value==""){
		alert("자동차번호를 입력해주세요!!");
		return;
	}else {
		document.signUpForm.action=root+"/member";
		document.signUpForm.submit();
	}
}

function formclear(){
	document.signUpForm.reset();
}
