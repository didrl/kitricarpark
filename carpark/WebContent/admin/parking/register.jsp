<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/common/common.jsp" %>
<%@ include file="/common/header/init.jsp" %>
<%@include file="/admin/common/sidebar.jsp" %>

<!-- ************************************************************************************ -->
<!-- ************************************************************************************ -->	
<%if(memberDto != null){ %>
<div id="wrapper">

		<!-- main -->
		<div id="page-wrapper">
			<div class="container-fluid">
			<br>
			<!-- 본문내용 -->
			<div class="col-md-10">
			<form name="parkRegisterForm" method="post" action="">
				<input type="hidden" name="act" value="parkingRegister">				
				
				
				<div class="row">
					<div class="col-md-2">
						<b>주차장 구분</b><br>
					</div>
					<div class="col-md-10">
						<label class="radio-inline">
						  <input type="radio" name="parkType" value="0" checked="checked"> 개인
						</label>
						<label class="radio-inline">
						  <input type="radio" name="parkType" value="1"> 사설
						</label>
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>사용가능여부</b><br>
					</div>
					<div class="col-md-10">
						<label class="radio-inline">
						  <input type="radio" name="parkFlag" value="0" checked="checked"> 사용가능
						</label>
						<label class="radio-inline">
						  <input type="radio" name="parkFlag" value="1"> 사용불가
						</label>
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>주차장 이름</b><br>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<input type="text" class="form-control" name="parkName">
						</div>
					</div><br>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>위치</b><br>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<input type="text" name="parkAddress" readonly="readonly" class="form-control">
							<input type="hidden" name="coordinate" readonly="readonly" class="form-control">
						</div>
							<button type="button" class="btn btn-default" onclick="javascript:parkingSearchWindow();">검색</button>
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>보유시설</b><br>
					</div>
					<div class="col-md-10">
						<input type="text" class="form-control" name="facility">
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>보유시설상세</b><br>
					</div>
					<div class="col-md-10">
						<textarea class="form-control" rows="3" name="feature"></textarea>						
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
									    <option value="0" selected="selected">무료</option>
									    <option value="1">유료</option>
									</select>
								</td>				
								<td width="90">토요일</td>				
								<td width="90">
									<select class="form-control" name="saturPayYn">
									    <option value="0" selected="selected">무료</option>
									    <option value="1">유료</option>
									</select>								
								</td>				
								<td width="90">공휴일</td>				 
								<td width="90">
									<select class="form-control" name="holiPayYn">
									    <option value="0" selected="selected">무료</option>
									    <option value="1">유료</option>
									</select>								
								</td>										
							</tr>							
							<tr>
								<td width="90">총 주차면수</td>				
								<td width="90"><input type="text" class="form-control" placeholder="124" name="parkCapacity"></td>			
								<td width="90">기본주차시간</td>				
								<td width="90">
									<select class="form-control" name="parkTimeRate">
									    <option value="1" selected="selected">1시간</option>
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
									    <option value="1" selected="selected">1코인</option>
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
									    <option value="1" selected="selected">1코인</option>
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
									    <option value="1" selected="selected">10코인</option>
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
								<td><input type="text" class="form-control" placeholder="코인" name="fullTimeMonthlyPay"></td>
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
						<textarea class="form-control" rows="3" name="content"></textarea>						
					</div>
				</div><br>
			</form>
	
				<div class="row">
						<p align="center">
		  					<button type="button" class="btn btn-default" onclick="javascript:parkingRegister();">등록</button>
		  					<button type="button" class="btn btn-default" onclick="javascript:parkingList('<%=pg%>');">목록</button>
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
	