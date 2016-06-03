<%@page import="com.carpark.common.model.ParkingViewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.carpark.member.model.*,com.carpark.util.*"%>  
<%
String root = request.getContextPath();
MemberDto memberDto = (MemberDto)session.getAttribute("memberInfo");
ParkingViewDto parkingViewDto = (ParkingViewDto) request.getAttribute("parkingViewDto");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="<%=root %>/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=root %>/css/stylish-portfolio.css" rel="stylesheet">
	<!-- jQuery -->
    <script src="<%=root %>/js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<%=root %>/js/bootstrap.min.js"></script>
<script type="text/javascript">
function parkingViewClose() {
	window.close();
}
</script>
</head>
<body>

<form name="common" method="get" action="">
	<input type="hidden" name="act" id="act" value="">
	<input type="hidden" name="bcode" id="bcode" value="2">
	<input type="hidden" name="pg" id="pg" value="">
</form>

<br>
<div id="page-wrapper">
<div class="container-fluid">
<%
if(memberDto != null) {
	if(parkingViewDto != null) {
%>
	<table class="table">
		<tr>
				<td width="120">주차장 이름</td>
				<td colspan="3"><%=parkingViewDto.getPark_name()%></td>
		</tr>
		<tr>
				<td width="50">관리자 이름</td>
				<td width="100"><%=parkingViewDto.getOwner_id() %></td>
				<td >평점</td>
				<td ><%=parkingViewDto.getAvg_point() %></td>
		</tr>
		<tr>
				<td width="80">주소</td>
				<td colspas="3"><%=parkingViewDto.getLocation() %></td>
		</tr>
		<tr>
				<td width="80">사용가능 여부</td>
				<td><p><%=parkingViewDto.getPark_flag() %></p></td>
				<td>월 정기권</td>
				<td><p><%=parkingViewDto.getFulltime_monthly_pay() %></p></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
			<p>
			<input type="button" class="btn btn-default" value="닫기" onclick="javascript:parkingViewClose();">
			</p>
			</td>
		</tr>
	</table>
<%
	} else {
%>
<center><h3>정보가 없습니다</h3></center>
<%
	}
} else {
%>
<center>
<h3>로그인 후 이용해 주세요</h3>
<a class="btn btn-default" href="<%=root%>/index.jsp">확인</a>
</center>
<%
}
%>
</div>
</div>
</body>
</html>

	