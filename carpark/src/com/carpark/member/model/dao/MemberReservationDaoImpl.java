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
	public ArrayList<Map<String, String>> getCarInfo(String user_id) {
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		Map<String, String> map = null;
		ArrayList<Map<String, String>> list = new ArrayList<Map<String, String>>();
		
		try {
			conn=DBConnection.makeConnection();
			String sql="";
			sql += "select carinfor \n";
			sql += "from member \n"; 
			sql += "where user_id =? \n"; 
			pstmt = conn.prepareStatement(sql);//미리 sql 문장을 가져가서 검사하고 틀린게 없을 때 실행
			int idx =1;//중간에 없어지거나 추가될때 필요
			pstmt.setString(idx++, user_id);

			rs=pstmt.executeQuery();
			
			System.out.println("id"+user_id);
			System.out.println("carinfo"+rs.getString("carinfo"));
			System.out.println(sql);

			while(rs.next()){
				map = new HashMap<String, String>();
				map.put("carinfo", rs.getString("carinfo"));
				
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
	public ArrayList<String> getUsingDate(int park_id) {
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		ArrayList<String> list = new ArrayList<String>();
		
		try {
			conn=DBConnection.makeConnection();
			String sql="";
//			sql += "select start_date, end_date \n";
			sql += "select to_char(start_date,'yyyymmdd) start_date, to_char(end_date,'yyyymmdd) end_date\n";
			sql += "from reservation \n"; 
			sql += "where park_id =? \n"; 
			pstmt = conn.prepareStatement(sql);//미리 sql 문장을 가져가서 검사하고 틀린게 없을 때 실행
			int idx =1;//중간에 없어지거나 추가될때 필요
			pstmt.setInt(idx++, park_id);

			rs=pstmt.executeQuery();
			
			System.out.println("id"+park_id);
			System.out.println("startdate"+rs.getString("start_date")+"    enddate"+rs.getString("end_date"));
			System.out.println(sql);

			while(rs.next()){
				list.add(rs.getString("start_date"));
				list.add(rs.getString("end_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}	
		return list;
	}
	
	
}
