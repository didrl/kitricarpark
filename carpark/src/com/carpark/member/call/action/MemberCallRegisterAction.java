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
import com.carpark.member.model.service.CommonServiceImpl;
import com.carpark.member.model.service.MemberCallServiceImpl;
import com.carpark.util.Encoder;
import com.carpark.util.NumberCheck;
import com.carpark.util.PageMove;
import com.carpark.util.PageNavigator;
import com.carpark.util.StringCheck;

public class MemberCallRegisterAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto)session.getAttribute("memberInfo");
		
		int seq = CommonServiceImpl.getCommonService().getNextSeq();
		int pg = NumberCheck.nullToOne(request.getParameter("pg"));
		String key = StringCheck.nullToBlank(request.getParameter("key"));
		String word = Encoder.isoToUtf(StringCheck.nullToBlank(request.getParameter("word")));
	
		String id = memberDto.getUser_id();
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String parkAddress = request.getParameter("parkAddress");
		String parkDetailAddress = request.getParameter("parkDetailAddress");
		
//		String pCall_Latitude = "";
//		String pCall_Longitude = "";
		CallDto callDto = new CallDto();
		
		callDto.setSeq(seq);
		callDto.setBcode(NumberCheck.nullToZero(request.getParameter("bcode")));
		callDto.setUserID(id);
		callDto.setSubject(subject);
		callDto.setContent(content);	
		callDto.setpCall_ADDR(parkAddress);
		
		callDto.setpCall_Flag(0);
	
		MemberCallServiceImpl.getMemberCallService().register(callDto);
		List<CallDto> list = MemberCallServiceImpl.getMemberCallService().sendList(id);
		session.setAttribute("sendList", list);
		
		PageNavigator navigator = CommonServiceImpl.getCommonService().getPageNavigatorReceiver(id, pg, key, word);
		navigator.setRoot(request.getContextPath());
		navigator.setNavigatorSend();
		session.setAttribute("navigator", navigator);
		
		return "/member/memberCallList.jsp";
	}
}
