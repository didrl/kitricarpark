<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <div class="collapse navbar-collapse navbar-ex1-collapse">
 	<ul class="nav navbar-nav side-nav">
    	<li class="active">
        	<a href="<%=root%>/adminindex.jsp"><i class="fa fa-fw fa-file"></i> 내 정보 </a>
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
        	<a href="javascript:;" data-toggle="collapse" data-target="#message"><i class="fa fa-fw fa-arrows-v"></i> 받은쪽지함 <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="message" class="collapse">
            	<li>
                	<a href=""> 받은쪽지 </a>
                </li>
                <li>
                	<a href=""> 보낸쪽지 </a>
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