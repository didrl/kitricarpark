<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<!--  search bar start -->
			
			<div class="col-sm-12">
				<!-- /input-group -->
				<form id="searchForm" name="searchForm" class="form-inline" role="form" method="post">
					<input type="hidden" name="act" value="mvSearchResult">
					<input type="hidden" name="search" value="">
					
					
					<div class="col-lg-2 input-group">
						<input type="text" class="form-control col-lg-6" id="citysearch" name="city" placeholder="Search for...">
					</div>
					
					<div class="col-lg-2 input-group">
						<input class="date-picker form-control col-lg-4" id="fromdatesearch" name="from" type="text" placeholder="Start Date"/>
					</div>

					<div class="col-lg-2 input-group">
						<input class="date-picker form-control col-lg-4" id="todatesearch" type="text" name="to" placeholder="End Date"/>
					</div>
					<div class="col-lg-1 input-group">
						<button class="btn btn-success" type="button"
							onclick="javascript:goSearchResult();">Search</button>
					</div>			
				</form>
			</div>
			
			<br>
			<br>
			<!--  search bar end-->