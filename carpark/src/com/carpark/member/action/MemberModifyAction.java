package com.carpark.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.dao.MemberDaoImpl;

public class MemberModifyAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto)session.getAttribute("memberInfo");
		System.out.println(memberDto.getUser_pass());
		if(request.getParameter("modifyname")!=null && !("".equals(request.getParameter("modifyname").trim())))
			memberDto.setUser_name(request.getParameter("modifyname"));
		if(request.getParameter("modifypass1")!=null && !("".equals(request.getParameter("modifypass1").trim())))
			memberDto.setUser_pass(request.getParameter("modifypass1"));
		if(request.getParameter("modifyemail")!=null && !("".equals(request.getParameter("modifyemail").trim())))
			memberDto.setEmail(request.getParameter("modifyemail"));
		if(request.getParameter("modifytel")!=null && !("".equals(request.getParameter("modifytel").trim())))
			memberDto.setTel(request.getParameter("modifytel"));
		System.out.println("Action name:"+memberDto.getUser_name());
		System.out.println("Action pass:"+memberDto.getUser_pass());
		System.out.println("Action email:"+memberDto.getEmail());
		int count = MemberDaoImpl.getMemberDao().modify(memberDto);
		return "/member/info.jsp";
	}
}
