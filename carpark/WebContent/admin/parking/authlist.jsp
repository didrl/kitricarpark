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
<div id="wrapper">
<!-- ****************************************************************************************************************** -->   

      <!-- main -->
      <div id="page-wrapper">
         <div class="container-fluid">
        <center><br><h3>인증예정목록</h3><br></center>   
              
            <div class="table" style="width: 800px">
              <table  class="table table-hover">
                 <tr>
                    <td width="120">주차장 아이디</td>
                    <td>주차장 이름</td>
                    <td width="100">소유주</td>
                    <td width="50">구분</td>
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
	                 	<%=parkingDetailDto.getPark_id() %>
                  </td>
                  <td>
                  	<a href="javascript:adminParkingView('<%=parkingDetailDto.getPark_id()%>');">
                  		<%=parkingDetailDto.getPark_name() %>
                  	</a>
                  </td>
                  <td>
	                 	<%=parkingDetailDto.getOwner_id() %>
                  </td>

<%
				if(parkingDetailDto.getPark_public() == 0) {
%>
                  <td> 공용 </td>
<%
				} else {
%>
				  <td> 사설 </td>
<%
				}
%>	

<%
				if(parkingDetailDto.getPark_flag() == 0) {
%>
                  <td> X </td>
<%
				} else {
%>
				  <td> O </td>
<%
				}
%>		
                  <td>
                  	<button type="button" class="btn btn-default btn-xs" onclick="javascript:adminParkingView('<%=parkingDetailDto.getPark_id()%>');"> 상세보기 </button>
                  	<button type="button" class="btn btn-default btn-xs" onclick="javascript:adminParkingAuth('<%=parkingDetailDto.getPark_id()%>');"> 인증 </button>
                  	<button type="button" class="btn btn-default btn-xs" onclick="javascript:adminParkingDelete('<%=parkingDetailDto.getPark_id()%>');"> 삭제 </button>
				  </td>
<%
      }
%>
               </tr>
              </table>
            </div>
            
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