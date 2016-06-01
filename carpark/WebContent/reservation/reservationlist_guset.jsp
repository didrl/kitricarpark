<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.carpark.member.model.*"%>
    
<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp" %> 
<%@include file="/common/side.jsp" %>
  
    
<%
if(memberDto != null) {
List<MessageDto> list = (List<MessageDto>) request.getAttribute("reservationList_host");
%>

<div id="wrapper">
<!-- ****************************************************************************************************************** -->	

		<!-- main -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<br><h3>예약 내역</h3><br>
					
				<div class="btn-group" role="group" aria-label="...">
	  				<button type="button" class="btn btn-default" onclick="javascript:reservationList_host();">
	  					받은 예약내역
	  				</button>
	  				<button type="button" class="btn btn-default" onclick="javascript:reservationList_guest();">
	  					내가 한 예약내역
	  				</button>	
					<button type="button" class="btn btn-default"  data-toggle="modal" data-target="#leaveReview" onclick="javascript:init();">
                		리뷰 남기기
               		</button>
				</div>
				
				<!-- 리뷰 남기기 모달창 -->
				<%@ include file="/reservation/leaveReview.jsp" %>
					
				
				<!-- 예약내역 리스트 -->
				<div class="table">
				  <table class="table table-hover" style="text-align:center">
				  	<tr>
				  		<td width="200"><b>호스트 아이디</b></td>
				  		<td><b>주차장 이름</b></td>
				  		<td><b>예약 시간</b></td>
				  		<td width="50"><b>확인</b></td>
				  		<td></td>
				  	</tr>
				
<%
int size = list.size();
if(size > 0) {
	for(MessageDto messageDto : list) {
%>
					<!-- 예약목록 -->
					<tr >
						<td><a href="javascript:reservationList_host('<%=messageDto.getSeq()%>');"><%=messageDto.getReceiverId() %></a></td>
						<td><a href="javascript:reservationList_host('<%=messageDto.getSeq() %>');"><%=messageDto.getSubject() %></a></td>
						<td><%=messageDto.getLogtime() %></td>	
<%
if(messageDto.getMsgFlag() == 0) {
%>					
						<td>X</td>
						<td>
						<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#leaveReview_to" onclick="leaveReview_toInit('<%=messageDto.getReceiverId()%>');">리뷰남기기</button>
						</td>
<%
} else {
%>
						<td>O</td>
						<td>
						<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#messageToWrite" onclick="javascript:toWriteInit('<%=messageDto.getReceiverId()%>');">리뷰남기기</button>
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
<center><h3>예약내역이 없습니다</h3></center>	
<br><br>  
<%
}
%>


			<!-- 페이지 네비게이션/검색 -->
			<nav align="center">
				<div class="form-group">
				<form class="form-inline" name="reservationsearchForm" method="get" action="">
					<input type="hidden" name="act" id="act" value="reservationSearch">
					<input type="hidden" name="bcode" id="bcode" value="1">
					<input type="hidden" name="pg" id="pg" value="1">
					<select name="key">
						<option value="parkname_reservation">예약주차장</option>
						<option value="time_reservation">예약시간</option>
						<option value="userid_reservationer">예약자</option>
					</select>
					<input type="text" name="word_r" id="word_r" value="">
					<input type="button" class="btn btn-default" value="검색" onclick="javascript:reservationSearch();">
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
<center>
<h3>로그인 후 이용해주세요</h3>
</center>
<%
}
%>

<%@include file="/common/footer.jsp"%>