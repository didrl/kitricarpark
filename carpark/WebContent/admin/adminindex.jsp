<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/header/init.jsp" %> 
<%@include file="/admin/common/sidebar.jsp" %>

<%
List<StatsChangeUserDto> changeUserList = (List<StatsChangeUserDto>) session.getAttribute("changeUserList"); 
List<StatsGoodBehaviorUsersDto> goodBehaviorUserList = (List<StatsGoodBehaviorUsersDto>) session.getAttribute("goodBehaviorUserList"); 
List<StatsGoodUseUserDto> goodUseUserList = (List<StatsGoodUseUserDto>) session.getAttribute("goodUseUserList"); 
List<StatsPopularParkDto> popularParkList = (List<StatsPopularParkDto>) session.getAttribute("popularParkList"); 

%>
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
    var data = google.visualization.arrayToDataTable([
     ['주차장 이름', '예약 횟수', '즐겨찾기 횟수', '평점'],
<%
	int ppsize=popularParkList.size();
	int i=0;
for(StatsPopularParkDto ppd : popularParkList){
	i++;
%>
     ['<%=ppd.getPark_name()%>',<%=ppd.getRcount()%>,<%=ppd.getFcount()%>,<%=ppd.getPark_avgpoint()%>]
<%
	if(i<ppsize){
		%>
     	,
     <%
	}
}
%>
  ]);

	var options = {
	  title : '인기 주차장 통계정보',
	  hAxis: {title: '주차장 이름'},
	  vAxis: {title: '인기도'},
	  seriesType: 'bars',
	  series: {2: {type: 'line'}}
	};
	
	var chart = new google.visualization.ComboChart(document.getElementById('popularPark'));
	chart.draw(data, options);
}

function drawGoodUseCustomerChart() {
    // Some raw data (not necessarily accurate)
    var data = google.visualization.arrayToDataTable([
     ['고객 아이디', '예약 횟수', '즐겨찾기 횟수', '평점'],
<%
	int uusize=goodUseUserList.size();
	int j=0;
for(StatsGoodUseUserDto sguu : goodUseUserList){
	i++;
%>
     ['<%=sguu.getUser_id()%>',<%=sguu.getRcount()%>,<%=sguu.getFcount()%>,<%=sguu.getUser_avgpoint()%>]
<%
	if(j<uusize){
		%>
     	,
     <%
	}
}
%>
  ]);

	var options = {
	  title : '우수 이용 고객 통계정보',
	  hAxis: {title: '고객 아이디'},
	  vAxis: {title: '사용률'},
	  seriesType: 'bars',
	  series: {2: {type: 'line'}}
	};
	
	var chart = new google.visualization.ComboChart(document.getElementById('goodUseCustomer'));
	chart.draw(data, options);
  }
  
function drawGoodBehaviorCustomerChart() {
    // Some raw data (not necessarily accurate)
    var data = google.visualization.arrayToDataTable([
     ['고객 아이디', '평점', '벌점'],
<%
	int busize=goodBehaviorUserList.size();
	int k=0;
for(StatsGoodBehaviorUsersDto bgu : goodBehaviorUserList){
	i++;
%>
     ['<%=bgu.getUser_id()%>',<%=bgu.getUser_avgpoint()%>,<%=bgu.getPenalty()%>]
<%
	if(k<busize){
		%>
     	,
     <%
	}
}
%>
  ]);

	var options = {
	  title : '우수 고객 통계정보',
	  hAxis: {title: '고객 아이디'},
	  vAxis: {title: '상벌점'},
	  seriesType: 'bars'
	};
	
	var chart = new google.visualization.ComboChart(document.getElementById('goodBehaviorCustomer'));
	chart.draw(data, options);
  }
  
function drawCustomerChangeChart() {
    var data = google.visualization.arrayToDataTable([
      ['가입일', '누적 회원수'],
      <%
  	int cusize=changeUserList.size();
  	int l=0;
  for(StatsChangeUserDto cul : changeUserList){
  	i++;
  %>
       ['<%=cul.getLogtime()%>',<%=cul.getSumover()%>]
  <%
  	if(l<cusize){
  		%>
       	,
       <%
  	}
  }
  %>
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
                    <div class="btn-group" role="group" aria-label="">
	  				<button type="button" class="btn btn-default"  id="popularParkBtn">
	  					인기 주차장
	  				</button>
	  				<button type="button" class="btn btn-default"  id="goodUseCustomerBtn">
	  					우수이용 고객
	  				</button>
	  				<button type="button" class="btn btn-default"  id="goodBehaviorCustomerBtn">
	  					우수활동 고객
	  				</button>	
	  				<button type="button" class="btn btn-default"  id="customerChangeBtn">
	  					이용자 변동 현황
	  				</button>		
	  				<button type="button" class="btn btn-default"  id="bestComplainBtn">
	  					불만사항
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

<!-- 
/////For Popular Parking space//////

select rownum, a.park_id,a.rcount,a.fcount,a.park_name,a.park_avgpoint
from(
select distinct pd.park_id, pd.park_avgpoint,nvl(r.rcount,0) rcount,nvl( f.fcount,0) fcount,nvl((r.rcount+f.fcount),0) point,p.park_name
from (select park_id, count(park_id) rcount
			from reservation
			group by park_id
			order by rcount desc) r,
		(select park_id, count(park_id) fcount
		from favorite
		group by park_id
		order by fcount desc) f, parking_detail pd,parking p
where r.park_id(+)=pd.park_id and
			f.park_id (+)= pd.park_id and
			pd.park_id = p.park_id
order by  point desc) a
where rownum <11
/////////////////////////////////////////////////////////////////////


//////For Good Behavior Customer//////////////////////////////////
select rownum, a.user_id, a.user_avgpoint, a.penalty
from (select user_id, user_avgpoint, penalty
			from member
			order by user_avgpoint desc, penalty) a
where rownum<11
/////////////////////////////////////////////////////////////////////


///////////// For Good Use Customer///////////////////////////////
select rownum, a.user_id,a.rcount,a.fcount,a.user_avgpoint
from(
select distinct m.user_id, m.user_avgpoint,nvl(r.rcount,0) rcount,nvl( f.fcount,0) fcount,nvl((r.rcount+f.fcount),0) point
from (select user_id, count(user_id) rcount
			from reservation
			group by user_id
			order by rcount desc) r,
		(select user_id, count(user_id) fcount
			from favorite
			group by user_id
			order by fcount desc) f, member m
where r.user_id(+)=m.user_id and
			f.user_id (+)= m.user_id
order by  point desc) a
where rownum <11
//////////////////////////////////////////////////////////////

//////// Customer Change ///////////////
select rownum, a.logtime, a.sumover
from(
			select logtime,  sum(count(user_id)) over (order by logtime) as sumover
			from member
			group by logtime
			order by logtime) a
where rownum<16
///////////////////////////////////////////////////////
 -->
