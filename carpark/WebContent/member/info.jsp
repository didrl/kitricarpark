<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@include file="/common/common.jsp" %>
<%@include file="/common/header.jsp" %> 
<%@include file="/common/side.jsp" %>

<% 
MemberDto memberDto = (MemberDto)request.getAttribute("Info");
int count = (Integer)request.getAttribute("count");
%>
	<div id="wrapper">

<!-- ****************************************************************************************************************** -->	

		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Profile</h1>
						<ol class="breadcrumb">
							<li><i class="fa fa-dashboard"></i> <a href="index.html">Dashboard</a>
							</li>
							<li class="active"><i class="fa fa-edit"></i> Profile</li>
						</ol>
					</div>
				</div>
				<!-- /.row -->
				
				<!-- form container -->
				<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<form role="form">
							<div class="form-group">
								
								<label ><h3>내 사진</h3></label><br> 
							
								<img src="<%=root%>/img/bg.jpg" class="img-circle" width="200" height="200" border="5">
							</div>
							<div class="form-group">        	
                             	<img src="<%=root%>/img/car.png" width="25" height="25">
                                	<label for="disabledSelect">
                                		<h4>Bookings Made : </h4>
                                	</label><br>
                               
                                <img src="<%=root%>/img/home.png" width="25" height="25">
                                	<label for="disabledSelect">
                                		<h4>Bookings Received : </h4>
                                	</label><br>    
                                	
                                <img src="<%=root%>/img/coin.png" width="25" height="25">
                                	<label for="disabledSelect">
                                		<h4>My coin :<%=memberDto.getCoin() %> </h4>
                                	</label><br>
                                	
                                <img src="<%=root%>/img/star.png" width="25" height="25">
                                	<label for="disabledSelect">
                                		<h4>My grade :<%=memberDto.getGrade_id()%> 등급</h4>
                                	</label><br>        
                            </div>
						</form>
					</div>

					<div class="col-lg-4">

						<form role="form">


							<div class="form-group">
                                    <label for="disabledSelect">이름</label>
                                    <input class="form-control" id="disabledInput" type="text" placeholder="이름" disabled>
                            </div>

							<div class="form-group">
                                    <label for="disabledSelect">아이디</label>
                                    <input class="form-control" id="disabledInput" type="text" placeholder="<%=memberDto.getUser_id() %>" disabled>
                            </div>

							<div class="form-group">
                                    <label for="disabledSelect">자동차번호</label>
                                    <input class="form-control" id="disabledInput" type="text" placeholder="<%=memberDto.getCarInfo() %>" disabled>
                            
                            </div>
                       
                            <div class="form-group">
								<div class="row">
									<div class="col-xs-4">
										<label>년도</label> <input type="text" class="form-control"
											placeholder="year" disabled>
									</div>
									<div class="col-xs-3">
										<label>월</label> <input type="text" class="form-control"
											placeholder="month" disabled>
									</div>
									<div class="col-xs-3">
										<label>일</label> <input type="text" class="form-control"
											placeholder="day" disabled>
									</div>
								</div>
							</div>
                            

						</form>
					</div>

				</div>
				</div>
				<!-- /.row -->
				<!-- /.form container -->
						
			</div>
			<!-- /.container-fluid -->

		</div>
		<!-- /#page-wrapper -->




<!-- ****************************************************************************************************************** -->	

	</div>
	<!-- /#wrapper -->
	
<!-- Footer -->
<%@include file="/common/footer.jsp" %>
<!-- /Footer -->

