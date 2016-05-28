<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp" %> 
<%@include file="/common/side.jsp" %>


<div id="wrapper">
<%
if(memberDto!=null){ 
%>

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
					<div class="col-lg-5">
						<form role="form">
						
							<div class="form-group">
									<label ><h3>내 사진</h3></label><br>
									<img src="<%=root%>/img/bg.jpg" class="img-circle" width="200" height="200" border="5" align="middle">
									
							</div>
							<div class="form-group">   
							
							<div class="form-group">
                                    <label for="disabledSelect">이름</label>
                                    <input class="form-control" id="disabledInput" type="text" placeholder="<%=memberDto.getUser_name() %>" disabled>
                            </div>

							<div class="form-group">
                                    <label for="disabledSelect">아이디</label>
                                    <input class="form-control" id="disabledInput" type="text" placeholder="<%=memberDto.getUser_id() %>" disabled>
                            </div>

                            
                            <div class="form-group">
                                    <label for="disabledSelect">이메일</label>
                                    <input class="form-control" id="disabledInput" type="text" placeholder="<%=memberDto.getEmail() %>" disabled>
                            </div>
                              	   
                            </div>
						</form>
					</div>

					<div class="col-lg-5">
						<form role="form" name="" method="post" action="<%=root%>/member">
							<input type="hidden" name="act" value="mvProfileDetail">
							<div class="form-group" data-toggle="buttons" align="right">
  								<label class="btn btn-primary active">
    								<input type="radio" name="options" id="option1" autocomplete="off" 
    								checked > 게스트
  								</label>
  								<label class="btn btn-primary">
    							<input type="radio" name="options" id="option2" autocomplete="off"> 호스트
  								</label>
							</div>
							
							<div class="form-group" align="center">
							<label for="disabledSelect">나의 등급</label> 
<%
	for(int i=0;i<memberDto.getGrade_id();i++){							
%>  
                                <img src="<%=root%>/img/star.png" width="25" height="25">
<%
	}
%>	
							</div>
							
							<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  								<div class="panel panel-default">
								    <div class="panel-heading" role="tab" id="headingOne">
								      <h4 class="panel-title">
								        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
								          	등급 혜택 정보
								        </a>
								      </h4>
								    </div>
								    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
								      <div class="panel-body">
								        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
								      </div>
								    </div>
								  </div>
								  </div>
							
						
							<div class="form-group">
                                    <label for="disabledSelect">나의 주차장</label>
                                    <input class="form-control" id="disabledInput" type="text" placeholder="<%=memberDto.getUser_name() %>" disabled>
                            </div>

                                                
                        	<div class="form-group" align="center"> 
                           	 	<button type="submit" class="btn btn-default">상세정보 보기</button>
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

<%
}else{
%>
<script type="text/javascript">
document.location.href="<%=root%>/member";
</script>
<%
}
%>
	</div>
	<!-- /#wrapper -->
<!-- Footer -->
<%@include file="/common/footer.jsp" %>
<!-- /Footer -->

