<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.carpark.member.model.*,com.carpark.util.*"%>
    
<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp" %> 
<%@include file="/common/side.jsp" %>
  
    
<%
if(memberDto != null) {
List<ReportDto> list = (List<ReportDto>) request.getAttribute("reportList");
PageNavigator navigator = (PageNavigator) request.getAttribute("navigator");
%>

<div id="wrapper">
<!-- ****************************************************************************************************************** -->	

		<!-- main -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<br><h3>신고내역</h3><br>
					
				
				<!-- 신고하기 모달창 -->
				<%@ include file="/report/write.jsp" %>
					
				
				<!-- 신고내역 -->
				<div class="table">
				  <table class="table table-hover" style="text-align:center">
				  	<tr>
				  		<td width="150"><b>신고대상</b></td>
				  		<td><b>제목</b></td>
				  		<td width="80"><b>시간</b></td>
				  	</tr>
				
<%
int size = list.size();
if(size > 0) {
	for(ReportDto reportDto : list) {
%>
					<!-- 신고내역 -->
					<tr>
						<td width="150"><a href="#"><%=reportDto.getReport_id() %></a></td>
						<td><a href="#"><%=reportDto.getSubject() %></a></td>
						<td width="80"><%=reportDto.getLogtime() %></td>	
					</tr>
<%
	}
%>
				  </table>
				</div>

<%
} else {
%>
				  </table>
				</div>
<center><h3>신고내역이 없습니다</h3></center>	
<br><br>  
<%
}
%>


			<!-- 페이지 네비게이션/검색 -->
			<nav align="center">
				<div class="form-group">
				<form class="form-inline" name="searchForm" method="get" action="">
					<input type="hidden" name="act" id="act" value="reportSearch">
					<input type="hidden" name="pg" id="pg" value="<%=pg%>">
					<select name="key">
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="user_id">신고대상</option>
					</select>
					<input type="text" name="word" id="word" value="">
					<input type="button" class="btn btn-default" value="검색" onclick="javascript:reportSearch();">
				</form>
				</div>
				<ul class="pagination">
				<%=navigator.getNavigator() %>
				</ul>
						
			</nav>

					
		</div>
	</div>
<!-- ****************************************************************************************************************** -->	
</div>
<%
} else {
%>
<center>
<h3>로그인 후 이용해주세요</h3>
</center>
<%
}
%>

<%@include file="/common/footer.jsp"%>