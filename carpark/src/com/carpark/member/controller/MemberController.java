package com.carpark.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.factory.MemberActionFactory;
import com.carpark.util.Encoder;
import com.carpark.util.PageMove;


@WebServlet("/member")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getContextPath();
		String search = Encoder.utfUrl(request.getParameter("search"));
		String act = Encoder.utfUrl(request.getParameter("act"));
		System.out.println("act>>>>>>>>>>>>>"+act);
		String path ="/index.jsp";
		
		if("mvlogin".equals(act)){
			path = MemberActionFactory.getMemberLoginAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("mvSearchResult".equals(act)){
			path = MemberActionFactory.getMemberSearchAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("mvSearchResultDetail".equals(act)){
			path = MemberActionFactory.getMemberSearchDetailAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("mvsignup".equals(act)){
			path = MemberActionFactory.getMemberRegisterAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("mvprofile".equals(act)){
			path = MemberActionFactory.getMemberInfoAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("mvlogout".equals(act)){
			path = MemberActionFactory.getMemberLogoutAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("addcarok".equals(act)){
			path = MemberActionFactory.getMemberAddCarAction().execute(request, response);
		}else if("mvProfileDetail".equals(act)){
			path = MemberActionFactory.getMemberInfoDetailAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("mvmessage".equals(act)){
			path = MemberActionFactory.getMemberMessageReceiveListAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("mvidcheck".equals(act)){
			path = MemberActionFactory.getMemberIdCheckAction().execute(request, response);
  
		}else if("mvmodify".equals(act)){
			path = MemberActionFactory.getMemberModifyAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("mvbenefit".equals(act)){
			path = MemberActionFactory.getMemberBenefitAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("mvcoin".equals(act)){
			path = MemberActionFactory.getMemberCoinAction().execute(request, response);
			PageMove.redirect(response, root+path);
		}else if("mycarInfo".equals(act)){
//			path = MemberActionFactory.get
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("mvMyOwnCar".equals(act)){
			path = MemberActionFactory.getMemberCarListAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("".equals(act)){
			
		}else{
			PageMove.redirect(response, root+path);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
