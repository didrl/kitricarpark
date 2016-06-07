<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/header/init.jsp" %> 
<%@include file="/admin/common/sidebar.jsp" %>

<!-- for hide or show div -->
<style>
.hidden{display:none;}
</style>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load("current", {packages:["corechart"]});
google.charts.setOnLoadCallback(drawPopularParkChart);

function drawBestComplainChart() {
	 var data = google.visualization.arrayToDataTable
	 ([
		 ['Task', 'Hours per Day'],
		 ['Work',     11],
		 ['Eat',      2],
		 ['Commute',  2],
		 ['Watch TV', 2],
		 ['Sleep',    7]
	]);

	 var options = {
			 title: 'My Daily Activities'
				 };

	 var chart = new google.visualization.PieChart(document.getElementById('bestComplain'));
	 chart.draw(data, options);
}

function drawPopularParkChart() {
    // Some raw data (not necessarily accurate)
    var data = google.visualization.arrayToDataTable([
     ['월', '가', 'Ecuador', 'Madagascar', 'Papua New Guinea', 'Rwanda', 'Average'],
     ['2004/05',  165,      938,         522,             998,           450,      614.6],
     ['2005/06',  135,      1120,        599,             1268,          288,      682],
     ['2006/07',  157,      1167,        587,             807,           397,      623],
     ['2007/08',  139,      1110,        615,             968,           215,      609.4],
     ['2008/09',  136,      691,         629,             1026,          366,      569.6]
  ]);

	var options = {
	  title : 'Monthly Coffee Production by Country',
	  vAxis: {title: '사용량'},
	  hAxis: {title: '월'},
	  seriesType: 'bars',
	  series: {5: {type: 'line'}}
	};
	
	var chart = new google.visualization.ComboChart(document.getElementById('popularPark'));
	chart.draw(data, options);
}

function drawGoodUseCustomerChart() {
	   var data = google.visualization.arrayToDataTable
	   ([
	   		["Element", "Density", { role: "style" } ],
	        ["Copper", 8.94, "#b87333"],
	        ["Silver", 10.49, "silver"],
	        ["Gold", 19.30, "gold"],
	        ["Platinum", 21.45, "color: #e5e4e2"]
	   ]);

	   var view = new google.visualization.DataView(data);
	   view.setColumns
	   ([0, 1,{ calc: "stringify", 
		   sourceColumn: 1,
			type: "string",
	        role: "annotation" },
	        2]);

	   var options = {
	   		title: "Density of Precious Metals, in g/cm^3",
	        width: 600,
	        height: 400,
	        bar: {groupWidth: "95%"},
	        legend: { position: "none" },
	   };
	   var chart = new google.visualization.BarChart(document.getElementById("goodUseCustomer"));
	   chart.draw(view, options);
  }
  
function drawGoodBehaviorCustomerChart() {
	   var data = google.visualization.arrayToDataTable
	   ([
	   		["Element", "Density", { role: "style" } ],
	        ["Copper", 8.94, "#b87333"],
	        ["Silver", 10.49, "silver"],
	        ["Gold", 19.30, "gold"],
	        ["Platinum", 21.45, "color: #e5e4e2"]
	   ]);
	
	  var view = new google.visualization.DataView(data);
	  view.setColumns([0, 1,
	  		{ calc: "stringify",
	        sourceColumn: 1,
	        type: "string",
	        role: "annotation" },2]);

	 var options = {
	 	title: "Density of Precious Metals, in g/cm^3",
	    width: 600,
	    height: 400,
	    bar: {groupWidth: "95%"},
	    legend: { position: "none" },
	 };
	 var chart = new google.visualization.BarChart(document.getElementById("goodBehaviorCustomer"));
	 chart.draw(view, options);
  }
  
function drawCustomerChangeChart() {
    var data = google.visualization.arrayToDataTable([
      ['Year', 'Sales', 'Expenses'],
      ['2004',  1000,      400],
      ['2005',  1170,      460],
      ['2006',  660,       1120],
      ['2007',  1030,      540]
    ]);

    var options = {
      title: 'Company Performance',
      curveType: 'function',
      legend: { position: 'bottom' }
    };

    var chart = new google.visualization.LineChart(document.getElementById('customerChange'));

    chart.draw(data, options);
  }
