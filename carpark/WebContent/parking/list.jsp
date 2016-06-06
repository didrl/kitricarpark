<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.carpark.common.model.ParkingDetailDto"%>
    
<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp" %> 
<%@include file="/common/side.jsp" %>
  
    
<%
if(memberDto != null) {
   List<ParkingDetailDto> list = (List<ParkingDetailDto>) request.getAttribute("parkingList");
%>
<div id="wrapper" align="center">
<!-- ****************************************************************************************************************** -->   

      <!-- main -->
      <div id="page-wrapper">
         <div class="container-fluid">
         <br><h3>나의 주차장</h3><br>   
               
            
            <div class="table" style="width: 800px">
              <table  class="table table-hover" style="text-align:center">
                 <tr>
                    <td>주차장 이름</td>
                    <td width="50">평점</td>
                    <td width="80">사용가능</td>
                    <td width="90"></td>
                    <td width="60"></td>
                    <td width="60"></td>
                 </tr>
            
<%
   int size = list.size();
   if(size > 0) {
      for(ParkingDetailDto parkingDetailDto : list) {
%>
				<tr>
                  <td>
                  	<a href="javascript:parkingView('<%=parkingDetailDto.getPark_id()%>');">
                  		<%=parkingDetailDto.getPark_name() %>
                  	</a>
                  </td>
                  <td>
	                 	<%=parkingDetailDto.getPark_avgPoint() %>
                  </td>
<%
		if(parkingDetailDto.getPark_flag() == 0) {
%>
                  <td> O </td>
<%
		} else {
%>
				  <td> X </td>
<%
		}
%>
                  <td>
                  	<button type="button" class="btn btn-default btn-group-xs" onclick="javascript:parkingView('<%=parkingDetailDto.getPark_id()%>');"> 상세보기 </button>
                  </td>
                  <td>                  
                  	<button type="button" class="btn btn-default btn-group-xs" onclick="javascript:parkingMvModify('<%=parkingDetailDto.getPark_id()%>');"> 수정 </button>
                  </td>
                  <td>	
                  	<button type="button" class="btn btn-default btn-group-xs" onclick="javascript:parkingDelete('<%=parkingDetailDto.getPark_id()%>');"> 삭제 </button>
				  </td>
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
<center><h3>등록된 주차장이 없습니다</h3></center>   
<br><br>  
<%
   }
%>


         <!-- 페이지 네비게이션/검색 -->
         <nav align="center">
            <div class="form-group">
            <form class="form-inline" name="parkingSearchForm" method="get" action="">
               <input type="hidden" name="act" id="act" value="messageSearch">
               <input type="hidden" name="bcode" id="bcode" value="1">
               <input type="hidden" name="pg" id="pg" value="1">
               <select name="key">
                  <option value="subject">주차장</option>
                  <option value="content">내용</option>
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
} else {
%>
<center><h3>로그인 후 이용해주세요</h3></center>
<%
}
%>

<%@include file="/common/footer.jsp"%>