<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.carpark.member.model.*"%>
    
<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp" %> 
<%@include file="/admin/common/sidebar.jsp" %>
  
    
<%
if(memberDto != null) {
	ArrayList<MemberDto> list = (ArrayList<MemberDto>) request.getAttribute("allmemberinfo");
%>
<script type="text/javascript">
function myReservationView(park_id){
//	alert(park_id+" 눌렀다.");
}
</script>
<div id="wrapper">
<!-- ****************************************************************************************************************** -->	

		<!-- main -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<br><h3>회원 목록</h3><br>
					
				
				<!-- 메세지 리스트 -->
				<div class="table">
				  <table class="table table-hover" style="text-align:center">
				  	<tr style="background: #00cc00">
				  		<td width="100"><b>회원 아이디</b></td>
				  		<td><b>회원 이름</b></td>
				  		<td><b>회원 등급</b></td>
				  		<td><b>호스트 여부</b></td>
				  		<td><b>보유 코인</b></td>
				  		<td><b>회원 평점</b></td>
				  		<td><b>벌점</b></td>
				  		<td><b>회원 구분</b></td>
				  		<td><b>회원 이메일</b></td>
				  		<td><b>회원 연락처</b></td>
				  	</tr>
				
<%
	int size = list.size();
	if(size > 0) {
		for(MemberDto allmemDto : list) {
			//user_id, user_name, grade_name, host_flag,coin, user_avgpoint,penalty,user_flag,email,tel
			String grade="";
			if(allmemDto.getGrade_id()==0)
				grade = "공영주차장";
			else if(allmemDto.getGrade_id()==1)
				grade = "민영주차장";
			else if(allmemDto.getGrade_id()==2)
				grade = "불량";
			else if(allmemDto.getGrade_id()==3)
				grade = "일반";
			else if(allmemDto.getGrade_id()==4)
				grade = "우수";
			else if(allmemDto.getGrade_id()==5)
				grade = "최우수";
			
%>

					<!-- 쪽지목록 -->
					<tr >
						<td><label onclick="javascript:selecteduserView('<%=allmemDto.getUser_id()%>');">
						<%=allmemDto.getUser_id() %></label></td>
						<td><label onclick="javascript:selecteduserView('<%=allmemDto.getUser_id()%>');">
						<%=allmemDto.getUser_name() %></label></td>
						<td><label onclick="javascript:selecteduserView('<%=allmemDto.getUser_id()%>');">
						<%=grade%></label></td>
						<td><label onclick="javascript:selecteduserView('<%=allmemDto.getUser_id()%>');">
						<%=allmemDto.getHost_flag()==0?"게스트":"호스트"%></label></td>
						<td><label onclick="javascript:selecteduserView('<%=allmemDto.getUser_id()%>');">
						<%=allmemDto.getCoin() %></label></td>
						<td><label onclick="javascript:selecteduserView('<%=allmemDto.getUser_id()%>');">
						<%=allmemDto.getAvgpoint() %></label></td>
						<td><label onclick="javascript:selecteduserView('<%=allmemDto.getUser_id()%>');">
						<%=allmemDto.getPenalty() %></label></td>
						<td><label onclick="javascript:selecteduserView('<%=allmemDto.getUser_id()%>');">
						<%=allmemDto.getUser_flag()==0?"개인":"기업"%></label></td>
						<td><label onclick="javascript:selecteduserView('<%=allmemDto.getUser_id()%>');">
						<%=allmemDto.getEmail() %></label></td>
						<td><label onclick="javascript:selecteduserView('<%=allmemDto.getUser_id()%>');">
						<%=allmemDto.getTel() %></label></td>
<%
		}
%>
					</tr>
				  </table>
				</div>
				
<%
	} else {
%>
				  </table>
				</div>
<center><h3>회원 내역이 없습니다</h3></center>	
<br><br>  
<%
	}
%>


			<!-- 페이지 네비게이션/검색 
			<nav align="center">
				<div class="form-group">
				<form class="form-inline" name="searchForm" method="get" action="">
					<input type="hidden" name="act" id="act" value="messageSearch">
					<input type="hidden" name="bcode" id="bcode" value="1">
					<input type="hidden" name="pg" id="pg" value="1">
					<select name="key">
						<option value="subject">회원 이름</option>
						<option value="subject">회원 아이디</option>
						<option value="content">회원 등급</option>
						<option value="content">회원 구분</option>
						<option value="content">호스트 여부</option>
					</select>
					<input type="text" name="word" id="word" value="">
					<input type="button" class="btn btn-default" value="검색" onclick="javascript:messageSearch();">
				</form>
				</div>
					
				<ul class="pagination">
					<li>
						<a href="#" aria-label="Previous">
					    	<span aria-hidden="true">&laquo;</span>
					    </a>
				 	</li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li>
						<a href="#" aria-label="Next">
					    	<span aria-hidden="true">&raquo;</span>
					    </a>
					</li>
				</ul>
			</nav>

					
		</div>
	</div>-->
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