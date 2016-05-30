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
		String id = new String(request.getParameter("idcheck").getBytes("ISO-8859-1"),"UTF-8");
		
		System.out.println("id>>>>>"+id);
		int count = MemberServiceImpl.getMemberService().idcheck(id);
		System.out.println("action>>>"+count);
		json.put("id",count);
		System.out.println(json.toJSONString());
		PrintWriter out = response.getWriter();
		response.setContentType("text/plain;charset=UTF-8");
		out.print(json.toJSONString());
		return "";
	}

}
