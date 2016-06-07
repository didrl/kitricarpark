<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<!--  search bar start -->
		<!-- calendar -->
			 <link href="/carpark/css/calendar/glDatePicker.default.css" rel="stylesheet" type="text/css">
 			<script src="/carpark/js/calendar/glDatePicker.min.js"></script>
 			<!-- calendar -->
			<script type="text/javascript" src="/carpark/js/datejs/date-ko-KR.js"></script>
			<div class="col-sm-12">
				<!-- /input-group -->
				<form id="searchForm" name="searchForm" class="form-inline" role="form" method="post">
					<input type="hidden" name="act" value="mvSearchResult">
					<input type="hidden" name="search" value="">
					<label>
						<input type="text" class="form-control col-lg-6" id="citysearch" name="city" placeholder="Search for..."> &nbsp;
						<input readonly="readonly"  id="fromdatesearch" name="fromdatesearch" type="text" placeholder="Start Date"/>
						<input readonly="readonly"  id="todatesearch" type="text" name="todatesearch" placeholder="End Date"/>
						<button class="btn btn-success" type="button"
						onclick="javascript:goSearchResult();">Search</button> 
					</label>			
				</form>
			</div>
			
			<br>
			<br>
			<!--  search bar end-->
	 	<script>
	 	var today = new Date();
	 	var datelimit = new Date(today);
	 	datelimit.setDate(today.getDate() + 62);



	 	$('#fromdatesearch').glDatePicker({
	 	    showAlways: false,
	 	    allowMonthSelect: true,
	 	    allowYearSelect: true,
	 	    selectedDate: today,
	 	    selectableDateRange: [{
	 	        from: today,
	 	        to: datelimit
	 	    }, ],
	 	    onClick: function (target, cell, date, data) {
	 	        target.val(date.getFullYear() + '/' + (date.getMonth() + 1) + '/' + date.getDate());

	 	        if (data != null) {
	 	            alert(data.message + '\n' + date);
	 	        }
	 	    }
	 	}).glDatePicker(true);


	 	var to = $('#todatesearch').glDatePicker(
	 	{
	 	    showAlways: false,
	 	    onClick: function (target, cell, date, data) {
	 	        target.val(date.getFullYear() + '/' + (date.getMonth() + 1) + '/' + date.getDate());

	 	        if (data != null) {
	 	            alert(data.message + '\n' + date);
	 	        }
	 	    }
	 	}).glDatePicker(true);

	 	$('#todatesearch').click(function() {
	 	    var fechaFrom = new Date($("#fromdatesearch").val());
	 	    var toLimit = new Date();
	 	    toLimit.setDate(fechaFrom.getDate() + 31);
	 	    to.options.selectableDateRange = [{
	 	        from: fechaFrom,
	 	        to: toLimit
	 	    }, ],
	 	    to.options.showAlways = false;
	 	    to.render();
	 	});
		</script> 