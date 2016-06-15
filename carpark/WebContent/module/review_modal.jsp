<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
function reviewWrite(){
	document.reviewWriteForm.action = "/carpark/review";
	document.reviewWriteForm.submit();
}
</script>
<link href="/carpark/css/star-rating/star-rating.css" media="all" rel="stylesheet" type="text/css" />
 
<script src="/carpark/js/star-rating/star-rating.js" type="text/javascript"></script>

<!-- Msg Modal Start -->
<div class="modal fade" id="reviewToParking" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h4 class="reviewToParking" id="reviewToPark">리뷰 남기기</h4>
			</div>
			<div class="modal-body">

				<!-- main -->
				<div id="page-wrapper">
					<div class="container-fluid">

						<!-- 리뷰 남기기 -->
						<div class="form-group">
							<form class="form-horizontal" name="reviewWriteForm" method="post"	action="">
								<input type="hidden" name="act" value="reviewWriteToParking"> 
								<input	type="hidden" name="bcode" value="0"> 
								<input	type="hidden" name="host_flag" value="0">
								<input type="hidden" id="review_park_id" name="park_id" value="">
								<input type="hidden" id="review_avaled_id" name="avaled_id" value="">								

								<div class="form-group">
									<label for="receiver">주차장이름</label> <input type="text"
										class="form-control" id="park_name_review" placeholder="받는사람"
										name="park_name_review">
								</div>
								<div class="form-group">
									<label for="subject">제목</label> <input type="text"
										class="form-control" id="subject_review" placeholder="제목"
										name="subject_review">
								</div>
								<div class="form-group">
									<label for="content">내용 평점 <br></label>
									<input id="avg_point_review" name="avg_point_review" type="number" class="rating"  >
									<textarea class="form-control" rows="10" id="content_review"
										name="content_review"></textarea>
<!--CKEditor -->
									<script>
										// Replace the <textarea id="editor1"> with a CKEditor
										// instance, using default configuration.
										CKEDITOR.replace( 'content_review', {
										filebrowserUploadUrl: '${pageContext.request.contextPath}/file/ckeditorImageUpload.do'	
										});
									</script>
								</div>
								<!-- <div class="form-group">
									<label for="fileinput" class="control-label">사진 등록하기</label>

									<input type="file" id="fileinput" name="fileinput" readonly="">


								</div> -->
								<div class="form-group text-center">
									<input class="btn btn-default" type="button" value="등록하기"
										onclick="javascript:reviewWrite();"> <input
										class="btn btn-default" type="reset" value="취소">
								</div>

							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
<!-- Msg Modal End -->

<!-- 쪽지보내기 모달 -->
<script>

$("#avg_point_review").rating({
	min:1, 
	max:5,
	step:0.5, 
	hoverEnabled:false,
	size:'sm',
	showClear:false
	});

</script>