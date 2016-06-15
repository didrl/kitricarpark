package com.carpark.member.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.common.model.ParkingDetailDto;
import com.carpark.member.model.service.MemberServiceImpl;

public class MemberSearchAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		Map<String, String>map =new HashMap<String, String>();
		String city = request.getParameter("city");
		String from = request.getParameter("fromdatesearch");
		String to= request.getParameter("todatesearch");
		map.put("city", city);
		map.put("from", from);
		map.put("to", to);
		
		List<ParkingDetailDto> list = MemberServiceImpl.getMemberService().list(map);
		HttpSession session = request.getSession();
		session.setAttribute("searchlist", list);
		session.setAttribute("searchInfo", map);
		request.setAttribute("city", city);
		
		return list==null ? "":"/search/searchResult.jsp";
	}

}
