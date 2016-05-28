package com.carpark.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.carpark.action.Action;
import com.carpark.member.model.service.MemberServiceImpl;

public class MemberIdCheckAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		JSONObject json = new JSONObject();
		String id = request.getParameter("id");
		int count = MemberServiceImpl.getMemberService().idcheck(id);
		json.put("id",count+"");
		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
		return "/index.jsp";
	}

}
