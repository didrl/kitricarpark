<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/common/common.jsp" %>
<%@ include file="/common/header/init.jsp" %>
<%@include file="/admin/common/sidebar.jsp" %>

<!-- ************************************************************************************ -->

<!-- ************************************************************************************ -->	
<%
if(memberDto != null){ 

ParkingDetailDto parkingDto = (ParkingDetailDto) request.getAttribute("parkingView");

if(parkingDto != null) {
%>
<div id="wrapper">

		<!-- main -->
		<div id="page-wrapper">
			<div class="container-fluid">
			<br>
			<!-- 본문내용 -->
			<div class="col-md-10">
			<form name="parkRegisterForm" method="post" action="">
				<input type="hidden" name="act" value="parkingRegister">				
				
				
				<div class="row">
					<div class="col-md-2">
						<b>주차장 구분</b><br>
					</div>
					<div class="col-md-10">
<%
if("0".equals(parkingDto.getPark_type())) {
%>
	개인
<%
} else {
%>
	사설
<%	
}
%>
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>사용가능여부</b><br>
					</div>
					<div class="col-md-10">
<%
if(0 == parkingDto.getPark_flag()) {
%>
	사용가능
<%
} else {
%>
	사용불가
<%
}
%>
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>주차장 이름</b><br>
					</div>
					<div class="col-md-10">
						<%=parkingDto.getPark_name() %>
					</div><br>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>위치</b><br>
					</div>
					<div class="col-md-10">
						<%=parkingDto.getDetailAddr() %>
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>보유시설</b><br>
					</div>
					<div class="col-md-10">
						<%=parkingDto.getFacility() %>
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>보유시설상세</b><br>
					</div>
					<div class="col-md-10">
						<%=parkingDto.getFeature() %>
					</div>
				</div><br>
				
				<div class="row">
					<div class="col-md-2">
						<b>상세정보</b><br>
					</div>
					<div class="col-md-10">
						<table class="table">
							<tr>
								<td width="90">평일</td>				
								<td width="90">
<%
if("0" == parkingDto.getPay_yn()) {
%>
	무료
<%
} else {
%>
	유료
<%
}
%>
								</td>				
								<td width="90">토요일</td>				
								<td width="90">
<%
if("0" == parkingDto.getSatur_pay_yn()) {
%>
	무료
<%
} else {
%>
	유료
<%
}
%>								
								</td>				
								<td width="90">공휴일</td>				 
								<td width="90">
<%
if("0" == parkingDto.getHoli_pay_yn()) {
%>
	무료
<%
} else {
%>
	유료
<%
}
%>							
								</td>										
							</tr>							
							<tr>
								<td width="90">총 주차면수</td>				
								<td width="90">
									<%=parkingDto.getPark_capacity() %>
								</td>			
								<td width="90">기본주차시간</td>				
								<td width="90">
									<%=parkingDto.getPark_time_rate() %> 시간								
								</td>				
								<td width="90">기본주차요금</td>				
								<td width="90">
									<%=parkingDto.getPark_rate() %> 코인
								</td>				
							</tr>
							<tr>
							<td width="90">추가단위요금</td>				
								<td width="90">
									<%=parkingDto.getAdd_park_rate() %> 코인
								</td>				
								<td width="90">하루최대요금</td>							
								<td width="90">
									<%=parkingDto.getDay_max_pay() %> 코인
								</td>	
								<td width="90">월정기권</td>
								<td>
									<%=parkingDto.getFulltime_monthly_pay() %> 코인
								</td>
							</tr>					
						</table>
					</div>
				</div>
			
				<div class="row">
					<div class="col-md-2">
						<b>사진</b><br>
					</div>
					<div class="col-md-10">
						사진
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-2">
						<b>주차장 설명</b><br>
					</div>
					<div class="col-md-10">
						<%=parkingDto.getContent() %>
					</div>
				</div><br>
			</form>
	
				<div class="row">
						<p align="center">
		  					<button type="button" class="btn btn-default btn-lg" onclick="javascript:parkingList('<%=pg%>');">목록</button>
		  					<button type="button" class="btn btn-default btn-lg" onclick="javascript:parkingMvModify('<%=parkingDto.getPark_id()%>');">수정</button>
		  					<button type="button" class="btn btn-default btn-lg" onclick="javascript:parkingDelete('<%=parkingDto.getPark_id()%>');">삭제</button>
						</p>
				</div>
			</div>
			
	
				
			
		</div>
	</div>
	</div>
	
<%@ include file="/common/footer.jsp" %>		
<%
} else {
%>
	해당 주차장이 없습니다
<%
}
}else{
%>
<script type="text/javascript">
alert("잘못된 접근입니다. 다시 시도해주세요.");
document.location.href = "<%=root%>/index.jsp";
</script>
<%
}
%>
	