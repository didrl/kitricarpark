//쪽지 검색
function adminMessageSearch() {
	if(document.searchForm.word.value == ""){
		alert("내용을 입력하세요");
		return;
	} else{
		document.searchForm.action = "/carpark/message";
		document.searchForm.submit();
	}
}

//보낸쪽지보기
function adminMessageSendView(seq) {
	window.open( "/carpark/admincall?act=adminCallSendView&seq=" + seq, "newWindow", "top=100, left=400, width=500, height=600, scrollbars=yes" );
}

//받은쪽지보기
function adminMessageReceiveView(seq) {
	window.open( "/carpark/admincall?act=adminCallReceiveView&seq=" + seq, "newWindow", "top=100, left=400, width=500, height=600, scrollbars=yes" );
}

//보낸 쪽지 삭제(삭제 후 보낸 쪽지 리스트 출력)
function adminMessageSendDelete(seq) {
	document.common.act.value = "messageSendDelete";
	document.common.seq.value = seq;
			
	document.common.action = "/carpark/message";
	document.common.submit();
	
	alert("메세지가 삭제되었습니다");
}

//받은 쪽지 삭제(삭제 후 받은 쪽지 리스트 출력)
function adminMessageReceiveDelete(seq) {
	document.common.act.value = "messageReceiveDelete";
	document.common.seq.value = seq;
			
	document.common.action = "/carpark/message";
	document.common.submit();
	
	alert("메세지가 삭제되었습니다");
}

//보낸 쪽지 리스트
function adminMessageSendList() {
	document.getElementById("act").value = "messageSendList";
		
	document.common.action = "/carpark/message";
	document.common.submit();
}

//받은 쪽지 리스트
function adminMessageReceiveList() {
	document.getElementById("act").value = "messageReceiveList";
		
	document.common.action = "/carpark/message";
	document.common.submit();
}

//쪽지 보내기
function adminMessageWrite() {
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
		document.messageWriteForm.action = "/carpark/message";
		document.messageWriteForm.submit();
	}
}

//지정된 대상에게 쪽지 보내기
function adminMessageToWrite() {
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
		document.messageToWriteForm.action = "/carpark/message";
		document.messageToWriteForm.submit();
	}
}

//입력 초기화
function adminWriteInit() {
	document.messageWriteForm.reset();
}

function adminToWriteInit(receiver) {
	document.messageToWriteForm.reset();//폼 초기화
	document.messageToWriteForm.receiver.value = receiver;//대상지정
}
//메세지 닫기
function adminMessageClose() {
	window.close();
}

function getAllUserInfo(){
	alert("getalluserinfo 눌름!!!");
	document.location.href=root+"/admin?act=alluserinfo";
}

//방문 확정
function callSendViewConfirm(seq) {
	alert("방문예정이 확정되었습니다.");
	self.close();
	opener.document.location.href=root+"/admincall?act=adminCallConfirm&seq="+seq;
}

//방문 확정
function adminCallReceiveDelete(seq){
	document.location.href=root+"/admincall?act=adminCallReceiveDelete&seq="+seq;
}

