package com.carpark.admin.parking.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.admin.model.service.AdminParkingServiceImpl;
import com.carpark.common.model.ParkingDetailDto;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.service.CommonServiceImpl;
import com.carpark.member.model.service.MemberParkingServiceImpl;
import com.carpark.util.Encoder;
import com.carpark.util.NumberCheck;
import com.carpark.util.PageNavigator;
import com.carpark.util.StringCheck;

public class AdminParkingListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		int pg = NumberCheck.nullToOne(request.getParameter("pg"));
		String key = StringCheck.nullToBlank(request.getParameter("key"));
		String word = StringCheck.nullToBlank(Encoder.isoToUtf(request.getParameter("word")));
		String auth = request.getParameter("auth");

		System.out.println("key : " + key);
		System.out.println("word : " + word);
		System.out.println("auth : " + auth);

		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("memberInfo");
		if (memberDto != null) {
			List<ParkingDetailDto> list = AdminParkingServiceImpl.getAdminParkingService().parkingList(pg, key, word,
					auth);
			request.setAttribute("parkingList", list);

			PageNavigator navigator = CommonServiceImpl.getCommonService().getPageNavigatorAdminParking(pg, key, word,
					auth);
			navigator.setRoot(request.getContextPath());
			if ("0".equals(word))
				navigator.setNavigator("adminParkListPublic");
			else if ("1".equals(word))
				navigator.setNavigator("adminParkListPrivate");
			else
				navigator.setNavigator("adminParkList");
			request.setAttribute("navigator", navigator);

			return "/admin/parking/list.jsp";
		} else
			return "index.jsp";

	}

}
