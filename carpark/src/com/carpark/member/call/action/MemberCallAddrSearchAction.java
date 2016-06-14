package com.carpark.member.call.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.carpark.action.Action;
import com.carpark.common.model.ZipDto;
import com.carpark.member.model.service.MemberCallServiceImpl;
import com.carpark.util.Encoder;

public class MemberCallAddrSearchAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String street = Encoder.isoToUtf(request.getParameter("street"));
		System.out.println(street);
		List<ZipDto> list = MemberCallServiceImpl.getMemberCallService().zipSearchList(street);
		System.out.println("ziplist>>"+list.size());
		JSONObject json = new JSONObject();
		JSONArray jArray = new JSONArray();
		
		for (ZipDto zipDto : list) {
			JSONObject zip = new JSONObject();
			zip.put("sido", zipDto.getSido());
			zip.put("gugun", zipDto.getGugun());
			zip.put("street", zipDto.getStreet());
			jArray.add(zip);
		}
		json.put("ziplist", jArray);
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
//		request.setAttribute("addressList", list);
//		request.setAttribute("dong", dong);
		return "";
	}
}
