<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.carpark.common.model.*,java.util.*"%>
<%
String root = request.getContextPath();
List<CitiesDto> list = (List<CitiesDto>) request.getAttribute("addressList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link href="<%=root %>/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=root %>/css/stylish-portfolio.css" rel="stylesheet">
	<!-- jQuery -->
    <script src="<%=root %>/js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<%=root %>/js/bootstrap.min.js"></script>
    <!-- message.js -->
    <script type="text/javascript" src="<%=root %>/message/message.js"></script>
<script type="text/javascript">
function parkSearch(){
	if(document.parkSearchForm.parkAddress.value == "") {
		alert("주소를 입력하세요");
		return;
	} else {
		document.parkSearchForm.action = "<%=root%>/memberparking";
		document.parkSearchForm.submit();
	}
}

function selectAddress(parkAddress, emdCode , lat, lng){	
	opener.document.parkRegisterForm.parkAddress.value = parkAddress;
	opener.document.parkRegisterForm.emdCode.value = emdCode;	
	opener.document.parkRegisterForm.latitude.value = lat;
	opener.document.parkRegisterForm.longtitude.value = lng;
	
	self.close();

}

function windowClose() {
	window.close();
}
</script>
</head>
<body>

<div id="page-wrapper">
<div class="container-fluid">



<form name="parkSearchForm" method="get" action="">
	<input type="hidden" name="act" value="parkSearch">

	<table class="table">
	
		<tr>
			<td align="center">동을 입력해 주세요</td>
		</tr>
		<tr>
			<td><input type="text" class="form-control" name="parkAddress"></td>
		</tr>
		
<%
if(list != null) {
	int size = list.size();
	if(size == 0) {
%>

		<tr>
			<td>
				검색 결과가 없습니다
			</td>		
		</tr>

<%
	} else {
		for(CitiesDto citiesDto : list) {
%>

	<tr>
		<td align="center">
			<a href="javascript:selectAddress('<%=citiesDto.getSsgName()%> <%=citiesDto.getEmdName()%>', '<%=citiesDto.getEmdCode() %>', '<%=citiesDto.getLat()%>', '<%=citiesDto.getLng()%>')">
				<%=citiesDto.getSsgName()%> <%=citiesDto.getEmdName()%>
			</a>
		</td>
	</tr>

<%		
		}
	}
}
%>
		
		<tr>
			<td align="center">
		  		<button type="button" class="btn btn-default btn-lg" onclick="javascript:parkSearch();">검색</button>
		  		<button type="button" class="btn btn-default btn-lg" onclick="javascript:windowClose();">취소</button>
			</td>
		</tr>
		
	
	</table>    
</form>

</div>
</div>
</body>
</html>