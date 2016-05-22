<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.carpark.member.model.*"%>
<%
String root = request.getContextPath();
MessageDto messageDto = (MessageDto) request.getAttribute("messageView");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- ********************************** javascript ******************************************************** -->
<script type="text/javascript">
function messageSearch() {
	if(document.messageForm.word.value == ""){
		alert("내용을 입력하세요");
		return;
	} else{
		document.messageForm.action = "/carpark/message";
		document.messageForm.submit();
	}
}

function messageView(seq) {
	document.getElementById("act").value = "messageView";
	document.getElementById("seq").value = seq;
		
	document.common.action = "/carpark/message";
	document.common.submit();
	
}

function messageDelete(seq) {
	document.getElementById("act").value = "messageDelete";
	document.getElementById("seq").value = seq;
		
	document.common.action = "/carpark/message";
	document.common.submit();
}

function messageList() {
	document.getElementById("act").value = "messageList";
		
	document.common.action = "/carpark/message";
	document.common.submit();
}

</script>
    <!-- Bootstrap Core CSS -->
    <link href="<%=root %>/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=root %>/css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=root %>/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]--> 
</head>
<div id="wrapper">

<!-- ****************************************************************************************************************** -->
		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">SB Admin</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
            	<li>
                    <button type="button" class="btn btn-default navbar-btn" data-toggle="modal" data-target="#myLogin">
					Login
					</button>
					&nbsp;&nbsp;
                </li>
                <li>
               		 <button type="button" class="btn btn-default navbar-btn" data-toggle="modal" data-target="#mySignUp">
						SignUp
					</button>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu message-dropdown">     
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-footer">
                            <a href="#">Read All New Messages</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu alert-dropdown">
                        <li>
                            <a href="#">Alert Name <span class="label label-default">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-primary">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-success">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-info">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-warning">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-danger">Alert Badge</span></a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">View All</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> 이름 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
           
            <!-- /.navbar-collapse -->
        </nav>
        
 <!-- ****************************************************************************************************************** -->
        
        <!-- login modal popup -->
		<div class="modal fade" id="myLogin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
			    	<div class="modal-header">
			        	<button type="button" class="close" data-dismiss="modal">
			            	<span aria-hidden="true">×</span><span class="sr-only">Close</span>
			            </button>
			            <h4 class="modal-title" id="myModalLabel">Modal title</h4>
			        </div>
					<div class="modal-body">
				                
					<form class="form-horizontal">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" id="inputEmail3" placeholder="Email">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="inputPassword3" placeholder="Password">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">
									<label>
										<input type="checkbox"> Remember me
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">Sign in</button>
							</div>
						</div>
					</form>  
				           
			 		</div>
				</div>
			</div>
		</div>
	
<!-- ****************************************************************************************************************** -->
	
		<!-- join modal popup -->
		<div class="modal fade" id="mySignUp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h2 class="modal-title" id="myModalLabel">회원가입</h2>
					</div>
				<div class="modal-body">

					<form role="form" name="signup" method="post" action="">
						<div class="form-group">
							<label for="name">name</label> 
							<input type="text" class="form-control" id="name" placeholder="name">
						</div>
						<div class="form-group">
							<label for="password">id</label> 
							<input type="text" class="form-control" id="id" placeholder="id">
						</div>
						<div class="form-group">
							<label for="Password">Password</label> 
							<input type="password" class="form-control" id="password" placeholder="password">
						</div>
						<div class="form-group">
							<label for="PasswordCheck">PasswordCheck</label> 
							<input type="password" class="form-control" id="passwordcheck" placeholder="passwordcheck">
						</div>
						<div class="form-group">
							<label for="Email">Email address</label> 
							<input type="text" class="form-control" id="email" placeholder="email">
						</div>
						<div class="form-group">
							<label for="Address">address</label> 
							<input type="text" class="form-control" id="address" placeholder="address">
						</div>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">Register</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				</div>
				</div>
			</div>
		</div>
		<!-- Navigation -->
		
