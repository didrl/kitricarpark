package com.carpark.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.carpark.factory.MemberActionFactory;
import com.carpark.util.PageMove;
import com.carpark.util.Encoder;
import com.carpark.util.NumberCheck;
import com.carpark.util.PageMove;
import com.carpark.util.StringCheck;
import com.sun.xml.internal.bind.v2.runtime.output.Encoded;

@WebServlet("/member")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getContextPath();
		String act = request.getParameter("act");
		System.out.println("act>>>>>>>>>>>>>"+act);
		String path ="/index.jsp";
		
		if("mvlogin".equals(act)){
			path = MemberActionFactory.getMemberLoginAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("mvSearchResult".equals(act)){
			path = MemberActionFactory.getMemberSearchAction().execute(request, response);
		}else if("mvReservation".equals(act)){
			
		}else if("mvSearchResultDetail".equals(act)){
			
		}else if("mvsignup".equals(act)){
			path = MemberActionFactory.getMemberRegisterAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("mvprofile".equals(act)){
			path= MemberActionFactory.getMemberInfoAction().execute(request, response);
			PageMove.redirect(response, root+path);
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
