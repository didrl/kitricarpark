<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.carpark.member.model.*"%>
    
<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp" %> 
<%@include file="/common/side.jsp" %>
  
    
<%
if(memberDto != null) {
	ArrayList<ReservationDto> list = (ArrayList<ReservationDto>) session.getAttribute("myreservationlist");
%>
<script type="text/javascript">
function myReservationView(park_id){
	alert(park_id+" 눌렀다.");
}
</script>
<div id="wrapper">
<!-- ****************************************************************************************************************** -->	

		<!-- main -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<br><h3>예약 목록</h3><br>
					
				
				<!-- 메세지 리스트 -->
				<div class="table">
				  <table class="table table-hover" style="text-align:center">
				  	<tr>
				  		<td width="100"><b>예약번호</b></td>
				  		<td><b>주차장 이름</b></td>
				  		<td><b>예약 시작일</b></td>
				  		<td><b>예약 종료일</b></td>
				  		<td><b>이용 가격</b></td>
				  		<td><b>관리자 이름</b></td>
				  		<td><b>예약 날짜</b></td>
				  	</tr>
				
<%
	int size = list.size();
	if(size > 0) {
		for(ReservationDto reservationDto : list) {
			//r.user_id,r.reser_id, p.park_name, r.start_date, r.end_date,r.pay,r.park_id, p.owner_id
%>

					<!-- 쪽지목록 -->
					<tr >
						<td><label onclick="javascript:myReservationView('<%=reservationDto.getReser_id()%>');">
						<%=reservationDto.getReser_id() %></label></td>
						<td><label onclick="javascript:myReservationView('<%=reservationDto.getReser_id()%>');">
						<%=reservationDto.getPark_name() %></label></td>
						<td><label onclick="javascript:myReservationView('<%=reservationDto.getReser_id()%>');">
						<%=reservationDto.getFromdate() %></label></td>
						<td><label onclick="javascript:myReservationView('<%=reservationDto.getReser_id()%>');">
						<%=reservationDto.getTodate() %></label></td>
						<td><label onclick="javascript:myReservationView('<%=reservationDto.getReser_id()%>');">
						<%=reservationDto.getPay() %></label></td>
						<td><label onclick="javascript:myReservationView('<%=reservationDto.getReser_id()%>');">
						<%=reservationDto.getHost_id() %></label></td>
						<td><label onclick="javascript:myReservationView('<%=reservationDto.getReser_id()%>');">
						<%=reservationDto.getReser_date() %></label></td>
<%
		}
%>
					</tr>
				  </table>
				</div>
				
<%
	} else {
%>
				  </table>
				</div>
<center><h3>예약 내역이 없습니다</h3></center>	
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
						<option value="subject">주차장 이름</option>
						<option value="content">관리자 이름</option>
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