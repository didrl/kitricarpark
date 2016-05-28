<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript">
    
function reservationok(){
	document.payform.action = "/carpark/reservation";
	document.payform.submit();
} 
</script>

<!-- 
폼으로 데이터를 전송할 때 label에 있는것들도 전송되는지 알아야함
모달로 넘길 때 히든의 벨류를 세팅해줄 수 있는지도
 -->
    
	 <!-- Payment Modal Start -->
                  <div class="modal fade" id="payment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                              <div class="modal-header">
                                 <button type="button" class="close" data-dismiss="modal">
                                    <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                                 </button>
                                 <h4 class="payment" id="paymentModal">결제</h4>
                              </div>
                            <div class="modal-body">
                            
                               <form class="form-horizontal"  name="payform" id="payform"  method="post">
                               <input type="hidden" name="act" value="payok">
                               <input type="hidden" name="park_id" id="paypark_id" value="">
                               <input type="hidden" name="payfromtime" id="payfromtime" value="">
                               <input type="hidden" name="paytotime" id="paytotime" value="">
                               
                              <div class="form-group" align ="center">
                                 <label class="col-sm-3 control-label">선택한 날짜 :</label>
                                 <label class="col-sm-4 control-label"><input type="text"  id="selectedfromdate"  name="selectedfromdate"></label>
                                 <label class="col-sm-3 control-label"><input type="text"  id="selectedtodate" name="selectedtodate" ></label>
                               </div>
                              <div class="form-group" align ="center">
                                  <label class="col-sm-3 control-label"><input type="text"  id="selectedid"  name="selectedid"></label>
                                  <label class="col-sm-3 control-label"><input type="text"  id="selectedcarnum" name="selectedcarnum" ></label>
                                  <label  class="col-sm-3 control-label"><input type="text"  id="selectedcarname"  name="selectedcarname" ></label>
                              </div>
                               <div class="form-group" align ="center">
                                  <label class="col-sm-5 control-label">보유 코인</label>
                                  <label class="col-sm-5 control-label"><input type="text"  id="selectedcoin"  name="selectedcoin" ></label>
                              </div>
							 <div class="form-group" align ="center">
                                  <label class="col-sm-5 control-label">이용 가격</label>
                                  <label for="inputMsgContent" class="col-sm-5 control-label"><input type="text"  id="selectedprice"  name="selectedprice"></label>
                              </div>
                              <div class="form-group" align ="center">
                                  <div >
                                     <button type="sendMsg" class="btn btn-default" onclick="javascript:reservationok();">결제하기</button>
                                  </div>
                              </div>
                           </form>
                              </div>
                        </div>
                     </div>
                </div>
                <!-- Msg Modal End -->