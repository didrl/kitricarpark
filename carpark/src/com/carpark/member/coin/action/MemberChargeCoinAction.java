package com.carpark.member.coin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.carpark.action.Action;
import com.carpark.member.model.*;
import com.carpark.member.model.service.*;
import com.carpark.util.*;

public class MemberChargeCoinAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("memberInfo");
		
		CoinDto coindto = new CoinDto();
		int ccoin = Integer.parseInt(request.getParameter("optionsRadios"));
		coindto.setCoin(ccoin);
		coindto.setCflag(2);
		coindto.setUser_id(memberDto.getUser_id());
		
		int coin = memberDto.getCoin();
		coin += coindto.getCoin();
		
		MemberCoinServiceImpl.getMemberCoinService().chargeCoin(coindto, coin);
		
		request.setAttribute("coinChargeInfo", coindto);
		
		return "/coin/charge.jsp";
	}
}
