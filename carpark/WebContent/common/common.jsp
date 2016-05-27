<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.carpark.member.model.MemberDto, com.carpark.admin.model.*"%>
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
	<!-- login -->
	<script type="text/javascript">
	var root = "<%=root%>";
	</script>
	<script type="text/javascript" src="<%=root%>/js/member/login.js"></script>
	
	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
</head>
<body>
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
    
    <form name="common" method="get" action="">
	<input type="hidden" name="act" id="act" value="">
	<input type="hidden" name="bcode" id="bcode" value="2">
	<input type="hidden" name="pg" id="pg" value="1">
	<input type="hidden" name="key" id="key" value="">
	<input type="hidden" name="word" id="word" value="">
	<input type="hidden" name="seq" id="seq" value="">
	</form>
   