function messageSearch() {
	if(document.searchForm.word.value == ""){
		alert("내용을 입력하세요");
		return;
	} else{
		document.searchForm.action = "/carpark/message";
		document.searchForm.submit();
	}
}

function messageSendView(seq) {
	window.open( "/carpark/message?act=messageSendView&seq=" + seq, "newWindow", "top=100, left=400, width=500, height=600, scrollbars=yes" );
}

function messageReceiveView(seq) {
	window.open( "/carpark/message?act=messageReceiveView&seq=" + seq, "newWindow", "top=100, left=400, width=500, height=600, scrollbars=yes" );
}

function messageViewClose() {
	self.close();
}

function messageDelete(seq, receiver) {
	document.common.act.value = "messageDelete";
	document.common.seq.value = seq;
	document.common.receiver.value = receiver;
			
	document.common.action = "/carpark/message";
	document.common.submit();
	
	alert("글이 삭제되었습니다")
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
