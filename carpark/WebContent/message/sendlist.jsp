<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.carpark.member.model.*"%>
    
<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp" %> 
<%@include file="/common/side.jsp" %>
  
    
<%
if(memberDto != null) {
List<MessageDto> list = (List<MessageDto>) request.getAttribute("sendList");
%>

<div id="wrapper">
<!-- ****************************************************************************************************************** -->	

		<!-- main -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<br><h3>쪽지함</h3><br>
					
				<div class="btn-group" role="group" aria-label="...">
	  				<button type="button" class="btn btn-default" onclick="javascript:messageReceiveList();">
	  					받은쪽지함
	  				</button>
	  				<button type="button" class="btn btn-default" onclick="javascript:messageSendList();">
	  					보낸쪽지함
	  				</button>	
					<button type="button" class="btn btn-default"  data-toggle="modal" data-target="#messageWrite" onclick="javascript:init();">
                		쪽지보내기
               		</button>
				</div>
				
				<!-- 메세지 보내기 모달창 -->
				<%@ include file="/message/write.jsp" %>
				
					
				
				<!-- 메세지 리스트 -->
				<div class="table">
				  <table class="table table-hover" style="text-align:center">
				  	<tr>
				  		<td width="200"><b>받는사람</b></td>
				  		<td><b>제목</b></td>
				  		<td><b>시간</b></td>
				  		<td width="50"><b>확인</b></td>
				  		<td></td>
				  	</tr>
				
<%
int size = list.size();
if(size > 0) {
	for(MessageDto messageDto : list) {
%>
					<!-- 쪽지목록 -->
					<tr >
						<td><a href="javascript:messageSendView('<%=messageDto.getSeq()%>');"><%=messageDto.getReceiverId() %></a></td>
						<td><a href="javascript:messageSendView('<%=messageDto.getSeq() %>');"><%=messageDto.getSubject() %></a></td>
						<td><%=messageDto.getLogtime() %></td>						
<%
if(messageDto.getMsgFlag() == 0) {
%>					
						<td>X</td>
						<td><input type="button" class="btn btn-default btn-xs" value="삭제" onclick="javascript:messageSendDelete('<%=messageDto.getSeq()%>');"></td>
<%
} else {
%>
						<td>O</td>
						<td><input type="button" class="btn btn-default btn-xs" value="삭제" onclick="javascript:messageSendDelete('<%=messageDto.getSeq()%>');"></td>
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
					<input type="hidden" name="act" id="act" value="messageSearch">
					<input type="hidden" name="bcode" id="bcode" value="1">
					<input type="hidden" name="pg" id="pg" value="1">
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
					<li>
						<a href="#" aria-label="Previous">
					    	<span aria-hidden="true">&laquo;</span>
					    </a>
				 	</li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li>
						<a href="#" aria-label="Next">
					    	<span aria-hidden="true">&raquo;</span>
					    </a>
					</li>
				</ul>
			</nav>

					
		</div>
	</div>
<!-- ****************************************************************************************************************** -->	
</div>
<%
} else {
%>
<center><h3>로그인 후 이용해주세요</h3></center>
<%
}
%>

<%@include file="/common/footer.jsp"%>