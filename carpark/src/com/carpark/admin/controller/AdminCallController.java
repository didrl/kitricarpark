package com.carpark.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.factory.MemberActionFactory;
import com.carpark.util.BoardConstance;
import com.carpark.util.Encoder;
import com.carpark.util.NumberCheck;
import com.carpark.util.PageMove;
import com.carpark.util.StringCheck;

/**
 * Servlet implementation class AdminCallController
 */
@WebServlet("/admincall")
public class AdminCallController extends HttpServlet {
	private static final long serialVersionUID = 1L;
           
      
    	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		String act = request.getParameter("act");
    		int bcode = NumberCheck.nullToZero(request.getParameter("bcode"));
    		int pg = NumberCheck.nullToOne(request.getParameter("pg"));
    		String key = StringCheck.nullToBlank(request.getParameter("key"));
    		String word = StringCheck.nullToBlank(request.getParameter("word"));
    		String path = "/index.jsp";
    		String queryString = "?bcode=" + bcode + "&pg=" + pg + "&key=" + key + "&word=" + Encoder.isoToUtf(word);
    		
    		if("".equals(act)) {
    			
    		} else if("AdminCallWrite".equals(act)) {//쪽지보내기
    			path = MemberActionFactory.getMemberMessageWriteAction().execute(request, response);
    			PageMove.forward(request, response, path + queryString);

    		} else if("AdminCallSendView".equals(act)) {//보낸쪽지보기
    			path = MemberActionFactory.getMemberMessageSendViewAction().execute(request, response);
    			PageMove.forward(request, response, path + queryString);
    			
    		} else if("AdminCallReceiveView".equals(act)) {//받은쪽지보기
    			path = MemberActionFactory.getMemberMessageReceiveViewAction().execute(request, response);
    			PageMove.forward(request, response, path + queryString);
    			
    		} else if("AdminCallSendDelete".equals(act)) {//보낸쪽지삭제
    			MemberActionFactory.getMemberMessageSendDeleteAction().execute(request, response);
    			path = MemberActionFactory.getMemberMessageSendListAction().execute(request, response);
    			PageMove.forward(request, response, path + queryString);
    			
    		} else if("AdminCallReceiveDelete".equals(act)) {//받은쪽지삭제
    			MemberActionFactory.getMemberMessageReceiveDeleteAction().execute(request, response);
    			path = MemberActionFactory.getMemberMessageReceiveListAction().execute(request, response);
    	
    		} else if("AdminCallSendList".equals(act)) {//보낸쪽지목록
    			path = MemberActionFactory.getMemberMessageSendListAction().execute(request, response);
    			PageMove.forward(request, response, path + queryString);
    			
    		} else if("AdminCallReceiveList".equals(act)) {//받은쪽지목록
    			path = MemberActionFactory.getMemberMessageReceiveListAction().execute(request, response);
    			PageMove.forward(request, response, path + queryString);
    			
    		} else if("".equals(act)) {
    			
    		}
    	}

    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		request.setCharacterEncoding(BoardConstance.DEFAULT_CHARSET);
    		doGet(request, response);
    	}

}
