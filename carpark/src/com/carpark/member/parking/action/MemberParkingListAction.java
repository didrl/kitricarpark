package com.carpark.member.parking.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.common.model.ParkingDetailDto;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.service.CommonServiceImpl;
import com.carpark.member.model.service.MemberParkingServiceImpl;
import com.carpark.util.Encoder;
import com.carpark.util.NumberCheck;
import com.carpark.util.PageNavigator;
import com.carpark.util.StringCheck;

public class MemberParkingListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		int pg = NumberCheck.nullToOne(request.getParameter("pg"));
		String key = StringCheck.nullToBlank(request.getParameter("key"));
		String word = StringCheck.nullToBlank(Encoder.isoToUtf(request.getParameter("word")));
		
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("memberInfo");
		if (memberDto != null) {
			String ownerId = memberDto.getUser_id();
			if (ownerId != null) {
				List<ParkingDetailDto> list = MemberParkingServiceImpl.getMemberParkingservice().parkingList(ownerId, pg, key, word);
				request.setAttribute("parkingList", list);
				
				PageNavigator navigator = CommonServiceImpl.getCommonService().getPageNavigatorParking(ownerId, pg, key, word);
				navigator.setRoot(request.getContextPath());
				navigator.setNavigator("parkingList");
				request.setAttribute("navigator", navigator);
			}
			return "/parking/list.jsp";
			
		} else
			return "/member/loginFail.jsp";

	}

}
