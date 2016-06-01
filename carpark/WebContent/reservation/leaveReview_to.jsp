<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


 <!-- Msg Modal Start -->
		<div class="modal fade" id="leaveReview_to" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="" id="leaveReview_toModal">쪽지 보내기</h4>
					</div>
					<div class="modal-body">

						<!-- main -->
						<div id="page-wrapper">
							<div class="container-fluid">

								<!-- 쪽지보내기 -->
								<div class="form-group">
									<form class="form-horizontal" name="leaveReview_toForm" method="post" action="">
										<input type="hidden" name="act" value="leaveReview">
										<input type="hidden" name="bcode" value="2"> 
										<input type="hidden" name="pg" value="1"> 
										<input type="hidden" name="key" value=""> 
										<input type="hidden" name="word" value="">

										<div class="form-group">
											<label for="receiver">리뷰남길 주차장</label> <input type="text"
												class="form-control" id="reviewHost" placeholder="리뷰남길주차장"
												name="reviewHost" readonly="true">
										</div>
										<div class="form-group">
											<label for="subject_review">제목</label> <input type="text"
												class="form-control" id="subject_review" placeholder="제목"
												name="subject">
										</div>
										<div class="form-group">
											<label for="content_review">내용</label>
											<textarea class="form-control_review" rows="10" id="content_review"
												name="content"></textarea>
										</div>

										<div class="form-group text-center">
											<input class="btn btn-default" type="button" value="보내기"
												onclick="javascript:leaveReview_to();">
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