function reportList(pg) {
	document.getElementById("act").value = "reportList";	
	document.getElementById("bcode").value = 3;
	document.getElementById("pg").value = pg;
		
	document.common.action = "/carpark/report";
	document.common.submit();
	
}

function reportId(id, parkId, parkName) {
	document.reportWriteForm.reset();
	document.reportWriteForm.report_id.value = id;
	document.reportWriteForm.park_id.value = parkId;
	document.reportWriteForm.report_info.value = "아이디 : " + id + "        주차장 : " + parkName

}

function reportWrite() {
	if(document.reportWriteForm.subject.value == "") {
		alert("제목을 입력하세요");
	} else if(document.reportWriteForm.content.value == "") {
		alert("내용을 입력하세요");
	} else {
		document.reportWriteForm.action = "/carpark/report";
		document.reportWriteForm.submit();
	}
}

function reportView(seq) {
	window.open( "/carpark/report?act=reportView&seq=" + seq, "newWindow", "top=100, left=400, width=500, height=600, scrollbars=yes" );
	
}

function reportDelete(seq) {
	document.common.act.value = "reportDelete";
	document.common.seq.value = seq;
	document.common.action = "/carpark/report";
	document.common.submit();
}

function reportClose() {
	window.close();
}

function reportSearch() {
	if(document.reportSearchForm.word.value == ""){
		alert("내용을 입력하세요");
		return;
	} else{
		document.reportSearchForm.action = "/carpark/report";
		document.reportSearchForm.submit();
	}
}