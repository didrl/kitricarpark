<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <<script type="text/javascript">
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
                            
                               <form class="form-horizontal"  name="payform" id="payform">
                               <input type="hidden" name="act" value="payok">
                              <div class="form-group" align ="center">
                                 <label for="inputMsgSubject" class="col-sm-3 control-label">선택한 날짜 :</label>
                                 <label for="inputMsgSubject"  id="selectedfromdate" class="col-sm-4 control-label">시작일</label>
                                 <label for="inputMsgSubject" id="selectedtodate" class="col-sm-3 control-label">종료일</label>
                               </div>
                              <div class="form-group" align ="center">
                                  <label for="inputMsgContent" id="selectedid" class="col-sm-3 control-label">아이디</label>
                                  <label for="inputMsgContent" id="selectedgrade" class="col-sm-3 control-label">등급</label>
                                  <label for="inputMsgSubject" id="selectedcarinfo" class="col-sm-3 control-label">차량정보</label>
                              </div>
                               <div class="form-group" align ="center">
                                  <label for="inputMsgContent" class="col-sm-5 control-label">보유 코인</label>
                                  <label for="inputMsgContent"  id="selectedcoin"  class="col-sm-5 control-label">보유중인 내코인</label>
                              </div>
							 <div class="form-group" align ="center">
                                  <label for="inputMsgContent" class="col-sm-5 control-label">이용 가격</label>
                                  <label for="inputMsgContent" id="selectedprice"   class="col-sm-5 control-label">가격정보 표시</label>
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