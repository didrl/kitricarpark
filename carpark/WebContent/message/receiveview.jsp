<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.carpark.member.model.*"%>  
<%
String root = request.getContextPath();
MessageDto messageDto = (MessageDto) request.getAttribute("messageView");
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
	<p>
	<input type="button" class="btn btn-default" value="답장" data-toggle="modal" data-target="#messageReply">
	<input type="button" class="btn btn-default" value="삭제" onclick="javascript:messageDelete('<%=messageDto.getSeq()%>');">
	</p>

	<table class="table" boder="1">
		<tr>
			<td width="80">보낸사람</td>
			<td><%=messageDto.getUserID() %></td>
			<td width="50">시간</td>
			<td width="80"><%=messageDto.getLogtime() %></td>
			</tr>
			<tr>
			<td width="80">제목</td>
			<td colspan="3"><%=messageDto.getSubject() %></td>
			</tr>
			<tr>
			<td width="80">내용</td>
			<td colspan="3" height="300"><p><%=messageDto.getContent() %></p></td>
			</tr>
		<tr>
			<td colspan="4" align="center">
			<p>
			<input type="button" class="btn btn-default" value="닫기" onclick="javascript:messageViewClose();">
			</p>
			</td>
		</tr>
	</table>
	  
	<!-- include reply.jsp -->
	
</div>
</div>
</body>
</html>

	