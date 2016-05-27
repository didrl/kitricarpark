function detailprofile(){
	document.location.href=root+"/member?act=mvProfileDetail";
}

function confirm(){
	document.signUpForm.reset();
}


$("#idcheck").click(function() {
	$.ajax({
		type:"post",
		url : "/member/idcheck"
	})
})