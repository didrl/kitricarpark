<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.carpark.admin.model.*"%>
<%
List<ParkingDto> list = (List<ParkingDto>)request.getAttribute("searchlist");
%>    

<!DOCTYPE html>
<html lang="en">

<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp" %> 

<!-- Simple Celander -->
<link rel="stylesheet" href="/carpark/css/calendar/style.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="/carpark/js/calendar/calendar.js"></script>
<!-- Simple Celander -->


<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- Tmap -->
<script
	src="https://apis.skplanetx.com/tmap/js?version=1&format=javascript&appKey=a4ea8cc9-e49c-308f-99de-3aadb0c70298"></script>
<script type="text/javascript" src="/carpark/js/search/mapsearch.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
$(document).ready(function() {
	var key = document.getElementById("key");
	var word = document.getElementById("word");
     jQuery.ajax({
           type:"GET",
           url:"/carpark/member",
           dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
           data:"",
           success : function(data) {
                 // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
                 // TODO
           },
           error : function(xhr, status, error) {
                 alert("에러발생");
           }
     });
});
</script>

<br><br><br><br>
	
    <!-- Page Content -->
	<div class="container" style="text-align:center">
						<!--  search bar start -->
			<div class="col-sm-13">
					<!-- /input-group -->
					<form id="searchForm" class="form-inline" role="form" method="post" >
						<input type="hidden"  name="act" value="mvSearchResult">
						<div class="input-group">
							<input type="text" class="form-control" id="citysearch"	placeholder="Search for..."> 
							<span	class="input-group-btn">
								<button class="btn btn-default" type="button">Go!</button>
							</span>
						</div>
						<div class="input-group">
								<input class="date-picker" id="fromdatesearch" type="text"  />
						</div>
	
						<div class="input-group">
								<input class="date-picker" id="todatesearch" type="text"  />
						</div>
						<div class="input-group">
							<button class="btn btn-success" type="button" onclick="javascript:goSearchResult();">Search</button>
						</div>
					</form>
				</div>
				<br><br>
				<!--  search bar end-->
		
		
		
		<!-- Left List Group Strat -->
		
		<h3><b>도시이름 </b>&nbsp;&nbsp;검색 결과</h3>
				
   		<div class="col-md-4" style="overflow:scroll ; height: 600px;">
				<ul class="list-group">
				<!--  for-->
			
<%
for(ParkingDto parkingDto :list){
%>
				<a href="<%=root%>/member?act=mvSearchResultDetail&parkingid=<%=parkingDto.getPark_id()%> 
				&parkingname=<%=parkingDto.getPark_name()%>&latitude=<%=parkingDto.getLatitude()%>
				&longitude=<%=parkingDto.getLongitude()%>" class="list-group-item">					
				<form id="parkListForm" name="parkListForm" class="form-inline" 
				role="form" method="post">
					<input type="hidden" name="act" value="mvSearchResultDetail">
					<input type="hidden" name="id" value="<%=parkingDto.getPark_id()%>">
					<input type="hidden" name="name" value="<%=parkingDto.getPark_name()%>">
					<input type="hidden" name="latitude" value="<%=parkingDto.getLatitude()%>">
					<input type="hidden" name="longitude" value="<%=parkingDto.getLongitude()%>">
					
						<h4 class="list-group-item-heading"><%=parkingDto.getPark_name() %></h4>
						<div class="ratings">
                        <p class="pull-right">
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            (4점)
                        </p>
                    </div>
						<p class="list-group-item-text">역에서 도보로 3분 다양한 회사들 밀집</p>
				</form>
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
                <div class="panel panel-default" id="divformap">
                    <section id="contact" class="map">
						<div id="map_div"></div>
					</section>
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

    </div>
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
		// 맵 위에서 마우스 휠, 키보드 방향키가 동작하지 않도록 막음
		$('#map_div').on('scroll touchmove mousewheel', function(e){
			e.preventDefault();
			e.stopPropagation();
			return false;
		});
	</script>
	<script src="/carpark/js/selectlist/jquery.selectlist.js"></script>
		<script type="text/javascript">
			$(function(){
				$('select').selectlist({
					zIndex: 10,
					width: 100,
					height: 30
				});		
			})
			
</script>



<!-- ****************************************************************************************************************** -->

<%@ include file="/common/footer.jsp" %>	