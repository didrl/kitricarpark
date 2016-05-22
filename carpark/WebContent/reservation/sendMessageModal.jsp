<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	 <!-- Msg Modal Start -->
                  <div class="modal fade" id="msgToHost" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                              <div class="modal-header">
                                 <button type="button" class="close" data-dismiss="modal">
                                    <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                                 </button>
                                 <h4 class="msgToHost" id="msgToHostModal">쪽지 보내기</h4>
                              </div>
                            <div class="modal-body">
                            
                               <form class="form-horizontal">
                              <div class="form-group">
                                 <label for="inputMsgSubject" class="col-sm-2 control-label">제목</label>
                                  <div class="col-sm-10">
                                       <input type="text" class="form-control" id="inputMsgSubject" placeholder="MsgSubject">
                                  </div>
                                </div>
                              <div class="form-group">
                                  <label for="inputMsgContent" class="col-sm-2 control-label">내용</label>
                                  <div class="col-sm-10">
                                    <textarea class="form-control" id="inputMsgContent" placeholder="MsgContent" row="10"></textarea>
                                  </div>
                              </div>
                              <div class="form-group">
                                  <div class="col-sm-offset-2 col-sm-10">
                                     <button type="sendMsg" class="btn btn-default">보내기</button>
                                  </div>
                              </div>
                           </form>
                            
                              </div>
                        </div>
                     </div>
                </div>
                <!-- Msg Modal End -->