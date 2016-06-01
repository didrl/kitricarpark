//예약 검색
function reservationSearch() {
	if(document.searchForm.word.value == ""){
		alert("내용을 입력하세요");
		return;
	} else{
		document.reservationsearchForm.action = "/carpark/reservationView";
		document.reservationsearchForm.submit();
	}
}

//받은 예약 한개 보기
function reservationView_host(seq) {
	window.open( "/carpark/message?act=reservationView_host&seq=" + seq, "newWindow", "top=100, left=400, width=500, height=600, scrollbars=yes" );
}

//예약한 내역 한개 보기
function reservationView_guest(seq) {
	window.open( "/carpark/message?act=reservationView_guest&seq=" + seq, "newWindow", "top=100, left=400, width=500, height=600, scrollbars=yes" );
}

//받은 예약 리스트
function reservationList_host() {
	document.getElementById("act").value = "reservationList_host";
		
	document.common.action = "/carpark/reservationView";
	document.common.submit();
}

//예약한 내역 리스트
function reservationList_guest() {
	document.getElementById("act").value = "reservationList_guest";
		
	document.common.action = "/carpark/reservationView";
	document.common.submit();
}

//리뷰 남기기
function leaveReview() {
	if(document.leaveReviewForm.receiver.value == ""){
		alert("대상을 입력하세요");
		return;
	} else if(document.leaveReviewForm.subject.value == "") {
		alert("제목을 입력하세요");
		return;	
	} else if(document.leaveReview_toForm.content.value == "") {
		alert("내용을 입력하세요");
		return;
	} else{
		document.leaveReviewForm.action = "/carpark/reservationView";
		document.leaveReviewForm.submit();
	}
}

//지정된 대상에게 리뷰 남기기
function leaveReview_to() {
	if(document.leaveReview_toForm.reviewHost.value == ""){
		alert("대상을 입력하세요");
		return;
	} else if(document.leaveReview_toForm.subject_review.value == "") {
		alert("제목을 입력하세요");
		return;	
	} else if(document.leaveReview_toForm.subject_review.value == "") {
		alert("내용을 입력하세요");
		return;
	} else{
		document.leaveReview_toForm.action = "/carpark/reservationView";
		document.leaveReview_toForm.submit();
	}
}

//입력 초기화
function leaveReviewInit() {
	document.leaveReviewForm.reset();
}

function leaveReview_toInit(reviewHost) {
	document.leaveReview_toForm.reset();//폼 초기화
	document.leaveReview_toForm.reviewHost.value = reviewHost;//대상지정
}


function reservationViewClose() {
	window.close();
}
