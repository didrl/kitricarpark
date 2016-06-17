package com.carpark.member.action;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

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
		String loginkey = request.getParameter("loginkey");
		String profile_image=request.getParameter("profileImage");
		System.out.println("profile"+profile_image);
		String name = null;
		if(loginkey != null)
			name = URLDecoder.decode(request.getParameter("name"), "UTF-8");
		String svid = request.getParameter("svid");
		String failSvid = request.getParameter("failSvid");
		MemberDto memberDto = null;
		if("idsave".equals(svid)||"idsave".equals(failSvid)){
			Cookie cookie = new Cookie("myid", URLEncoder.encode(id,"UTF-8"));
//			Cookie cookie = new Cookie("myid", id);
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
		if(loginkey!=null){
//			memberDto = MemberServiceImpl.getMemberService().kakaologin(loginkey);
			memberDto = new MemberDto();
			memberDto.setUser_name("kakao"+name);
			memberDto.setUser_id(loginkey);
			memberDto.setUser_pass("P"+loginkey);
			memberDto.setEmail("Kakao@email.com");
			memberDto.setTel("010111111");
			memberDto.setProfile_image(profile_image);
			
			MemberDto kakaomember= MemberServiceImpl.getMemberService().getMember(loginkey);
			if(kakaomember==null){
				MemberServiceImpl.getMemberService().register(memberDto);
			}
//			session.setAttribute("memberInfo",memberDto);
		}else{
			memberDto = MemberServiceImpl.getMemberService().login(id,pass);
		}
		session.setAttribute("memberInfo",memberDto);	
		return memberDto==null ? "/member/loginFail.jsp":((memberDto.getUser_flag()!=10)?"/index.jsp":"/admin?act=adminLogin");
	}

}
