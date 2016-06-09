<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.carpark.common.model.*"%>
<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp" %> 


<!-- Custom CSS -->
<link href="/carpark/css/shop-item.css" rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script type="text/javascript">
function goSearchResult() {
	if(document.getElementById("citysearch").value  == "") {
		alert("검색하실 도시의 이름을 입력해주세요.");
		return;
	} else if(document.getElementById("fromdatesearch").value  == "") {
		alert("시작일을 입력해주세요.");
		return;
	}else if(document.getElementById("todatesearch").value  == "") {
		alert("종료일을 입력해주세요.");
		return;
	}else{
	document.searchForm.action = "/carpark/member";
	document.searchForm.submit();
	}
}


</script>
<br><br><br><br>
	
    <!-- Page Content -->
	<div class="container" style="text-align:center">
			<%@include file="/common/searchBar.jsp"%>
		<br><br>
		
		
		<!-- Left List Group Strat -->
		
		<h3><b>주차장 제보</b>&nbsp;&nbsp;검색 결과</h3>
				
   		<div class="col-md-4" style="height: 1000px;">
					<div class="modal-header" style="background-color: #00cc00" align="center">
						<h4 class="" id="messageReplyModal" style="color: #FFFFFF">주차장 제보 하기</h4>
					</div>
						<!-- main -->
						<div id="page-wrapper">
							<div class="container-fluid">

								<!-- 쪽지보내기 -->
								<div class="form-group">
									<form class="form-horizontal" name="writeForm" method="post" action="<%=root%>/call">
										<input type="hidden" name="act" value="memberParkRegisterMessage">
										<input type="hidden" name="bcode" value="1"> 
										<input type="hidden" name="pg" value="1"> 
										<input type="hidden" name="key" value=""> 
										<input type="hidden" name="word" value="">

										<div class="form-group">
											<label for="receiver">받는사람</label> <input type="text"
												class="form-control" id="receiver" placeholder="Cpark 관리자"
												style="text-align: center;"  disabled="disabled"  name="receiver" value="">
										</div>
										
										<div class="form-group">
											<label for="subject">제목</label> <input type="text"
												class="form-control" id="subject" name="subject" placeholder="제목">
										</div><hr>
										
										<div class="form-group">
											<div class="col-md-2">
												<b>위치</b><br>
											</div>
											<div class="col-md-10">
												<input type="text" id="parkAddress" class="form-control" placeholder="주소" name="parkAddress" readonly="readonly"><br>
												<button type="button" class="btn btn-default" data-toggle="modal" data-target="#addrSearch">검색</button>
											</div>
											</div><hr>
										
										
										<div class="form-group">
											<label for="content">내용</label>
											<textarea class="form-control" rows="10" id="content"
												name="content" style="resize:none;"></textarea>
										</div>

										<div class="form-group text-center">
											<input class="btn btn-default" id="callBtn" name="callBtn" type="button" 
											value="제보하기" onclick="javascript:parkMessageRegister();">
										</div>

									</form>
								</div>
							</div>
						</div>
			</div>
			<!-- Left List Group End -->
			
			<!-- Right Section -->
            <div class="col-md-8">
				
				<!-- Map -->
				
                <div class="thumbnail">
		                <div class="panel panel-default">
							<div id="daumlistmap" style="width:100%;height:650px;"></div>
							<script src="//apis.daum.net/maps/maps3.js?apikey=4763b9e0f6cbc4102f42cb9f7b0f9167&libraries=services"></script>
							<script>
							function addrMap(data){
								var mapContainer = document.getElementById('daumlistmap'), // 지도를 표시할 div 
								    mapOption = {
								        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
								        level: 6, // 지도의 확대 레벨
								        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
								    }; 					
								
								// 지도를 생성합니다    
								var map = new daum.maps.Map(mapContainer, mapOption); 
								
								// 주소-좌표 변환 객체를 생성합니다
								var geocoder = new daum.maps.services.Geocoder();

								// 주소로 좌표를 검색합니다
								geocoder.addr2coord(data, function(status, result) {

								    // 정상적으로 검색이 완료됐으면 
								     if (status === daum.maps.services.Status.OK) {

								        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
										
								  
								        
								        // 결과값으로 받은 위치를 마커로 표시합니다
								        var marker = new daum.maps.Marker({
								            map: map,
								            position: coords
								        });

								        // 인포윈도우로 장소에 대한 설명을 표시합니다
								        var infowindow = new daum.maps.InfoWindow({
								            content: '<div style="padding:5px;">제보주차장</div>'
								        });
								        infowindow.open(map, marker);
								        
								     // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								        map.setCenter(coords);
								    } 
								});    
							}
							</script>
						</div>
						
						
	                    <div class="caption-full">
	                        <h4><a href="#">Product Name</a>
	                        </h4>
	                        <p>See more snippets like these online store reviews at <a target="_blank" href="http://bootsnipp.com">Bootsnipp - http://bootsnipp.com</a>.</p>
	                        <p>Want to make these reviews work? Check out
	                            <strong><a href="http://maxoffsky.com/code-blog/laravel-shop-tutorial-1-building-a-review-system/">this building a review system tutorial</a>
	                            </strong>over at maxoffsky.com!</p>
	                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
	                    </div>
	                    <div class="ratings">
	                        <p class="pull-right">3 reviews</p>
	                        <p>
	                            <span class="glyphicon glyphicon-star"></span>
	                            <span class="glyphicon glyphicon-star"></span>
	                            <span class="glyphicon glyphicon-star"></span>
	                            <span class="glyphicon glyphicon-star"></span>
	                            <span class="glyphicon glyphicon-star-empty"></span>
	                            4.0 stars
	                        </p>
	                    </div>
	                </div>
                </div>

                <div class="well">

                    <div class="text-right">
                        <a class="btn btn-success">Leave a Review</a>
                    </div>

                    <hr>

                    <div class="row">
                        <div class="col-md-12">
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            Anonymous
                            <span class="pull-right">10 days ago</span>
                            <p>This product was great in terms of quality. I would definitely buy another!</p>
                        </div>
                    </div>

                    <hr>

                    <div class="row">
                        <div class="col-md-12">
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            Anonymous
                            <span class="pull-right">12 days ago</span>
                            <p>I've alredy ordered another one!</p>
                        </div>
                    </div>

                    <hr>

                    <div class="row">
                        <div class="col-md-12">
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            Anonymous
                            <span class="pull-right">15 days ago</span>
                            <p>I've seen some better than this, but not at this price. I definitely recommend this item.</p>
                        </div>
                    </div>

                </div>

            </div>

   
    <!-- /.container -->

        <hr>

	<!-- Custom Theme JavaScript -->
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
											: $('[name=' + this.hash.slice(1)
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
</script>
		
		
		
		
		
<!-- search modal popup -->
<div class="modal fade" id="addrSearch" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="background: #00cc00" align="center">
				<button type="button" class="close" data-dismiss="modal" onclick="javascript:loginConfirm();">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="myModalLabel" style="color: #FFFFFF">주소 검색</h4>
			</div>
					
			
		<form name="zipform" method="get" action="">
		<div style="height: 300px; overflow: scroll;">
		<table width="350">
		<tr>
			<td class="td3">검색할동을 입력하세요<br>(예: 역삼동, 신촌)</td>
		</tr>
		<tr>
			<td class="td4">
				<input type="text" name="dong" id="dong">
				<input type="button" id="addrSearchBtn" value="검색">
			</td>
		</tr>
		
		<tbody id="ml">
		</tbody>	
		</table>
		</div>
		</form>
					
		</div>
	</div>
</div>		

<script type="text/javascript">
$('#addrSearchBtn').click(function(){
	var dong = document.getElementById("dong").value;
	$.ajax({
		type :"GET",
		url : "/carpark/call?act=addrSearch",
			dataType : "json",
			data : {
				"dong" : dong
			},
			success : function(data) {
				console.log('성공 - ', data);
				zipcodeView(data);
			},
			error : function(xhr) {
				console.log('실패 - ', xhr);
			}
		});

	});
	
var ml;

function zipcodeView(data){
	ml = document.getElementById("ml");
	var len = data.ziplist.length;
	clearData();
	for(var i=0; i<len; i++){
		var row = createRow(data.ziplist[i].zip1,data.ziplist[i].zip2,data.ziplist[i].sido,
				  data.ziplist[i].gugun,data.ziplist[i].dong,data.ziplist[i].bungi);
		ml.appendChild(row);
	}
}

function createRow(zip1,zip2,sido,gugun,dong,bungi){
	row = document.createElement("tr");
	row.appendChild(createCell(zip1,zip2,sido,gugun,dong,bungi));
	return row;
}

function createCell(zip1,zip2,sido,gugun,dong,bungi){
	cell = document.createElement("td");
	cell.appendChild(createAtag(zip1,zip2,sido,gugun,dong,bungi));
	return cell;
}

function createAtag(zip1,zip2,sido,gugun,dong,bungi){
	aTag = document.createElement("a");
	aTag.setAttribute("href","javascript:selected('"+sido+" "+gugun+" "+dong+" "+bungi+"');");
	var textnode = document.createTextNode(sido+" "+gugun+" "+dong+" "+bungi);
	aTag.appendChild(textnode);
	return aTag;
}

function clearData() {
	var len = ml.childNodes.length;
	for(var i=len-1;i>=0;i--)
		ml.removeChild(ml.childNodes[i]);
}

function selected(data){
	document.getElementById("parkAddress").value=data;
	addrMap(data);
	$("#addrSearch").modal("hide");
} 
</script>
			
		
		
<%@ include file="/common/footer.jsp" %>	