package com.carpark.member.call.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.member.model.ZipDto;
import com.carpark.member.model.service.MemberCallServiceImpl;
import com.carpark.member.model.service.MemberParkingServiceImpl;
import com.carpark.member.model.service.MemberServiceImpl;
import com.carpark.util.Encoder;

public class MemberCallAddrSearchAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String parkAddress = Encoder.isoToUtf(request.getParameter("parkAddress"));
		System.out.println(parkAddress);
		List<ZipDto> list = MemberCallServiceImpl.getMemberCallService().list(parkAddress);
		request.setAttribute("addressList", list);
		
		return "/member/init.jsp";
	}
}
