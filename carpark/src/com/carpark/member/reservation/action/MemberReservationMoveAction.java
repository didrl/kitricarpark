package com.carpark.member.reservation.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.admin.model.ParkingDto;
import com.carpark.member.model.ReservationDto;

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
		ReservationDto reservationDto = new ReservationDto();

		reservationDto.setUser_id(request.getParameter("id"));
		reservationDto.setFromdate(request.getParameter("fromdate"));
		reservationDto.setTodate(request.getParameter("todate"));
		reservationDto.setFromtime(Integer.parseInt(request.getParameter("fromTime")));
		reservationDto.setTotime(Integer.parseInt(request.getParameter("toTime")));
		
		//parkingDto 
		reservationDto.setPark_id(Integer.parseInt(request.getParameter("park_id")));
		reservationDto.setPark_name(request.getParameter("park_name"));

		
		request.setAttribute("reservationDto", reservationDto);
		
		return "/reservation/reservationDetail.jsp";
	}

}
