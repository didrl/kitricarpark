<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <<script type="text/javascript">
    function getAllUserInfo(){
    	document.location.href=root+"/admin?act=alluserinfo";
    }
</script>

 <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                   <li class="active">
                        <a href="<%=root%>/admin/adminindex.jsp"><i class="fa fa-fw fa-file"></i> 관리자 화면</a>
                    </li>
              
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#customer"><i class="fa fa-fw fa-arrows-v"></i> 고객관리 <i class="fa fa-fw fa-caret-down"></i></a>       
                        <ul id="customer" class="collapse">
                            <li>
                                <a href="javascript:getAllUserInfo();">전체 고객 정보</a>
                            </li>
                            <li>
                                <a href="<%=customerpath%>/report.jsp">신고내역</a>
                            </li>
                            <li>
                                <a href="<%=customerpath%>/rate.jsp">등급 및 혜택 설정</a>
                            </li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#parking"><i class="fa fa-fw fa-arrows-v"></i> 주차장 관리 <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="parking" class="collapse">
                            <li>
                                <a href="<%=parkingpath%>/list.jsp">주차장 목록</a>
                            </li>
                            <li>
                                <a href="<%=parkingpath%>/newparking.jsp">새로운 주차장 등록</a>
                            </li>
                            <li>
                                <a href="<%=root%>/admincall?act=AdminCallReceiveList">주차장 제보 목록</a>
                            </li>
                            <li>
                                <a href="<%=parkingpath%>/authpark.jsp">주차장 인증예정목록</a>
                            </li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#qna"><i class="fa fa-fw fa-arrows-v"></i>QnA관리 <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="qna" class="collapse">
                            <li>
                                <a href="<%=qnapath%>/faq.jsp">FAQ 관리</a>
                            </li>
                            <li>
                                <a href="<%=qnapath%>/message.jsp">쪽지 목록</a>
                            </li>
                       
                        </ul>
                    </li>
                <li>
                        <a href="<%=root%>/admin/adminindex.jsp"><i class="fa fa-fw fa-bar-chart-o"></i> 사이트 통계 </a>
                </li>
                </ul>
                
                
            </div>
   