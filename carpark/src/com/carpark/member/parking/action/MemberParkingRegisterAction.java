package com.carpark.member.parking.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.admin.model.ParkingDetailDto;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.service.CommonServiceImpl;
import com.carpark.member.model.service.MemberParkingServiceImpl;
import com.carpark.util.NumberCheck;
import com.carpark.util.StringCheck;

public class MemberParkingRegisterAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("memberInfo");
		
		int parkingId = CommonServiceImpl.getCommonService().getNextParkingId();
		
		ParkingDetailDto parkingDto = new ParkingDetailDto();
		
		parkingDto.setPark_id(parkingId);
		parkingDto.setPark_type(request.getParameter("parkType"));
		parkingDto.setPark_name(request.getParameter("parkName"));
		parkingDto.setLatitude(Double.parseDouble(request.getParameter("latitude")));
		parkingDto.setLongitude(Double.parseDouble(request.getParameter("longtitude")));
		parkingDto.setEmd_code(NumberCheck.nullToZero(request.getParameter("emdCode")));
		
		parkingDto.setOwner_id("didrl");
//		parkingDto.setOwnerId(memberDto.getUser_id());
		
		parkingDto.setFacility(StringCheck.nullToBlank(request.getParameter("facility")));
		parkingDto.setFeature(StringCheck.nullToBlank(request.getParameter("feature")));
		parkingDto.setPay_yn(request.getParameter("payYn"));
		parkingDto.setSatur_pay_yn(request.getParameter("saturPayYn"));
		parkingDto.setHoli_pay_yn(request.getParameter("holiPayYn"));
		parkingDto.setPark_capacity(NumberCheck.nullToOne(request.getParameter("parkCapacity")));
		parkingDto.setPark_time_rate(NumberCheck.nullToOne(request.getParameter("parkTimeRate")));
		parkingDto.setPark_rate(NumberCheck.nullToOne(request.getParameter("parkRate")));
		parkingDto.setAdd_park_rate(NumberCheck.nullToOne(request.getParameter("addParkRate")));
		parkingDto.setDay_max_pay(NumberCheck.nullToOne(request.getParameter("dayMaxPay")));
		parkingDto.setFulltime_monthly_pay(NumberCheck.nullToOne(request.getParameter("fullTimeMonthlyPay")));
		parkingDto.setPark_flag(NumberCheck.nullToOne(request.getParameter("parkFlag")));
		
		if(parkingId != 0) {
			MemberParkingServiceImpl.getMemberParkingservice().MemberParkingRegister(parkingDto);
			List<ParkingDetailDto> list = MemberParkingServiceImpl.getMemberParkingservice().MemberParkingList("didrl");
			request.setAttribute("parkList", list);
		}
		
		
		return "/parking/list.jsp";
	}

}
