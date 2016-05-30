package com.carpark.member.parking.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.common.model.ParkingDetailDto;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.service.CommonServiceImpl;
import com.carpark.member.model.service.MemberParkingServiceImpl;
import com.carpark.member.model.service.MemberServiceImpl;
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
		
		parkingDto.setParkId(parkingId);
		parkingDto.setParkType(request.getParameter("parkType"));
		parkingDto.setParkName(request.getParameter("parkName"));
		parkingDto.setLatitude(Double.parseDouble(request.getParameter("latitude")));
		parkingDto.setLongtitude(Double.parseDouble(request.getParameter("longtitude")));
		parkingDto.setEmdCode(NumberCheck.nullToZero(request.getParameter("emdCode")));
		
		parkingDto.setOwnerId("didrl");
		//parkingDto.setOwnerId(memberDto.getUser_id());
		
		parkingDto.setFacility(StringCheck.nullToBlank(request.getParameter("facility")));
		parkingDto.setFeature(StringCheck.nullToBlank(request.getParameter("feature")));
		parkingDto.setPayYn(request.getParameter("payYn"));
		parkingDto.setSaturPayYn(request.getParameter("saturPayYn"));
		parkingDto.setHoliPayYn(request.getParameter("holiPayYn"));
		parkingDto.setParkCapacity(NumberCheck.nullToOne(request.getParameter("parkCapacity")));
		parkingDto.setParkTimeRate(NumberCheck.nullToOne(request.getParameter("parkTimeRate")));
		parkingDto.setParkRate(NumberCheck.nullToOne(request.getParameter("parkRate")));
		parkingDto.setAddParkRate(NumberCheck.nullToOne(request.getParameter("addParkRate")));
		parkingDto.setDayMaxPay(NumberCheck.nullToOne(request.getParameter("dayMaxPay")));
		parkingDto.setFullTimeMonthlyPay(NumberCheck.nullToOne(request.getParameter("fullTimeMonthlyPay")));
		parkingDto.setParkFlag(NumberCheck.nullToOne(request.getParameter("parkFlag")));
		
		if(parkingId != 0) {
			MemberParkingServiceImpl.getMemberParkingservice().MemberParkingRegister(parkingDto);
			List<ParkingDetailDto> list = MemberParkingServiceImpl.getMemberParkingservice().MemberParkingList("didrl");
			request.setAttribute("parkList", list);
		}
		
		
		return "/parking/list.jsp";
	}

}
