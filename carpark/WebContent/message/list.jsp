<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.carpark.member.model.*"%>
    
<%@include file="/common/common.jsp" %>
<%@include file="/common/header.jsp" %> 
<%@include file="/common/side.jsp" %>
<script type="text/javascript" src="./message.js"></script>  
    
<%
List<MessageDto> list = (List<MessageDto>) request.getAttribute("messageList");
%>

<div id="wrapper">
<!-- ****************************************************************************************************************** -->	

<form name="common" method="get" action="">
	<input type="hidden" name="act" id="act" value="">
	<input type="hidden" name="bcode" id="bcode" value="2">
	<input type="hidden" name="pg" id="pg" value="1">
	<input type="hidden" name="key" id="key" value="">
	<input type="hidden" name="word" id="word" value="">
	<input type="hidden" name="seq" id="seq" value="">
</form>



			<!-- main -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- 받은쪽지함 -->
				<br><h3>받은 쪽지함</h3><br>
				
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
					<input type="text" name="word" id="word" value="">
					<input type="button" value="검색" onclick="javascript:messageSearch();">
				</form>
				</div>
  				
				
				<div class="table">
				  <table class="table table-hover" style="text-align:center">
				  	<tr>
				  		<td width="150"><b>보낸사람</b></td>
				  		<td><b>제목</b></td>
				  		<td width="150"><b>보낸시간</b></td>
				  		<td width="50"><b>확인</b></td>
				  	</tr>

<script tyep="text/javascript">
function messageView(seq) {
	document.getElementById("act").value = "messageView";
	document.getElementById("seq").value = seq;
		
	document.common.action = "/carpark/message";
	document.common.submit();
	
}
</script>				
<%
if(list != null) {
	for(MessageDto messageDto : list) {
%>
					<tr >
						<td width="150"><a href="javascript:messageView('<%=messageDto.getSeq()%>');"><%=messageDto.getReceiverId() %></a></td>
						<td><a href="javascript:messageView('<%=messageDto.getSeq() %>');"><%=messageDto.getSubject() %></a></td>
						<td width="150"><%=messageDto.getLogtime() %></td>						
						<td width="50"><%=(messageDto.getMsgFlag() == 0) ? "X" : "O" %></td>
					</tr>
<%
	}	
}
%>	
				  
				  </table>
				</div>
				
			<!-- 쪽지보내기 모달 -->	
			<div class="text-center">
				<button type="button" class="btn btn-default"  data-toggle="modal" data-target="#msgToHost">
                	쪽지보내기
               	</button>
			</div>

<%@ include file="/message/write.jsp" %>
				

					
		</div>
	</div>
<!-- ****************************************************************************************************************** -->	
</div>

<%@include file="/common/footer.jsp"%>