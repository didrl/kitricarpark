package com.carpark.factory;

import com.carpark.action.Action;
import com.carpark.admin.action.AdminAllUserInfoAction;
import com.carpark.admin.action.AdminLoginAction;
import com.carpark.admin.call.action.AdminCallConfirmAction;
import com.carpark.admin.call.action.AdminCallDeleteAction;
import com.carpark.admin.call.action.AdminCallListAction;
import com.carpark.admin.call.action.AdminCallModifyAction;
import com.carpark.admin.call.action.AdminCallRegisterAction;
import com.carpark.admin.call.action.AdminCallViewAction;
import com.carpark.admin.evaluation.action.AdminEvaluationDeleteAction;
import com.carpark.admin.evaluation.action.AdminEvaluationListAction;
import com.carpark.admin.evaluation.action.AdminEvaluationModifyAction;
import com.carpark.admin.evaluation.action.AdminEvaluationRegisterAction;
import com.carpark.admin.evaluation.action.AdminEvaluationSearchAction;
import com.carpark.admin.grade.action.AdminGradeDeleteAction;
import com.carpark.admin.grade.action.AdminGradeListAction;
import com.carpark.admin.grade.action.AdminGradeModifyAction;
import com.carpark.admin.grade.action.AdminGradeRegisterAction;
import com.carpark.admin.parking.action.AdminParkingAuthAction;
import com.carpark.admin.parking.action.AdminParkingAuthListAction;
import com.carpark.admin.parking.action.AdminParkingDeleteAction;
import com.carpark.admin.parking.action.AdminParkingListAction;
import com.carpark.admin.parking.action.AdminParkingModifyAction;
import com.carpark.admin.parking.action.AdminParkingRegisterAction;
import com.carpark.admin.parking.action.AdminParkingSearchAction;
import com.carpark.admin.parking.action.AdminParkingViewAction;
import com.carpark.admin.report.action.AdminReportDeleteAction;
import com.carpark.admin.report.action.AdminReportListAction;
import com.carpark.admin.report.action.AdminReportListFlagAction;
import com.carpark.admin.report.action.AdminReportRegisterAction;
import com.carpark.admin.report.action.AdminReportViewAction;

public class AdminActionFactory {
	private static Action adminEvaluationDeleteAction;
	private static Action adminEvaluationListAction;
	private static Action adminEvaluationModifyAction;
	private static Action adminEvaluationRegisterAction;
	private static Action adminEvaluationSearchAction;
	
	private static Action adminGradeDeleteAction;
	private static Action adminGradeListAction;
	private static Action adminGradeModifyAction;
	private static Action adminGradeRegisterAction;
	private static Action adminGradeSearchAction;
	
	private static Action adminParkingDeleteAction;
	private static Action adminParkingListAction;
	private static Action adminParkingModifyAction;
	private static Action adminParkingRegisterAction;
	private static Action adminParkingSearchAction;
	private static Action adminParkingAuthListAction;
	private static Action adminParkingViewAction;
	private static Action adminParkingAuthAction;
	
	private static Action adminCallDeleteAction;
	private static Action adminCallListAction;
	private static Action adminCallModifyAction;
	private static Action adminCallRegisterAction;
	private static Action adminCallViewAction;
	private static Action adminCallConfirmAction;
	
	
	private static Action adminAllUserInfoAction;
	
	private static Action adminReportListAction;
	private static Action adminReportListFlagAction;
	private static Action adminReportViewAction;
	private static Action adminReportDeleteAction;
	private static Action adminReportRegisterAction;
	
	private static Action adminLoginAction;
	


