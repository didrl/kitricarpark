package com.carpark.member.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.service.MemberServiceImpl;

public class MemberLoginAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		String root = request.getContextPath();
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String svid = request.getParameter("svid");
		
		if("idsave".equals(svid)){
			Cookie cookie = new Cookie("myid", id);
			cookie.setPath(root);
			cookie.setMaxAge(60 * 60 * 24);
			response.addCookie(cookie);
		}else{
			Cookie cookies[] = request.getCookies();
			int len = cookies.length;
			for (int i = 0; i < len; i++) {
				if("myid".equals(cookies[i].getName())){
					cookies[i].setMaxAge(0);
					cookies[i].setPath(root);
					response.addCookie(cookies[i]);
					break;
				}
			}
		}
		
		MemberDto memberDto = MemberServiceImpl.getMemberService().login(id,pass);
		session.setAttribute("memberInfo",memberDto);
		return memberDto==null ? "/member/loginFail.jsp":((memberDto.getUser_flag()!=10)?"/index.jsp":"/admin/adminindex.jsp");
	}

}
