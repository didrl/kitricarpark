package com.carpark.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.service.MemberServiceImpl;

public class MemberInfoAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto)session.getAttribute("memberInfo");
		MemberDto getmemberDto = new MemberDto();
		getmemberDto = MemberServiceImpl.getMemberService().getMember(memberDto.getUser_id());
		request.setAttribute("getmemberInfo", getmemberDto);
		return "/member/info.jsp";
	}
}
