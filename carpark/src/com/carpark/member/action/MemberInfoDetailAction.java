package com.carpark.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.service.MemberServiceImpl;

public class MemberInfoDetailAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto)session.getAttribute("memberInfo");
		memberDto = MemberServiceImpl.getMemberService().getMemberDetail(memberDto.getUser_id());
		System.out.println("memberinfodetailaction>>>>>>>>>>>>"+memberDto.getUser_id());
		request.setAttribute("memberDetailInfo", memberDto);
		
		return "/member/detailInfo.jsp";
	}

}
