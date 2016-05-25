
function mvlogin() {
	if(document.getElementById("id").value=="")
		alert("id를 입력해주세요!!");
	else if(document.getElementById("pass").value=="")
		alert("password를 입력해주세요!!");
	else{
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
	}else if(document.getElementById("signupemail").value==""){
		alert("이메일을 입력해주세요!!");
		return;
	}else if(document.getElementById("signupphone").value==""){
		alert("핸드폰번호를 입력해주세요!!");
		return;
	}else if(document.getElementById("signupcarInfo").value==""){
		alert("자동차번호를 입력해주세요!!");
		return;
	}
	else {
		alert("회원가입을 축하드립니다!~ 필요한 정보를 더채워넣어보세요~");
		document.signUpForm.action=root+"/member";
		document.signUpForm.submit();
	}
}

function mvtrylogin(){
	if(document.getElementById("tryid").value=="")
		alert("id를 입력해주세요!!");
	else if(document.getElementById("trypass").value=="")
		alert("password를 입력해주세요!!");
	else{
		document.tryLoginForm.action=root+"/member";
		document.tryLoginForm.submit();
	}
}


function confirm(){
	document.signUpForm.reset();
}
