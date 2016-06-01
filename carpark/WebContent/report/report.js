
function reportSearch() {
	if(document.searchForm.word.value == ""){
		alert("내용을 입력하세요");
		return;
	} else{
		document.searchForm.action = "/carpark/report";
		document.searchForm.submit();
	}
}

function reportView(seq) {
	//window.open( "/carpark/message?act=messageSendView&seq=" + seq, "newWindow", "top=100, left=400, width=500, height=600, scrollbars=yes" );
}

function reportDelete(seq) {
	document.common.act.value = "reportDelete";
	document.common.seq.value = seq;
			
	document.common.action = "/carpark/report";
	document.common.submit();
	
	alert("메세지가 삭제되었습니다");
}

function reportList(pg) {
	document.getElementById("act").value = "reportList";
	document.getElementById("pg").value = pg;
		
	document.common.action = "/carpark/report";
	document.common.submit();
}

function reportWrite() {
	if(document.reportWriteForm.receiver.value == ""){
		alert("대상을 입력하세요");
		return;
	} else if(document.reportWriteForm.subject.value == "") {
		alert("제목을 입력하세요");
		return;	
	} else if(document.reportWriteForm.content.value == "") {
		alert("내용을 입력하세요");
		return;
	} else{
		document.reportWriteForm.action = "/carpark/report";
		document.reportWriteForm.submit();
	}
}

function WriteInit(userId) {
	document.reportWriteForm.reset();//폼 초기화
	document.reportWriteForm.userId.value = userId;//대상지정
}

function reportClose() {
	window.close();
}
