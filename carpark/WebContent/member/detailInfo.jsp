<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp"%>
<%@include file="/common/side.jsp" %>
<%
MemberDto memberDetailDto = (MemberDto)request.getAttribute("memberDetailInfo");
%>

	<div id="wrapper">
<!-- ****************************************************************************************************************** -->	

		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">상세프로필</h1>
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
								<label>Full Name</label> <input class="form-control"
									placeholder="Full name">
								<p class="help-block">Example block-level help text here.</p>
							</div>

							<div class="form-group">
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
								<label>비밀번호</label> <input class="form-control">
							</div>

							<div class="form-group">
								<label>비밀번호확인</label> <input class="form-control">
							</div>


							<div class="form-group">
								<label for="exampleInputName2">전화번호</label> <input type="text"
									class="form-control" id="exampleInputName2"
									placeholder="<%=memberDetailDto.getTel() %>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail2">이메일</label> <input
									type="email" class="form-control" id="exampleInputEmail2"
									placeholder="<%=memberDetailDto.getEmail() %>">
							</div>


							<div class="form-group">
								<label>Company Name</label> <input class="form-control">
								<p class="help-block">Example block-level help text here.</p>
							</div>
					</div>
					<!-- /.col-lg-6 -->

					<div class="col-lg-6">

						<div class="form-group">
							<label class="checkbox-inline"> <input type="checkbox">사업자등록번호체크

							</label>
						</div>

						<div class="form-group">
							<label>프로필 사진 선택</label> <input type="file">
						</div>

						<div class="form-group">
							<label>소개글</label>
							<textarea class="form-control" rows="3"></textarea>
						</div>

						<div class="form-group">
							<label>Checkboxes</label>
							<div class="checkbox">
								<label> <input type="checkbox" value="">Checkbox
									1
								</label>
							</div>
							<div class="checkbox">
								<label> <input type="checkbox" value="">Checkbox
									2
								</label>
							</div>
							<div class="checkbox">
								<label> <input type="checkbox" value="">Checkbox
									3
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
							<button type="submit" class="btn btn-default">수정</button>
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
	
