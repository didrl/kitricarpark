<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.carpark.member.model.ReservationDto, java.util.*,com.carpark.member.model.MemberCarDto"
    %>
    
<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp"%>

<%
ReservationDto reservationDto = (ReservationDto) request.getAttribute("reservationDto");
ArrayList<MemberCarDto> carInfo = (ArrayList<MemberCarDto>) request.getAttribute("carinfo"); 
ArrayList<String> availdate = (ArrayList<String>) request.getAttribute("availalbledate");
ParkingDetailDto parkingDetailDto =(ParkingDetailDto) request.getAttribute("parkingDetailDto");

if(parkingDetailDto == null)
	System.out.println("없어!!!!!!!!!!!!!!!!!");

if(reservationDto != null){
%>
    <!-- For sendMsg Modal -->
   <%@include file="/reservation/sendMessageModal.jsp"%>
   <!-- For sendMsg Modal -->
   <!-- For addCar Modal -->
   <%@include file="/reservation/addMyOwnCarModal.jsp"%>
   <!-- For addCar Modal -->
   <!-- For payment Modal -->
   <%@include file="/reservation/payment.jsp"%>
   <!-- For payment Modal -->

<!-- Seclect List CSS
<link rel="stylesheet" type="text/css" href="/carpark/css/jquery.selectlist.css">
 -->
<!-- Simple Celander -->
<link rel="stylesheet" href="/carpark/css/calendar/style.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="/carpark/js/calendar/calendar.js"></script>
<!-- Simple Celander -->


<link rel="stylesheet" href="/carpark/css/normalize.css">
<link rel="stylesheet" href="/carpark/css/style.css">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,100,100italic'
	rel='stylesheet' type='text/css'>

<!-- Custom CSS -->
<link href="/carpark/css/shop-item.css" rel="stylesheet">

<!-- Custom Fonts -->

<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- for hid or show div -->
<style>
.hidden{display:none;}
</style>


	<!-- Page Content -->
	<div class="container" style="text-align:center">

		<div class="row">

			<!-- Left Section Start -->
			<div class="col-md-7 col-lg-7 col-sm-7">
				<div class="panel panel-default"> <!--  Left panel div Start -->
				<div class="panel-body"> <!--  Left panel body Start -->
				<div>	<h3><a href="" ><%=reservationDto.getPark_name() %></a></h3></div>
				<div><%=reservationDto.getHost_id() %>
						이것저것 정보들
				</div><br><br><br><br>
				<div><h3>언제 주차를 하길 원하십니까?</h3></div><br>
				<div class="row"><!-- From Choice Start -->
					<div class="col-md-3 col-lg-3 col-sm-3">
						<div class="pull-right">예약 구분 : </div>
					</div>
					<div class="col-md-8 col-lg-8 col-sm-8" >
					연속 예약 <input type="radio" name="resercheck" id="multireservation" > 하루 예약 
					<input type="radio" name="resercheck" id="singlereservation">
					</div>
				</div><br>
				<!--  radio button에 의한 Multi reservation Start-->
				<div id="multiReservationDiv" class='formultidiv'>	
				<div class="row"><!-- From Choice Start -->
					<div class="col-md-3 col-lg-3 col-sm-3">
								<div class="pull-right">From : </div>
						</div>
						<div class="col-md-8 col-lg-8 col-sm-8" >		
								<input class="date-picker" id="rdfromdate" name="rdfromdate" type="text"  />
								<select id="rdfromTime" name="rdfromTime">
								  <option value="0">00:00</option><option value="1">01:00</option><option value="2">02:00</option>
								  <option value="3">03:00</option> <option value="4">04:00</option><option value="5">05:00</option>
								  <option value="6">06:00</option><option value="7">07:00</option><option value="8">08:00</option>
								  <option value="9">09:00</option><option value="10">10:00</option><option value="11">11:00</option>
								  <option value="12">12:00</option><option value="13">13:00</option><option value="14">14:00</option>
								  <option value="15">15:00</option> <option value="16">16:00</option><option value="17">17:00</option>
								  <option value="18">18:00</option><option value="19">19:00</option> <option value="20">20:00</option>
								  <option value="21">21:00</option><option value="22">22:00</option><option value="23">23:00</option>
								</select>
							</div>
					</div><!-- From Choice End -->
					<div class="row"><!-- To Choice Start -->
							<div class="col-md-3 col-lg-3 col-sm-3">
								<div class="pull-right">T o :</div> 
								</div>
								<div class="col-md-8 col-lg-8 col-sm-8" >
								<input class="date-picker" id="rdtodate" name="rdtodate" type="text" />
								<select id="rdtoTime" name="rdtoTime">
								  <option value="0">00:00</option><option value="1">01:00</option><option value="2">02:00</option>
								  <option value="3">03:00</option> <option value="4">04:00</option><option value="5">05:00</option>
								  <option value="6">06:00</option><option value="7">07:00</option><option value="8">08:00</option>
								  <option value="9">09:00</option><option value="10">10:00</option><option value="11">11:00</option>
								  <option value="12">12:00</option><option value="13">13:00</option><option value="14">14:00</option>
								  <option value="15">15:00</option> <option value="16">16:00</option><option value="17">17:00</option>
								  <option value="18">18:00</option><option value="19">19:00</option> <option value="20">20:00</option>
								  <option value="21">21:00</option><option value="22">22:00</option><option value="23">23:00</option>
								</select>
								</div>
					</div>	<!-- To Choice End -->	
					</div> <!--  radio button에 의한 Multi reservation End-->
					
					<div class="row" id="singleReservationDiv" class='forsinglediv'> <!--  radio button에 의한 Single reservation Start-->
					<div class="col-md-3 col-lg-3 col-sm-3">
								<div class="pull-right">Date : </div>
						</div>
						<div class="col-md-8 col-lg-8 col-sm-8" >		
								<input class="date-picker" id="singedate"  name="singedate"  type="text"  />
								<select id="datefromTime" name="datefromTime">
								  <option value="0">00:00</option><option value="1">01:00</option><option value="2">02:00</option>
								  <option value="3">03:00</option> <option value="4">04:00</option><option value="5">05:00</option>
								  <option value="6">06:00</option><option value="7">07:00</option><option value="8">08:00</option>
								  <option value="9">09:00</option><option value="10">10:00</option><option value="11">11:00</option>
								  <option value="12">12:00</option><option value="13">13:00</option><option value="14">14:00</option>
								  <option value="15">15:00</option> <option value="16">16:00</option><option value="17">17:00</option>
								  <option value="18">18:00</option><option value="19">19:00</option> <option value="20">20:00</option>
								  <option value="21">21:00</option><option value="22">22:00</option><option value="23">23:00</option>
								</select>
							</div>
							<div class="col-md-8 col-lg-8 col-sm-8" >		
								<select id="datetoTime" name="datetoTime">
								  <option value="0">00:00</option><option value="1">01:00</option><option value="2">02:00</option>
								  <option value="3">03:00</option> <option value="4">04:00</option><option value="5">05:00</option>
								  <option value="6">06:00</option><option value="7">07:00</option><option value="8">08:00</option>
								  <option value="9">09:00</option><option value="10">10:00</option><option value="11">11:00</option>
								  <option value="12">12:00</option><option value="13">13:00</option><option value="14">14:00</option>
								  <option value="15">15:00</option> <option value="16">16:00</option><option value="17">17:00</option>
								  <option value="18">18:00</option><option value="19">19:00</option> <option value="20">20:00</option>
								  <option value="21">21:00</option><option value="22">22:00</option><option value="23">23:00</option>
								</select>
							</div>
					</div><!--  radio button에 의한 Single reservation End--> <br>
					<div><h3>어떤 차량을 주차 하길 원하십니까?</h3></div><br>
					<div class="row" > <!-- Select Car div Start-->
					<div class="col-md-3 col-lg-3 col-sm-3">
								<div class="pull-right">등록 차량 </div>
						</div>
						<div class="col-md-8 col-lg-8 col-sm-8" >		
								<select  id="mycarlist" name="mycarlist" >
<%for(MemberCarDto memberCarDto : carInfo){ %>
								  <option value="<%=memberCarDto.getCar_id()%>"><%=memberCarDto.getModel() %></option>  
<%} %>
								</select>
								<button type="button" class="btn btn-success"  id="addmycarbt" data-toggle="modal" data-target="#addCar">
                  				 + 차량 등록 
               				</button>
							</div>
					</div><!-- Select Reason div End--> <br>
						<div><h3>이용 목적이 무엇입니까?</h3></div><br>
					<div class="row" > <!-- Select Car div Start-->
					<div class="col-md-3 col-lg-3 col-sm-3">
								<div class="pull-right">이용 목적</div>
						</div>
						<div class="col-md-8 col-lg-8 col-sm-8" >		
								<select  id="reasonlist" name="reasonlist" >
								  <option value="business">업무</option>
								  <option value="trip">여행</option>
								  <option value="visit">방문</option>
								  <option value="ext">기타</option>
								</select>
							</div>
					</div><!-- Select Reason div End--> <br>
					</div><!--  Left panel body End -->
							<button type="button" class="btn btn-success"  id="mvpaymodalbtn" data-toggle="modal" data-target="#payment">
                  				 결제하기 
               				</button>
				</div><!--  Left panel div End -->
			</div> 
			<!-- Left Section End -->

			<!-- Right Section Start -->
			<div class="col-md-5 col-lg-5 col-sm-5">
				<div class="row">
					<div class="well">
						<div class="panel-body">
						<b>고객 유의사항</b><br>
						현재 보고있는 주차장 이용 시<br>
						발생할 수 있는 법적 책임은<br>
						서비스를 제공하는 CarPark가 아닌<br>
						주차장을 제공하는<br>
						제공자와 해당 주차장을 이용하는<br>
						본인에게 있습니다.<br>
						</div>
						<div class="text-center">
						<br>
						</div>
						</div>
					<!-- host info panel End -->
					<div class="panel panel-default">
						<div class="panel-body">
						<h3>사용 가능 일</h3>
							<div id="c">
								<div id="disp">
									<div id="prev" class="nav">←</div>
									<div id="month"></div>
									<div id="next" class="nav">→</div>
								</div>
								<div id="cal"></div>
							</div>
							<!-- /#c -->
							<script src="/carpark/js/calendar/index.js"></script>
						</div>
					</div>
					<!-- clelander panel End -->
				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->
	<div class="container">

		<hr>

	
</div>
		<!-- Custom Theme JavaScript 
		<script src="/carpark/js/selectlist/jquery.selectlist.js"></script>
-->
		<script>
			// Closes the sidebar menu
			$("#menu-close").click(function(e) {
				e.preventDefault();
				$("#sidebar-wrapper").toggleClass("active");
			});

			// Opens the sidebar menu
			$("#menu-toggle").click(function(e) {
				e.preventDefault();
				$("#sidebar-wrapper").toggleClass("active");
			});

			// Scrolls to the selected menu item on the page
			$(function() {
				$('a[href*=#]:not([href=#])')
						.click(
								function() {
									if (location.pathname.replace(/^\//, '') == this.pathname
											.replace(/^\//, '')
											|| location.hostname == this.hostname) {

										var target = $(this.hash);
										target = target.length ? target
												: $('[name='
														+ this.hash.slice(1)
														+ ']');
										if (target.length) {
											$('html,body').animate({
												scrollTop : target.offset().top
											}, 1000);
											return false;
										}
									}
								});
			});
	/*		
			$(function(){
				$('select').selectlist({
					zIndex: 10,
					width: 100,
					height: 30
				});		
			})
			$(function(){
				$('selectlong').selectlist({
					zIndex: 10,
					width: 200,
					height: 30
				});		
			})
	*/

		$(document).ready(function () {
				$("#multireservation").attr("checked", true);
				$("#singleReservationDiv").addClass("hidden");
				
				//init time
				$("#rdfromdate").val("<%=reservationDto.getFromdate()%>");
				$("#rdtodate").val("<%=reservationDto.getTodate()%>");
				$("#rdtoTime").val("<%=reservationDto.getTotime()%>");
				$("#rdfromTime").val("<%=reservationDto.getFromtime()%>");
				
				$("#datefromTime").val("<%=reservationDto.getFromtime()%>");
				$("#datetoTime").val("<%=reservationDto.getTotime()%>");
				$("#singedate").val("<%=reservationDto.getFromdate()%>");
				
	
				
		});
			// Radio Control div Show or Hide 
				$("#multireservation").on("click",function(){
					if(this.checked){
						$("#multiReservationDiv").removeClass("hidden");
						$("#singleReservationDiv").addClass("hidden");
					}
				});
				
				$("#singlereservation").on("click",function(){
					if(this.checked){
						$("#multiReservationDiv").addClass("hidden");
						$("#singleReservationDiv").removeClass("hidden");
					}
				});
			
				
			$("#addmycarbt").on('click',function(e){
				$("#inputCarNum").empty();
				$("#inputCarName").empty();
				$("#addCarTitle").append("<%=memberDto.getUser_id()%>");
				
				
				$('#addcar').show();
			});
			
			$('#mvpaymodalbtn').on('click', function (event) {
				  var button = $(event.relatedTarget) // Button that triggered the modal
				  var fdate =$('#rdfromdate');
				  var tdate =$('#rdtodate');
				  var ddate =$('#singledate');
			      console.log("fd : "+fdate.val()+"  td : "+tdate.val()+"  dd :"+ddate.val());
	
         			// Clean text in modal label
			        $("#selectedfromdate").empty();
			        $("#selectedtodate").empty();
			        $("#selectedid").empty();
			        $("#selectedgrade").empty();
			        $("#selectedcarnum").empty();
			        $("#selectedcarname").empty();
			        $("#selectedcoin").empty();
			        $("#selectedprice").empty();
			        // Clean text in modal label
			            	
			        $("#selectedfromdate").append(fdate);
			        $("#selectedtodate").append(tdate);
			        $("#selectedid").append("<%=memberDto.getUser_id()%>");
			        $("#selectedgrade").append("<%=memberDto.getGrade_id()%>");
			        $("#selectedcarnum").append($("#mycarlist option:selected").val());
			        $("#selectedcarname").append($("#mycarlist option:selected").text());
			        $("#selectedcoin").append("<%=memberDto.getCoin()%>");
			        $("#selectedprice").append();
					//init price
			        $('#payment').show();
				})
		</script>



		
		

<!-- ****************************************************************************************************************** -->			


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
 