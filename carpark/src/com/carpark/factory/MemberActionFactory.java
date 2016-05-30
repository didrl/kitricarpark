package com.carpark.factory;

import com.carpark.action.Action;
import com.carpark.member.action.MemberAddCarAction;
import com.carpark.member.action.MemberBenefitAction;
import com.carpark.member.action.MemberDeleteAction;
import com.carpark.member.action.MemberIdCheckAction;
import com.carpark.member.action.MemberInfoAction;
import com.carpark.member.action.MemberInfoDetailAction;
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
import com.carpark.member.parking.action.MemberParkingDeleteAction;
import com.carpark.member.parking.action.MemberParkingListAction;
import com.carpark.member.parking.action.MemberParkingModifyAction;
import com.carpark.member.parking.action.MemberParkingRegisterAction;
import com.carpark.member.parking.action.MemberParkingSearchAction;
import com.carpark.member.report.action.MemberReportListAction;
import com.carpark.member.report.action.MemberReportRegisterAction;
import com.carpark.member.report.action.MemberReportViewAction;
import com.carpark.member.reservation.action.MemberReservationDeleteAction;
import com.carpark.member.reservation.action.MemberReservationListAction;
import com.carpark.member.reservation.action.MemberReservationMoveAction;
import com.carpark.member.reservation.action.MemberReservationRegisterAction;
import com.carpark.member.reservation.action.MemberReservationViewAction;
import com.carpark.member.review.action.MemberReviewDeleteAction;
import com.carpark.member.review.action.MemberReviewListAction;
import com.carpark.member.review.action.MemberReviewModifyAction;
import com.carpark.member.review.action.MemberReviewRegisterAction;

public class MemberActionFactory {
	
	private static Action memberDeleteAction;
	private static Action memberInfoAction;
	private static Action memberInfoDetailAction;
	private static Action memberLoginAction;
	private static Action memberModifyAction;
	private static Action memberRegisterAction;
	private static Action memberAddCarAction;
	private static Action memberIdCheckAction;
	
	private static Action memberSearchAction;
	private static Action memberSearchDetailAction;
	private static Action memberLogoutAction;
	private static Action memberBenefitAction;
	
	private static Action memberCallDeleteAction;
	private static Action memberCallListAction;
	private static Action memberCallModifyAction;
	private static Action memberCallRegisterAction;
	private static Action memberCallViewAction;
	
	private static Action memberFavoriteDeleteAction;
	private static Action memberFavoriteListAction;
	private static Action memberFavoriteRegisterAction;
	
	private static Action memberMessageSendListAction;
	private static Action memberMessageReceiveListAction;	
	private static Action memberMessageWriteAction;
	private static Action memberMessageSendViewAction;
	private static Action memberMessageReceiveViewAction;
	private static Action memberMessageSendDeleteAction;
	private static Action memberMessageReceiveDeleteAction;
	
	private static Action memberReportListAction;
	private static Action memberReportRegisterAction;
	private static Action memberReportViewAction;
	
	private static Action memberReservationDeleteAction;
	private static Action memberReservationListAction;
	private static Action memberReservationRegisterAction;
	private static Action memberReservationViewAction;
	private static Action memberReservationMoveAction;
	
	private static Action memberReviewDeleteAction;
	private static Action memberReviewListAction;
	private static Action memberReviewModifyAction;
	private static Action memberReviewRegisterAction;
	
	private static Action memberParkingRegisterAction;
	private static Action memberParkingSearchAction;
	private static Action memberParkingModifyAction;
	private static Action memberParkingListAction;
	private static Action memberParkingDeleteAction;
	
