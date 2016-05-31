package com.carpark.admin.parking.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.admin.model.ParkingDetailDto;
import com.carpark.admin.model.service.AdminParkingServiceImpl;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.service.MemberReservationServiceImpl;

public class AdminParkingRegisterAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto)session.getAttribute("memberInfo");
		
		ParkingDetailDto parkingDetailDto = new ParkingDetailDto();
		parkingDetailDto.setPark_flag(Integer.parseInt((request.getParameter("parkType"))));
		parkingDetailDto.setPark_name(request.getParameter("parkName"));
		parkingDetailDto.setDetailAddr(request.getParameter("parkAddress"));
		parkingDetailDto.setPay_yn(request.getParameter("payYn"));
		parkingDetailDto.setSatur_pay_yn(request.getParameter("saturPayYn"));
		parkingDetailDto.setHoli_pay_yn(request.getParameter("holiPayYn"));
		parkingDetailDto.setPark_time_rate(Integer.parseInt(request.getParameter("parkTimeRate")));
		parkingDetailDto.setPark_rate(Integer.parseInt(request.getParameter("parkRate")));
		parkingDetailDto.setAdd_park_rate(Integer.parseInt(request.getParameter("addParkRate")));
		parkingDetailDto.setDay_max_pay(Integer.parseInt(request.getParameter("dayMaxPay")));
		parkingDetailDto.setFulltime_monthly_pay(Integer.parseInt(request.getParameter("fullTimeMonthlyPay")));
		parkingDetailDto.setImg_file_name(request.getParameter("fileName"));
		
		AdminParkingServiceImpl.getAdminParkingService().registerReservation(parkingDetailDto);
		request.setAttribute("adminParkingRegiser", parkingDetailDto);
		return "/parklist/.jsp";
	}

}
