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
		
		int parkingId = CommonServiceImpl.getCommonService().getNextParkingId();
		

		
	
	request.getParameter("parkName");
		request.getParameter("ssgName");
	request.getParameter("emdName");
	 request.getParameter("facility");
	 request.getParameter("feature");
 request.getParameter("payYn");
 request.getParameter("saturPayYn");
		request.getParameter("holiPayYn");
	request.getParameter("parkCapacity");
	request.getParameter("parkTimeRate");
	 request.getParameter("parkRate");
	 request.getParameter("addParkRate");
	 request.getParameter("dayMaxPay");
	request.getParameter("fullTimeMonthlyPay");
		
		
		
		
		return null;
	}

}