	static {
		
		adminLoginAction = new AdminLoginAction();
		
		adminAllUserInfoAction = new AdminAllUserInfoAction();
		
		adminEvaluationDeleteAction = new AdminEvaluationDeleteAction();
		adminEvaluationListAction = new AdminEvaluationListAction();
		adminEvaluationModifyAction = new AdminEvaluationModifyAction();
		adminEvaluationRegisterAction = new AdminEvaluationRegisterAction();
		adminEvaluationSearchAction = new AdminEvaluationSearchAction();
		
		adminGradeDeleteAction = new AdminGradeDeleteAction();
		adminGradeListAction = new AdminGradeListAction();
		adminGradeModifyAction = new AdminGradeModifyAction();
		adminGradeRegisterAction = new AdminGradeRegisterAction();
		
		adminParkingDeleteAction = new AdminParkingDeleteAction();
		adminParkingModifyAction = new AdminParkingModifyAction();
		adminParkingRegisterAction = new AdminParkingRegisterAction();
		adminParkingSearchAction = new AdminParkingSearchAction();
		adminParkingListAction = new AdminParkingListAction();
		adminParkingAuthListAction = new AdminParkingAuthListAction();
		adminParkingViewAction = new AdminParkingViewAction();
		adminParkingAuthAction = new AdminParkingAuthAction();
		
		adminCallDeleteAction = new AdminCallDeleteAction();
		adminCallListAction = new AdminCallListAction();
		adminCallModifyAction = new AdminCallModifyAction();
		adminCallRegisterAction = new AdminCallRegisterAction();
		adminCallViewAction = new AdminCallViewAction();	
		adminCallConfirmAction = new AdminCallConfirmAction();
		
		adminReportListAction = new AdminReportListAction();
		adminReportListFlagAction = new AdminReportListFlagAction();
		adminReportViewAction = new AdminReportViewAction();
		adminReportDeleteAction = new AdminReportDeleteAction();
		adminReportRegisterAction = new AdminReportRegisterAction();
		
		}
	public static Action getAdminLoginAction() {
		return adminLoginAction;
	}

	public static Action getAdminCallConfirmAction() {
		return adminCallConfirmAction;
	}

	public static Action getAdminAllUserInfoAction() {
		return adminAllUserInfoAction;
	}

	public static Action getAdminCallDeleteAction() {
		return adminCallDeleteAction;
	}

	public static Action getAdminCallListAction() {
		return adminCallListAction;
	}

	public static Action getAdminCallModifyAction() {
		return adminCallModifyAction;
	}

	public static Action getAdminCallRegisterAction() {
		return adminCallRegisterAction;
	}

	public static Action getAdminCallViewAction() {
		return adminCallViewAction;
	}

	public static Action getAdminEvaluationDeleteAction() {
		return adminEvaluationDeleteAction;
	}

	public static Action getAdminEvaluationListAction() {
		return adminEvaluationListAction;
	}

	public static Action getAdminEvaluationModifyAction() {
		return adminEvaluationModifyAction;
	}

	public static Action getAdminEvaluationRegisterAction() {
		return adminEvaluationRegisterAction;
	}

	public static Action getAdminEvaluationSearchAction() {
		return adminEvaluationSearchAction;
	}

	public static Action getAdminGradeDeleteAction() {
		return adminGradeDeleteAction;
	}

	public static Action getAdminGradeListAction() {
		return adminGradeListAction;
	}

	public static Action getAdminGradeModifyAction() {
		return adminGradeModifyAction;
	}

	public static Action getAdminGradeRegisterAction() {
		return adminGradeRegisterAction;
	}

	public static Action getAdminGradeSearchAction() {
		return adminGradeSearchAction;
	}

	public static Action getAdminParkingDeleteAction() {
		return adminParkingDeleteAction;
	}

	public static Action getAdminParkingListAction() {
		return adminParkingListAction;
	}

	public static Action getAdminParkingModifyAction() {
		return adminParkingModifyAction;
	}

	public static Action getAdminParkingRegisterAction() {
		return adminParkingRegisterAction;
	}

	public static Action getAdminParkingSearchAction() {
		return adminParkingSearchAction;
	}

	public static Action getAdminReportListAction() {
		return adminReportListAction;
	}

	public static Action getAdminReportViewAction() {
		return adminReportViewAction;
	}

	public static Action getAdminReportDeleteAction() {
		return adminReportDeleteAction;
	}

	public static Action getAdminReportListFlagAction() {
		return adminReportListFlagAction;
	}

	public static Action getAdminReportRegisterAction() {
		return adminReportRegisterAction;
	}

	public static Action getAdminParkingAuthListAction() {
		return adminParkingAuthListAction;
	}

	public static Action getAdminParkingViewAction() {
		return adminParkingViewAction;
	}

	public static Action getAdminParkingAuthAction() {
		return adminParkingAuthAction;
	}
	
	
	
}
