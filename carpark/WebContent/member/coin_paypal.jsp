<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="order_container">
        <form method="post" action="https://www.sandbox.paypal.com/cgi-bin/webscr">
            <input type="hidden" name="cmd" value="_xclick" size="50" /><br />
            <input type="hidden" name="business" value="parkingc16+admin@gmail.com" size="50" /><br />
            금액 : <input type="index" name="amount" value="10" size="50" /><br />
            상품이름 : <input type="index" name="item_name" value="toy" size="50" /><br />
            <input type="hidden" name="return" value="http://192.168.0.3:8080/carpark/coin/complete.jsp" size="50" /><br />
            <input type="hidden" name="notify_url" value="http://192.168.0.3:8080/carpark/coin/complete.jsp" size="50" /><br />
            <input type="hidden" name="cancel_return" value="http://192.168.0.3:8080/carpark/coin/complete.jsp" size="50" /><br />
            <input type="hidden" name="charset" value="UTF-8" size="50" /><br />
            <input type="index" name="currency_type" value="USD" size="50" /><br />
            <input type="submit" value="충전하기" size="50" />
        </form>
    </div>

</body>
</html>