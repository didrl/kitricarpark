package com.carpark.member.parking.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.common.model.ZipDto;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.service.CommonServiceImpl;
import com.carpark.member.model.service.MemberParkingServiceImpl;
import com.carpark.util.Encoder;
import com.carpark.util.NumberCheck;
import com.carpark.util.PageNavigator;
import com.carpark.util.StringCheck;

public class MemberParkingSearchAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String parkAddress = Encoder.isoToUtf(StringCheck.nullToBlank(request.getParameter("parkAddress")));
		
		HttpSession session = request.getSession();
		session.setAttribute("address", parkAddress);
		MemberDto memberDto = (MemberDto) session.getAttribute("memberInfo");
		if (memberDto != null) {		
			int pg = NumberCheck.nullToOne(request.getParameter("pg"));
			List<ZipDto> list = MemberParkingServiceImpl.getMemberParkingservice().parkingSearch(parkAddress, pg);
			request.setAttribute("addressList", list);
			
			PageNavigator navigator = CommonServiceImpl.getCommonService().getPageNavigatorAddress(parkAddress, pg);
			navigator.setRoot(request.getContextPath());
			navigator.setNavigator("searchAddress");
			request.setAttribute("navigator", navigator);
			
			return "/parking/parksearch.jsp";
		} else
//			return "index.jsp";
			return "/member/loginFail.jsp";
	}

}
