package com.carpark.member.call.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.common.model.CallDto;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.service.MemberCallServiceImpl;

public class MemberCallModifyAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		CallDto callDto = new CallDto();
		HttpSession session = request.getSession();
		callDto.setSeq(Integer.parseInt(request.getParameter("seq")));
		callDto.setSubject(request.getParameter("subject"));
		callDto.setContent(request.getParameter("content"));
		int count = MemberCallServiceImpl.getMemberCallService().modify(callDto);
		return "/member/memberCallList.jsp";
	}
}