<!-- ****************************************************************************************************************** -->
		
		<!-- side -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
 			<ul class="nav navbar-nav side-nav">
		    	<li class="active">
		        	<a href=""><i class="fa fa-fw fa-file"></i> 내 정보 </a>
		       	</li>
        		<li>
      				<a href="javascript:;" data-toggle="collapse" data-target="#member"><i class="fa fa-fw fa-arrows-v"></i> 개인정보관리 <i class="fa fa-fw fa-caret-down"></i></a>       
    				<ul id="member" class="collapse">
		        		<li>
		            		<a href=""> 내 정보 </a>
		        		</li>
		        		<li>
		           			<a href=""> 내 주차장 </a>
				        </li>
				        <li>
				            <a href=""> 코인관리 </a>
				        </li>
    				</ul>
        		</li>
                    
		        <li>
		        	<a href="javascript:;" data-toggle="collapse" data-target="#favorite"><i class="fa fa-fw fa-arrows-v"></i> 즐겨찾기 <i class="fa fa-fw fa-caret-down"></i></a>
		            <ul id="favorite" class="collapse">
		            	<li>
		            		<a href=""> 즐겨찾기목록 </a>
		                </li>
		                <li>
		                    <a href=""> ?!?! </a>
		                </li>
		            </ul>
		        </li>
                    
		        <li>
		        	<a href="javascript:;" data-toggle="collapse" data-target="#reservation"><i class="fa fa-fw fa-arrows-v"></i> 예약정보 <i class="fa fa-fw fa-caret-down"></i></a>
		            <ul id="reservation" class="collapse">
		            	<li>
		                	<a href=""> 예약내역 </a>
		                </li>
		                <li>
		                	<a href=""> 진행중/완료목록?? </a>
		                </li>
		                       
		            </ul>
		        </li>
        
		        <li>
		        	<a href="javascript:;" data-toggle="collapse" data-target="#message"><i class="fa fa-fw fa-arrows-v"></i> 쪽지함 <i class="fa fa-fw fa-caret-down"></i></a>
		            <ul id="message" class="collapse">
		            	<li>
		                	<a href="<%=root%>/message/list.jsp"> 받은쪽지함 </a>
		                </li>
		                <li>
		                	<a href=""> 보낸쪽지함 </a>
		                </li>       
		                <li>
		                	<a href="<%=root%>/message/write.jsp"> 쪽지보내기 </a>
		                </li>       
		                <li>
		                	<a href=""> 보관한쪽지함 </a>
		                </li>       
		                <li>
		                	<a href=""> 공지쪽지함 </a>
		                </li>       
		                <li>
		                	<a href=""> 삭제한쪽지함 </a>
		                </li>       
		                <li>
		                	<a href=""> 스팸쪽지함 </a>
		                </li>   
		                <li>
		                	<a href=""> 차단목록 </a>
		                </li>   
		                <li>
		                	<a href=""> 주소록 </a>
		                </li>   
		   
		            </ul>
		        </li>
        
		        <li>
		        	<a href="javascript:;" data-toggle="collapse" data-target="#qna"><i class="fa fa-fw fa-arrows-v"></i> 문의내역 <i class="fa fa-fw fa-caret-down"></i></a>
		            <ul id="qna" class="collapse">
		                <li>
		                	<a href=""> 자주 묻는 질문 </a>
		                </li>
		            	<li>
		                	<a href=""> 문의내역 </a>
		                </li>
		            	<li>
		                	<a href=""> 답변받은목록? </a>
		                </li>
		            </ul>
		        </li>
        
		        <li>
		        	<a href="javascript:;" data-toggle="collapse" data-target="#report"><i class="fa fa-fw fa-arrows-v"></i> 신고내역 <i class="fa fa-fw fa-caret-down"></i></a>
		            <ul id="report" class="collapse">
		            	<li>
		                	<a href=""> 신고내역 </a>
		                </li>
		                <li>
		                	<a href=""> 진행중/처리완료?? </a>
		                </li>
		                       
		            </ul>
		        </li>
        
			</ul>
                
                
		</div>

<!-- ****************************************************************************************************************** -->
<form name="common" method="get" action="">
	<input type="hidden" name="act" id="act" value="">
	<input type="hidden" name="bcode" id="bcode" value="1">
	<input type="hidden" name="pg" id="pg" value="1">
	<input type="hidden" name="key" id="key" value="">
	<input type="hidden" name="word" id="word" value="">
	<input type="hidden" name="seq" id="seq" value="">
</form>



		<!-- main -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- 쪽지내용 -->
				
				<div class="form-group">
				<form name="messageForm" method="get" action="">
				<input type="hidden" name="act" id="act" value="messageSearch">
				<input type="hidden" name="bcode" id="bcode" value="1">
				<input type="hidden" name="pg" id="pg" value="1">
					<select name="key">
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="user_id">작성자</option>
					</select>
					<input type="text" name="word">
					<input type="button" value="검색" onclick="javascript:messageSearch();">
				</form>
				</div>
<%
if(messageDto != null) {
%> 				
				
				<div class="table-responsive">
				  <table class="table table-hover">
				  <tr>
				  	<th width="100">보낸사람</th><td><%=messageDto.getUserID() %></td>
				  </tr>
				  <tr>
				  	<th width="100">보낸시간</th><td><%=messageDto.getLogtime() %></td>
				  </tr>
				  <tr>
				  	<th colspan="2"><p><%=messageDto.getContent() %></p></td>
				  </tr>
				  </table>
				</div>
<%
} else {
%>
<center>
	<h3>글이 없습니다</h3>
				<div class="table-responsive">
				  <table class="table table-hover">
				  <tr>
				  	<th width="100">보낸사람</th><td>test</td>
				  </tr>
				  <tr>
				  	<th width="100">보낸시간</th><td>test</td>
				  </tr>
				  <tr>
				  	<th colspan="2"><p>test</p></td>
				  </tr>
				  </table>
				</div>
</center>
<%
}
%>
				<input type="button" value="목록" onclick="javascript:messageList();">
				<input type="button" value="삭제" onclick="javascript:messageDelete('<%=messageDto.getSeq()%>');">
				
			</div>
		</div>

<!-- ****************************************************************************************************************** -->	
	
	
</div>




    <!-- jQuery -->
    <script src="<%=root %>/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%=root %>/js/bootstrap.min.js"></script>

</body>

</html>