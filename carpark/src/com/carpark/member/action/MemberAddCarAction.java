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
		
		String user_id = request.getParameter("user_id");
		MemberCarDto memberCarDto ;
		
//		MemberServiceImpl.getMemberService().addNewCar(user_id);

		return "";
	}

}

// memberCarDto
//private String car_id;
//private String maker;
//private String model;
//private String category;
//private String reg_num;