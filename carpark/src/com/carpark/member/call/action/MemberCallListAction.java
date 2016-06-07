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
import com.carpark.util.PageNavigator;
import com.carpark.util.StringCheck;

public class MemberCallListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto)session.getAttribute("memberInfo");
		String id = memberDto.getUser_id();
		int seq = CommonServiceImpl.getCommonService().getNextSeq();
		int pg = NumberCheck.nullToOne(request.getParameter("pg"));
		String key = StringCheck.nullToBlank(request.getParameter("key"));
		String word = Encoder.isoToUtf(StringCheck.nullToBlank(request.getParameter("word")));
		List<CallDto> list = MemberCallServiceImpl.getMemberCallService().sendList(id);	
		
//		List<CallDto> list = (List<CallDto>)session.getAttribute("sendList");
		
		PageNavigator navigator = CommonServiceImpl.getCommonService().getPageNavigatorUser(id, pg, key, word);
		navigator.setRoot(request.getContextPath());
		navigator.setNavigatorSend();
		
		if(session.getAttribute("sendList")!=null){
			session.removeAttribute("sendList");
			session.removeAttribute("navigator");
		}
		
		session.setAttribute("sendList", list);
		session.setAttribute("navigator", navigator);
		return "/member/memberCallList.jsp";
	}

}
