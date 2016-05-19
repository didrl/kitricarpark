<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/admin/common/common.jsp" %>

    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
        	    
            
                    <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							���� ���� <small>Subheading</small>
						</h1>

					</div>
				</div>


				<div class="row">
					<div class="col-lg-12">
						<form role="form">
							<!-- p1: my coin -->
							<div class="form-group">

								<div class="col-lg-4">
									<label>�� ����</label>
								</div>
								<div class="col-lg-6">
									<p class="breadcrumb">���� ����</p>
									<p class="form-control-static">datainput ����</p>
									<p class="help-block">���� ��� �ȳ�</p>
								</div>
							</div>
							<!-- p1: my coin end-->

							<!-- p2: coin charge-->
							<div class="form-group">
								<div class="col-lg-4">
									<label> �������� </label>
								</div>
								<!-- select coin -->

								<div class="col-lg-6">
									<p>
									<ol class="breadcrumb">
										<li>���� ��ǰ ����</li>
									</ol>
									<div class="radio">
										<label> <input type="radio" name="optionsRadios"
											id="optionsRadios1" value="option1" checked>21����
											3900��
										</label>
									</div>
									<div class="radio">
										<label> <input type="radio" name="optionsRadios"
											id="optionsRadios2" value="option2">61���� 8900��
										</label>
									</div>
									<div class="radio">
										<label> <input type="radio" name="optionsRadios"
											id="optionsRadios3" value="option3">100���� 15000��
										</label>
									</div>
									</p>

									<!-- coin charge method-->
									<p>
									<ol class="breadcrumb">
										<li>���� ���� ����</li>
									</ol>

									<label class="radio-inline"> <input type="radio"
										name="optionsRadiosInline" id="optionsRadiosInline1"
										value="option1" checked> �ſ�ī��
									</label> <label class="radio-inline"> <input type="radio"
										name="optionsRadiosInline" id="optionsRadiosInline2"
										value="option2"> �޴��� ����
									</label> <label class="radio-inline"> <input type="radio"
										name="optionsRadiosInline" id="optionsRadiosInline3"
										value="option3"> ������ü
									</label>
									</p>
									<p>
										<button type="submit" class="btn btn-default">������û</button>
										<button type="reset" class="btn btn-default">���</button>
									</p>
								</div>
							</div>

							<!-- p2: coin charge end -->
						</form>

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