package com.carpark.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.carpark.factory.MemberActionFactory;
import com.carpark.util.BoardConstance;
import com.carpark.util.Encoder;
import com.carpark.util.PageMove;

@WebServlet("/call")
public class MemberCallController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getContextPath();
		String search = Encoder.utfUrl(request.getParameter("search"));
		String act = Encoder.utfUrl(request.getParameter("act"));
		System.out.println("act>>>>>>>>>>>>>"+act);
		String path ="/index.jsp";
		
		if("addrSearch".equals(act)){
			path = MemberActionFactory.getMemberCallAddrSearchAction().execute(request, response);
		}else if("mvzip".equals(act)){
			path = MemberActionFactory.getMemberCallMvZipAction().execute(request, response);
			PageMove.redirect(response, root+path);
		}else if("memberParkRegisterMessage".equals(act)){
			path = MemberActionFactory.getMemberCallRegisterAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("callSendList".equals(act)){
			path = MemberActionFactory.getMemberCallListAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(BoardConstance.DEFAULT_CHARSET);
		doGet(request, response);
	}

}
