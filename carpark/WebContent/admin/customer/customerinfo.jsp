<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp" %>
<%@ include file="/admin/common/header.jsp" %>
<%@ include file="/admin/common/sidebar.jsp" %>
<!-- t_list -->
<!-- 전체고객정보 : 전체고객정보조회 수정/삭제(개별 회원이 보유한 코인내역 포함) -->
    <div id="wrapper">

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            고객관리
                            <small>고객정보</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="<%=adminpath%>/adminindex.jsp">고객 화면</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-file"></i> 고객 화면_sub
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

</body>
</html>