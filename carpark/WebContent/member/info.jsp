<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp" %> 
<%@include file="/common/side.jsp" %>

<div id="wrapper">
<%
if(memberDto!=null){
MemberDto getmemberInfo = (MemberDto)session.getAttribute("getmemberInfo");
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
                                    <input class="form-control" id="disabledInputId" type="text" value="<%=memberDto.getUser_id() %>"  disabled>
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
							
							
							<div class="form-group" align="center">
							<label for="disabledSelect">나의 등급</label> 
<%
	for(int i=0;i<getmemberInfo.getGrade_id();i++){							
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
				        <a href="<%=root %>/member?act=mvbenefit" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				          	 <label><h4 style="color: #ff0033" align="center">고객님의 혜택정보</h4></label> 
				        </a>
				      </h4>
				    </div>
<%
if(getmemberInfo!=null){
%>
				    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
				      <div class="panel-body">
			        		
			        		<label>등급 : <%=getmemberInfo.getGrade_name()%></label>  <br>
			        		<label>포인트 : <%=getmemberInfo.getAvgpoint() %></label> <br>
			        		<label>할인율 :<%=getmemberInfo.getBenefit() %> %</label> <br>
			        		<label>벌점사항 :<%=getmemberInfo.getPenalty()%> </label> 
				      </div>
				    </div>
				  </div>
			 </div> 
				   
<%
}else{
%>					    
			 <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
				      <div class="panel-body">
			        	
				      </div>
				    </div>
				  </div>
			 </div> 	
				
<%
}
%>					
						
						
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
alert("잘못된 접근입니다. 다시 시도해주세요.");
document.location.href = "<%=root%>/index.jsp";
</script>
<%
}
%>
	
</div>	
	<!-- /#wrapper -->
<!-- Footer -->
<%@include file="/common/footer.jsp" %>
<!-- /Footer -->

<script type="text/javascript">

$(document).ready(function(){
	
	var id = document.getElementById("disabledInputId").value; 
		$.ajax({
			type :"GET",
			url : "/carpark/member?act=mvbenefit",
			dataType : "json",
			data : {
				"user_id" : id
			},
			 success: function(data) {
			      console.log('성공 - ', data);
			    },
			 error: function(request,status,error) {
			      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
		});
	});

</script>


