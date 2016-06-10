<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

/* session.setAttribute("reservationDto", reservationDto);
session.setAttribute("carinfo", carinfo);
session.setAttribute("availabledate", availabledate);
session.setAttribute("parkingDetailDto", parkingDetailDto);
 */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script async="async" src="https://www.paypalobjects.com/js/external/paypal-button.min.js?merchant=parkingc16+admin@gmail.com" 
    data-button="buynow" 
    data-name="1" 
    data-quantity="1" 
    data-amount="1" 
    data-currency="USD" 
    data-shipping="0" 
    data-tax="0" 
    data-callback="http://192.168.12.108/carpark/coin/complete.jsp" 
    data-env="sandbox"
></script>

</body>
</html>