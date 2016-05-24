package com.carpark.factory;

import com.carpark.action.Action;
import com.carpark.member.action.MemberDeleteAction;
import com.carpark.member.action.MemberInfoAction;
import com.carpark.member.action.MemberLoginAction;
import com.carpark.member.action.MemberLogoutAction;
import com.carpark.member.action.MemberModifyAction;
import com.carpark.member.action.MemberRegisterAction;
import com.carpark.member.action.MemberSearchAction;
import com.carpark.member.action.MemberSearchDetailAction;
import com.carpark.member.call.action.MemberCallDeleteAction;
import com.carpark.member.call.action.MemberCallListAction;
import com.carpark.member.call.action.MemberCallModifyAction;
import com.carpark.member.call.action.MemberCallRegisterAction;
import com.carpark.member.call.action.MemberCallViewAction;
import com.carpark.member.favorite.action.MemberFavoriteDeleteAction;
import com.carpark.member.favorite.action.MemberFavoriteListAction;
import com.carpark.member.favorite.action.MemberFavoriteRegisterAction;
import com.carpark.member.message.action.*;
import com.carpark.member.report.action.MemberReportListAction;
import com.carpark.member.report.action.MemberReportRegisterAction;
import com.carpark.member.report.action.MemberReportViewAction;
import com.carpark.member.reservation.action.MemberReservationDeleteAction;
import com.carpark.member.reservation.action.MemberReservationListAction;
import com.carpark.member.reservation.action.MemberReservationRegisterAction;
import com.carpark.member.reservation.action.MemberReservationViewAction;
import com.carpark.member.review.action.MemberReviewDeleteAction;
import com.carpark.member.review.action.MemberReviewListAction;
import com.carpark.member.review.action.MemberReviewModifyAction;
import com.carpark.member.review.action.MemberReviewRegisterAction;

public class MemberActionFactory {
	
	private static Action memberDeleteAction;
	private static Action memberInfoAction;
	private static Action memberLoginAction;
	private static Action memberModifyAction;
	private static Action memberRegisterAction;
	
	private static Action memberSearchAction;
	private static Action memberSearchDetailAction;
	private static Action memberLogoutAction;
	
	
	private static Action memberCallDeleteAction;
	private static Action memberCallListAction;
	private static Action memberCallModifyAction;
	private static Action memberCallRegisterAction;
	private static Action memberCallViewAction;
	
	private static Action memberFavoriteDeleteAction;
	private static Action memberFavoriteListAction;
	private static Action memberFavoriteRegisterAction;
	
	private static Action memberMessageDeleteAction;
	private static Action memberMessageListAction;
	private static Action memberMessageRegisterAction;
	private static Action memberMessageViewAction;
	private static Action memberMessageWriteAction;
	
	private static Action memberReportListAction;
	private static Action memberReportRegisterAction;
	private static Action memberReportViewAction;
	
	private static Action memberReservationDeleteAction;
	private static Action memberReservationListAction;
	private static Action memberReservationRegisterAction;
	private static Action memberReservationViewAction;
	
	private static Action memberReviewDeleteAction;
	private static Action memberReviewListAction;
	private static Action memberReviewModifyAction;
	private static Action memberReviewRegisterAction;
	
