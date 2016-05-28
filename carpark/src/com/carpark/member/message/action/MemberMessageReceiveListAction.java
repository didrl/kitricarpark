package com.carpark.member.message.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.carpark.action.Action;
import com.carpark.factory.MemberActionFactory;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.MessageDto;
import com.carpark.member.model.service.MemberMessageServiceImpl;

public class MemberMessageReceiveListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("memberInfo");
		
		String receiveId = memberDto.getUser_id();
		if(receiveId != null) {
			List<MessageDto> receiveList = MemberMessageServiceImpl.getMemberMessageService().receiveListArticle(receiveId);
			request.setAttribute("receiveList", receiveList);
		}
		
		return "/message/receivelist.jsp";
	}

}
