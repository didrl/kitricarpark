package com.carpark.member.call.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.common.model.CallDto;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.service.MemberCallServiceImpl;

public class MemberCallListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
//		MemberDto memberDto = (MemberDto)session.getAttribute("memberInfo");
//		String id = memberDto.getUser_id();
//		List<CallDto> list = MemberCallServiceImpl.getMemberCallService().sendList(id);	
		List<CallDto> list = (List<CallDto>)session.getAttribute("sendList");
		return "/member/memberCallList.jsp";
	}

}
