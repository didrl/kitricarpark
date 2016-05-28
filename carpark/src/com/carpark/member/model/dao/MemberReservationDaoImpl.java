package com.carpark.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.carpark.db.DBClose;
import com.carpark.db.DBConnection;
import com.carpark.member.model.MemberCarDto;
import com.carpark.member.model.ReservationDto;

public class MemberReservationDaoImpl implements MemberReservationDao {
	
	private static MemberReservationDao memberReservationDao;
	
	static {
		memberReservationDao = new MemberReservationDaoImpl();
	}
	
	private MemberReservationDaoImpl(){}

	public static MemberReservationDao getMemberReservationDao() {
		return memberReservationDao;
	}

	@Override
	public ArrayList<MemberCarDto> getCarInfo(String user_id) {
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		MemberCarDto memberCarDto;
		ArrayList<MemberCarDto> list = new ArrayList<MemberCarDto>();
		
		try {
			conn=DBConnection.makeConnection();
			String sql="";
			sql += "select ci.car_id, ci.maker, ci.model, mc.category, mc.reg_num \n";
			sql += "from car_info ci, member_car mc \n"; 
			sql += "where ci.car_id = mc.car_id\n";
			sql += "and mc.user_id=?";
			pstmt = conn.prepareStatement(sql);//미리 sql 문장을 가져가서 검사하고 틀린게 없을 때 실행
			int idx =1;//중간에 없어지거나 추가될때 필요
			pstmt.setString(idx++, user_id);

			rs=pstmt.executeQuery();
			
//			System.out.println("id   in carinfo "+user_id);
//			System.out.println(sql);

			while(rs.next()){
				memberCarDto = new MemberCarDto();
				
				memberCarDto.setCar_id(rs.getString("car_id"));
				memberCarDto.setMaker(rs.getString("maker"));
				memberCarDto.setModel(rs.getString("model"));
				memberCarDto.setCategory(rs.getString("category"));
				memberCarDto.setReg_num(rs.getString("reg_num"));
				
				list.add(memberCarDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}	
		return list;
	}

	@Override
	public ArrayList<Map<String,String>> getUsingDate(int park_id) {
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		Map<String, String> map = null;
		ArrayList<Map<String,String>> list = new ArrayList<Map<String,String>>();
		
		try {
			conn=DBConnection.makeConnection();
			String sql="";
			sql += "select to_char(start_date,'yyyy.mm.dd') start_date, to_char(end_date,'yyyy.mm.dd') end_date, \n";
			sql += "end_date-start_date betweendate \n";
			sql += "from reservation \n"; 
			sql += "where park_id =? \n"; 
			pstmt = conn.prepareStatement(sql);//미리 sql 문장을 가져가서 검사하고 틀린게 없을 때 실행
			int idx =1;//중간에 없어지거나 추가될때 필요
	
			pstmt.setInt(idx++, park_id);
			rs=pstmt.executeQuery();
			
//			System.out.println("park_id    in getdate"+park_id);
//			System.out.println(sql);

			while(rs.next()){
				map = new HashMap<String, String>();
				map.put("startdate", rs.getString("startdate"));
				map.put("betweendate", rs.getString("betweendate"));		// end_date - start_date
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}	
		return list;
	}

	@Override
	public void registerReservation(ReservationDto reservationDto) {
		Connection conn=null;
		PreparedStatement pstmt =null;
		
		try {
			conn=DBConnection.makeConnection();
			String sql="";
			sql += "insert into reservation (reser_id, park_id, user_id, start_date, end_date, pay) \n";
			sql += "values(concat(to_char(systimestamp, 'yyyymmddhh24missFF3'),?),?,?,?,?,?)\n"; 
			pstmt = conn.prepareStatement(sql);//미리 sql 문장을 가져가서 검사하고 틀린게 없을 때 실행
			int idx =1;//중간에 없어지거나 추가될때 필요
			pstmt.setInt(idx++, reservationDto.getPark_id());
			pstmt.setInt(idx++, reservationDto.getPark_id());
			pstmt.setString(idx++, reservationDto.getUser_id());
			pstmt.setString(idx++, reservationDto.getFromdate());
			pstmt.setString(idx++, reservationDto.getTodate());
			pstmt.setInt(idx++, reservationDto.getPay());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt);
		}	

	}
	
	
}
