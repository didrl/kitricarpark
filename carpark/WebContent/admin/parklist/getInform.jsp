<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp" %>
<%@ include file="/admin/common/header.jsp" %>
<%@ include file="/admin/common/sidebar.jsp" %>
<%

List<CallDto> callList = (List<CallDto>)request.getAttribute("receiveList");
%>
<div id="wrapper">
<!-- ****************************************************************************************************************** -->	
 
		<!-- main -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<br><h3>쪽지함</h3><br>
					
				<div class="btn-group" role="group" aria-label="...">
	  				<button type="button" class="btn btn-default" onclick="javascript:messageReceiveList();">
	  					받은쪽지함
	  				</button>
	  				<button type="button" class="btn btn-default" onclick="javascript:messageSendList();">
	  					보낸쪽지함
	  				</button>	
					<button type="button" class="btn btn-default"  data-toggle="modal" data-target="#messageWrite" onclick="javascript:init();">
                		쪽지보내기
               		</button>
				</div>
				
				<!-- 메세지 보내기 모달창 -->
				<%@ include file="/message/write.jsp" %>
				<%@ include file="/message/towrite.jsp" %>
					
				
				<!-- 메세지 리스트 -->
				<div class="table">
				  <table class="table table-hover" style="text-align:center">
				  	<tr>
				  		<td width="200"><b>보낸사람</b></td>
				  		<td><b>제목</b></td>
				  		<td><b>시간</b></td>
				  		<td width="50"><b>확인</b></td>
				  		<td></td>
				  	</tr>
				
<%
int size = callList.size();
	
if(size > 0) {
	for(CallDto callDto : callList) {
%>
					<!-- 쪽지목록 -->
					<tr >
						<td><a href="javascript:adminMessageReceiveView('<%=callDto.getSeq()%>');"><%=callDto.getUserID() %></a></td>
						<td><a href="javascript:adminMessageReceiveView('<%=callDto.getSeq() %>');"><%=callDto.getSubject() %></a></td>
						<td><%=callDto.getLogtime() %></td>	
<%
if(callDto.getpCall_Flag() == 0) {
%>					
						<td>X</td>
						<td>
						<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#messageToWrite" onclick="toWriteInit('<%=callDto.getUserID()%>');">답장</button>
						<button type="button" class="btn btn-default btn-xs" onclick="javascript:messageReceiveDelete('<%=callDto.getSeq()%>');">삭제</button>
						</td>
<%
} else {
%>
						<td>O</td>
						<td>
						<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#messageToWrite" onclick="javascript:toWriteInit('<%=callDto.getUserID()%>');">답장</button>
						<button type="button" class="btn btn-default btn-xs" onclick="javascript:messageReceiveDelete('<%=callDto.getSeq()%>');">삭제</button>
						</td>
					</tr>
<%
	}	
}
%>
				  </table>
				</div>

<%
} else {
%>
				  </table>
				</div>
<center><h3>메세지가 없습니다</h3></center>	
<br><br>  
<%
}
%>


			<!-- 페이지 네비게이션/검색 -->
			<nav align="center">
				<div class="form-group">
				<form class="form-inline" name="searchForm" method="get" action="">
					<input type="hidden" name="act" id="act" value="messageSearch">
					<input type="hidden" name="bcode" id="bcode" value="1">
					<input type="hidden" name="pg" id="pg" value="1">
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
	</div>
<!-- ****************************************************************************************************************** -->	
</div>
<%

%>
<center>
<h3>로그인 후 이용해주세요</h3>
</center>
<%

%>

<%@include file="/common/footer.jsp"%>