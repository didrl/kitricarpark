package com.carpark.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		memberDto.setUser_name(request.getParameter("name"));
		memberDto.setEmail(request.getParameter("email"));
		memberDto.setTel(request.getParameter("tel"));
		int count=MemberServiceImpl.getMemberService().register(memberDto);
		System.out.println("Dao에서 service 들어옴>>>>>"+count);
		request.setAttribute("registerInfo", memberDto);
		request.setAttribute("count",count);
		return count==0 ? "":"";
	}
}