	static {
		memberDeleteAction = new MemberDeleteAction();
		memberInfoAction = new MemberInfoAction();
		memberLoginAction = new MemberLoginAction();
		memberModifyAction = new MemberModifyAction();
		memberRegisterAction = new MemberRegisterAction();
		
		
		memberSearchAction = new MemberSearchAction();
		memberSearchDetailAction = new MemberSearchDetailAction();
		memberLogoutAction = new MemberLogoutAction();
		
		memberCallDeleteAction = new MemberCallDeleteAction();
		memberCallListAction = new MemberCallListAction();
		memberCallModifyAction = new MemberCallModifyAction();
		memberCallRegisterAction = new MemberCallRegisterAction();
		memberCallViewAction = new MemberCallViewAction();
		
		memberFavoriteDeleteAction = new MemberFavoriteDeleteAction();
		memberFavoriteListAction = new MemberFavoriteListAction();
		memberFavoriteRegisterAction = new MemberFavoriteRegisterAction();
		
		memberMessageDeleteAction = new MemberMessageDeleteAction();
		memberMessageListAction = new MemberMessageListAction();
		memberMessageRegisterAction = new MemberMessageRegisterAction();
		memberMessageViewAction = new MemberMessageViewAction();
		memberMessageWriteAction = new MemberMessageWriteAction();
		
		memberReportListAction = new MemberReportListAction();
		memberReportRegisterAction = new MemberReportRegisterAction();
		memberReportViewAction = new MemberReportViewAction();
		
		memberReservationDeleteAction = new MemberReservationDeleteAction();
		memberReservationListAction = new MemberReservationListAction();
		memberReservationRegisterAction = new MemberReservationRegisterAction();
		memberReservationViewAction = new MemberReservationViewAction();
		
		memberReviewDeleteAction = new MemberReviewDeleteAction();
		memberReviewListAction = new MemberReviewListAction();
		memberReviewModifyAction = new MemberReviewModifyAction();
		memberReviewRegisterAction = new MemberReviewRegisterAction();
	}


	public static Action getMemberSearchDetailAction() {
		return memberSearchDetailAction;
	}

	public static Action getMemberLogoutAction() {
		return memberLogoutAction;
	}

	public static Action getMemberSearchAction() {
		return memberSearchAction;
	}

	public static Action getMemberDeleteAction() {
		return memberDeleteAction;
	}

	public static Action getMemberInfoAction() {
		return memberInfoAction;
	}


	public static Action getMemberLoginAction() {
		return memberLoginAction;
	}

	public static Action getMemberModifyAction() {
		return memberModifyAction;
	}

	public static Action getMemberRegisterAction() {
		return memberRegisterAction;
	}

	public static Action getMemberCallDeleteAction() {
		return memberCallDeleteAction;
	}

	public static Action getMemberCallListAction() {
		return memberCallListAction;
	}

	public static Action getMemberCallModifyAction() {
		return memberCallModifyAction;
	}

	public static Action getMemberCallRegisterAction() {
		return memberCallRegisterAction;
	}

	public static Action getMemberCallViewAction() {
		return memberCallViewAction;
	}

	public static Action getMemberFavoriteDeleteAction() {
		return memberFavoriteDeleteAction;
	}

	public static Action getMemberFavoriteListAction() {
		return memberFavoriteListAction;
	}

	public static Action getMemberFavoriteRegisterAction() {
		return memberFavoriteRegisterAction;
	}

	public static Action getMemberMessageDeleteAction() {
		return memberMessageDeleteAction;
	}

	public static Action getMemberMessageListAction() {
		return memberMessageListAction;
	}

	public static Action getMemberMessageRegisterAction() {
		return memberMessageRegisterAction;
	}

	public static Action getMemberMessageViewAction() {
		return memberMessageViewAction;
	}
	
	public static Action getMemberMessageWriteAction() {
		return memberMessageWriteAction;
	}
	
	public static Action getMemberReportListAction() {
		return memberReportListAction;
	}

	public static Action getMemberReportRegisterAction() {
		return memberReportRegisterAction;
	}

	public static Action getMemberReportViewAction() {
		return memberReportViewAction;
	}

	public static Action getMemberReservationDeleteAction() {
		return memberReservationDeleteAction;
	}

	public static Action getMemberReservationListAction() {
		return memberReservationListAction;
	}

	public static Action getMemberReservationRegisterAction() {
		return memberReservationRegisterAction;
	}

	public static Action getMemberReservationViewAction() {
		return memberReservationViewAction;
	}

	public static Action getMemberReviewDeleteAction() {
		return memberReviewDeleteAction;
	}

	public static Action getMemberReviewListAction() {
		return memberReviewListAction;
	}

	public static Action getMemberReviewModifyAction() {
		return memberReviewModifyAction;
	}

	public static Action getMemberReviewRegisterAction() {
		return memberReviewRegisterAction;
	}
}
