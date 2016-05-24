<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.carpark.member.model.*"%>
    
<%@include file="/common/common.jsp" %>
<%@include file="/common/header.jsp" %> 
<%@include file="/common/side.jsp" %>
<script type="text/javascript" src="./message.js"></script>  
    
<%
List<MessageDto> list = (List<MessageDto>) request.getAttribute("messageList");
%>

<div id="wrapper">
<!-- ****************************************************************************************************************** -->	

<form name="common" method="get" action="">
	<input type="hidden" name="act" id="act" value="">
	<input type="hidden" name="bcode" id="bcode" value="1">
	<input type="hidden" name="pg" id="pg" value="1">
	<input type="hidden" name="key" id="key" value="">
	<input type="hidden" name="word" id="word" value="">
	<input type="hidden" name="seq" id="seq" value="">
</form>



			<!-- main -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- 받은쪽지함 -->
				<h3>받은 쪽지함</h3><br>
				
				<div class="form-group">
				<form name="searchForm" method="get" action="">
				<input type="hidden" name="act" id="act" value="messageSearch">
				<input type="hidden" name="bcode" id="bcode" value="1">
				<input type="hidden" name="pg" id="pg" value="1">
					<select name="key">
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="user_id">작성자</option>
					</select>
					<input type="text" name="word" id="word" value="">
					<input type="button" value="검색" onclick="javascript:messageSearch();">
				</form>
				</div>
  				
				
				<div class="table-responsive">
				  <table class="table table-hover">
				  	<tr>
				  		<th width="100">보낸사람</th>
				  		<th>제목</th>
				  		<th width="100">보낸시간</th>
				  		<th width="50">확인</th>
				  	</tr>

				
<%
if(list != null) {
	for(MessageDto messageDto : list) {
%>
					<tr >
						<td width="100"><a href="javascript:messageView('<%=messageDto.getSeq() %>');"><%=messageDto.getReceiverId() %></a></td>
						<td><a href="javascript:messageView('<%=messageDto.getSeq() %>');"><%=messageDto.getSubject() %></a></td>
						<td width="100"><%=messageDto.getLogtime() %></td>						
						<td width="50"><%=(messageDto.getMsgFlag() == 0) ? "X" : "O" %></td>
					</tr>
<%
	}	
}
%>	
					<tr>
				  		<td width="100"><a href="javascript:messageView('10');">test</a></td>
				  		<td><a href="javascript:messageView('10');">test</a></td>
				  		<td width="100">test</td>
				  		<td width="50">test</td>
				  	</tr>
				  
				  </table>
				</div>
				
			<!-- 쪽지보내기 모달 -->	
			<div class="text-center">
				<button type="button" class="btn btn-default"  data-toggle="modal" data-target="#msgToHost">
                	쪽지보내기
               	</button>
			</div>

				
			 <!-- Msg Modal Start -->
             <div class="modal fade" id="msgToHost" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
             	<div class="modal-dialog">
                	<div class="modal-content">
                    	<div class="modal-header">
                        	<button type="button" class="close" data-dismiss="modal">
                            	<span aria-hidden="true">×</span><span class="sr-only">Close</span>
                            </button>
                            <h4 class="msgToHost" id="msgToHostModal">쪽지 보내기</h4>
                        </div>
                    <div class="modal-body">
                            
             <!-- main -->
			<div id="page-wrapper">
				<div class="container-fluid">
				
				<!-- 쪽지보내기 -->
				<div class="form-group">
					<form class="form-horizontal" name="writeForm" method="post" action="">
						<input type="hidden" name="act" value="messageWrite">
						<input type="hidden" name="bcode" value="1">
						<input type="hidden" name="pg" value="1">
						<input type="hidden" name="key" value="">
						<input type="hidden" name="word" value="">
			
				  		<div class="form-group">
				    		<label for="receiver">받는사람</label>
				    		<input type="text" class="form-control" id="receiver" placeholder="받는사람" name="name">
				  		</div>
						<div class="form-group">
							<label for="subject">제목</label>
						    <input type="text" class="form-control" id="subject" placeholder="제목" name="content">
						</div>
				  		<div class="form-group">
				    		<label for="content">내용</label>
				    		<textarea class="form-control" rows="10" id="content" name="content"></textarea>
				  		</div>
				  
				  		<div class="form-group text-center">
							<input class="btn btn-default" type="button" value="보내기" onclick="javascript:messageWrite();">
							<input class="btn btn-default" type="reset" value="취소">
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
	
			<!-- 쪽지보내기 모달 -->		
					
		</div>
	</div>
<!-- ****************************************************************************************************************** -->	
</div>

<%@include file="/common/footer.jsp"%>