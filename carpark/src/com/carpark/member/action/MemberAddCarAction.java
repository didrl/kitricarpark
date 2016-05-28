package com.carpark.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.member.model.MemberCarDto;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.service.MemberServiceImpl;

public class MemberAddCarAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto)session.getAttribute("memberInfo");
		
		MemberCarDto memberCarDto=new MemberCarDto();
		
		memberCarDto.setCategory(request.getParameter("carcategory"));
		memberCarDto.setReg_num(request.getParameter("inputCarNum"));
		memberCarDto.setModel(request.getParameter("inputCarName"));
		memberCarDto.setUser_id(memberDto.getUser_id());
		
		int cnt = MemberServiceImpl.getMemberService().addNewCar(memberCarDto);

		return "/reservation/reservationDetail.jsp";
	}

}

// memberCarDto
//private String car_id;
//private String maker;
//private String model;
//private String category;
//private String reg_num;