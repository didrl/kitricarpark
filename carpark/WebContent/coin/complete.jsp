<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp"%>
<%@include file="/common/side.jsp" %>

<script type="text/javascript">
	function chargeComplete(){
	//DB 업데이트 
		document.chargeCoinForm.action = <%=root%>+"/coin?act=mvChargeCoin";
		document.chargeCoinForm.submit();
	}
</script>
<div id="wrapper">
	<div id="page-wrapper">
<script type="text/javascript">
		chargeComplete();
	</script>
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							코인 충전이 완료되었습니다. 
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
								<!-- 
								<div class="col-lg-6">
									<p class="breadcrumb">충전한 코인</p>
									<p class="form-control-static"> 코인</p>
								</div>
								 -->
							</div>
							<div class="form-group">
								<div class="col-lg-4">
									<label></label>
								</div>	
								<div class="col-lg-6">
									<p class="breadcrumb">보유한 코인</p>
									<p class="form-control-static"><%=memberDto.getCoin()%> 코인</p>	
								</div>
								
							</div>
							<div class="form-group">
								<div class="col-lg-4">
									<label></label>
								</div>
							<div class="col-lg-6">
							<br>
									<a href="/carpark/coin/coin.jsp" >충전 페이지로 돌아가기 </a>
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
