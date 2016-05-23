<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.carpark.util.*, com.carpark.member.model.*"%>
<%
String root = request.getContextPath();

int bcode = NumberCheck.nullToZero(request.getParameter("bcode"));//유효성 체크 및 문자열 숫자로 변환
int pg = NumberCheck.nullToOne(request.getParameter("pg"));
String key = StringCheck.nullToBlank(request.getParameter("key"));
String word = Encoder.isoToUtf(StringCheck.nullToBlank(request.getParameter("word")));

MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="ko">
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
var root = "<%=root%>";
var control = "";
<%@include file="/message/message.js"%>
</script>