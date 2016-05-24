package com.carpark.member.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.admin.model.ParkingDto;
import com.carpark.member.model.service.MemberServiceImpl;

public class MemberSearchAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		Map<String, String>map =new HashMap<String, String>();
		String city = request.getParameter("city");
		String from = request.getParameter("from");
		String to= request.getParameter("to");
		map.put("city", city);
		map.put("from", from);
		map.put("to", to);
		
		List<ParkingDto> list = MemberServiceImpl.getMemberService().list(map);
		request.setAttribute("searchlist", list);
		
		return list==null ? "":"/search/searchResult.jsp";
	}

}
