package com.carpark.admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
//			pstmt.setString(idx++, parkingDetailDto.getImg_file_name());
		
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

	@Override
	public List<ParkingDetailDto> parkingList(Map<String, String> map) {
		List<ParkingDetailDto> list = new ArrayList<ParkingDetailDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String key = map.get("key");
		String word = map.get("word");
		String visit = map.get("visit");
		String flag = map.get("flag");
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select b.rn, b.park_id, b.park_name, b.owner_id, b.park_flag, b.park_avgPoint, b.park_public, b.park_visit \n";
			sql += "from \n";
		    sql += "  		(select rownum rn, a.park_id, a.park_name, a.owner_id, a.park_flag, a.park_avgPoint, a.park_public, a.park_visit \n"; 
		    sql += "         from \n";
		    sql += "     		  (select p.park_id, park_name, owner_id, park_flag, park_avgPoint, park_public, park_visit \n";
		    sql += "               from parking p, parking_detail d \n";
		    sql += "               where p.park_id = d.park_id \n";
		    sql += "			   and park_public = ? \n";	
		    if(flag != null && !flag.isEmpty()) {
		    	sql += "		   and d.park_visit = ? \n";
		    }
		    if(key != null && !key.isEmpty()) {
		    	if(word != null && !word.isEmpty()) {
		    		sql += "   and " + key + " = ? \n";						
		    	}
		    }
		    sql += "               order by park_name) a \n";
		    sql += "         where rownum < ? ) b \n";
		    sql += "where rn > ? \n";
			pstmt = conn.prepareStatement(sql);
			int idx = 0;
			pstmt.setString(++idx, flag);
		    if(flag != null && !flag.isEmpty()) {
		    	pstmt.setString(++idx, visit);
		    }
			if(key != null && !key.isEmpty()) {
				if(word != null && !word.isEmpty()) {
					pstmt.setString(++idx, map.get("word"));				
				}
			}
			pstmt.setString(++idx, map.get("end"));
			pstmt.setString(++idx, map.get("start"));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ParkingDetailDto parkingDto = new ParkingDetailDto();
				parkingDto.setPark_id(rs.getInt("park_id"));
				parkingDto.setPark_name(rs.getString("park_name"));
				parkingDto.setOwner_id(rs.getString("owner_id"));
				parkingDto.setPark_flag(rs.getInt("park_flag"));
				parkingDto.setPark_avgPoint(rs.getInt("park_avgPoint"));
				parkingDto.setPark_public(rs.getInt("park_public"));
				parkingDto.setPark_visit(rs.getInt("park_visit"));
				
				list.add(parkingDto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void parkingRegister(ParkingDetailDto parkingDetailDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "insert all \n";
			sql += "	into parking (park_id, park_name, park_capacity, owner_id, latitude, "
										+ "longitude, content, detail_addr, park_public, pic_seq) \n";
			sql += "	values (? ,? ,? ,? ,? ,?, ?, ?, ?, ?) \n";
			sql += "	into parking_detail (park_id, park_flag, PAY_YN, satur_pay_yn, holi_pay_yn, "
												+ "fulltime_monthly_pay, park_rate, "
												+ "park_time_rate, add_park_rate, day_max_pay, park_visit, facility) \n";
			sql += "	values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			sql += "select * from dual";
			
			pstmt = conn.prepareStatement(sql);
			int idx = 0;
			//parking table
			pstmt.setInt(++idx, parkingDetailDto.getPark_id());
			pstmt.setString(++idx, parkingDetailDto.getPark_name());
			pstmt.setInt(++idx, parkingDetailDto.getPark_capacity());
			pstmt.setString(++idx, parkingDetailDto.getOwner_id());
			pstmt.setDouble(++idx, parkingDetailDto.getLatitude());
			pstmt.setDouble(++idx, parkingDetailDto.getLongitude());
			pstmt.setString(++idx, parkingDetailDto.getContent());
			pstmt.setString(++idx, parkingDetailDto.getDetailAddr());
			pstmt.setInt(++idx, parkingDetailDto.getPark_public());
			pstmt.setInt(++idx, parkingDetailDto.getPic_seq());
			//parking_detail table
			pstmt.setInt(++idx, parkingDetailDto.getPark_id());
			pstmt.setInt(++idx, parkingDetailDto.getPark_flag());
			pstmt.setString(++idx, parkingDetailDto.getPay_yn());
			pstmt.setString(++idx, parkingDetailDto.getSatur_pay_yn());
			pstmt.setString(++idx, parkingDetailDto.getHoli_pay_yn());
			pstmt.setInt(++idx, parkingDetailDto.getFulltime_monthly_pay());
			pstmt.setInt(++idx, parkingDetailDto.getPark_rate());
			pstmt.setInt(++idx, parkingDetailDto.getPark_time_rate());
			pstmt.setInt(++idx, parkingDetailDto.getAdd_park_rate());
			pstmt.setInt(++idx, parkingDetailDto.getDay_max_pay());
			pstmt.setInt(++idx, parkingDetailDto.getPark_visit());
			pstmt.setString(++idx, parkingDetailDto.getFacility());

			pstmt.executeUpdate();
	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}

		
	}

	@Override
	public void adminParkingVisit(String parkId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "update parking_detail \n";
			sql += "set park_visit = 1 \n";
			sql += "where park_id = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, parkId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		
	}
	
	
}
