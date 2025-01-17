<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.carpark.common.model.*,com.carpark.util.*"%>
<%
String root = request.getContextPath();
int pg = NumberCheck.nullToOne(request.getParameter("pg"));
String address = StringCheck.nullToBlank((String) session.getAttribute("address"));
List<ZipDto> list = (List<ZipDto>) request.getAttribute("addressList");
PageNavigator navigator = (PageNavigator) request.getAttribute("navigator");
%>
	<script type="text/javascript">
	var root = "<%=root%>";
	</script>
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
    <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=4763b9e0f6cbc4102f42cb9f7b0f9167&libraries=services"></script>
    <script type="text/javascript" src="<%=root %>/admin/parking/adminparking.js"></script>
</head>
<body>
<!-- main -->
<div id="page-wrapper">
	<div class="container-fluid">

	<form name="adminParkSearchForm" method="get" action="">
		<input type="hidden" name="act" value="adminParkingSearch">
		<input type="hidden" name="pg" value="">
										
		<table class="table">
										
		<tr>
			<td align="center" colspan="2">동을 입력해 주세요</td>
		</tr>
		
		<tr>
			<td>
				<input type="text" class="form-control" name="parkAddress" value="<%=address%>">				
			</td>
<%
session.removeAttribute("address");
%>
			<td width="60">
				<button type="button" class="btn btn-default btn-group-xs" onclick="javascript:adminSearchAddress('1');">검색</button>
			</td>
			<td width="60">
				<button type="button" class="btn btn-default btn-group-xs" onclick="javascript:windowClose();">사용</button>
			</td>
		</tr>
										
<%
if(list != null) {
	int size = list.size();
	if(size == 0) {
%>
								
		<tr>
			<td colspan="2">
				검색 결과가 없습니다
			</td>		
		</tr>
								
<%
} else {
	for(ZipDto zipDto : list) {
%>
								
		<tr>
			<td align="center" colspan="2">
				<a href="javascript:adminSelectAddress('<%=zipDto.getSido() %> <%=zipDto.getGugun() %> <%=zipDto.getStreet() %>');">
					<%=zipDto.getSido() %> <%=zipDto.getGugun() %> <%=zipDto.getStreet() %>
				</a>
			</td>
		</tr>
								
<%		
		}
	}
}
%>
<%
if(navigator != null) {
%>
		<tr>
		<td align="center" colspan="3">
			<nav align="center">
				<ul class="pagination">
				<%=navigator.getNavigator() %>
				</ul>
						
			</nav>
			</td>
        </tr>
<%
}
%>
		<tr>
			<td align="center" colspan="3">
				
				<button type="button" class="btn btn-default btn-group-xs" onclick="javascript:windowClose();">취소</button>
			</td>
		</tr>
		
	
		</table>    
	</form>
								
	</div>
</div>
</body>
</html>
