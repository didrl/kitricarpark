<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.carpark.member.model.*"%>  
<%
String root = request.getContextPath();
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
    <!-- message.js -->
    <script type="text/javascript" src="<%=root %>/message/message.js"></script>
</head>
<body>
<br>
<div id="page-wrapper">
<div class="container-fluid">
	<table class="table" boder="1">
		<tr>
			<td widht="80">보낸사람</td>
			<td>didrl</td>
			<td width="50">시간</td>
			<td width="80">2015.05.28</td>
		</tr>
		<tr>
			<td width="80">제목</td>
			<td colspan="3">쪽지 U 뭐가 좋을까</td>
		</tr>
		<tr>
			<td width="80" height="300">내용</td>
			<td colspan="3"><p>이것저것테스트중!@#!@#!@#!@#!@#!@#</p></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
			<p>
			<input type="button" class="btn btn-default" value="답장" onclick="javascript:messageDelete('seq');">
			<input type="button" class="btn btn-default" value="삭제" onclick="javascript:messageDelete('seq');">
			</p>
			</td>
		</tr>
	</table>
</div>
</div>
</body>
</html>

	