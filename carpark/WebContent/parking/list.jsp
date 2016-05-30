<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.carpark.common.model.*"%>
    
<%
String root = request.getContextPath();
List<ParkingDetailDto> list = (List<ParkingDetailDto>) request.getAttribute("parkList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</head>
<body>
<form name="memberParkingForm" method="get" action="">
	<input type="hidden" name="act">
	<input type="hidden" name="parkId">	
</form>
<%
if(list != null) {
	int size = list.size();
	if(size == 0) {		
%>
<center><h3>등록된 주차장이 없습니다</h3></center>

<%		
	} else {
		for(ParkingDetailDto parkingDetailDto : list) {
%>		
<center>
<table class="table">
	<tr>
		<td align="center"><a href="javascript:parkView(<%=parkingDetailDto.getParkId()%>);">
			<%=parkingDetailDto.getParkName() %> <%=parkingDetailDto.getParkAvgPoint() %> 
		</a></td>
		<td><input type="button" value="삭제" onclick="javascript:parkDelete('<%=parkingDetailDto.getParkId()%>');"></td>
	</tr>
</table>
</center>
<%		
		}
	}
}
%>

</body>
</html>