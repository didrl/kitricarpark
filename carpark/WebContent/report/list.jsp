<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/common/common.jsp" %>
<%@include file="/common/header.jsp" %> 
<%@include file="/common/side.jsp" %>

	<div id="wrapper">

<!-- ****************************************************************************************************************** -->	

		<!-- 메인 -->
        <div id="page-wrapper">
        
        
 

			<!-- 신고리스트 -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            신고내역
                        </h1>
                    
                    </div>
                </div>
                
                
	            <!-- 신고하기 -->
	            <p>
				<button type="button" class="btn btn-default" data-toggle="modal" data-target="#report">
					신고
				</button>
				</p>
		         		
		        <!-- 신고 모달 -->
				<div class="modal fade" id="report" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				    <div class="modal-dialog">
				        <div class="modal-content">
				           	<div class="modal-header">
				               	<button type="button" class="close" data-dismiss="modal">
				                    <span aria-hidden="true">×</span><span class="sr-only">Close</span>
				                </button>
				                <center>
					                <h4 class="modal-title" id="myModalLabel">신고하기</h4>
				                </center>
				            </div>
				               	
					        <div class="modal-body">
							    <div class="row">
									<div class="col-md-2">
										<b>신고목록</b>
									</div>
			                        <div class="form-group">
			                        	<label>Selects</label>
			                            <select class="form-control">
			                            	<option>1</option>
			                                <option>2</option>
			                                <option>3</option>
			                                <option>4</option>
			                                <option>5</option>
			                            </select>
			                    	</div>
								</div><hr>
						
								<div class="row">
									<div class="form-group">
										<div class="col-md-2">
											<label for="form-title">제목</label>
										</div>
										<div class="col-md-10">
											<input type="text" class="form-control" name="title" id="form-title" placeholder="제목을 적어주세요.">
										</div>
									</div>
								</div><hr>
								
								<div class="row">
									<div class="form-group">
										<div class="col-md-2">
											<label for="form-author">내용</label>
										</div>
										<div class="col-md-10">
											<textarea class="form-control" rows="10" name="description"  id="form-author" placeholder="본문을 적어주세요."></textarea>
										</div>
									</div>
								</div><hr>	
							
								<div class="row">
									<center>
										<p>
						  					<button type="button" class="btn btn-primary btn-lg">등록</button>
										</p>
									</center>
								</div>	
							</div>
							               		
						</div>
					</div>
				</div>
				<!-- 신고 모달 -->

                <div class="list-group">
				  <a href="#" class="list-group-item">신고1</a>
				  <a href="#" class="list-group-item">신고2</a>
				  <a href="#" class="list-group-item">신고3</a>
				  <a href="#" class="list-group-item">신고4</a>
				  <a href="#" class="list-group-item">신고5</a>
				  <a href="#" class="list-group-item">신고6</a>
				  <a href="#" class="list-group-item">신고7</a>
				  <a href="#" class="list-group-item">신고8</a>
				  <a href="#" class="list-group-item">신고9</a>
				</div>
                
            </div>
            <!-- /.container-fluid -->
            <!-- 신고리스트 -->

            

        </div>
        <!-- /#page-wrapper -->
		<!-- 메인 -->

<!-- ****************************************************************************************************************** -->	

    </div>
    <!-- /#wrapper -->
    
<%@ include file="/common/footer.jsp" %>
