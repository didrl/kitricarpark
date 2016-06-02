package com.carpark.member.message.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.carpark.action.Action;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.MessageDto;
import com.carpark.member.model.service.CommonServiceImpl;
import com.carpark.member.model.service.MemberMessageServiceImpl;
import com.carpark.util.Encoder;
import com.carpark.util.NumberCheck;
import com.carpark.util.PageNavigator;
import com.carpark.util.StringCheck;

public class MemberMessageWriteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		int pg = NumberCheck.nullToOne(request.getParameter("pg"));
		String key = StringCheck.nullToBlank(request.getParameter("key"));
		String word = Encoder.isoToUtf(StringCheck.nullToBlank(request.getParameter("word")));
		
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("memberInfo");
		
		int seq = CommonServiceImpl.getCommonService().getNextSeq();
		
		MessageDto messageDto = new MessageDto();
		messageDto.setSeq(seq);
		messageDto.setUserID(memberDto.getUser_id());
		messageDto.setSubject(request.getParameter("subject"));
		messageDto.setContent(request.getParameter("content").replace("\r\n", "<br>"));
		messageDto.setBcode(NumberCheck.nullToZero(request.getParameter("bcode")));
		messageDto.setMseq(seq);
		messageDto.setReceiverId(request.getParameter("receiver"));
		messageDto.setMsgFlag(0);
		
		String userId = memberDto.getUser_id();
		
		MemberMessageServiceImpl.getMemberMessageService().writeArticle(messageDto);
		List<MessageDto> list = MemberMessageServiceImpl.getMemberMessageService().sendListArticle(userId, pg, key, word);
		request.setAttribute("sendList", list);
		PageNavigator navigator = CommonServiceImpl.getCommonService().getPageNavigatorUser(userId, pg, key, word);
		navigator.setRoot(request.getContextPath());
		navigator.setNavigatorSend();
		request.setAttribute("navigator", navigator);
		
		
		return "/message/sendlist.jsp";
	}

}
