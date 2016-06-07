<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.carpark.member.model.*,com.carpark.util.*
    ,com.carpark.common.model.*"%>

<%
String root = request.getContextPath();
MemberDto memberDto = (MemberDto)session.getAttribute("memberInfo");
CallDto callDto = (CallDto) request.getAttribute("callSendView");

int pg = NumberCheck.nullToOne(request.getParameter("pg"));
String key = StringCheck.nullToBlank(request.getParameter("key"));
String word = Encoder.isoToUtf(StringCheck.nullToBlank(request.getParameter("word")));
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
</head>
<body>

<form name="common" method="get" action="">
	<input type="hidden" name="act" id="act" value="">
	<input type="hidden" name="bcode" id="bcode" value="2">
	<input type="hidden" name="pg" id="pg" value="<%=pg%>">
	<input type="hidden" name="key" id="key" value="">
	<input type="hidden" name="word" id="word" value="">
	<input type="hidden" name="seq" id="seq" value=""> 
</form>

<br>
<div id="page-wrapper">
<div class="container-fluid">
<%
if(memberDto != null) {
	if(callDto != null) {
%>
	<table class="table">
		<tr>
			<td width="80">받는사람</td>
			<td><%=callDto.getUserID() %></td>
			<td width="50">시간</td>
			<td width="80"><%=callDto.getLogtime() %></td>
			</tr>
			<tr>
			<td width="80">제목</td>
			<td colspan="3"><%=callDto.getSubject() %></td>
			</tr>
			<tr>
			<td width="80">내용</td>
			<td colspan="3" height="350"><p><%=callDto.getContent() %></p></td>
			</tr>
		<tr>
			<td colspan="4" align="center">
			<p>
			<input type="button" class="btn btn-default" value="닫기" onclick="javascript:messageClose();">
			</p>
			</td>
		</tr>
	</table>
<%
	} else {
%>
<center><h3>쪽지가 없습니다</h3></center>
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