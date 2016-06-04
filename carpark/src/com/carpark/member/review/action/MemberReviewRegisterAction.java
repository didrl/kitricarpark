package com.carpark.member.review.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.member.model.MemberDto;

public class MemberReviewRegisterAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto)session.getAttribute("memberInfo");
		
		String user_id = memberDto.getUser_id();
		int park_id = Integer.parseInt(request.getParameter("review_park_id"));
		int host_flag = Integer.parseInt(request.getParameter("host_flag"));
		int bcode = Integer.parseInt(request.getParameter("bcode"));
		
		
		return null;
	}

}
