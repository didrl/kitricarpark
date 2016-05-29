<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String root = request.getContextPath();

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

function selectAddress(z1, z2, address){
	opener.document.joinform.zip1.value = z1;//opener.document.getElementById("zip1").value = z1;
	opener.document.joinform.zip2.value = z2;//opener 열어준 창
	opener.document.joinform.addr1.value = address;
	
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
			<td align="center">주소를 입력해 주세요</td>
		</tr>
		<tr>
			<td><input type="text" class="form-control" name="parkAddress"></td>
		</tr>
		<tr>
			<td align="center">
		  		<button type="button" class="btn btn-default btn-lg" onclick="javascript:parkSearch();">검색</button>
		  		<button type="reset" class="btn btn-default btn-lg">취소</button>
			</td>
		</tr>
	</table>    
</form>

</div>
</div>
</body>
</html>