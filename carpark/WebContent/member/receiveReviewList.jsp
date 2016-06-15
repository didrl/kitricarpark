<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.carpark.member.model.*,com.carpark.util.*"%>
    
<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp" %> 
<%@include file="/common/side.jsp" %>
  
    
<%
if(memberDto != null) {
	List<ReviewDto> list = (List<ReviewDto>) session.getAttribute("receiveReview");
	PageNavigator navigator = (PageNavigator) request.getAttribute("navigator");
%>
<<script type="text/javascript">
function receiveReviewView(seq) {
	window.open( root+"/review?act=receiveReview&seq="+seq, "newWindow", "top=100, left=400, width=500, height=600, scrollbars=yes" );
}
function sendReviewList(pg) {
	document.location.href = root+"/review?act=sendReviewList&pg="+pg;
}

function receiveReviewList(pg) {
	document.location.href = root+"/review?act=receiveReviewList&pg="+pg;
}
</script>
<div id="wrapper">
<!-- ****************************************************************************************************************** -->	

		<!-- main -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<br><h3>받은 후기 목록</h3><br>
					
				<div class="btn-group" role="group" aria-label="...">
	  				<button type="button" class="btn btn-default" onclick="javascript:receiveReviewList('1');">
	  					받은 후기함
	  				</button>
	  				<button type="button" class="btn btn-default" onclick="javascript:sendReviewList('1');">
	  					보낸 후기함
	  				</button>	
				</div>
				
				
				<!-- 메세지 리스트 -->
				<div class="table">
				  <table class="table table-hover" style="text-align:center">
				  	<tr style="background: #00cc00">
				  		<td width="150"><b>보낸 사람</b></td>
				  		<td width="150"><b>작성자</b></td>
				  		<td width="100"><b>주차장 번호</b></td>
				  		<td width="450"><b>제목</b></td>
				  		<td width="150">작성 시간</td>
				  	</tr>
				
<%
int size = list.size();
if(size > 0) {
	for(ReviewDto reviewDto : list) {
%>
					<!-- 쪽지목록 -->
					<tr >
						<td width="150"><a href="javascript:receiveReviewView('<%=reviewDto.getSeq()%>');"><%=reviewDto.getAvaled_id() %></a></td>
						<td><a href="javascript:receiveReviewView('<%=reviewDto.getSeq() %>');"><%=reviewDto.getUser_id() %></a></td>
						<td><a href="javascript:receiveReviewView('<%=reviewDto.getSeq() %>');"><%=reviewDto.getPark_id() %></a></td>
						<td><a href="javascript:receiveReviewView('<%=reviewDto.getSeq() %>');"><%=reviewDto.getSubject() %></a></td>
						<td width="80"><%=reviewDto.getLogtime() %></td>						
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
<center><h3>받은 후기가 없습니다</h3></center>	
<br><br>  
<%
}
%>


			<!-- 페이지 네비게이션/검색 
			<nav align="center">
				<div class="form-group">
				<form class="form-inline" name="searchForm" method="get" action="">
					<input type="hidden" name="act" id="act" value="messageSearchSend">
					<input type="hidden" name="pg" id="pg" value="<%=pg%>">
					<select name="key">
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="user_id">작성자</option>
					</select>
					<input type="text" name="word" id="word" value="">
					<input type="button" class="btn btn-default" value="검색" onclick="javascript:messageSearch();">
				</form>
				</div>
					
				<ul class="pagination">
				<navigator.getNavigator() %>
				</ul>
			</nav>-->

					
		</div>
	</div>
<!-- ****************************************************************************************************************** -->	
</div>
<%
} else {
%>
<center><h3>로그인 후 이용해주세요</h3></center>
<%
}
%>

<%@include file="/common/footer.jsp"%>