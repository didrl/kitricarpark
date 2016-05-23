function messageSearch() {
	if(document.messageForm.word.value == ""){
		alert("내용을 입력하세요");
		return;
	} else{
		document.messageForm.action = "/carpark/message";
		document.messageForm.submit();
	}
}

function messageView(seq) {
	document.getElementById("act").value = "messageView";
	document.getElementById("seq").value = seq;
		
	document.common.action = "/carpark/message";
	document.common.submit();
	
}

function messageDelete(seq) {
	document.getElementById("act").value = "messageDelete";
	document.getElementById("seq").value = seq;
		
	document.common.action = "/carpark/message";
	document.common.submit();
}

function messageList() {
	document.getElementById("act").value = "messageList";
		
	document.common.action = "/carpark/message";
	document.common.submit();
}

function messageWrite() {
	if(document.messageForm.receiver.value == ""){
		alert("대상을 입력하세요");
		return;
	} else if(document.messageForm.subject.value == "") {
		alert("제목을 입력하세요");
		return;	
	} else if(document.messageForm.content.value == "") {
		alert("내용을 입력하세요");
		return;
	} else{
		document.messageForm.action = "/carpark/message";
		document.messageForm.submit();
	}
}