package com.carpark.factory;

import com.carpark.action.Action;
import com.carpark.member.call.action.MemberCallDeleteAction;
import com.carpark.member.call.action.MemberCallListAction;
import com.carpark.member.call.action.MemberCallModifyAction;
import com.carpark.member.call.action.MemberCallRegisterAction;
import com.carpark.member.call.action.MemberCallViewAction;
import com.carpark.member.favorite.action.MemberFavoriteDeleteAction;
import com.carpark.member.favorite.action.MemberFavoriteListAction;
import com.carpark.member.favorite.action.MemberFavoriteRegisterAction;
import com.carpark.member.message.action.MemberMessageDeleteAction;
import com.carpark.member.message.action.MemberMessageListAction;
import com.carpark.member.message.action.MemberMessageRegisterAction;
import com.carpark.member.message.action.MemberMessageViewAction;
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
		memberMessageRegisterAction = new MemberMessageRegisterAction();;
		memberMessageViewAction = new MemberMessageViewAction();;
		
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
