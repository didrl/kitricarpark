<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/common/common.jsp" %>
<%@ include file="/common/header/init.jsp" %>
<%@include file="/admin/common/sidebar.jsp" %> %>

<!-- ************************************************************************************ -->
<!-- ************************************************************************************ -->	
<%
if(memberDto != null){ 

	ParkingDetailDto parkingDto = (ParkingDetailDto) request.getAttribute("parkingView");
%>
<div id="wrapper">

		<!-- main -->
		<div id="page-wrapper">
			<div class="container-fluid">
			<br>
			<!-- 본문내용 -->
			<div class="col-md-10">
			<form name="adminParkingModifyForm" method="post" action="">
				<input type="hidden" name="act" value="adminParkingModify">				
				<input type="hidden" name="parkId" value="<%=parkingDto.getPark_id()%>">				
				
				
				<div class="row">
					<div class="col-md-2">
						<b>주차장 구분</b><br>
					</div>
					<div class="col-md-10">
<%
if("0".equals(parkingDto.getPark_type())) {
%>
						<label class="radio-inline">
						  <input type="radio" name="parkType" value="0" checked="checked"> 개인
						</label>
						<label class="radio-inline">
						  <input type="radio" name="parkType" value="1"> 사설
						</label>
<%
} else {
%>
						<label class="radio-inline">
						  <input type="radio" name="parkType" value="0"> 개인
						</label>
						<label class="radio-inline">
						  <input type="radio" name="parkType" value="1" checked="checked"> 사설
						</label>
<%
}
%>
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>사용가능여부</b><br>
					</div>
					<div class="col-md-10">
<%
if(0 == parkingDto.getPark_flag()) {
%>
						<label class="radio-inline">
						  <input type="radio" name="parkFlag" value="0" checked="checked"> 사용가능
						</label>
						<label class="radio-inline">
						  <input type="radio" name="parkFlag" value="1"> 사용불가
						</label>
<%
} else {
%>
						<label class="radio-inline">
						  <input type="radio" name="parkFlag" value="0"> 사용가능
						</label>
						<label class="radio-inline">
						  <input type="radio" name="parkFlag" value="1" checked="checked"> 사용불가
						</label>
<%
}
%>

					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>주차장 이름</b><br>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<input type="text" class="form-control" name="parkName" value="<%=parkingDto.getPark_name()%>">
						</div>
					</div><br>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>위치</b><br>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="주소" name="parkAddress" readonly="readonly" value="<%=parkingDto.getDetailAddr()%>">
							<input type="hidden" class="form-control" name="coordinate" value="(<%=parkingDto.getLatitude()%> , <%=parkingDto.getLongitude()%>)">
						</div>
							<button type="button" class="btn btn-default" onclick="javascript:parkingSearchWindow();">검색</button>
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>보유시설</b><br>
					</div>
					<div class="col-md-10">
						<input type="text" class="form-control" name="facility" value="<%=parkingDto.getFacility()%>">
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>보유시설상세</b><br>
					</div>
					<div class="col-md-10">
						<textarea class="form-control" rows="3" name="feature" value="<%=parkingDto.getFeature()%>"></textarea>						
					</div>
				</div><br>
				
				<div class="row">
					<div class="col-md-2">
						<b>상세정보</b><br>
					</div>
					<div class="col-md-10">
						<table class="table">
							<tr>
								<td width="90">평일</td>				
								<td width="90">
									<select class="form-control" name="payYn">
									    <option value="" selected="selected">----</option>
									    <option value="0">무료</option>
									    <option value="1">유료</option>
									</select>
								</td>				
								<td width="90">토요일</td>				
								<td width="90">
									<select class="form-control" name="saturPayYn">
										<option value="" selected="selected">----</option>
									    <option value="0">무료</option>
									    <option value="1">유료</option>
									</select>								
								</td>				
								<td width="90">공휴일</td>				 
								<td width="90">
									<select class="form-control" name="holiPayYn">
									    <option value="" selected="selected">----</option>
									    <option value="0">무료</option>
									    <option value="1">유료</option>
									</select>								
								</td>										
							</tr>							
							<tr>
								<td width="90">총 주차면수</td>				
								<td width="90"><input type="text" class="form-control" placeholder="124" name="parkCapacity" value="<%=parkingDto.getPark_capacity()%>"></td>			
								<td width="90">기본주차시간</td>				
								<td width="90">
									<select class="form-control" name="parkTimeRate">
									    <option value="" selected="selected">----</option>
									    <option value="1">1시간</option>
									    <option value="2">2시간</option>
									    <option value="3">3시간</option>
									    <option value="4">4시간</option>
									    <option value="5">5시간</option>
									    <option value="6">6시간</option>
									    <option value="7">7시간</option>
									    <option value="8">8시간</option>
									    <option value="9">9시간</option>
									    <option value="10">10시간</option>
									    <option value="11">11시간</option>
									    <option value="12">12시간</option>
									</select>
								</td>				
								<td width="90">기본주차요금</td>				
								<td width="90">
									<select class="form-control" name="parkRate">
										<option value="" selected="selected">----</option>
									    <option value="1">1코인</option>
									    <option value="2">2코인</option>
									    <option value="3">3코인</option>
									    <option value="4">4코인</option>
									    <option value="5">5코인</option>
									    <option value="6">6코인</option>
									    <option value="7">7코인</option>
									    <option value="8">8코인</option>
									    <option value="9">9코인</option>
									    <option value="10">10코인</option>
									</select>
								</td>				
							</tr>
							<tr>
							<td width="90">추가단위요금</td>				
								<td width="90">
									<select class="form-control" name="addParkRate">
										<option value="" selected="selected">----</option>
									    <option value="1">1코인</option>
									    <option value="2">2코인</option>
									    <option value="3">3코인</option>
									    <option value="4">4코인</option>
									    <option value="5">5코인</option>
									    <option value="6">6코인</option>
									    <option value="7">7코인</option>
									    <option value="8">8코인</option>
									    <option value="9">9코인</option>
									    <option value="10">10코인</option>
									</select>
								</td>				
								<td width="90">하루최대요금</td>							
								<td width="90">
									<select class="form-control" name="dayMaxPay">
										<option value="" selected="selected">----</option>
									    <option value="1">10코인</option>
									    <option value="2">20코인</option>
									    <option value="3">30코인</option>
									    <option value="4">40코인</option>
									    <option value="5">50코인</option>
									    <option value="6">60코인</option>
									    <option value="7">70코인</option>
									    <option value="8">80코인</option>
									    <option value="9">90코인</option>
									    <option value="10">100코인</option>
									</select>
								</td>	
								<td width="90">월정기권</td>
								<td><input type="text" class="form-control" placeholder="코인" name="fullTimeMonthlyPay" value="<%=parkingDto.getFulltime_monthly_pay()%>"></td>
							</tr>					
						</table>
					</div>
				</div>
			
				<div class="row">
					<div class="col-md-2">
						<b>사진</b><br>
					</div>
					<div class="col-md-10">
					    <input type="file" id="fileName">
					    <p class="help-block">주차장 사진 등록</p>
				</div>
				
				<div class="row">
					<div class="col-md-2">
						<b>주차장 설명</b><br>
					</div>
					<div class="col-md-10">
						<textarea class="form-control" rows="3" name="content" value="<%=parkingDto.getContent()%>"></textarea>						
					</div>
				</div><br>
			</form>
	
				<div class="row">
						<p align="center">
		  					<button type="button" class="btn btn-primary btn-lg" onclick="javascript:adminParkingModify('<%=parkingDto.getPark_id()%>');">수정</button>
		  					<button type="button" class="btn btn-default btn-lg" onclick="javascript:adminParkList('<%=pg%>');"> 취소 </button>
						</p>
				</div>
			</div>
			
	
				
			
		</div>
	</div>
	</div>
	
<%@ include file="/common/footer.jsp" %>		
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
	