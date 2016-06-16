//쪽지 검색
function messageSearchSend() {
	if(document.searchForm.word.value == ""){
		alert("내용을 입력하세요");
		return;
	} else{
		document.searchForm.action = root + "/message";
		document.searchForm.submit();
	}
}

function messageSearchReceive() {
	if(document.searchForm.word.value == ""){
		alert("내용을 입력하세요");
		return;
	} else{
		document.searchForm.action = root + "/message";
		document.searchForm.submit();
	}
}

//보낸쪽지보기
function messageSendView(seq) {
	window.open( root + "/message?act=messageSendView&seq=" + seq, "newWindow", "top=100, left=400, width=500, height=600, scrollbars=yes" );
}

//받은쪽지보기
function messageReceiveView(seq) {
	window.open( root + "/message?act=messageReceiveView&seq=" + seq, "newWindow", "top=100, left=400, width=500, height=600, scrollbars=yes" );
}

//보낸 쪽지 삭제(삭제 후 보낸 쪽지 리스트 출력)
function messageSendDelete(seq, delete_recei) {
	document.common.act.value = "messageSendDelete";
	document.common.seq.value = seq;
	document.common.delete_recei.value = delete_recei;
	document.common.action = root + "/message";
	document.common.submit();
	
	alert("메세지가 삭제되었습니다");
}

//받은 쪽지 삭제(삭제 후 받은 쪽지 리스트 출력)
function messageReceiveDelete(seq, delete_send) {
	document.common.act.value = "messageReceiveDelete";
	document.common.seq.value = seq;
	document.common.delete_send.value = delete_send;
	document.common.action = root + "/message";
	document.common.submit();
	
	alert("메세지가 삭제되었습니다");
}

//보낸 쪽지 리스트
function messageSendList(pg) {
	document.getElementById("act").value = "messageSendList";
	document.getElementById("pg").value = pg;
		
	document.common.action = root + "/message";
	document.common.submit();
}

//받은 쪽지 리스트
function messageReceiveList(pg) {
	document.getElementById("act").value = "messageReceiveList";
	document.getElementById("pg").value = pg;
		
	document.common.action = root + "/message";
	document.common.submit();
}

//쪽지 보내기
function messageWrite() {
	if(document.messageWriteForm.receiver.value == ""){
		alert("대상을 입력하세요");
		return;
	} else if(document.messageWriteForm.subject.value == "") {
		alert("제목을 입력하세요");
		return;	
	} else if(document.messageWriteForm.content.value == "") {
		alert("내용을 입력하세요");
		return;
	} else{
		document.messageWriteForm.action = root + "/message";
		document.messageWriteForm.submit();
	}
}

//지정된 대상에게 쪽지 보내기
function messageToWrite() {
	if(document.messageToWriteForm.receiver.value == ""){
		alert("대상을 입력하세요");
		return;
	} else if(document.messageToWriteForm.subject.value == "") {
		alert("제목을 입력하세요");
		return;	
	} else if(document.messageToWriteForm.content.value == "") {
		alert("내용을 입력하세요");
		return;
	} else{
		document.messageToWriteForm.action = root + "/message";
		document.messageToWriteForm.submit();
	}
}

//입력 초기화
function writeInit() {
	document.messageWriteForm.reset();
}

function toWriteInit(receiver) {
	document.messageToWriteForm.reset();//폼 초기화
	document.messageToWriteForm.receiver.value = receiver;//대상지정
}

function messageClose() {
	window.close();
}

function firstList() {
	document.getElementById("act").value = "messageSendList";
	
	document.common.action = root + "/message";
	document.common.submit();
}