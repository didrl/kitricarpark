function mvlogin() {
	if(document.getElementById("id").value="")
		alert("id를 입력해주세요!!");
	else if(document.getElementById("pass").value="")
		alert("password를 입력해주세요!!");
	else{
		document.loginForm.action=root+"/member";
		document.loginForm.submit();
	}
	
}
