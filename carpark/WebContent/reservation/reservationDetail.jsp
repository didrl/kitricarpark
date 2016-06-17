<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.carpark.member.model.ReservationDto, java.util.*,com.carpark.member.model.MemberCarDto"
    import="com.carpark.common.model.*,java.text.SimpleDateFormat"
    %>
    
<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp"%>

<%
ReservationDto reservationDto = (ReservationDto) session.getAttribute("reservationDto");
ArrayList<MemberCarDto> carInfo = (ArrayList<MemberCarDto>) session.getAttribute("carinfo"); 
ArrayList<Map<String,String>> availabledate = (ArrayList<Map<String,String>>)session.getAttribute("availabledate");
ParkingDetailDto parkingDetailDto =(ParkingDetailDto) session.getAttribute("parkingDetailDto");
ArrayList<ParkingDto> list = (ArrayList<ParkingDto>)session.getAttribute("searchlist");

if(reservationDto != null){
	   StringBuffer sb =new StringBuffer();
	   SimpleDateFormat transFormat = new SimpleDateFormat("yyyy/MM/dd");
	   Calendar cal = Calendar.getInstance();
	   Date nowDate = transFormat.parse(cal.get(Calendar.YEAR)+"/"+cal.get(Calendar.MONTH)+"/"+cal.get(Calendar.DATE));
	   Date lDate = transFormat.parse(cal.get(Calendar.YEAR)+"/"+(cal.get(Calendar.MONTH)+1)+"/"+cal.get(Calendar.DATE));
	   String lastDate = transFormat.format(lDate);
	   int size = availabledate.size();
	   String tmp ="";
	   if(size==0){
	       tmp ="{from : new Date(), to :new Date("+lastDate.replace("/", ",")+")}";
	       sb.append(tmp);
	   }else if(size<2 && size>0){
	       Date td = transFormat.parse(availabledate.get(0).get("startdate"));
	       if(nowDate.before(td)){            //가져온 첫 예약일의 시작일이 오늘보다 나중일 때
	          tmp ="{from : new Date(), to : new Date("+availabledate.get(0).get("startdate").replace("/", ",")+")},";
	          sb.append(tmp);
	       }
	       tmp ="{from : new Date("+availabledate.get(0).get("enddate").replace("/", ",")+"), to :new Date("+lastDate.replace("/", ",")+")}";
	       sb.append(tmp);
	   }else{
	       Date td = transFormat.parse(availabledate.get(0).get("startdate"));
	        if(nowDate.before(td)){            //가져온 첫 예약일의 시작일이 오늘보다 나중일 때
	           tmp ="{from : new Date(), to : new Date("+availabledate.get(0).get("startdate").replace("/", ",")+")},";
	           sb.append(tmp);
	        }
	        tmp ="{from : new Date("+availabledate.get(0).get("enddate").replace("/", ",")+")";
	        sb.append(tmp);
	        for(int i=1;i<size;++i){   // 두번째 예약부터
	            tmp =",to : new Date("+availabledate.get(i).get("startdate").replace("/", ",")+")},";
	            sb.append(tmp);
	            tmp ="{from : new Date("+availabledate.get(i).get("enddate").replace("/", ",")+")";
	            sb.append(tmp);
	            if(i==size-1)
	               sb.append(", to :new Date("+lastDate.replace("/", ",")+")}");
	         }
	      }
	int paypal_pay = 10;	

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

 <!-- calendar -->
 <link href="/carpark/css/calendar/glDatePicker.default.css" rel="stylesheet" type="text/css">
 <script src="/carpark/js/calendar/glDatePicker.min.js"></script>
 <!-- calendar -->
 <script src="/carpark/js/datejs/date-ko-KR.js" type="text/javascript"></script>
 
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

<!-- for hide or show div -->
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
								<label>
								From : 
								<input readonly="readonly" id="rdfromdate" name="rdfromdate" type="text"  />
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
								</label>
					</div><!-- From Choice End -->
					<div class="row"><!-- To Choice Start -->
								<label>
								T &nbsp;&nbsp; o : 
								<input readonly="readonly" id="rdtodate" name="rdtodate" type="text" />
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
								</label>
					</div>	<!-- To Choice End -->	
					</div> <!--  radio button에 의한 Multi reservation End-->
					
					<div class="row" id="singleReservationDiv" class='forsinglediv'> <!--  radio button에 의한 Single reservation Start-->
								<label>
								Date : 
								<input  readonly="readonly" id="singledate"  name="singledate"  type="text"  />
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
								</label>
					</div><!--  radio button에 의한 Single reservation End--> <br>
					<div><h3>어떤 차량을 주차 하길 원하십니까?</h3></div><br>
					<div class="row" > <!-- Select Car div Start-->
					<div class="col-md-3 col-lg-3 col-sm-3">
								<div class="pull-right">등록 차량 </div>
						</div>
						<div class="col-md-8 col-lg-8 col-sm-8" >		
								<select  id="mycarlist" name="mycarlist" >
<%for(MemberCarDto memberCarDto : carInfo){ %>
								  <option value="<%=memberCarDto.getReg_num()%>"><%=memberCarDto.getModel() %></option>  
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
							<button type="button" class="btn btn-success"  id="mvpaymodalbtn" data-target="#payment">
                  				 코인으로 결제하기 
               				</button>
               				<!-- 페이팔로 결제하기 
               				
               				<script async="async" src="https://www.paypalobjects.com/js/external/paypal-button.min.js?merchant=parkingc16+admin@gmail.com" 
							    data-button="buynow" 
							    data-name="1" 
							    data-quantity="1" 
							    data-amount= <%=paypal_pay%>
							    data-currency="USD" 
							    data-shipping="0" 
							    data-tax="0" 
							    data-callback="http://192.168.0.3:8080/carpark/coin/complete.jsp" 
							    data-env="sandbox"
							></script>-->
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
					<!-- clelander panel  -->
						<div class="panel-body" id="rdcalendar">
						<h3>사용 가능 일</h3>
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

	//	$(document).ready(function () {
				
				var fdate ="<%=reservationDto.getFromdate()%>";
				var tdate ="<%=reservationDto.getTodate()%>";
				var ddate ="<%=reservationDto.getFromdate()%>";
				
				$("#multireservation").attr("checked", true);
				$("#singleReservationDiv").addClass("hidden");
				
				//init time
				$("#rdfromdate").val(fdate);
				$("#rdtodate").val(tdate);
				$("#rdtoTime").val("<%=reservationDto.getTotime()%>");
				$("#rdfromTime").val("<%=reservationDto.getFromtime()%>");
				
				$("#datefromTime").val("<%=reservationDto.getFromtime()%>");
				$("#datetoTime").val("<%=reservationDto.getTotime()%>");
				$("#singledate").val(ddate);
//				});
				 $("#selectedfromdate").val(fdate);
			     $("#selectedtodate").val(tdate);
			// Radio Control div Show or Hide 
				$("#multireservation").on("click",function(){
			
					if(this.checked){
						$("#multiReservationDiv").removeClass("hidden");
						$("#singleReservationDiv").addClass("hidden");
					      $("#selectedfromdate").val(fdate);
					        $("#selectedtodate").val(tdate);
					}
				});
				
				$("#singlereservation").on("click",function(){
					
					if(this.checked){
						$("#multiReservationDiv").addClass("hidden");
						$("#singleReservationDiv").removeClass("hidden");
						$("#selectedfromdate").val(ddate);
			        	$("#selectedtodate").val(ddate);
					}
				});
			
				
			$("#addmycarbt").on('click',function(e){
				$("#inputCarNum").empty();
				$("#inputCarName").empty();
				$("#addCarTitle").append("<%=memberDto.getUser_id()%>");
				$("#addcaruser_id").val("<%=memberDto.getUser_id()%>");
				$("#addcarpark_id").val("<%=parkingDetailDto.getPark_id()%>");
				
				$('#addcar').show();
			});
			
		 	var today = new Date();
		 	var datelimit = new Date(today);
		 	datelimit.setDate(today.getDate() + 31);

		 	$('#rdfromdate').glDatePicker({
		 	    showAlways: false,
		 	    allowMonthSelect: true,
		 	    allowYearSelect: true,
		 	    selectedDate: today,
		 	   selectableDateRange: [<%=sb.toString()%>],
		 	    onClick: function (target, cell, date, data) {
		 	        target.val(date.getFullYear() + '/' + (date.getMonth() + 1) + '/' + date.getDate());

		 	        if (data != null) {
		 	            alert(data.message + '\n' + date);
		 	        }
		 	    }
		 	}).glDatePicker(true);

		 	$('#singledate').glDatePicker({
		 	    showAlways: false,
		 	    allowMonthSelect: true,
		 	    allowYearSelect: true,
		 	    selectableDateRange: [{
		 	        from: today}]
		 	});
		 	
		 	var to = $('#rdtodate').glDatePicker(
		 	{
		 	    showAlways: false,
		 	    onClick: function (target, cell, date, data) {
		 	        target.val(date.getFullYear() + '/' + (date.getMonth() + 1) + '/' + date.getDate());

		 	        if (data != null) {
		 	            alert(data.message + '\n' + date);
		 	        }
		 	    }
		 	}).glDatePicker(true);

		 	$('#rdtodate').click(function() {
		 	    var fechaFrom = new Date($("#rdfromdate").val());
		 	    var toLimit = new Date();
		 	    toLimit.setDate(fechaFrom.getDate() + 31);
		 	    to.options.selectableDateRange = [{
		 	        from: fechaFrom,
		 	        //to: toLimit
		 	    },<%=sb.toString()%> ],
		 	    to.options.showAlways = false;
		 	    to.render();
		 	});
		 	
	          $('#rdcalendar').glDatePicker(
	                    {
	                     showAlways: true,
	                     allowMonthSelect: false,
	                     allowYearSelect: false,
	                     prevArrow: '',
	                     nextArrow: '',
	                     selectedDate: new Date(),
	                     selectableDateRange: [<%=sb.toString()%>]
	                    });
	          
			$('#mvpaymodalbtn').on('click', function (event) {
				var minutes = 1000 * 60;
				var hours = minutes * 60;
				var days = hours * 24;
							
				var fdateDate = Date.parseExact(fdate,"yyyy/M/d");
				var tdateDate = Date.parseExact(tdate,"yyyy/M/d");
				
				var reserHours = (tdateDate-fdateDate)/hours;
				var reserDays = (tdateDate-fdateDate)/days;
				var reserExtraHours = $("#rdtoTime").val()-$("#rdfromTime").val();
				if(reserDays==0 && reserExtraHours==0){
					alert("예약할 시간을 확인해주세요.");
					return;
				}else{
				alert("days :"+ reserDays +"    hours :"+reserHours+"       ehours : "+reserExtraHours);
				
				var pay=0;
					if(<%=parkingDetailDto.getDay_max_pay()%>==0)
						pay=reserHours*<%=parkingDetailDto.getAdd_park_rate()/100%>/(4*reserDays);
					else
			        	pay =<%=parkingDetailDto.getDay_max_pay()/100%>*reserDays+(<%=parkingDetailDto.getAdd_park_rate()%>*reserExtraHours)/100;
			        	
			        if(pay><%=memberDto.getCoin()%>){
			        	alert("보유한 코인이 부족합니다. 코인 충전 후 다시 이용해주세요.");
			        	document.location.href = "<%=root%>/member?act=mvcoin";
			        }else{
				        $("#paypark_id").val("<%=parkingDetailDto.getPark_id()%>");
				        $("#payfromtime").val($("#rdfromTime").val());
				        $("#paytotime").val($("#rdtoTime").val());
				        
				        $("#selectedid").val("<%=memberDto.getUser_id()%>");
				        $("#selectedgrade").append("<%=memberDto.getGrade_id()%>");
				        $("#selectedcarnum").val($("#mycarlist option:selected").val());
				        $("#selectedcarname").val($("#mycarlist option:selected").text());
				        $("#selectedcoin").val("<%=memberDto.getCoin()%>");
				        $("#selectedprice").val(pay);
	
				        $('#payment').modal("show");
			        }
				}
				});
				
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
 