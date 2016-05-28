<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp"%>
<%@include file="/common/side.jsp" %>
<%
MemberDto memberDetailInfo =(MemberDto)request.getAttribute("memberDetailInfo");
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
					<form role="form" id="memberdetail" name="memberdetail" method="post" action="<%=root %>/member">
					<input type="hidden" name="act" value="mvmodify">
					<div class="col-lg-6">
							<div class="form-group">
								<label>Full Name</label> <input class="form-control"
									value="<%=memberDetailInfo.getUser_name()%>" name="modifyname">
								<p class="help-block">Example block-level help text here.</p>
							</div>

							<div class="form-group">
								<label>새비밀번호</label> <input class="form-control" name="modifypass1" id="modifypass1">
							</div>

							<div class="form-group">
								<label>새비밀번호확인</label> <input class="form-control" name="modifypass2" id="modifypass2">
							</div>
							
							
							<div class="form-group">
								<label for="exampleInputName2">전화번호</label> <input type="text"
									class="form-control" id="modifytel" name="modifytel"
									value="<%=memberDetailInfo.getTel() %>">
									<p class="help-block"> - 없이 입력해주세요.</p>
							</div>

							<div class="form-group">
								<label for="exampleInputEmail2">이메일</label> <input
									type="email" class="form-control" id="exampleInputEmail2" name="modifyemail"
									value="<%=memberDetailInfo.getEmail() %>">
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
							<label>회사 선택</label> <label class="radio-inline">
								<input type="radio" name="optionsRadiosInline"
								id="optionsRadiosInline1" value="option1" checked>개인
							</label> 
							<label class="radio-inline"> <input type="radio"
								name="optionsRadiosInline" id="optionsRadiosInline2"
								value="option2">기업
							</label> 
							<label class="radio-inline"> <input type="radio"
								name="optionsRadiosInline" id="optionsRadiosInline3"
								value="option3">공공기관
							</label>
							<label class="radio-inline"> <input type="radio"
								name="optionsRadiosInline" id="optionsRadiosInline3"
								value="option3">없음
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
	
