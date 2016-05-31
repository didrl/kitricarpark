<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.carpark.common.model.ParkingDetailDto"%>
    
<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp" %> 
<%@include file="/common/side.jsp" %>
  
    
<%
if(memberDto != null) {
   List<ParkingDetailDto> list = (List<ParkingDetailDto>) request.getAttribute("parkList");
%>

<script type="text/javascript">
function parkList() {
   document.memberParkingForm.act.value = "parkList";
   document.memberParkingForm.action = "/carpark/memberparking";
   document.memberParkingForm.submit();
   
}

function parkView(parkId) {
   document.memberParkingForm.act.value = "parkView";
   document.memberParkingForm.parkId.value = parkId;
   document.memberParkingForm.action = "/carpark/memberparking"
   document.memberParkingForm.submit();
   
}

function parkDelete(parkId) {
   document.memberParkingForm.act.value = "parkDelete";
   document.memberParkingForm.parkId.value = parkId;
   document.memberParkingForm.action = "/carpark/memberparking"
   document.memberParkingForm.submit();
   
}
</script>
<div id="wrapper" align="center">
<!-- ****************************************************************************************************************** -->   

      <!-- main -->
      <div id="page-wrapper">
         <div class="container-fluid">
         <br><h3>즐겨찾는 주차장</h3><br>   
               
            
            <!-- 메세지 리스트 -->
            <div class="table" style="width: 800px">
              <table  class="table table-hover" style="text-align:center">
                 <tr>
                    <td width="200"><b>주차장 이름</b></td>
                    <td width="200"><b>관리자 아이디</b></td>
                    <td width="100"></td>
                 </tr>
            
<%
   int size = list.size();
   if(size > 0) {
      for(ParkingDetailDto parkingDetailDto : list) {
%>
               <!-- 쪽지목록 -->
               <tr >
                  <td><label onclick="javascript:parkingView('<%=parkingDetailDto.getParkId()%>');">
                  <%=parkingDetailDto.getParkName() %></label></td>
                  <td><label onclick="javascript:parkingView('<%=parkingDetailDto.getParkId()%>');">
                  <%=parkingDetailDto.getParkAvgPoint() %></label></td>
                  <td><input type="button" value="삭제" onclick="javascript:parkDelete('<%=parkingDetailDto.getParkId()%>');"></td>                  
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
            <form class="form-inline" name="searchForm" method="get" action="">
               <input type="hidden" name="act" id="act" value="messageSearch">
               <input type="hidden" name="bcode" id="bcode" value="1">
               <input type="hidden" name="pg" id="pg" value="1">
               <select name="key">
                  <option value="subject">주차장 이름</option>
                  <option value="content">관리자 이름</option>
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