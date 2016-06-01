package com.carpark.member.reservation.action;

import java.io.IOException;
<<<<<<< HEAD
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.carpark.action.Action;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.MessageDto;
import com.carpark.member.model.service.MemberMessageServiceImpl;
=======
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.ReservationDto;
import com.carpark.member.model.service.MemberReservationServiceImpl;
>>>>>>> a3d98903480c22a6c0e2b5d8691554756d51a1c4

public class MemberReservationListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
<<<<<<< HEAD
		MemberDto memberDto = (MemberDto) session.getAttribute("memberInfo");
		
		String receiveId = memberDto.getUser_id();
		if(receiveId != null) {
			List<MessageDto> receiveList = MemberMessageServiceImpl.getMemberMessageService().receiveListArticle(receiveId);
			request.setAttribute("receiveList", receiveList);
		}
		
		return "/message/reservationlist.jsp";
=======
		MemberDto memberDto = (MemberDto)session.getAttribute("memberInfo");
		
		 ArrayList<ReservationDto> list = ( ArrayList<ReservationDto>) MemberReservationServiceImpl.getMemberReservationService().myReservationList(memberDto.getUser_id());
		 request.setAttribute("myreservationlist", list);
		return "/member/myReservation.jsp";
>>>>>>> a3d98903480c22a6c0e2b5d8691554756d51a1c4
	}

}
