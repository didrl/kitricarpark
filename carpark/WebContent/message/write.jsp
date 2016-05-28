<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    <!-- Msg Modal Start -->
		<div class="modal fade" id="messageWrite" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="messageWrite" id="messageWriteModal">쪽지 보내기</h4>
					</div>
					<div class="modal-body">

						<!-- main -->
						<div id="page-wrapper">
							<div class="container-fluid">

								<!-- 쪽지보내기 -->
								<div class="form-group">
									<form class="form-horizontal" name="messageWriteForm" method="post" action="">
										<input type="hidden" name="act" value="messageWrite">
										<input type="hidden" name="bcode" value="2"> 
										<input type="hidden" name="pg" value="1"> 
										<input type="hidden" name="key" value=""> 
										<input type="hidden" name="word" value="">

										<div class="form-group">
											<label for="receiver">받는사람</label> <input type="text"
												class="form-control" id="receiver" placeholder="받는사람"
												name="receiver">
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
											<input class="btn btn-default" type="button" value="보내기"
												onclick="javascript:messageWrite();">
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