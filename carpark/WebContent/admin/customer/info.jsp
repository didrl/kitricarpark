<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/admin/common/common.jsp" %>

    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
        	<%@ include file="/admin/common/header.jsp" %>    
            
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
           <%@ include file="/admin/common/sidebar.jsp" %>
                    <!-- /.navbar-collapse -->
        </nav>

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