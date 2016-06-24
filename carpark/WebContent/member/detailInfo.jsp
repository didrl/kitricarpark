<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp"%>
<%@include file="/common/side.jsp" %>
<%
MemberDto memberDetailInfo =(MemberDto)request.getAttribute("memberDetailInfo");
int delete =  (Integer)request.getAttribute("delete");
%>



	<div id="wrapper">
<!-- ****************************************************************************************************************** -->	

		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">프로필수정</h1>
						
					</div>
				</div>
				<!-- /.row -->


				<div class="row">
					<form role="form" id="memberdetail" name="memberdetail" method="post" action="<%=root %>/member">
					<input type="hidden" name="act" value="mvmodify">
					<div class="col-lg-6">
							<div class="form-group">
								<label>이름</label> <input class="form-control"
									value="<%=memberDetailInfo.getUser_name()%>" name="modifyname">
							</div>

							<div class="form-group">
								<label>새비밀번호</label> <input type="password" class="form-control" name="modifypass1" id="modifypass1">
							</div>

							<div class="form-group">
								<label>새비밀번호확인</label> <input type="password" class="form-control" name="modifypass2" id="modifypass2">
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
							
							
							<div class="form-group">
								<button type="submit" class="btn btn-default">수정</button>
								<button type="reset" class="btn btn-default">취소</button>
								<button type="button" class="btn btn-default" onclick="javascript:secession('<%=memberDto.getUser_id()%>');">회원탈퇴</button>
							</div>
					</div>
					<!-- /.col-lg-6 -->

					<div class="col-lg-6">

					<!-- 	<div class="form-group">
							<label>프로필 사진 선택</label> <input type="file">
						</div> -->

<!-- 
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
 -->
						
							
						

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
	
