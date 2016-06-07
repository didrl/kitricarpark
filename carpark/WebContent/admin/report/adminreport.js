function adminReportList(pg) {
	document.getElementById("act").value = "adminReportList";	
	document.getElementById("bcode").value = 3;
	document.getElementById("pg").value = pg;
		
	document.common.action = "/carpark/adminreport";
	document.common.submit();
	
}

function adminReportId(id, parkId, parkName) {
	document.reportWriteForm.reset();
	document.reportWriteForm.report_id.value = id;
	document.reportWriteForm.park_id.value = parkId;
	document.reportWriteForm.report_info.value = "아이디 : " + id + "        주차장 : " + parkName

}

function adminReportWrite() {
	if(document.reportWriteForm.subject.value == "") {
		alert("제목을 입력하세요");
	} else if(document.reportWriteForm.content.value == "") {
		alert("내용을 입력하세요");
	} else {
		document.reportWriteForm.action = "/carpark/adminreport";
		document.reportWriteForm.submit();
	}
}

function adminReportView(seq) {
	window.open( "/carpark/adminreport?act=adminReportView&seq=" + seq, "newWindow", "top=100, left=400, width=500, height=600, scrollbars=yes" );
	
}

function adminReportDelete(seq) {
	document.common.act.value = "adminReportDelete";
	document.common.seq.value = seq;
	document.common.action = "/carpark/adminreport";
	document.common.submit();
}

function adminReportClose() {
	window.close();
}

function adminReportSearch() {
	if(document.reportSearchForm.word.value == ""){
		alert("내용을 입력하세요");
		return;
	} else{
		document.reportSearchForm.action = "/carpark/adminreport";
		document.reportSearchForm.submit();
	}
}