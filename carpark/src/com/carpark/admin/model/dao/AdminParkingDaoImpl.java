package com.carpark.admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import com.carpark.common.model.ParkingDetailDto;
import com.carpark.db.DBClose;
import com.carpark.db.DBConnection;
import com.carpark.member.model.ReservationDto;

public class AdminParkingDaoImpl implements AdminParkingDao {

	private static AdminParkingDao adminParkingDao;
	
	static {
		adminParkingDao = new AdminParkingDaoImpl();
	}
	
	private AdminParkingDaoImpl(){}

	public static AdminParkingDao getAdminParkingDao() {
		return adminParkingDao;
	}

	@Override
	public int registerReservation(ParkingDetailDto parkingDetailDto) {
		Connection conn=null;
		PreparedStatement pstmt =null;
		int count = 0;
		try {
			conn=DBConnection.makeConnection();
			String sql="";
			sql += "insert all \n";
			sql += "into parking \n";
			sql += "values(?,?,?) \n";
			sql += "into parking_detail \n";
			sql += "values(?,?,?,?,?,?,?,?) \n";
			sql += "into parking_img \n";
			sql += "values(?) \n";
			pstmt = conn.prepareStatement(sql);//미리 sql 문장을 가져가서 검사하고 틀린게 없을 때 실행
			int idx =1;//중간에 없어지거나 추가될때 필요
			pstmt.setString(idx++, parkingDetailDto.getPark_type());
			pstmt.setString(idx++, parkingDetailDto.getPark_name());
			pstmt.setString(idx++, parkingDetailDto.getDetailAddr());
			pstmt.setString(idx++, parkingDetailDto.getPay_yn());
			pstmt.setString(idx++, parkingDetailDto.getSatur_pay_yn());
			pstmt.setString(idx++, parkingDetailDto.getHoli_pay_yn());
			pstmt.setInt(idx++,parkingDetailDto.getDay_max_pay());
			pstmt.setInt(idx++, parkingDetailDto.getPark_rate());
			pstmt.setInt(idx++,parkingDetailDto.getAdd_park_rate());
			pstmt.setInt(idx++, parkingDetailDto.getPark_time_rate());
			pstmt.setInt(idx++,parkingDetailDto.getFulltime_monthly_pay());
			pstmt.setString(idx++, parkingDetailDto.getImg_file_name());
		
			count =pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt);
		}	
		return count;
	}

	@Override
	public ArrayList<ReservationDto> myReservationList(String user_id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
