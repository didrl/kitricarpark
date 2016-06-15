package com.carpark.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.carpark.action.Action;
import com.carpark.admin.model.GradeDto;
import com.carpark.member.model.service.MemberServiceImpl;

public class MemberBenefitAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String id = request.getParameter("user_id");
		System.out.println("benefitAction >>>" +id);
		GradeDto gradeDto= MemberServiceImpl.getMemberService().gradeInfo(id);
		
		JSONObject json = new JSONObject();	
		json.put("gradeInfo", gradeDto);
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
		return "";

	}

}
