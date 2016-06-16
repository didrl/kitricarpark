package com.carpark.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.factory.MemberActionFactory;
import com.carpark.util.BoardConstance;
import com.carpark.util.Encoder;
import com.carpark.util.PageMove;

@WebServlet("/review")
public class MemberReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getContextPath();
		String search = Encoder.utfUrl(request.getParameter("search"));
		String act = Encoder.utfUrl(request.getParameter("act"));
		System.out.println("act>>>>>>>>>>>>>"+act);
		String path ="/index.jsp";
		
		if("reviewWriteToParking".equals(act)){
			path = MemberActionFactory.getMemberReviewRegisterAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("sendReviewList".equals(act)){
			path = MemberActionFactory.getMemberSendReviewListAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("receiveReviewList".equals(act)){
			path = MemberActionFactory.getMemberReceiveReviewListAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("receiveReview".equals(act)){
			path = MemberActionFactory.getMemberReviewReceiveViewAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("sendReview".equals(act)){
			path = MemberActionFactory.getMemberReviewSendViewAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else {
			PageMove.redirect(response, root + path);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
