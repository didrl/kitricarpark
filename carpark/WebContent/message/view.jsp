<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.carpark.member.model.*"%>
<%
MessageDto messageDto = (MessageDto) request.getAttribute("messageView");
%>

    <!-- 쪽지보기모달 -->
	<div class="modal fade" id="sendMessage" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="sendMessage" id="msgToHostModal">쪽지 보내기</h4>
				</div>
				<div class="modal-body">

				<!-- main -->
				<div id="page-wrapper">
					<div class="container-fluid">

						<!-- 쪽지내용 -->
						<div class="table-responsive">
				  			<table class="table" border="1">
							  <tr>
							  	<td width="100">보낸사람</td>
							  	<td><%=messageDto.getUserID() %></td>
							  	<td width="100">보낸시간</td>
							  	<td width="100"><%=messageDto.getLogtime() %></td>
							  </tr>
							  <tr>
							  	<td width="100">제목</td>
							  	<td colspan="3"><%=messageDto.getSubject() %></td>
							  </tr>
							  <tr>
							  	<td width="100">내용</td>
							  	<td colspan="3"><p><%=messageDto.getContent() %></p></td>
							  </tr>
							</table>
						</div>
						<input type="button" value="삭제" onclick="javascript:messageDelete('<%=messageDto.getSeq()%>');">
	
					</div>
				</div>

				</div>
			</div>
		</div>
	</div>
	<!-- Msg Modal End -->

			
				
