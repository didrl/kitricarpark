function messageSearch() {
	if(document.searchForm.word.value == ""){
		alert("내용을 입력하세요");
		return;
	} else{
		document.searchForm.action = "/carpark/message";
		document.searchForm.submit();
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

function messageSendList() {
	document.getElementById("act").value = "messageSendList";
		
	document.common.action = "/carpark/message";
	document.common.submit();
}

function messageReceiveList() {
	document.getElementById("act").value = "messageReceiveList";
		
	document.common.action = "/carpark/message";
	document.common.submit();
}

function messageWrite() {
	if(document.writeForm.receiver.value == ""){
		alert("대상을 입력하세요");
		return;
	} else if(document.writeForm.subject.value == "") {
		alert("제목을 입력하세요");
		return;	
	} else if(document.writeForm.content.value == "") {
		alert("내용을 입력하세요");
		return;
	} else{
		document.writeForm.action = "/carpark/message";
		document.writeForm.submit();
	}
}