<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
 <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                   <li class="active">
                        <a href="<%=root%>/adminindex.jsp"><i class="fa fa-fw fa-file"></i> ������ ȭ��</a>
                    </li>
              
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#customer"><i class="fa fa-fw fa-arrows-v"></i> ������ <i class="fa fa-fw fa-caret-down"></i></a>       
                        <ul id="customer" class="collapse">
                            <li>
                                <a href="<%=customerpath%>/info.jsp">��ü �� ����</a>
                            </li>
                            <li>
                                <a href="<%=customerpath%>/rate.jsp">�Ű���</a>
                            </li>
                            <li>
                                <a href="<%=customerpath%>/report.jsp">��� �� ���� ����</a>
                            </li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#parking"><i class="fa fa-fw fa-arrows-v"></i> ������ ���� <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="parking" class="collapse">
                            <li>
                                <a href="<%=parkingpath%>/list.jsp">������ ���</a>
                            </li>
                            <li>
                                <a href="<%=parkingpath%>/newparking.jsp">���ο� ������ ���</a>
                            </li>
                            <li>
                                <a href="<%=parkingpath%>/report.jsp">������ ���� ���</a>
                            </li>
                            <li>
                                <a href="<%=parkingpath%>/auth.jsp">������ �����������</a>
                            </li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#qna"><i class="fa fa-fw fa-arrows-v"></i>QnA���� <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="qna" class="collapse">
                            <li>
                                <a href="<%=qnapath%>/faq.jsp">FAQ ����</a>
                            </li>
                            <li>
                                <a href="<%=qnapath%>/message.jsp">���� ���</a>
                            </li>
                       
                        </ul>
                    </li>
                <li>
                        <a href="<%=staticpath%>/static.jsp"><i class="fa fa-fw fa-bar-chart-o"></i> ����Ʈ ��� </a>
                </li>
                </ul>
                
                
            </div>
   