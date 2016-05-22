package com.carpark.member.controller;

<<<<<<< HEAD
=======
import java.io.IOException;
>>>>>>> 0b7271da2013bb240a81f07d16cf97e2fb563860
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.factory.MemberActionFactory;
<<<<<<< HEAD
import com.carpark.util.PageMove;
=======
import com.carpark.util.Encoder;
import com.carpark.util.NumberCheck;
import com.carpark.util.PageMove;
import com.carpark.util.StringCheck;
import com.sun.xml.internal.bind.v2.runtime.output.Encoded;
>>>>>>> 0b7271da2013bb240a81f07d16cf97e2fb563860

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
<<<<<<< HEAD
		}else if("mvSearchResult".equals(act)){
			// go to carpark/search/searchResult.jsp with location, fromDate, endDate
		}else if("mvReservation".equals(act)){
			// go to carpark/reservation/reservationDetail.jsp with park_id, fromDate, endDate
		}else if("mvSearchResultDetail".equals(act)){
			// go to carpark/search/searchResultDetail.jsp with parkingDto, fromDate, endDate
=======
		}else if("mvsignup".equals(act)){
			path = MemberActionFactory.getMemberRegisterAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
>>>>>>> 0b7271da2013bb240a81f07d16cf97e2fb563860
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
