<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.carpark.common.model.*"%>
<%
List<ParkingDetailDto> list = (List<ParkingDetailDto>)session.getAttribute("searchlist");
String city = (String)request.getParameter("city");
%>    

<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp" %> 

<!-- Simple Celander -->
<link rel="stylesheet" href="/carpark/css/calendar/style.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="/carpark/js/calendar/calendar.js"></script>
<!-- Simple Celander -->

<!-- Damu map -->
<link rel="stylesheet" href="/carpark/css/listmap.css">


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

function goResultDetail() {
	document.parkListForm.action = "/carpark/member";
	document.parkListForm.submit();
}
</script>
<br><br><br><br>
	
    <!-- Page Content -->
	<div class="container" style="text-align:center">
			<%@include file="/common/searchBar.jsp"%>
		<br><br>
		
		
		<!-- Left List Group Strat -->
		
		<h3 align="left"><b>&nbsp;&nbsp;&nbsp;&nbsp;<%=city %> 
		</b>&nbsp;&nbsp;검색 결과</h3>
				
   		<div class="col-md-4" style="overflow:scroll ; height: 600px;">
				<ul class="list-group">
				<!--  for-->
			
<%
ParkingDetailDto parkingDto = new ParkingDetailDto();
ParkingDetailDto parkingDetailDto = new ParkingDetailDto();
%>
<script>
// 마커 클릭시 이동할 페이지를 가지고 있는 객체 배열입니다 
var hrefs = new Array();
</script>
<%
for(int i =0;i<list.size();i++){
	parkingDto = list.get(i);
	int avgpoint = (int) parkingDto.getPark_avgPoint();
//for(ParkingDto parkingDto :list){
%>
				<a href="<%=root%>/member?act=mvSearchResultDetail&parkingid=<%=parkingDto.getPark_id()%> &parkingname=<%=parkingDto.getPark_name()%>&latitude=<%=parkingDto.getLatitude()%>&longitude=<%=parkingDto.getLongitude()%>" class="list-group-item">					
				<form id="parkListForm" name="parkListForm" class="form-inline" role="form" method="post">

					<input type="hidden" name="act" value="mvSearchResultDetail">
					<input type="hidden" name="id" value="<%=parkingDto.getPark_id()%>">
					<input type="hidden" name="name" value="<%=parkingDto.getPark_name()%>">
					<input type="hidden" name="latitude" value="<%=parkingDto.getLatitude()%>">
					<input type="hidden" name="longitude" value="<%=parkingDto.getLongitude()%>">
					
						<h4 class="list-group-item-heading"><%=i+1%>.<%=parkingDto.getPark_name()%></h4>
						<div class="ratings">
                        <p class="pull-right">
                        
                        <div class="text-right">
<!-- 평점정보 가져와야함 -->
						
<% 
		for(int k = 0;k<avgpoint;++k){
%>
									<span class="glyphicon glyphicon-star"></span>
<% 
		}
		for(int k = 0;k<5-avgpoint;++k){
%>
									<span class="glyphicon glyphicon-star-empty"></span>
<% 
		}
%> 

                            (<%=parkingDto.getPark_avgPoint()%>점)
                            </div>
                        </p>
                    </div>
						<%=parkingDto.getContent()%>
				</form>
				

				
				
				<script>
				var getHref="<%=root%>/member?act=mvSearchResultDetail&parkingid=<%=parkingDto.getPark_id()%>&parkingname=<%=parkingDto.getPark_name()%>&latitude=<%=parkingDto.getLatitude()%>&longitude=<%=parkingDto.getLongitude()%>";
				hrefs.push({
					href: getHref
				});
				</script>	
				</a>
				
						
<%
}
%>			
				</ul>
			</div>
			<!-- Left List Group End -->
			
			<!-- Right Section -->
            <div class="col-md-8">
				
				<!-- Map -->
                <div class="thumbnail">
	                
		                <div class="panel panel-default">
		
							<div id="daumlistmap" style="width:100%;height:650px;"></div>
							<script src="//apis.daum.net/maps/maps3.js?apikey=c2d873676f2c4854b2b2c62e165a629d"></script>
							<script>
								var mapContainer = document.getElementById('daumlistmap'), // 지도를 표시할 div 
								    mapOption = {
								        center: new daum.maps.LatLng(<%=parkingDto.getLatitude()%>, <%=parkingDto.getLongitude()%>), // 지도의 중심좌표
								        level: 6, // 지도의 확대 레벨
								        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
								    }; 					
								// 지도를 생성한다 
								var listmap = new daum.maps.Map(mapContainer, mapOption); 					
								// 마우스 드래그와 모바일 터치를 이용한 지도 이동을 막는다
								//listmap.setDraggable(false);							
								// 마우스 휠과 모바일 터치를 이용한 지도 확대, 축소를 막는다
								listmap.setZoomable(false);   	
								
								// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
								var zoomControl = new daum.maps.ZoomControl();
								listmap.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
								
								// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
								var positions = new Array();
