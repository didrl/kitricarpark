package com.carpark.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.member.model.MemberCarDto;
import com.carpark.member.model.service.MemberServiceImpl;

public class MemberAddCarAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		MemberCarDto memberCarDto = new MemberCarDto();
		
		memberCarDto.setUser_id(request.getParameter("user_id"));
		memberCarDto.setModel(request.getParameter("inputCarName"));
		memberCarDto.setCategory(request.getParameter("carcategory"));
		memberCarDto.setReg_num(request.getParameter("inputCarNum"));
		
		MemberServiceImpl.getMemberService().addNewCar(memberCarDto);

		return "";
	}

}

// memberCarDto
//private String car_id;
//private String maker;
//private String model;
//private String category;
//private String reg_num;