	static {
		memberDeleteAction = new MemberDeleteAction();
		memberInfoAction = new MemberInfoAction();
		memberInfoDetailAction = new MemberInfoDetailAction();
		memberLoginAction = new MemberLoginAction();
		memberModifyAction = new MemberModifyAction();
		memberRegisterAction = new MemberRegisterAction();
		memberIdCheckAction= new MemberIdCheckAction();
		
		memberSearchAction = new MemberSearchAction();
		memberSearchDetailAction = new MemberSearchDetailAction();
		memberLogoutAction = new MemberLogoutAction();
		memberAddCarAction = new MemberAddCarAction();
		memberBenefitAction = new MemberBenefitAction();
		
		memberCallDeleteAction = new MemberCallDeleteAction();
		memberCallListAction = new MemberCallListAction();
		memberCallModifyAction = new MemberCallModifyAction();
		memberCallRegisterAction = new MemberCallRegisterAction();
		memberCallViewAction = new MemberCallViewAction();
		
		memberFavoriteDeleteAction = new MemberFavoriteDeleteAction();
		memberFavoriteListAction = new MemberFavoriteListAction();
		memberFavoriteRegisterAction = new MemberFavoriteRegisterAction();
		
		memberMessageSendListAction = new MemberMessageSendListAction();
		memberMessageReceiveListAction = new MemberMessageReceiveListAction();
		memberMessageWriteAction = new MemberMessageWriteAction();
		memberMessageSendViewAction = new MemberMessageSendViewAction();
		memberMessageReceiveViewAction = new MemberMessageReceiveViewAction();
		memberMessageSendDeleteAction = new MemberMessageSendDeleteAction();
		memberMessageReceiveDeleteAction = new MemberMessageReceiveDeleteAction();
		
		memberReportListAction = new MemberReportListAction();
		memberReportRegisterAction = new MemberReportRegisterAction();
		memberReportViewAction = new MemberReportViewAction();
		
		memberReservationDeleteAction = new MemberReservationDeleteAction();
		memberReservationListAction = new MemberReservationListAction();
		memberReservationRegisterAction = new MemberReservationRegisterAction();
		memberReservationViewAction = new MemberReservationViewAction();
		memberReservationMoveAction= new MemberReservationMoveAction();
		
		memberReviewDeleteAction = new MemberReviewDeleteAction();
		memberReviewListAction = new MemberReviewListAction();
		memberReviewModifyAction = new MemberReviewModifyAction();
		memberReviewRegisterAction = new MemberReviewRegisterAction();
		
		memberParkingRegisterAction = new MemberParkingRegisterAction();
		memberParkingSearchAction = new MemberParkingSearchAction();
		memberParkingModifyAction = new MemberParkingModifyAction();
		memberParkingListAction = new MemberParkingListAction();
		memberParkingDeleteAction = new MemberParkingDeleteAction();
		
	}

	public static Action getMemberBenefitAction() {
		return memberBenefitAction;
	}

	public static Action getMemberIdCheckAction() {
		return memberIdCheckAction;
	}

	public static Action getMemberInfoDetailAction() {
		return memberInfoDetailAction;
	}

	public static Action getMemberAddCarAction() {
		return memberAddCarAction;
	}
	public static Action getMemberSearchDetailAction() {
		return memberSearchDetailAction;
	}
	public static Action getMemberReservationMoveAction() {
		return memberReservationMoveAction;
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

	
	public static Action getMemberMessageSendListAction() {
		return memberMessageSendListAction;
	}
	
	public static Action getMemberMessageReceiveListAction() {
		return memberMessageReceiveListAction;
	}
	
	public static Action getMemberMessageWriteAction() {
		return memberMessageWriteAction;
	}
	
	public static Action getMemberMessageSendViewAction() {
		return memberMessageSendViewAction;
	}
	
	public static Action getMemberMessageReceiveViewAction() {
		return memberMessageReceiveViewAction;
	}
	
	public static Action getMemberMessageSendDeleteAction() {
		return memberMessageSendDeleteAction;
	}
	
	public static Action getMemberMessageReceiveDeleteAction() {
		return memberMessageReceiveDeleteAction;
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

	public static Action getMemberParkingRegisterAction() {
		return memberParkingRegisterAction;
	}

	public static Action getMemberParkingSearchAction() {
		return memberParkingSearchAction;
	}

	public static Action getMemberParkingModifyAction() {
		return memberParkingModifyAction;
	}

	public static Action getMemberParkingListAction() {
		return memberParkingListAction;
	}

	public static Action getMemberParkingDeleteAction() {
		return memberParkingDeleteAction;
	}

	
	
}
