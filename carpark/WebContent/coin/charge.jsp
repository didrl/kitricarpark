<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, com.carpark.member.model.MessageDto"
    %>
    
<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp"%>
<%@include file="/common/side.jsp" %>

<%
String paypal_business = "parkingc16+admin@gmail.com";
String paypal_cmd = "_xclick";
String success_url = "http://192.168.12.108/carpark/coin/complete.jsp";
String cancel_url = "http://192.168.12.108/carpark/coin/complete.jsp";
//sandbox.paypal.com/ IPN setting 으로 대체 
//String notify_url = "http://192.168.0.3:8080/carpark/coin/complete.jsp";
String paypal_currencyType = "USD";
double paypal_amount = 0;
String paypal_itemName = "코인충전";
String paypal_itemNumber = "";


if(memberDto != null) {
CoinDto coindto = (CoinDto) request.getAttribute("coinChargeInfo");
paypal_amount = coindto.getCoin()/10;
%>
<script type="text/javascript">
        function init_orderid()
        {
            var frm = document.paypal_form;
            var url = "https://www.sandbox.paypal.com/cgi-bin/webscr";
            frm.action = url;
            frm.submit();
        }
</script>


<div id="wrapper">

<!-- ****************************************************************************************************************** -->	
       
        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							코인 충전
						</h1>

					</div>
				</div>


				<div class="row">
					<div class="col-lg-12">
							<!-- p1: my coin -->
							<div class="form-group">

								<div class="col-lg-4">
									<label><%=memberDto.getUser_id()%>님의 코인</label>
								</div>
								<div class="col-lg-6">
									<p class="breadcrumb">보유한 코인</p>
									<p class="form-control-static"><%=memberDto.getCoin()%> 코인</p>
									<p class="help-block">코인 사용 안내</p>
								</div>
							</div>
							<!-- p1: my coin end-->
							<div class="form-group">
							<div class="col-lg-4">
									<label>충전할 코인</label>
								</div>
								<div class="col-lg-6">
									<p class="breadcrumb">충전내역 확인</p>
								
								
									<div id="order_container">
								        <form class="form-horizontal" method="post" action="https://www.sandbox.paypal.com/cgi-bin/webscr">
								        	<input type="hidden" name="charset" value="UTF-8" size="50" />
								        	<input type="hidden" name="cmd" value=<%=paypal_cmd%> size="50" />
								        	<input type="hidden" name="business" value=<%=paypal_business%> size="50" />
								            <input type="hidden" name="return" value=<%=success_url%> size="50" />
								            <input type="hidden" name="cancel_return" value=<%=cancel_url%> size="50" />         
								            <input type="hidden" name="currency_type" value=<%=paypal_currencyType%> size="50" />
								            <input type="hidden" name="amount" value=<%=paypal_amount%> size="50" />
								            <input type="hidden" name="item_name" value=<%=paypal_itemName%> size="50" />
								            <center>결 제 금 액 : USD <%=paypal_amount%></center>
								            <br>
								            <center>상 품 내 역 : <%=paypal_itemName%></center>
								            <br>
								            <center><input class="btn btn-default" type="submit" value="충전하기" size="50" /></center>
								        </form>
								    </div>
								   </div>
							    
							 </div>
							
				</div>
			</div>
		</div>
	</div>
</div>

  <!-- Footer -->
  <%@include file="/common/footer.jsp" %>
  <!-- /Footer -->

<%
}else{
%>
<script type="text/javascript">
alert("잘못된 접근입니다. 다시 시도해주세요.");
document.location.href = "<%=root%>/index.jsp";
</script>
<%
} 
%>