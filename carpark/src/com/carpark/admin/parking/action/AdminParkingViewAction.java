package com.carpark.admin.parking.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.common.model.ParkingDetailDto;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.service.MemberParkingServiceImpl;
import com.carpark.member.model.service.MemberReportServiceImpl;
import com.carpark.util.NumberCheck;
import com.carpark.util.StringCheck;

public class AdminParkingViewAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("memberInfo");
		if (memberDto != null) {
			int parkId = NumberCheck.nullToZero(request.getParameter("parkId"));
			if (parkId != 0) {
				ParkingDetailDto parkingDto = MemberParkingServiceImpl.getMemberParkingservice().parkingView(parkId);
				request.setAttribute("parkingView", parkingDto);
			}
			return "/admin/parking/view.jsp";
		} else
			return "/member/loginFail.jsp";
	}

}
