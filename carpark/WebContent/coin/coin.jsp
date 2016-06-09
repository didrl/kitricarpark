<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, com.carpark.member.model.MessageDto"
    %>
    
<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp"%>
<%@include file="/common/side.jsp" %>

<%
if(memberDto != null) {
List<MessageDto> list = (List<MessageDto>) request.getAttribute("receiveList");
%>

<script>
function chargeCoin(){
		document.chargeCoinForm.action = <%=root%>+"/coin?act=mvChargeCoin";
		document.chargeCoinForm.submit();
}

</script>

<div id="wrapper">

<!-- ****************************************************************************************************************** -->	
       
        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							코인 충전
						</h1>

					</div>
				</div>


				<div class="row">
					<div class="col-lg-12">
							<!-- p1: my coin -->
							<div class="form-group">

								<div class="col-lg-4">
									<label><%=memberDto.getUser_id()%>님의 코인</label>
								</div>
								<div class="col-lg-6">
									<p class="breadcrumb">보유한 코인</p>
									<p class="form-control-static"><%=memberDto.getCoin()%> 코인</p>
									<p class="help-block">코인 사용 안내</p>
								</div>
							</div>
							<!-- p1: my coin end-->
							
							
							
							<!-- 쪽지보내기 -->
							<!-- 
								<div class="form-group">
									<form class="form-horizontal" name="leaveReviewForm" method="post" action="">
										<input type="hidden" name="act" value="leaveReview">
										<input type="hidden" name="bcode" value="2"> 
										<input type="hidden" name="pg" value="1"> 
										<input type="hidden" name="key" value=""> 
										<input type="hidden" name="word" value="">

										<div class="form-group">
											<label for="reviewHost">리뷰 남길 주차장</label> <input type="text"
												class="form-control" id="reviewHost" placeholder="리뷰남길주차장"
												name="reviewHost">
										</div>
										<div class="form-group">
											<label for="subject_review">제목</label> <input type="text"
												class="form-control" id="subject_review" placeholder="제목"
												name="subject_review">
										</div>
										<div class="form-group">
											<label for="content_review">내용</label>
											<textarea class="form-control" rows="10" id="content_review"
												name="content_review"></textarea>
										</div>

										<div class="form-group text-center">
											<input class="btn btn-default" type="button" value="보내기"
												onclick="javascript:leaveReview();">
										</div>

									</form>
								</div>
							-->
							
							

							<!-- p2: coin charge-->
							<div class="form-group">
							<form class="form-horizontal" name="chargeCoinForm" method="post" action="">
							<input type="hidden" name="act" value="chargeCoin">
								<div class="col-lg-4">
									<label> 코인충전 </label>
								</div>
								<!-- select coin -->

								<div class="col-lg-6">
									<p>
									<ol class="breadcrumb">
										<li>코인 상품 선택</li>
									</ol>
									<div class="radio">
										<label> <input type="radio" name="optionsRadios"
											id="optionsRadios1" value="50" checked>50코인
											5000원
										</label>
									</div>
									<div class="radio">
										<label> <input type="radio" name="optionsRadios"
											id="optionsRadios2" value="90">90코인 9000원
										</label>
									</div>
									<div class="radio">
										<label> <input type="radio" name="optionsRadios"
											id="optionsRadios3" value="100">100코인 10000원
										</label>
									</div>
									</p>

									<!-- coin charge method-->
									<p>
									<ol class="breadcrumb">
										<li>결제 수단 선택</li>
									</ol>

									<label class="radio-inline"> <input type="radio"
										name="optionsRadiosInline" id="optionsRadiosInline1"
										value="option1" checked> 신용카드 <img src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/cc-badges-ppppcmcvdam.png" alt="Pay with PayPal, PayPal Credit or any major credit card" />
									</label> 
									<!-- 
									<label class="radio-inline"> <input type="radio"
										name="optionsRadiosInline" id="optionsRadiosInline2"
										value="option2"> 휴대폰 결제(사용불가)
									</label>
									 --> 
									<label class="radio-inline"> <input type="radio"
										name="optionsRadiosInline" id="optionsRadiosInline3"
										value="option3"> 계좌이체 <img src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/pp-acceptance-small.png" alt="Buy now with PayPal" />
									</label>
									</p>
									<p>
									<input class="btn btn-default" type="submit" value=결제하기 onclick="javascript:chargeCoin();">
									<input type="reset" class="btn btn-default" value=취소>
									</p>
								</div>
								</form>
							</div>

							<!-- p2: coin charge end -->
						

					</div>
				</div>
				<!-- /.row -->

			</div>
			<!-- /.container-fluid -->

		</div>
        <!-- /#page-wrapper -->

  
  <!-- ****************************************************************************************************************** -->	
    </div>
    <!-- /#wrapper -->

  <!-- Footer -->
  <%@include file="/common/footer.jsp" %>
  <!-- /Footer -->
 <%
}else{
%>
<script type="text/javascript">
alert("잘못된 접근입니다. 다시 시도해주세요.");
document.location.href = "<%=root%>/index.jsp";
</script>
<%
}
%>