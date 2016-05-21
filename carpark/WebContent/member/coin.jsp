<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/common/common.jsp" %>

    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
        	    
            
                    <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							코인 충전 <small>Subheading</small>
						</h1>

					</div>
				</div>


				<div class="row">
					<div class="col-lg-12">
						<form role="form">
							<!-- p1: my coin -->
							<div class="form-group">

								<div class="col-lg-4">
									<label>내 코인</label>
								</div>
								<div class="col-lg-6">
									<p class="breadcrumb">보유 코인</p>
									<p class="form-control-static">datainput 코인</p>
									<p class="help-block">코인 사용 안내</p>
								</div>
							</div>
							<!-- p1: my coin end-->

							<!-- p2: coin charge-->
							<div class="form-group">
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
											id="optionsRadios1" value="option1" checked>21코인
											3900원
										</label>
									</div>
									<div class="radio">
										<label> <input type="radio" name="optionsRadios"
											id="optionsRadios2" value="option2">61코인 8900원
										</label>
									</div>
									<div class="radio">
										<label> <input type="radio" name="optionsRadios"
											id="optionsRadios3" value="option3">100코인 15000원
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
										value="option1" checked> 신용카드
									</label> <label class="radio-inline"> <input type="radio"
										name="optionsRadiosInline" id="optionsRadiosInline2"
										value="option2"> 휴대폰 결제
									</label> <label class="radio-inline"> <input type="radio"
										name="optionsRadiosInline" id="optionsRadiosInline3"
										value="option3"> 계좌이체
									</label>
									</p>
									<p>
										<button type="submit" class="btn btn-default">결제요청</button>
										<button type="reset" class="btn btn-default">취소</button>
									</p>
								</div>
							</div>

							<!-- p2: coin charge end -->
						</form>

					</div>
				</div>
				<!-- /.row -->

			</div>
			<!-- /.container-fluid -->

		</div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
  <!-- Footer -->
  <%@include file="/common/footer.jsp" %>
  <!-- /Footer -->

</body>
</html>