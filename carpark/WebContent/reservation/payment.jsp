<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	 <!-- Msg Modal Start -->
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
                            
                               <form class="form-horizontal" >
                              <div class="form-group" align ="center">
                                 <label for="inputMsgSubject" class="col-sm-3 control-label">선택한 날짜 :</label>
                                 <label for="inputMsgSubject"  id="selectedfromdate" class="col-sm-4 control-label"> 2016-08-16 18:00</label>
                                 <label for="inputMsgSubject" id="selectedtodate" class="col-sm-3 control-label"> 08-17 21:00</label>
                               </div>
                              <div class="form-group" align ="center">
                                  <label for="inputMsgContent" id="selectedid" class="col-sm-3 control-label">아이디</label>
                                  <label for="inputMsgContent" id="selectedgrade" class="col-sm-3 control-label">등급</label>
                                  <label for="inputMsgSubject" id="selectedcarinfo" class="col-sm-3 control-label">차량정보</label>
                              </div>
                               <div class="form-group" align ="center">
                                  <label for="inputMsgContent" class="col-sm-5 control-label">보유 코인</label>
                                  <label for="inputMsgContent"  id="selectedcoin"  class="col-sm-5 control-label">보유중코인</label>
                              </div>
							 <div class="form-group" align ="center">
                                  <label for="inputMsgContent" class="col-sm-5 control-label">이용 가격</label>
                                  <label for="inputMsgContent" id="selectedprice"   class="col-sm-5 control-label">가격</label>
                              </div>
                              <div class="form-group" align ="center">
                                  <div >
                                     <button type="sendMsg" class="btn btn-default">결제하기</button>
                                  </div>
                              </div>
                           </form>
                            
                              </div>
                        </div>
                     </div>
                </div>
                <!-- Msg Modal End -->