<%
for(int i =0;i<list.size();i++){
	parkingDto = list.get(i);
%>						
								positions.push({
										content: '<%=parkingDto.getPark_name()%>',
										latlng: new daum.maps.LatLng(<%=parkingDto.getLatitude()%>, <%=parkingDto.getLongitude()%>)
								});
								
<%
}
%>
								var info_num = 1;
								var content_design = "";
								var content_href="";
								for (var i = 0; i < positions.length; i ++) {			
									content_href= hrefs[i].href;	
									content_link='<a href="'+content_href+'">'+'상세보기'+'</a>';
									// 마커를 생성합니다
								    var marker = new daum.maps.Marker({
								        map: listmap, // 마커를 표시할 지도
								        position: positions[i].latlng // 마커의 위치
								    });
								    var selectedMarker = null;
								    var contentRemoveable = true;
								    
								    //<div style="padding:5px;">'+positions[i].content+'<br>'+content_link+'<br></div>
								    
								    var content_design2 = '<div class="wrap">' + 
						            '    <div class="info">' + 
						            '        <div class="title">' + 
						            positions[i].content + 
						            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
						            '        </div>' + 
						            '        <div class="body">' + 
						            '            <div class="desc">' +
						            '                <div>'+content_link+'</div>' + 
						            '            </div>' + 
						            '        </div>' + 
						            '    </div>' +    
						            '</div>';
						            
						            var content_design = 
						            	'<div style="padding:5px;">'
						            	+positions[i].content+'<br>'
						            	+content_link+'<br>'
						            	+'</div>';
		
						         // 마커 위에 커스텀오버레이를 표시합니다
						         // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
						        // var overlay = new daum.maps.CustomOverlay({
						          //   content: content_design,
						            // map: listmap,
						             //position: positions[i].latlng  
						         //});
						         
						      // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
						         //daum.maps.event.addListener(marker, 'click', function() {
						           /*   overlay.setMap(listmap);
						         });
 */
						         // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	/* 					         function closeOverlay() {
						             overlay.setMap(null);     
						         }
	 */					         

						            
					            // 인포윈도우를 생성하고 지도에 표시합니다
								    /* var infowindow = new daum.maps.InfoWindow({
								        map: listmap, // 인포윈도우가 표시될 지도
								        position: positions[i].latlng, 
								        //content: '<div>'+info_num+""+content_link+'</div>'
								        content: '<div>'+info_num+""+'</div>'
								    }); */
								 	
								    var infowindow2 = new daum.maps.InfoWindow({
								    	//content: '<div style="padding:5px;">'+positions[i].content+'<br>'+content_link+'<br></div>',
								    	content: content_design
								    	//removable : contentRemoveable
								    });
								   
								    // 아래 코드는 인포윈도우를 지도에서 제거합니다
								    // infowindow.close();        

								    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
								    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
								    (function(marker,infowindow2) {
								        /* // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
								        daum.maps.event.addListener(marker, 'mouseover', function() {
								        	infowindow.close();
								        	infowindow2.open(listmap, marker);
								        });

								        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
								        daum.maps.event.addListener(marker, 'mouseout', function() {
								            infowindow2.close();
								            infowindow.open(listmap,marker);
								        }); */
								        
								        //마커 클릭이벤트
								        daum.maps.event.addListener(marker, 'click', function() {
								        	// 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
								            // 마커에 상세 인포윈도우를 보여줍니다. 
								            if (!selectedMarker || selectedMarker !== marker) {
								                // 현재 클릭된 마커에 상세인포윈도우를 띄웁니다
								                //infowindow.close();
									        	infowindow2.open(listmap, marker);
									        	// 클릭된 마커 객체가 null이 아니면
									            // 클릭된 마커의 이미지를 기본 이미지로 변경하고
									            //!!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);
									        	// 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
									            selectedMarker = marker;
								            }else if(selectedMarker == marker){
								            	infowindow2.close();
									            //infowindow.open(listmap,marker);
								            }
								            
								        });
								        
								    })(marker, infowindow2); 
								    
								    info_num++;
								}
								
								
							</script>
			</div>
	                    
	                    
	                </div>
                </div>
<!-- 
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

        </div>

    </div> -->
    <!-- /.container -->

    <div class="container">

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
		
<%@ include file="/common/footer.jsp" %>	