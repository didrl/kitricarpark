<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.carpark.common.model.ParkingDetailDto"%>
    
<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp" %> 
<%@include file="/admin/common/sidebar.jsp" %>
  
    
<%
if(memberDto != null) {
   List<ParkingDetailDto> list = (List<ParkingDetailDto>) request.getAttribute("parkingList");
   PageNavigator navigator = (PageNavigator) request.getAttribute("navigator");
%>
<div id="wrapper" align="center">
<!-- ****************************************************************************************************************** -->   

      <!-- main -->
      <div id="page-wrapper">
         <div class="container-fluid">
         <br><h3>주차장 관리</h3><br>   
              
            <div class="table" style="width: 800px">
              <table  class="table table-hover" style="text-align:center">
                 <tr>
                    <td>주차장 이름</td>
                    <td width="50">평점</td>
                    <td width="80">사용가능</td>
                    <td width="150"></td>
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
                  	<button type="button" class="btn btn-default btn-xs" onclick="javascript:adminParkingView('<%=parkingDetailDto.getPark_id()%>');"> 상세보기 </button>
                  	<button type="button" class="btn btn-default btn-xs" onclick="javascript:adminParkingMvModify('<%=parkingDetailDto.getPark_id()%>');"> 수정 </button>
                  	<button type="button" class="btn btn-default btn-xs" onclick="javascript:adminParkingDelete('<%=parkingDetailDto.getPark_id()%>');"> 삭제 </button>
				  </td>
<%
      }
%>
               </tr>
              </table>
            </div>
            
            <a class="btn btn-default" href="<%=root %>/parking/register.jsp"> 등록 </a>
            
            <nav align="center">
				<ul class="pagination">
				<%=navigator.getNavigator() %>
				</ul>
						
			</nav>
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