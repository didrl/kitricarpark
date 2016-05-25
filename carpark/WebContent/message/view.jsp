<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.carpark.member.model.*"%>
<%
MessageDto messageDto = (MessageDto) request.getAttribute("messageView");
%>

<%@ include file="/common/common.jsp" %>
<%@ include file="/common/side.jsp" %>

<div id="wrapper">
<!-- ****************************************************************************************************************** -->
<form name="common" method="get" action="">
	<input type="hidden" name="act" id="act" value="">
	<input type="hidden" name="bcode" id="bcode" value="1">
	<input type="hidden" name="pg" id="pg" value="1">
	<input type="hidden" name="key" id="key" value="">
	<input type="hidden" name="word" id="word" value="">
	<input type="hidden" name="seq" id="seq" value="">
</form>



		<!-- main -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- 쪽지내용 -->
				
				<div class="form-group">
				<form name="searchForm" method="get" action="">
				<input type="hidden" name="act" id="act" value="messageSearch">
				<input type="hidden" name="bcode" id="bcode" value="1">
				<input type="hidden" name="pg" id="pg" value="1">
					<select name="key">
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="user_id">작성자</option>
					</select>
					<input type="text" name="word">
					<input type="button" value="검색" onclick="javascript:messageSearch();">
				</form>
				</div>
<%
if(messageDto != null) {
%> 				
				
				<div class="table-responsive">
				  <table class="table" border="1">
				  <tr>
				  	<td width="100">보낸사람</td>
				  	<td><%=messageDto.getUserID() %></td>
				  	<td width="100">보낸시간</td>
				  	<td width="100"><%=messageDto.getLogtime() %></td>
				  </tr>
				  <tr>
				  	<td width="100">제목</td>
				  	<td colspan="3"><%=messageDto.getSubject() %></td>
				  </tr>
				  <tr>
				  	<td width="100">내용</td>
				  	<td colspan="3"><p><%=messageDto.getContent() %></p></td>
				  </tr>
				  </table>
				</div>
<%
} else {
%>
<center>
	<h3>삭제된 쪽지입니다</h3>
</center>
<%
}
%>
				<input type="button" value="목록" onclick="javascript:messageList();">
				<input type="button" value="삭제" onclick="javascript:messageDelete('<%=messageDto.getSeq()%>');">
				
			</div>
		</div>

<!-- ****************************************************************************************************************** -->	
		
</div>

<%@ include file="/common/footer.jsp" %>

