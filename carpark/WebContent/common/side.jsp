<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


		<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav side-nav">
				<li><a href="index.html"><i class="fa fa-fw fa-dashboard"></i>
						Dashboard</a></li>
						
				<li><a href="javascript:;" data-toggle="collapse"
					data-target="#profile"><i class="fa fa-fw fa-arrows-v"></i>
						프로필 <i class="fa fa-fw fa-caret-down"></i></a>
					<ul id="profile" class="collapse">
						<li><a href="javascript:detailprofile();">프로필수정</a></li>
						<li><a href="#">feedback</a></li>
						<li><a href="#">자동차정보</a></li>
					</ul></li>
					
				<li><a href="javascript:;" data-toggle="collapse"
					data-target="#reservation"><i class="fa fa-fw fa-arrows-v"></i>
						예약 <i class="fa fa-fw fa-caret-down"></i></a>
					<ul id="reservation" class="collapse">
						<li><a href="#">예약하기</a></li>
						<li><a href="#">예약받기</a></li>
					</ul></li>
					
				<li><a href="javascript:;" data-toggle="collapse"
					data-target="#message"><i class="fa fa-fw fa-arrows-v"></i>
						메세지 <i class="fa fa-fw fa-caret-down"></i></a>
					<ul id="message" class="collapse">
						<li><a href="javascript:messageReceiveList();">받은메세지</a></li>
						<li><a href="javascript:messageSendList();">보낸메세지</a></li>
					</ul></li>
					
				<li><a href="javascript:;" data-toggle="collapse"
					data-target="#parking"><i class="fa fa-fw fa-arrows-v"></i>
						주차장 <i class="fa fa-fw fa-caret-down"></i></a>
					<ul id="parking" class="collapse">
						<li><a href="#">주차장 등록</a></li>
						<li><a href="#">내 주차장</a></li>
					</ul></li>
					
				<li><a href="blank-page.html"><i class="fa fa-fw fa-file"></i>
						My Coin</a></li>
				<li><a href="index-rtl.html"><i
						class="fa fa-fw fa-dashboard"></i> 친구초대</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
