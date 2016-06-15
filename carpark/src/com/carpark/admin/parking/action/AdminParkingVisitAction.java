package com.carpark.admin.parking.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.admin.model.service.AdminParkingServiceImpl;
import com.carpark.common.model.ParkingDetailDto;
import com.carpark.member.model.service.CommonServiceImpl;
import com.carpark.util.NumberCheck;
import com.carpark.util.PageNavigator;
import com.carpark.util.StringCheck;

public class AdminParkingVisitAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String act = request.getParameter("act");
		String visit = StringCheck.nullToBlank(request.getParameter("visit"));
		int pg = NumberCheck.nullToOne(request.getParameter("pg"));
		String key = StringCheck.nullToBlank(request.getParameter("key"));
		String word = StringCheck.nullToBlank(request.getParameter("word"));
		String flag = request.getParameter("flag");
		
		String parkId = request.getParameter("parkId");
		
		AdminParkingServiceImpl.getAdminParkingService().adminParkingVisit(parkId);
		
		List<ParkingDetailDto> list = AdminParkingServiceImpl.getAdminParkingService().parkingList(pg, flag, visit, key, word);
		request.setAttribute("parkingList", list);

		PageNavigator navigator = CommonServiceImpl.getCommonService().getPageNavigatorAdminParking(pg, flag, visit, key, word);
		navigator.setRoot(request.getContextPath());
		Map<String, String> map = new HashMap<String, String>();
		String javascript = "adminParkList";
		map.put("javascript", javascript);
		map.put("pg", pg + "");
		map.put("flag", flag);
		map.put("visit", visit);
		navigator.setNavigator(map);
		request.setAttribute("navigator", navigator);

		return "/admin/parking/list.jsp";
	}

}
