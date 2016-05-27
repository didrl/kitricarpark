<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp"%>
<%@include file="/common/side.jsp" %>

	<div id="wrapper">

<!-- ****************************************************************************************************************** -->	
	
		
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">주차장 예약</h1>
						<ol class="breadcrumb">
							<li><i class="fa fa-dashboard"></i> <a href="index.html">Dashboard</a>
							</li>
							<li class="active"><i class="fa fa-edit"></i> Forms</li>
						</ol>
					</div>
				</div>
				<!-- /.row -->


				<div class="row">
					<div class="col-lg-6">
						<form role="form">
							<div class="form-group">
								<label> </label> <input class="form-control"
									placeholder="Full name">
								<p class="help-block">Example block-level help text here.</p>
							</div>

							<div class="form-group">
								<label>예약날짜 </label>
								<div class="row">
									<div class="col-xs-4">
										<label>년도</label> <input type="text" class="form-control"
											placeholder="year">
									</div>
									<div class="col-xs-3">
										<label>월</label> <input type="text" class="form-control"
											placeholder="month">
									</div>
									<div class="col-xs-3">
										<label>일</label> <input type="text" class="form-control"
											placeholder="day">
									</div>
								</div>
							</div>


							<div class="form-group">
								<label>방문목적</label> <input class="form-control">
							</div>


							<div class="form-group">
								<label for="exampleInputName2">전화번호</label> <input type="text"
									class="form-control" id="exampleInputName2"
									placeholder="Jane Doe">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail2">Email</label> <input
									type="email" class="form-control" id="exampleInputEmail2"
									placeholder="jane.doe@example.com">
							</div>
							
						</div>
						<!-- /.col-lg-6 -->
						
						<!-- .col-lg-6 -->	
						<div class="col-lg-6">
							<div class="form-group">
								<label>호스트에게 남길 메세지</label>
							</div>

							<div class="form-group">
								<textarea class="form-control" rows="3"></textarea>
							</div>


							<div class="form-group">
								<div class="checkbox">
									<label> <input type="checkbox" value="">페이스북에 공유
									</label>
								</div>
							</div>


							<div class="form-group">
								<label>Inline Radio Buttons</label> <label class="radio-inline">
									<input type="radio" name="optionsRadiosInline"
									id="optionsRadiosInline1" value="option1" checked>1
								</label> <label class="radio-inline"> <input type="radio"
									name="optionsRadiosInline" id="optionsRadiosInline2"
									value="option2">2
								</label> <label class="radio-inline"> <input type="radio"
									name="optionsRadiosInline" id="optionsRadiosInline3"
									value="option3">3
								</label>
							</div>

							<div class="form-group">
								<button type="submit" class="btn btn-default">예약</button>
								<button type="reset" class="btn btn-default">취소</button>
							</div>

							</div>
						</form>
					
					<!-- /.col-lg-6 -->
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
