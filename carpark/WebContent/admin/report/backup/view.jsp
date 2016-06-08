<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.carpark.member.model.*,com.carpark.util.*"%>  
<%
String root = request.getContextPath();
MemberDto memberDto = (MemberDto)session.getAttribute("memberInfo");
ReportDto reportDto = (ReportDto) request.getAttribute("reportView");
int penalty = (Integer) request.getAttribute("penalty");

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
    <!-- message.js -->
    <script type="text/javascript" src="<%=root %>/admin/report/adminreport.js"></script>
</head>
<body>



<br>
<div id="page-wrapper">
<div class="container-fluid">
<%
if(memberDto != null) {
	if(reportDto != null) {
%>
	<table class="table">
<form name="penaltyRegisterForm" method="post" action="">
	<input type="hidden" name="act" value="">	
	<input type="hidden" name="pg" id="pg" value="<%=pg%>">
	<input type="hidden" name="key" value="">
	<input type="hidden" name="word" value="">
	<input type="hidden" name="report_id" value="">
		<tr>
			<td width="100">신고자</td>
			<td><%=reportDto.getUserID() %></td>
			<td width="50">시간</td>
			<td width="80"><%=reportDto.getLogtime() %></td>
		</tr>
		<tr>
			<td>신고대상</td>
			<td><%=reportDto.getReport_id() %></td>
			<td>벌점</td>
			<td><%=penalty %></td>
		</tr>
		<tr>
			<td width="80">제목</td>
			<td colspan="3"><%=reportDto.getSubject() %></td>
		</tr>
		<tr>
			<td width="80">내용</td>
			<td colspan="3" height="300"><p><%=reportDto.getContent() %></p></td>
		</tr>

		<tr>
			<td>
			<select class="form-control" name="penalty_code">
				<option value="" selected="selected">-----</option>
				<option value="10">욕설</option>
				<option value="20">불친절</option>
				<option value="30">계약위반</option>
				<option value="40">사기</option>
			</select>	
			</td>
			<td colspan="3">
				<textarea class="form-control" rows="3" name="penalty_content"></textarea>	
			</td>		
		</tr>

		<tr>
			<td colspan="4" align="center">
			<p>
			<input type="button" class="btn btn-default" value="벌점주기" onclick="javascript:adminPenaltyRegister('<%=reportDto.getReport_id()%>');">
			<input type="button" class="btn btn-default" value="닫기" onclick="javascript:adminReportClose();">
			</p>
		</td>
		</tr>
	</form>
	</table>    
<%
	} else {
%>
<center><h3>신고내역이 없습니다</h3></center>
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

	