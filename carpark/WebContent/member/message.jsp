<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/common/common.jsp" %>
<%@include file="/common/header.jsp" %> 
<%@include file="/common/side.jsp" %>

	<div id="wrapper">

<!-- ****************************************************************************************************************** -->	

		<!-- row -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Message</h1>
						<ol class="breadcrumb">
							<li><i class="fa fa-dashboard"></i> <a href="index.html">Dashboard</a>
							</li>
							<li class="active"><i class="fa fa-edit"></i> Message</li>
						</ol>
					</div>
				</div>
				<!-- /.row -->

				<!-- table create -->
				<div class="row">
					<div class="col-md-10">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">Developers</h3>
								<div class="pull-right">
									<span class="clickable filter" data-toggle="tooltip"
										title="Toggle table filter" data-container="body"> <i
										class="glyphicon glyphicon-filter"></i>
									</span>
								</div>
							</div>
							<div class="panel-body">
								<input type="text" class="form-control" id="dev-table-filter"
									data-action="filter" data-filters="#dev-table"
									placeholder="Filter Developers" />
							</div>
							<table class="table table-hover" id="dev-table">
								<thead>
									<tr>
										<th>#</th>
										<th>상태</th>
										<th>보낸 사람</th>
										<th>주차 시작 날짜</th>
										<th>보낸 시간</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>Kilgore</td>
										<td>Trout</td>
										<td>kilgore</td>
										<td>kilgore</td>
									</tr>
									<tr>
										<td>2</td>
										<td>Bob</td>
										<td>Loblaw</td>
										<td>boblahblah</td>
										<td>kilgore</td>
									</tr>
									<tr>
										<td>3</td>
										<td>Holden</td>
										<td>Caulfield</td>
										<td>penceyreject</td>
										<td>kilgore</td>
									</tr>
								</tbody>
							</table>
							<!-- 주차장 추가 버튼 -->

						</div>
						<!-- /.table create -->

					</div>
					<!-- /.container-fluid -->
					<!-- message button -->
					<div class="row col-md-10 ">
						<div id="content" class="text-center">
							<button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myMessage">쪽지 보내기</button>
							<button type="button" class="btn btn-success btn-lg">쪽지 삭제</button>
						</div>
					</div>
				</div>
				<!-- /#page-wrapper -->

			</div>

		</div>

		<!-- message modal popup -->
	
		<div class="modal fade" id="myMessage" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">쪽지 보내기(이름)</h4>
					</div>
					<div class="modal-body">
	
						<form class="form-horizontal">
							
							<div class="row">
								<div class="col-md-2">
									<b>설명</b><br>
								</div>
								<div class="col-md-10">
									<textarea class="form-control" rows="5"></textarea>						
								</div>
							</div><hr>
										
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
</div>
<!-- Footer -->
<%@include file="/common/footer.jsp" %>
<!-- /Footer -->
