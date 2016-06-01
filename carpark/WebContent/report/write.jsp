<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


		<div class="modal fade" id="reportWrite" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 id="reportWriteModal">신고하기</h4>
					</div>
					<div class="modal-body">

						<!-- main -->
						<div id="page-wrapper">
							<div class="container-fluid">

								<!-- 신고내용작성 -->
								<div class="form-group">
									<form class="form-horizontal" name="reportWriteForm" method="post" action="">
										<input type="hidden" name="act" value="reportWrite">
										<input type="hidden" name="pg" value="1"> 
										<input type="hidden" name="key" value=""> 
										<input type="hidden" name="word" value="">

										<div class="form-group">
											<label for="userId">신고대상</label> <input type="text"
												class="form-control" id="userId" placeholder="신고대상"
												name="userId">
										</div>
										<div class="form-group">
											<label for="subject">제목</label> <input type="text"
												class="form-control" id="subject" placeholder="제목"
												name="subject">
										</div>
										<div class="form-group">
											<label for="content">내용</label>
											<textarea class="form-control" rows="10" id="content"
												name="content"></textarea>
										</div>

										<div class="form-group text-center">
											<input class="btn btn-default" type="button" value="신고하기"
												onclick="javascript:reportWrite();">
										</div>

									</form>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