</script>


    <div id="wrapper">


        <div id="page-wrapper">

            <div class="container-fluid">
            </div>
            <!-- /.container-fluid -->
<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Flot Charts -->
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header"> 사이트 통계 </h2>
                    </div>
                    <div class="btn-group" role="group" aria-label="...">
                    <!-- 
	                    - 인기 주차장(예약이 많은 곳, 평점이 높은 곳) 	// 콤보차트
						- 가장 많이 사용한 사람	// 막대
						- 가장 많은 불만내용		// pie
						- 인기좋은 자(평점 높은 사용자- 호스트/평점 높은 사용자- 게스트)	// 막대
						- 기간 별 이용자수 증가량 	// 꺾은선
                     -->
	  				<button type="button" class="btn btn-default"  id="popularParkBtn">
	  					인기 주차장
	  				</button>
	  				<button type="button" class="btn btn-default"  id="goodUseCustomerBtn">
	  					우수이용 고객
	  				</button>
	  				<button type="button" class="btn btn-default"  id="goodBehaviorCustomerBtn">
	  					우수활동 고객
	  				</button>	
	  				<button type="button" class="btn btn-default"  id="bestComplainBtn">
	  					불만사항
	  				</button>	
	  				<button type="button" class="btn btn-default"  id="customerChange">
	  					이용자 변동 현황
	  				</button>		
				</div>
                </div>
                <!-- /.row -->
				<div id="bestComplain" style="width: 900px; height: 500px;"></div>
				<div id="goodUseCustomer" style="width: 900px; height: 500px;"></div>
				<div id="goodBehaviorCustomer" style="width: 900px; height: 500px;"></div>
				<div id="popularPark" style="width: 900px; height: 500px;"></div>
				<div id="customerChange" style="width: 900px; height: 500px;"></div>
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    </div>
    <!--[if lte IE 8]><script src="js/excanvas.min.js"></script><![endif]-->

<script>
$("#goodUseCustomer").addClass("hidden");
$("#goodBehaviorCustomer").addClass("hidden");
$("#bestComplain").addClass("hidden");
$("#customerChange").addClass("hidden");

$("#popularPark").removeClass("hidden");

$('#popularParkBtn').on('click', function (event) {
	$("#goodUseCustomer").addClass("hidden");
	$("#goodBehaviorCustomer").addClass("hidden");
	$("#bestComplain").addClass("hidden");
	$("#customerChange").addClass("hidden");
	
	$("#popularPark").removeClass("hidden");
	drawPopularParkChart();
});
$('#goodUseCustomerBtn').on('click', function (event) {
	$("#popularPark").addClass("hidden");
	$("#goodBehaviorCustomer").addClass("hidden");
	$("#bestComplain").addClass("hidden");
	$("#customerChange").addClass("hidden");
	
	$("#goodUseCustomer").removeClass("hidden");
	drawGoodUseCustomerChart();
});
$('#goodBehaviorCustomerBtn').on('click', function (event) {
	$("#goodUseCustomer").addClass("hidden");
	$("#popularPark").addClass("hidden");
	$("#bestComplain").addClass("hidden");
	$("#customerChange").addClass("hidden");
	
	$("#goodBehaviorCustomer").removeClass("hidden");
	drawGoodBehaviorCustomerChart();
});
$('#bestComplainBtn').on('click', function (event) {
	$("#goodUseCustomer").addClass("hidden");
	$("#goodBehaviorCustomer").addClass("hidden");
	$("#popularPark").addClass("hidden");
	$("#customerChange").addClass("hidden");
	
	$("#bestComplain").removeClass("hidden");
	drawBestComplainChart();
});
$('#customerChangeBtn').on('click', function (event) {
	$("#goodUseCustomer").addClass("hidden");
	$("#goodBehaviorCustomer").addClass("hidden");
	$("#bestComplain").addClass("hidden");
	$("#popularPark").addClass("hidden");
	
	$("#customerChange").removeClass("hidden");
	drawCustomerChangeChart();
});
</script>
<%@include file="/common/footer.jsp"%>
