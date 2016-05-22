package com.carpark.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
<<<<<<< HEAD
=======
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.service.MemberServiceImpl;
>>>>>>> 0b7271da2013bb240a81f07d16cf97e2fb563860

public class MemberRegisterAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
<<<<<<< HEAD
		
		return null;
	}
	
=======
		MemberDto memberDto = new MemberDto(); 
		memberDto.setUser_id(request.getParameter("id"));
		memberDto.setUser_pass(request.getParameter("pass"));
		memberDto.setCarInfo(request.getParameter("carInfo"));
		request.setAttribute("memberInfo", memberDto);
		int count=MemberServiceImpl.getMemberService().register(memberDto);
		System.out.println("Dao에서 service 들어옴>>>>>"+count);
		return count==0 ? "":"/member/info.jsp";
	}
>>>>>>> 0b7271da2013bb240a81f07d16cf97e2fb563860
}
