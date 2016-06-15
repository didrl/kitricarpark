package com.carpark.admin.parking.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.admin.model.service.AdminParkingServiceImpl;
import com.carpark.common.model.ParkingDetailDto;
import com.carpark.member.model.service.CommonServiceImpl;
import com.carpark.member.model.service.MemberParkingServiceImpl;
import com.carpark.util.NumberCheck;
import com.carpark.util.PageNavigator;
import com.carpark.util.StringCheck;

public class AdminParkingDeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String act = request.getParameter("act");
		String visit = StringCheck.nullToBlank(request.getParameter("visit"));
		int pg = NumberCheck.nullToOne(request.getParameter("pg"));
		String key = StringCheck.nullToBlank(request.getParameter("key"));
		String word = StringCheck.nullToBlank(request.getParameter("word"));
		String flag = request.getParameter("flag");
		
		int parkId = NumberCheck.nullToZero(request.getParameter("parkId"));

		MemberParkingServiceImpl.getMemberParkingservice().parkingDelete(parkId);
		
		List<ParkingDetailDto> list = AdminParkingServiceImpl.getAdminParkingService().parkingList(pg, flag, visit, key, word);
		request.setAttribute("parkingList", list);

		PageNavigator navigator = CommonServiceImpl.getCommonService().getPageNavigatorAdminParking(pg, key, word, visit, flag);
		navigator.setRoot(request.getContextPath());
		if ("0".equals(flag))
			navigator.setNavigator("adminParkListPublic");
		else if ("1".equals(flag))
			navigator.setNavigator("adminParkListPrivate");
		else
			navigator.setNavigator("adminParkList");
		request.setAttribute("navigator", navigator);

		return "/admin/parking/list.jsp";
	}

}
