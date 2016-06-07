<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp" %>

<%
CallDto callDto = (CallDto) request.getAttribute("callSendView");
%>

<div id="page-wrapper">
<div class="container-fluid">
<%
if(memberDto != null) {
	if(callDto != null) {
%>
<form action="">
	<table class="table">
		<tr>
			<td width="90" style="text-align: center; vertical-align: middle;">받는사람</td>
			<td style="text-align: center; vertical-align: middle;"><%=callDto.getUserID() %></td>
			<td width="50" style="text-align: center; vertical-align: middle;">시간</td>
			<td width="90" style="text-align: center; vertical-align: middle;"><%=callDto.getLogtime() %></td>
			</tr>
			<tr>
			<td width="90" style="text-align: center; vertical-align: middle;">제목</td>
				<td colspan="3" style="text-align: center; vertical-align: middle;"><%=callDto.getSubject()%></td>
			</tr>
			<tr>
			<td width="90" style="text-align: center; vertical-align: middle;">내용</td>
			<td colspan="3" height="350" style="text-align: center; vertical-align: middle;">
			<p><%=callDto.getContent() %></p></td>
			</tr>
		<tr>
			<td colspan="4" align="center">
			<p>
			<input type="button" class="btn btn-default" value="닫기" onclick="javascript:callSendViewClose();">
			</p>
			</td>
		</tr>
	</table>
</form>
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