package com.carpark.member.reservation.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.ReservationDto;
import com.carpark.member.model.service.MemberReservationServiceImpl;

public class MemberReservationRegisterAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto)session.getAttribute("memberInfo");
		
		ReservationDto reservationDto = new ReservationDto();
			
		reservationDto.setUser_id(memberDto.getUser_id());
		reservationDto.setPark_id(Integer.parseInt(request.getParameter("park_id")));
		reservationDto.setFromdate(request.getParameter("selectedfromdate"));
		reservationDto.setTodate(request.getParameter("selectedtodate"));
		reservationDto.setFromtime(Integer.parseInt(request.getParameter("payfromtime")));
		reservationDto.setTotime(Integer.parseInt(request.getParameter("paytotime")));
		reservationDto.setPay(Integer.parseInt(request.getParameter("selectedprice")));
		
		
		MemberReservationServiceImpl.getMemberReservationService().registerReservation(reservationDto);

		
		
		return "";
	}

}
