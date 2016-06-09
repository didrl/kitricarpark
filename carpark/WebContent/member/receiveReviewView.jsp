<%@page import="com.carpark.common.model.ParkingViewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.carpark.member.model.*,com.carpark.util.*"%>  
<%
String root = request.getContextPath();
MemberDto memberDto = (MemberDto)session.getAttribute("memberInfo");
ReviewDto reviewDto = (ReviewDto) request.getAttribute("reviewView");
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
function reviewViewClose() {
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
	if(reviewDto != null) {
%>
	<table class="table">
		<tr>
				<td width="120">주차장 번호</td>
				<td ><%=reviewDto.getPark_id()%></td>
				<td width="50">평가대상</td>
				<td width="100"><%=reviewDto.getAvaled_id() %></td>
		</tr>
		<tr>
				<td width="50">평가자</td>
				<td width="100"><%=reviewDto.getUser_id() %></td>
				<td >받은 평점</td>
				<td ><%=reviewDto.getAvgPoint()%></td>
		</tr>
		
		<tr>
				<td>작성일</td>
				<td><p><%=reviewDto.getLogtime() %></p></td>
		</tr>
		<tr>
				<td width="80">제목</td>
				<td colspan="3"><%=reviewDto.getSubject() %></td>
		</tr>
		<tr>
				<td width="80">내용</td>
				<td colspan="3"><p><%=reviewDto.getContent()%></p></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
			<p>
			<input type="button" class="btn btn-default" value="닫기" onclick="javascript:reviewViewClose();">
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

	