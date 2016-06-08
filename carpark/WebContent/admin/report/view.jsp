<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.carpark.member.model.*,com.carpark.util.*"%>  
    
<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp" %> 
<%@include file="/admin/common/sidebar.jsp" %>

<%
ReportDto reportDto = (ReportDto) request.getAttribute("reportView");
%>

<div id="wrapper">
<div id="page-wrapper">
<div class="container-fluid">
<%
if(memberDto != null) {
	if(reportDto != null) {
%>

<center><h3>신고내용</h3></center><br>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-2">
			<b>신고자</b><br>
		</div>
		<div class="col-md-8">
			<%=reportDto.getUserID() %>
		</div>
	</div><hr>
	
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-2">
			<b>시간</b><br>
		</div>
		<div class="col-md-8">
			<%=reportDto.getLogtime() %>
		</div>
	</div><hr>

	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-2">
			<b>신고대상</b><br>
		</div>
		<div class="col-md-8">
			<%=reportDto.getReport_id() %>
		</div>
	</div><hr>

	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-2">
			<b>신고제목</b><br>
		</div>
		<div class="col-md-8">
			<%=reportDto.getSubject() %>
		</div>
	</div><hr>

	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-2">
			<b>신고내용</b><br>
		</div>
		<div class="col-md-8">
			<p><%=reportDto.getContent() %></p>
		</div>
	</div><hr>


<form name="penaltyRegisterForm" method="post" action="">
	<input type="hidden" name="act" value="">	
	<input type="hidden" name="pg" id="pg" value="<%=pg%>">
	<input type="hidden" name="key" value="">
	<input type="hidden" name="word" value="">
	<input type="hidden" name="report_id" value="">
	<input type="hidden" name="seq" value="">

<br><br>
<center><h3>벌점주기</h3></center><br>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-2">
			<b>벌점내용선택</b><br>
		</div>
		<div class="col-md-2">
			<select class="form-control" name="penalty_code">
				<option value="" selected="selected">-----</option>
				<option value="10">욕설</option>
				<option value="20">불친절</option>
				<option value="30">계약위반</option>
				<option value="40">사기</option>
			</select>	
		</div>
	</div><hr>
	
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-2">
			<b>추가내용</b><br>
		</div>
		<div class="col-md-8">
			<textarea class="form-control" rows="3" name="penalty_content"></textarea>
		</div>
	</div><hr>
		
</form>

	<div class="row">
		<p align="center">
			<input type="button" class="btn btn-default" value="벌점주기" onclick="javascript:adminPenaltyRegister('<%=reportDto.getReport_id()%>', '<%=reportDto.getSeq()%>');">
			<input type="button" class="btn btn-default" value="닫기" onclick="javascript:adminReportList('<%=pg%>');">
		</p>
	</div>

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
</div>

<%@include file="/common/footer.jsp"%>