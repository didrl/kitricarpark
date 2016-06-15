<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.carpark.member.model.*,com.carpark.util.*,com.carpark.common.model.*"%>
    
<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp" %> 
<%@include file="/common/side.jsp" %>
  
<%
if(memberDto != null) {
	List<CallDto> callReceiveList = (List<CallDto>)session.getAttribute("sendList");
	PageNavigator navigator = (PageNavigator) session.getAttribute("navigator");
%>
<div id="wrapper">
<!-- ****************************************************************************************************************** -->   

      <!-- main -->
      <div id="page-wrapper">
         <div class="container-fluid">
            <br><h3>제보 리스트</h3><br>
               
            <div class="btn-group" role="group" aria-label="...">
                 <button type="button" class="btn btn-default" onclick="javascript:memberCallSendList('1');">
                    보낸쪽지함
                 </button>   
               <button type="button" class="btn btn-default"  data-toggle="modal" data-target="#messageWrite" onclick="javascript:init();">
                      쪽지 보내기
                     </button>
            </div>
            
            <!-- 메세지 보내기 모달창 -->
            <%@ include file="/message/write.jsp" %>
            <%@ include file="/message/towrite.jsp" %>
               
            
            <!-- 메세지 리스트 -->
            <div class="table">
              <table class="table table-hover" style="text-align:center">
 					<tr style="background: #00cc00">
				  		<td width="150" style="background-color: #00cc00" align="center"><b style="color: #FFFFFF">보낸사람</b></td>
				  		<td style="background-color: #00cc00" align="center"><b style="color: #FFFFFF">제목</b></td>
				  		<td width="200" style="background-color: #00cc00" align="center"><b style="color: #FFFFFF">시간</b></td>
				  		<td width="50" style="background-color: #00cc00" align="center"><b style="color: #FFFFFF">확인</b></td>
				  		<td width="50" style="background-color: #00cc00" align="center"></td>
				  	</tr>
            
<%

int size = callReceiveList.size();
if(size > 0) {
int idcount=0;
   for(CallDto callDto : callReceiveList) {
	   idcount++;
%>
	

               <!-- 쪽지목록 -->
               <tr > 
                  <td width="150"><a href="javascript:memberCallSendView('<%=callDto.getSeq()%>');"><%=callDto.getUserID()%></a></td>
                  <td><a href="javascript:memberCallSendView('<%=callDto.getSeq() %>');"><%=callDto.getSubject() %></a></td>
                  <td width="80"><%=callDto.getLogtime() %></td>  
 
 
 
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
                  <td width="50">X</td>
                  <td width="50">
                  <button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#callModify<%=idcount%>">변경</button>
                  <button type="button" class="btn btn-default btn-xs" onclick="javascript:memberCallDelete('<%=callDto.getSeq()%>');">삭제</button>
                  </td>
                  
                                  
                  
<%
} else {
%>
                  <td width="50">O</td>
                  <td width="50">
                  <button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#callModify<%=idcount%>">변경</button>
                  <button type="button" class="btn btn-default btn-xs" onclick="javascript:memberCallDelete('<%=callDto.getSeq()%>');">삭제</button>
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


         <!-- 페이지 네비게이션/검색
         <nav align="center">
            <div class="form-group">
            <form class="form-inline" name="searchForm" method="get" action="">
               <input type="hidden" name="act" id="act" value="messageSearchReceive">
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
            <=navigator.getNavigator() %>
            </ul>
                  
         </nav> -->
          
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