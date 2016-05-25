<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
function addNewCar(){
	if(document.addcarForm.inputCarNum.value == ""){
		alert("차량 번호를 입력하세요");
		return;
	} else if(document.addcarForm.inputCarName.value == "") {
		alert("차량 종류를 입력하세요");
		return;	
	
	document.addcarForm.action = "/carpark/member";
	document.addcarForm.submit();
}
    </script>

<!-- Add Car Modal Start -->
<div class="modal fade" id="addCar" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h4 class="addCar" id="addCarTitle">차량 등록</h4>
			</div>
			<div class="modal-body">

				<form class="form-horizontal" id="addcarForm" name="addcarForm">
					<input type="hidden" name="act" value="addcarok">
					<div class="form-group">
						<label for="inputCarNum" class="col-sm-2 control-label">차량
							번호</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputCarNum"
								name="inputCarNum" placeholder="CarNum">
						</div>
					</div>
					<div class="form-group">
						<label for="inputCarName" class="col-sm-2 control-label">차종</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputCarName"
								name="inputCarName" placeholder="CarName">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="sendMsg" class="btn btn-default" id="addcarok"
								onclick="javascript:addNewCar();">등록하기</button>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
</div>
<!-- Add Car Modal End -->