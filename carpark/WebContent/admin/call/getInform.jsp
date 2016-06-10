<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp"%>
<%@ include file="/admin/common/sidebar.jsp" %>
<%
if(memberDto!=null){
List<CallDto> callList = (List<CallDto>)request.getAttribute("receiveList");
%>

<div id="wrapper">
<!-- ****************************************************************************************************************** -->	
 
		<!-- main -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<br><h3>방문 예정 리스트</h3><br>
					
				<div class="btn-group" role="group" aria-label="...">
	  				<button type="button" class="btn btn-default">
	  					받은제보함
	  				</button>
	  				<!--  <button type="button" class="btn btn-default" onclick="javascript:adminMessageSendList();">
	  					보낸제보함
	  				</button>	
					<button type="button" class="btn btn-default"  data-toggle="modal" data-target="#messageWrite" onclick="javascript:init();">
                		쪽지보내기
               		</button>-->
				</div>
				
				<!-- 메세지 보내기 모달창 -->
				<%@ include file="/message/write.jsp" %>
				<%@ include file="/message/towrite.jsp" %>
					
				
				<!-- 메세지 리스트 -->
				<div class="table">
				  <table class="table table-hover" style="text-align:center">
				  	<tr>
				  		<td width="200" style="background: #00cc00" align="center"><b style="color: #FFFFFF;">보낸사람</b></td>
				  		<td style="background: #00cc00" align="center"><b style="color: #FFFFFF;">제목</b></td>
				  		<td style="background: #00cc00" align="center"><b style="color: #FFFFFF;">시간</b></td>
				  		<td width="100" style="background: #00cc00" align="center"><b style="color: #FFFFFF;">방문예정</b></td>
				  		<td style="background: #00cc00" align="center"></td>
				  	</tr>
				
<%
int size = callList.size();
int idcount=0;	
if(size > 0) {
	for(CallDto callDto : callList) {
		idcount++;
%>
					<!-- 쪽지목록 -->
					<tr >
						<td><a href="javascript:adminMessageReceiveView('<%=callDto.getSeq()%>');"><%=callDto.getUserID() %></a></td>
						<td><a href="javascript:adminMessageReceiveView('<%=callDto.getSeq()%>');"><%=callDto.getSubject() %></a></td>
						<td><%=callDto.getLogtime() %></td>	



<!-- callModify Modal Start -->
		<div class="modal fade" id="callModify<%=idcount%>" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" style="background: #00cc00" align="center">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="" id="messageToWriteModal" style="color: #FFFFFF;">제보하기</h4>
					</div>
					<div class="modal-body">

						<!-- main -->
						<div id="page-wrapper">
							<div class="container-fluid">

								<!-- 변경 -->
								<div class="form-group">
									<form class="form-horizontal" name="callModifyForm" method="post" action="<%=root%>/call">
										<input type="hidden" name="act" value="callViewModify">
										<input type="hidden" name="bcode" value="1"> 
										<input type="hidden" name="pg" value="1"> 
										<input type="hidden" name="key" value=""> 
										<input type="hidden" name="word" value="">
										<input type="hidden" name="seq" value="<%=callDto.getSeq()%>">
										

										<div class="form-group">
											<label for="receiver">받는사람</label> <input type="text"
												class="form-control" id="receiver" placeholder="받는사람"
												name="receiver" readonly="true" value="">
										</div>
										<div class="form-group">
											<label for="subject">제목</label> <input type="text"
												class="form-control" id="subject" placeholder="제목"
												name="subject"  value="<%=callDto.getSubject()%>">
										</div>
										<div class="form-group">
											<label for="content">내용</label>
											<textarea class="form-control" rows="10" id="content"
												name="content"><%=callDto.getContent() %></textarea>
										</div>

										<div class="form-group text-center">
											<input class="btn btn-default" type="submit" value="변경">
										</div>

									</form>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!-- callModify Modal End -->
                   



<%
if(callDto.getpCall_Ok() == 0) {
%>					
						<td>X</td>
						<td>
						<button type="button" class="btn btn-default btn-xs" onclick="javascript:adminCallReceiveDelete('<%=callDto.getSeq()%>');">삭제</button>
						</td>
					</tr>
<%
} else {
%>
						<td>O</td>
						<td>
						<button type="button" class="btn btn-default btn-xs" onclick="javascript:adminCallReceiveDelete('<%=callDto.getSeq()%>');">삭제</button>
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
}else{
%>
<center>
<h3>로그인 후 이용해주세요</h3>
</center>
<%
}
%>

<%@include file="/common/footer.jsp"%>