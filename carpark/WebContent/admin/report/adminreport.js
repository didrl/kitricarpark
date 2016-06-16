function adminReportList(pg) {
	document.getElementById("act").value = "adminReportList";	
	document.getElementById("bcode").value = 3;
	document.getElementById("pg").value = pg;
		
	document.common.action = root + "/adminreport";
	document.common.submit();
	
}

function adminReportListFlag(pg, flag) {
	document.getElementById("act").value = "adminReportListFlag";	
	document.getElementById("bcode").value = 3;
	document.getElementById("pg").value = pg;
	document.getElementById("flag").value = flag;
		
	document.common.action = root + "/adminreport";
	document.common.submit();
	
}

function adminReportId(id, parkId, parkName) {
	document.reportWriteForm.reset();
	document.reportWriteForm.report_id.value = id;
	document.reportWriteForm.park_id.value = parkId;
	document.reportWriteForm.report_info.value = "아이디 : " + id + "        주차장 : " + parkName

}

//function adminReportView(seq, reportId) {
//	window.open( "/carpark/adminreport?act=adminReportView&seq=" + seq + "&reportId=" + reportId, "newWindow", "top=100, left=400, width=550, height=620, scrollbars=yes" );
//	
//}

function adminReportView(seq) {
	document.adminReportViewForm.seq.value = seq;
	document.adminReportViewForm.action = root + "/adminreport";
	document.adminReportViewForm.submit();
}

function adminReportDelete(seq) {
	document.common.act.value = "adminReportDelete";
	document.common.seq.value = seq;
	document.common.action = root + "/adminreport";
	document.common.submit();
}

function adminReportSearch() {
	if(document.reportSearchForm.word.value == ""){
		alert("내용을 입력하세요");
		return;
	} else{
		document.reportSearchForm.action = root + "/adminreport";
		document.reportSearchForm.submit();
	}
}

function adminPenaltyRegister(userId, seq) {
	if(document.penaltyRegisterForm.penalty_code.value == "") {
		alert("벌점목록을 선택하세요");
		return;
	} else {
		document.penaltyRegisterForm.action = root + "/adminreport";
		document.penaltyRegisterForm.report_id.value = userId;
		document.penaltyRegisterForm.seq.value = seq;
		document.penaltyRegisterForm.act.value = "penaltyRegister";
		document.penaltyRegisterForm.submit();
	}
}