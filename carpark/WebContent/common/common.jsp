<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.carpark.member.model.*, com.carpark.admin.model.*,
com.carpark.util.*,java.util.*,com.carpark.common.model.*"%>
<%
String root = request.getContextPath();
String commonpath = root + "/common";
String headerpath = commonpath+ "/header";
String adminpath = root + "/admin";
String customerpath = adminpath +"/"+"customer";
String parkingpath = adminpath +"/"+"parking";
String qnapath = adminpath +"/"+"qna";
String staticpath = adminpath +"/"+"static";
MemberDto memberDto = (MemberDto)session.getAttribute("memberInfo"); 
int bcode = NumberCheck.nullToZero(request.getParameter("bcode"));
String visit = StringCheck.nullToBlank(request.getParameter("visit"));
int pg = NumberCheck.nullToOne(request.getParameter("pg"));
String key = StringCheck.nullToBlank(request.getParameter("key"));
String word = StringCheck.nullToBlank(request.getParameter("word"));
String flag = request.getParameter("flag");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="admin_160518">
    <meta name="author" content="SiYoungOh">
 
    <link href="<%=root %>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=root %>/css/sb-admin.css" rel="stylesheet">
    <link href="<%=root %>/css/stylish-portfolio.css" rel="stylesheet">
    <link href="<%=root %>/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="<%=root %>/css/custom_kitri.css" rel="stylesheet">
	
	<link rel="stylesheet" href="/carpark/css/normalize.css">
	<link rel="stylesheet" href="/carpark/css/style.css">
	<!-- login -->
	<script type="text/javascript">
	var root = "<%=root%>";
	</script>
	<script type="text/javascript" src="<%=root%>/js/member/login.js"></script>
	<script type="text/javascript" src="<%=root%>/admin/js/adminCall.js"></script>
	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
</head>
<body onunload="javascript:closeWin();">
    <!-- jQuery -->
    <script src="<%=root %>/js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<%=root %>/js/bootstrap.min.js"></script>
    <!-- Morris Charts JavaScript -->
    <script src="<%=root %>/js/plugins/morris/raphael.min.js"></script>
    <script src="<%=root %>/js/plugins/morris/morris.min.js"></script>
    <script src="<%=root %>/js/plugins/morris/morris-data.js"></script>
   <!-- bootbox(modal) JavaScript -->
   <script src="<%=root %>/js/bootbox.min.js"></script>
   <!-- Fuel UX CDN -->
   <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//www.fuelcdn.com/fuelux/3.13.0/css/fuelux.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="//www.fuelcdn.com/fuelux/3.13.0/js/fuelux.min.js"></script>
    
    <!-- message.js -->
    <script type="text/javascript" src="<%=root %>/message/message.js"></script>
    
    <!-- report.js -->
    <script type="text/javascript" src="<%=root %>/report/report.js"></script>
    <script type="text/javascript" src="<%=root %>/admin/report/adminreport.js"></script>

    <!-- parking.js -->
    <script type="text/javascript" src="<%=root %>/parking/parking.js"></script> 
    <script type="text/javascript" src="<%=root %>/admin/parking/adminparking.js"></script> 
    
    <!-- admincall.js -->
    <script type="text/javascript" src="<%=root %>/message/message.js"></script>
  
    <!-- kakao.js -->
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>  
    
<script type="text/javascript">
Kakao.init('fc8d34750e811639ad119ce8c9daeee1');
function loginWithKakao() {
  // 로그인 창을 띄웁니다.
  $("#custom-login-btn").remove();
  Kakao.Auth.login({
  	persistAccessToken: false,
	persistRefreshToken: true,
    success: function(authObj) {
		logincarpark();
    	Kakao.Auth.cleanup();
  		Kakao.Auth.logout();
    },
    fail: function(err) {
      alert(JSON.stringify(err));
    }
  });
  
  function logincarpark(){
  	Kakao.API.request({
			url: '/v1/user/me',
			success: function(res) {
				document.location.href="<%=root%>/member?act=mvlogin&loginkey="+
				res.id+"&name="+ encodeURI(res.properties.nickname);
			
			},
			fail: function(error) {
				console.log(error);
			}
		});
   }
  
};

</script>
    
    <form name="common" method="get" action="">
	<input type="hidden" name="act" id="act" value="">
	<input type="hidden" name="bcode" id="bcode" value="<%=bcode%>">
	<input type="hidden" name="pg" id="pg" value="<%=pg%>">
	<input type="hidden" name="key" id="key" value="<%=key%>">
	<input type="hidden" name="word" id="word" value="<%=word%>">
	<input type="hidden" name="seq" id="seq" value="">
	<input type="hidden" name="parkId" id="parkId" value="">
	<input type="hidden" name="flag" id="flag" value="<%=flag%>">
	<input type="hidden" name="visit" id="visit" value="<%=visit%>">
	</form>
	
    