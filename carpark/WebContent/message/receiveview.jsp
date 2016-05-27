<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.carpark.member.model.*"%>  
<%
String root = request.getContextPath();
MessageDto messageDto = (MessageDto) request.getAttribute("messageView");
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
    <script type="text/javascript" src="<%=root %>/message/message.js"></script>
</head>
<body>
    <form name="common" method="get" action="">
	<input type="hidden" name="act" id="act" value="">
	<input type="hidden" name="bcode" id="bcode" value="2">
	<input type="hidden" name="pg" id="pg" value="1">
	<input type="hidden" name="key" id="key" value="">
	<input type="hidden" name="word" id="word" value="">
	<input type="hidden" name="seq" id="seq" value="">
</form>
<br>
<div id="page-wrapper">
<div class="container-fluid">
	<p>
	<input type="button" class="btn btn-default" value="답장" data-toggle="modal" data-target="#messageReply">
	<input type="button" class="btn btn-default" value="삭제" onclick="javascript:messageDelete('<%=messageDto.getSeq()%>');">
	</p>

	<table class="table">
		<tr>
			<td width="80">보낸사람</td>
			<td><%=messageDto.getUserID() %></td>
			<td width="50">시간</td>
			<td width="80"><%=messageDto.getLogtime() %></td>
			</tr>
			<tr>
			<td width="80">제목</td>
			<td colspan="3"><%=messageDto.getSubject() %></td>
			</tr>
			<tr>
			<td width="80">내용</td>
			<td colspan="3" height="350"><p><%=messageDto.getContent() %></p></td>
			</tr>
		<tr>
			<td colspan="4" align="center">
			<p>
			<input type="button" class="btn btn-default" value="닫기" onclick="javascript:messageViewClose();">
			</p>
			</td>
		</tr>
	</table>
	  
	<!-- include reply.jsp, 실패:데이터 못가져감 -->
	    <!-- Msg Modal Start -->
		<div class="modal fade" id="messageReply" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="" id="messageReplyModal">쪽지 보내기</h4>
					</div>
					<div class="modal-body">

						<!-- main -->
						<div id="page-wrapper">
							<div class="container-fluid">

								<!-- 쪽지보내기 -->
								<div class="form-group">
									<form class="form-horizontal" name="writeForm" method="post" action="">
										<input type="hidden" name="act" value="messageWrite">
										<input type="hidden" name="bcode" value="2"> 
										<input type="hidden" name="pg" value="1"> 
										<input type="hidden" name="key" value=""> 
										<input type="hidden" name="word" value="">

										<div class="form-group">
											<label for="receiver">받는사람</label> <input type="text"
												class="form-control" id="receiver" placeholder="받는사람"
												name="receiver" value="<%=messageDto.getUserID() %>" readonly="true">
										</div>
										<div class="form-group">
											<label for="subject">제목</label> <input type="text"
												class="form-control" id="subject" placeholder="제목"
												name="subject">
										</div>
										<div class="form-group">
											<label for="content">내용</label>
											<textarea class="form-control" rows="10" id="content"
												name="content"></textarea>
										</div>

										<div class="form-group text-center">
											<input class="btn btn-default" type="button" value="보내기"
												onclick="javascript:messageWrite();">
										</div>

									</form>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!-- Msg Modal End -->
	
</div>
</div>
</body>
</html>

	