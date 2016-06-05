package com.carpark.member.call.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.common.model.CallDto;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.service.CommonServiceImpl;
import com.carpark.member.model.service.MemberCallServiceImpl;

public class MemberCallRegisterAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto)session.getAttribute("memberInfo");
		int seq = CommonServiceImpl.getCommonService().getNextSeq();
		
		String id = memberDto.getUser_id();
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String parkAddress = request.getParameter("parkAddress");
//		String pCall_Latitude = "";
//		String pCall_Longitude = "";
		CallDto callDto = new CallDto();
		
		callDto.setSeq(seq);
		callDto.setUserID(id);
		callDto.setSubject(subject);
		callDto.setContent(content);	
		callDto.setpCall_ADDR(parkAddress);
	
		int count = MemberCallServiceImpl.getMemberCallService().register(callDto);
		request.setAttribute("sendList", callDto);
		return count ==0 ? "/member/memberCallList.jsp":"";
	}

}
