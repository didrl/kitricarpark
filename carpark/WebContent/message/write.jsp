<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.carpark.member.model.*,java.util.List"%>
<%

List<MessageDto> list = (List<MessageDto>) request.getAttribute("messageList");
%>

<%@ include file="/common/common.jsp" %>
<%@ include file="/common/header.jsp" %>
<%@ include file="/common/side.jsp" %>

<div id="wrapper">
<!-- ****************************************************************************************************************** -->

		<!-- main -->
		<div id="page-wrapper">
			<div class="container-fluid">
			<!-- 쪽지보내기 -->
			<h3>쪽지보내기</h3><br>
			<div class="form-group">
				<form class="form-horizontal" name="writeForm" method="post" action="">
				<input type="hidden" name="act" value="messageWrite">
				<input type="hidden" name="bcode" value="1">
				<input type="hidden" name="pg" value="1">
				<input type="hidden" name="key" value="">
				<input type="hidden" name="word" value="">
			
				  <div class="form-group">
				    <label for="receiver">받는사람</label>
				    <input type="text" class="form-control" id="receiver" placeholder="받는사람" name="name">
				  </div>
				  <div class="form-group">
				    <label for="subject">제목</label>
				    <input type="text" class="form-control" id="subject" placeholder="제목" name="content">
				  </div>
				  <div class="form-group">
				    <label for="content">내용</label>
				    <textarea class="form-control" rows="10" id="content" name="content"></textarea>
				  </div>
				  
				  <div class="form-group text-center">
					<input class="btn btn-default" type="button" value="보내기" onclick="javascript:messageWrite();">
					<input class="btn btn-default" type="reset" value="취소">
				  </div>
			
				</form>
			</div>					
			</div>
		</div>

<!-- ****************************************************************************************************************** -->	
	
	
</div>

<%@ include file="/common/footer.jsp" %>
