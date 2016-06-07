package com.carpark.member.parking.action;

import java.io.IOException;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.common.model.ParkingDetailDto;
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
		
		String coordinate = request.getParameter("coordinate");//지도에서 가져온 좌표
		if(coordinate != null) {
		StringTokenizer st = new StringTokenizer(coordinate, ",");//lat, lng로 나눔
		String latitude = st.nextToken().substring(1);// ( 제거 
		String longitude = st.nextToken().replace(")", "").trim();// ) 제거
		
		parkingDto.setLatitude(Double.parseDouble(latitude));//dto에 넣기
		parkingDto.setLongitude(Double.parseDouble(longitude));
		} else {
			System.out.println("좌표가져오기 실패");
			return "/parking/register.jsp";
		}
		
		parkingDto.setOwner_id(memberDto.getUser_id());
		
		parkingDto.setFacility(request.getParameter("facility"));
		parkingDto.setFeature(request.getParameter("feature").replace("\r\n", "<br>"));
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
		parkingDto.setContent(request.getParameter("content").replace("\r\n", "<br>"));
		parkingDto.setDetailAddr(request.getParameter("parkAddress"));
		
		parkingDto.setEmd_code(11650101);
		
		if(parkingId != 0) {
			MemberParkingServiceImpl.getMemberParkingservice().parkingRegister(parkingDto);
			List<ParkingDetailDto> list = MemberParkingServiceImpl.getMemberParkingservice().parkingList(memberDto.getUser_id());
			request.setAttribute("parkingList", list);
		}
		
		
		return "/parking/list.jsp";
	}

}
