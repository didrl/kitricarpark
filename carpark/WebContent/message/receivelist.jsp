<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.carpark.member.model.*,com.carpark.util.*"%>
    
<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp" %> 
<%@include file="/common/side.jsp" %>
  
    
<%
if(memberDto != null) {
List<MessageDto> list = (List<MessageDto>) request.getAttribute("receiveList");
PageNavigator navigator = (PageNavigator) request.getAttribute("navigator");
%>

<div id="wrapper">
<!-- ****************************************************************************************************************** -->	

		<!-- main -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<br><h3>쪽지함</h3><br>
					
				<div class="btn-group" role="group" aria-label="...">
<<<<<<< HEAD
	  				<button type="button" class="btn btn-default" onclick="javascript:messageReceiveList();">
	  					받은 쪽지함
	  				</button>
	  				<button type="button" class="btn btn-default" onclick="javascript:messageSendList();">
	  					보낸 쪽지함
=======
	  				<button type="button" class="btn btn-default" onclick="javascript:messageReceiveList('1');">
	  					받은쪽지함
	  				</button>
	  				<button type="button" class="btn btn-default" onclick="javascript:messageSendList('1');">
	  					보낸쪽지함
>>>>>>> a3d98903480c22a6c0e2b5d8691554756d51a1c4
	  				</button>	
					<button type="button" class="btn btn-default"  data-toggle="modal" data-target="#messageWrite" onclick="javascript:init();">
                		쪽지 보내기
               		</button>
				</div>
				
				<!-- 메세지 보내기 모달창 -->
				<%@ include file="/message/write.jsp" %>
				<%@ include file="/message/towrite.jsp" %>
					
				
				<!-- 메세지 리스트 -->
				<div class="table">
				  <table class="table table-hover" style="text-align:center">
				  	<tr>
				  		<td width="150"><b>보낸사람</b></td>
				  		<td><b>제목</b></td>
				  		<td width="80"><b>시간</b></td>
				  		<td width="50"><b>확인</b></td>
				  		<td width="50"></td>
				  	</tr>
				
<%
int size = list.size();
if(size > 0) {
	for(MessageDto messageDto : list) {
%>
					<!-- 쪽지목록 -->
					<tr >
						<td width="150"><a href="javascript:messageReceiveView('<%=messageDto.getSeq()%>');"><%=messageDto.getReceiverId() %></a></td>
						<td><a href="javascript:messageReceiveView('<%=messageDto.getSeq() %>');"><%=messageDto.getSubject() %></a></td>
						<td width="80"><%=messageDto.getLogtime() %></td>	
<%
if(messageDto.getMsgFlag() == 0) {
%>					
						<td width="50">X</td>
						<td width="50">
						<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#messageToWrite" onclick="toWriteInit('<%=messageDto.getReceiverId()%>');">답장</button>
						<button type="button" class="btn btn-default btn-xs" onclick="javascript:messageReceiveDelete('<%=messageDto.getSeq()%>');">삭제</button>
						</td>
<%
} else {
%>
						<td width="50">O</td>
						<td width="50">
						<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#messageToWrite" onclick="javascript:toWriteInit('<%=messageDto.getReceiverId()%>');">답장</button>
						<button type="button" class="btn btn-default btn-xs" onclick="javascript:messageReceiveDelete('<%=messageDto.getSeq()%>');">삭제</button>
						</td>
					</tr>
<%
	}	
}
%>
				  </table>
				</div>

<%
} else {
%>
				  </table>
				</div>
<center><h3>메세지가 없습니다</h3></center>	
<br><br>  
<%
}
%>


			<!-- 페이지 네비게이션/검색 -->
			<nav align="center">
				<div class="form-group">
				<form class="form-inline" name="searchForm" method="get" action="">
					<input type="hidden" name="act" id="act" value="messageSearchReceive">
					<input type="hidden" name="pg" id="pg" value="<%=pg%>">
					<select name="key">
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="user_id">작성자</option>
					</select>
					<input type="text" name="word" id="word" value="">
					<input type="button" class="btn btn-default" value="검색" onclick="javascript:messageSearch();">
				</form>
				</div>
				<ul class="pagination">
				<%=navigator.getNavigator() %>
				</ul>
						
			</nav>

					
		</div>
	</div>
<!-- ****************************************************************************************************************** -->	
</div>
<%
} else {
%>
<center>
<h3>로그인 후 이용해주세요</h3>
</center>
<%
}
%>

<%@include file="/common/footer.jsp"%>