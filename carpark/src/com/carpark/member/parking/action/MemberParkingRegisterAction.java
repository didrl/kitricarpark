package com.carpark.member.parking.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.service.CommonServiceImpl;

public class MemberParkingRegisterAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("memberInfo");
		
		String parkType = request.getParameter("parkType");
		String parkName = request.getParameter("parkName");
		String ssgName = request.getParameter("ssgName");
		String emdName = request.getParameter("emdName");
		String facility = request.getParameter("facility");
		String feature = request.getParameter("feature");
		String payYn = request.getParameter("payYn");
		String saturPayYn = request.getParameter("saturPayYn");
		String holiPayYn = request.getParameter("holiPayYn");
		String parkCapacity = request.getParameter("parkCapacity");
		String parkTimeRate = request.getParameter("parkTimeRate");
		String parkRate = request.getParameter("parkRate");
		String addParkRate = request.getParameter("addParkRate");
		String dayMaxPay = request.getParameter("dayMaxPay");
		String fullTimeMonthlyPay = request.getParameter("fullTimeMonthlyPay");
		
		int parkingId = CommonServiceImpl.getCommonService().getNextParkingId();
		
		
		
		return null;
	}

}
