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
			sql += "select category, reg_num,car_name,user_id \n";
			sql += "from member_car \n"; 
			sql += "where user_id=?\n";
			pstmt = conn.prepareStatement(sql);//미리 sql 문장을 가져가서 검사하고 틀린게 없을 때 실행
			int idx =1;//중간에 없어지거나 추가될때 필요
			pstmt.setString(idx++, user_id);

			rs=pstmt.executeQuery();
			
//			System.out.println("id   in carinfo "+user_id);
//			System.out.println(sql);

			while(rs.next()){
				memberCarDto = new MemberCarDto();
				
				memberCarDto.setUser_id(rs.getString("user_id"));
				memberCarDto.setModel(rs.getString("car_name"));
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
				map.put("startdate", rs.getString("start_date"));
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
			sql += "insert into reservation (reser_id, park_id, user_id, start_date, end_date,rdate) \n";
			sql += "values(concat(to_char(systimestamp, 'yyyymmddhh24missFF3'),?),?,?,?,?,sysdate)\n"; 
			pstmt = conn.prepareStatement(sql);//미리 sql 문장을 가져가서 검사하고 틀린게 없을 때 실행
			int idx =1;//중간에 없어지거나 추가될때 필요
			pstmt.setInt(idx++, reservationDto.getPark_id());
			pstmt.setInt(idx++, reservationDto.getPark_id());
			pstmt.setString(idx++, reservationDto.getUser_id());
			pstmt.setString(idx++, reservationDto.getFromdate());
			pstmt.setString(idx++, reservationDto.getTodate());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt);
		}	

	}

	@Override
	public ArrayList<ReservationDto> myReservationList(String user_id) {
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		ReservationDto reservationDto;
		ArrayList<ReservationDto> list = new ArrayList<ReservationDto>();
		
		try {
			conn=DBConnection.makeConnection();
			String sql="";
			sql += "select r.user_id,r.reser_id, p.park_name, r.start_date, r.end_date,r.pay,r.park_id, p.owner_id,r.rdate  \n";
			sql += "from reservation r, parking p \n"; 
			sql += "where user_id=?\n";
			sql += "and r.park_id=p.park_id\n";
			sql += "order by r.rdate desc";
			pstmt = conn.prepareStatement(sql);//미리 sql 문장을 가져가서 검사하고 틀린게 없을 때 실행
			int idx =1;//중간에 없어지거나 추가될때 필요
			pstmt.setString(idx++, user_id);

			rs=pstmt.executeQuery();
			
//			System.out.println("id   in carinfo "+user_id);
//			System.out.println(sql);

			while(rs.next()){
				reservationDto = new ReservationDto();
				
				reservationDto.setUser_id(rs.getString("user_id"));
				reservationDto.setReser_id(rs.getString("reser_id"));
				reservationDto.setPark_name(rs.getString("park_name"));
				reservationDto.setFromdate(rs.getString("start_date"));
				reservationDto.setTodate(rs.getString("end_date"));
				reservationDto.setPay(rs.getInt("pay"));
				reservationDto.setPark_id(rs.getInt("park_id"));
				reservationDto.setHost_id(rs.getString("owner_id"));
				reservationDto.setReser_date(rs.getString("rdate"));
				
				list.add(reservationDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}	
		return list;
	}
	
	
}
