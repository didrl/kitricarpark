package com.carpark.member.reservation.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.common.model.ParkingDetailDto;
import com.carpark.member.model.MemberCarDto;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.ReservationDto;
import com.carpark.member.model.service.MemberReservationServiceImpl;
import com.carpark.member.model.service.MemberServiceImpl;

public class MemberReservationMoveAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		

		// if searchResultDetail can not give some info then get that info in DB
		
		// have to change when get some additional parking info 
		//		ex) near landmarks, discount info . . .
		
		
		//fromdate, fromtime
		//todate, totime
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto)session.getAttribute("memberInfo");
		ReservationDto reservationDto = new ReservationDto();
		String user_id = memberDto.getUser_id();
		int park_id = Integer.parseInt(request.getParameter("park_id"));
		 
		reservationDto.setUser_id(user_id);
		reservationDto.setHost_id(request.getParameter("host_id"));
		ArrayList<MemberCarDto> carinfo=MemberReservationServiceImpl.getMemberReservationService().getCarInfo(user_id);
		ArrayList<Map<String,String>> availabledate =MemberReservationServiceImpl.getMemberReservationService().getAvailDate(park_id);
		reservationDto.setFromdate(request.getParameter("fromdate"));
		reservationDto.setTodate(request.getParameter("todate"));
		reservationDto.setFromtime(Integer.parseInt(request.getParameter("srfromTime")));
		reservationDto.setTotime(Integer.parseInt(request.getParameter("srtoTime")));
		
		//parkingDto 
		reservationDto.setPark_id(park_id);
		reservationDto.setPark_name(request.getParameter("park_name"));
		ParkingDetailDto parkingDetailDto = MemberServiceImpl.getMemberService().getParkingDetail_info(request.getParameter("park_id"));
		
		 
		session.setAttribute("reservationDto", reservationDto);
		session.setAttribute("carinfo", carinfo);
		session.setAttribute("availabledate", availabledate);
		session.setAttribute("parkingDetailDto", parkingDetailDto);
		
		return "/reservation/reservationDetail.jsp";
	}

}
