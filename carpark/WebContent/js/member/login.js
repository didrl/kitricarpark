
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
