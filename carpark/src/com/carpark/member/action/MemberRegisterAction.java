package com.carpark.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.service.MemberServiceImpl;

public class MemberRegisterAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		MemberDto memberDto = new MemberDto(); 
		memberDto.setUser_id(request.getParameter("id"));
		memberDto.setUser_pass(request.getParameter("pass"));
		memberDto.setCarInfo(request.getParameter("carInfo"));
		
		request.setAttribute("memberInfo", memberDto);
		int count=MemberServiceImpl.getMemberService().register(memberDto);
		return count==0 ? "":"/member/info.jsp";
	}
}
