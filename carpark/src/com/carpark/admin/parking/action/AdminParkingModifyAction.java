package com.carpark.admin.parking.action;

import java.io.IOException;
import java.util.List;
import java.util.StringTokenizer;

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
import com.carpark.util.NumberCheck;
import com.carpark.util.PageNavigator;
import com.carpark.util.StringCheck;

public class AdminParkingModifyAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		String visit = StringCheck.nullToBlank(request.getParameter("visit"));
		int pg = NumberCheck.nullToOne(request.getParameter("pg"));
		String key = StringCheck.nullToBlank(request.getParameter("key"));
		String word = StringCheck.nullToBlank(request.getParameter("word"));
		String flag = request.getParameter("flag");

		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("memberInfo");

		if (memberDto != null) {
			String ownerId = memberDto.getUser_id();

			ParkingDetailDto parkingDto = new ParkingDetailDto();

			parkingDto.setPark_id(NumberCheck.nullToZero(request.getParameter("parkId")));
			parkingDto.setPark_type(request.getParameter("parkType"));
			parkingDto.setPark_name(request.getParameter("parkName"));

			String coordinate = request.getParameter("coordinate");// 지도에서 가져온 좌표
																	
			if (coordinate != null) {
				StringTokenizer st = new StringTokenizer(coordinate, ",");// lat, lng로 나눔
				String latitude = st.nextToken().substring(1);// ( 제거
				String longitude = st.nextToken().replace(")", "").trim();

				parkingDto.setLatitude(Double.parseDouble(latitude));
				parkingDto.setLongitude(Double.parseDouble(longitude));
			} else {
				System.out.println("좌표가져오기 실패");
				return "/admin/parking/register.jsp";
			}

			parkingDto.setOwner_id(ownerId);

			parkingDto.setPay_yn(StringCheck.nullToBlank(request.getParameter("payYn")));
			parkingDto.setSatur_pay_yn(StringCheck.nullToBlank(request.getParameter("saturPayYn")));
			parkingDto.setHoli_pay_yn(StringCheck.nullToBlank(request.getParameter("holiPayYn")));
			parkingDto.setPark_capacity(NumberCheck.nullToOne(request.getParameter("parkCapacity")));
			parkingDto.setPark_time_rate(NumberCheck.nullToOne(request.getParameter("parkTimeRate")));
			parkingDto.setPark_rate(NumberCheck.nullToOne(request.getParameter("parkRate")));
			parkingDto.setAdd_park_rate(NumberCheck.nullToOne(request.getParameter("addParkRate")));
			parkingDto.setDay_max_pay(NumberCheck.nullToOne(request.getParameter("dayMaxPay")));
			parkingDto.setFulltime_monthly_pay(NumberCheck.nullToOne(request.getParameter("fullTimeMonthlyPay")));
			parkingDto.setPark_flag(NumberCheck.nullToOne(request.getParameter("parkFlag")));
			parkingDto.setContent(StringCheck.nullToBlank(request.getParameter("content").replace("\r\n", "<br>")));
			parkingDto.setDetailAddr(StringCheck.nullToBlank(request.getParameter("parkAddress")));
			parkingDto.setFacility(StringCheck.nullToBlank(request.getParameter("facility")));

			MemberParkingServiceImpl.getMemberParkingservice().parkingModify(parkingDto);

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
		} else
			return "index.jsp";
	}

}
