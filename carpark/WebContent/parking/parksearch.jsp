<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.carpark.common.model.*,com.carpark.util.*"%>
<%
String root = request.getContextPath();
int pg = NumberCheck.nullToOne(request.getParameter("pg"));
String address = StringCheck.nullToBlank((String) session.getAttribute("address"));
List<ZipDto> list = (List<ZipDto>) request.getAttribute("addressList");
PageNavigator navigator = (PageNavigator) request.getAttribute("navigator");
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
    <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=c2d873676f2c4854b2b2c62e165a629d&libraries=services"></script>
    <script type="text/javascript" src="<%=root %>/parking/parking.js"></script>
</head>
<body>
<!-- main -->
<div id="page-wrapper">
	<div class="container-fluid">

	<form name="parkSearchForm" method="get" action="">
		<input type="hidden" name="act" value="parkingSearch">
		<input type="hidden" name="pg" value="">
										
		<table class="table">
										
		<tr>
			<td align="center" colspan="3">동을 입력해 주세요</td>
		</tr>
		
		<tr>
			<td>
				<input type="text" class="form-control" name="parkAddress" value="<%=address%>">				
			</td>
			<td width="60">
				<button type="button" class="btn btn-default btn-group-xs" onclick="javascript:searchAddress('1');">검색</button>
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
			<td colspan="3">
				검색 결과가 없습니다
			</td>		
		</tr>
								
<%
} else {
	for(ZipDto zipDto : list) {
%>
								
		<tr>
			<td align="center" colspan="3">
				<a href="javascript:selectAddress('<%=zipDto.getSido() %> <%=zipDto.getGugun() %> <%=zipDto.getDong() %>');">
					<%=zipDto.getZip1() %> - <%=zipDto.getZip2() %> 
					<%=zipDto.getSido() %> <%=zipDto.getGugun() %> <%=zipDto.getDong() %> 
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
