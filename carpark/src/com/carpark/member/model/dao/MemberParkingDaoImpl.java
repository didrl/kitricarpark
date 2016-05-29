package com.carpark.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.carpark.common.model.CitiesDto;
import com.carpark.common.model.ParkingDetailDto;
import com.carpark.db.DBClose;
import com.carpark.db.DBConnection;

public class MemberParkingDaoImpl implements MemberParkingDao {
	
	private static MemberParkingDao memberParkingDao;
	
	static {
		memberParkingDao = new MemberParkingDaoImpl();
	}
	
	private MemberParkingDaoImpl(){}
	
	public static MemberParkingDao getMemberParkingDao() {
		return memberParkingDao;
	}

	@Override
	public void MemberParkingRegister(ParkingDetailDto parkingDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "insert all \n";
			sql += "	into parking (park_id, park_name, park_capacity, owner_id, latitude, "
										+ "longitude, park_type, emd_code) \n";
			sql += "	values (? ,? ,? ,? ,? ,? ,?, ?) \n";
			sql += "	into parking_facility (park_id, facility, feature) \n";
			sql += "	values (?, ?, ?) \n";
			sql += "	into parking_img (park_id, file_name, file_path) \n";
			sql += "	values (?, ?, ?) \n";
			sql += "	into parking_detail (park_id, park_flag, PAY_YN, satur_pay_yn, holi_pay_yn, "
												+ "fulltime_monthly_pay, park_rate, "
												+ "park_time_rate, add_park_rate, day_max_pay) \n";
			sql += "	values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			sql += "select * from dual";
			
			pstmt = conn.prepareStatement(sql);
			int idx = 0;
			//parking table
			pstmt.setInt(++idx, parkingDto.getParkId());
			pstmt.setString(++idx, parkingDto.getParkName());
			pstmt.setInt(++idx, parkingDto.getParkCapacity());
			pstmt.setString(++idx, parkingDto.getOwnerId());
			pstmt.setDouble(++idx, parkingDto.getLatitude());
			pstmt.setDouble(++idx, parkingDto.getLongtitude());
			pstmt.setString(++idx, parkingDto.getParkType());
			pstmt.setInt(++idx, parkingDto.getEmdCode());
			//parking_facility table
			pstmt.setInt(++idx, parkingDto.getParkId());
			pstmt.setString(++idx, parkingDto.getFacility());
			pstmt.setString(++idx, parkingDto.getFeature());
			//parking_img table
			pstmt.setInt(++idx, parkingDto.getParkId());
			pstmt.setString(++idx, parkingDto.getFileName());
			pstmt.setString(++idx, parkingDto.getFilePath());
			//parking_img table
			pstmt.setInt(++idx, parkingDto.getParkId());
			pstmt.setInt(++idx, parkingDto.getParkFlag());
			pstmt.setString(++idx, parkingDto.getPayYn());
			pstmt.setString(++idx, parkingDto.getSaturPayYn());
			pstmt.setString(++idx, parkingDto.getHoliPayYn());
			pstmt.setInt(++idx, parkingDto.getFullTimeMonthlyPay());
			pstmt.setInt(++idx, parkingDto.getParkRate());
			pstmt.setInt(++idx, parkingDto.getParkTimeRate());
			pstmt.setInt(++idx, parkingDto.getAddParkRate());
			pstmt.setInt(++idx, parkingDto.getDayMaxPay());

			pstmt.executeUpdate();
	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}

	}

	@Override
	public int MemberParkingModify(int parkingId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ParkingDetailDto> MemberParkingList(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void MemberParkingDelete(int parkingId) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<CitiesDto> ParkSearch(String address) {
		List<CitiesDto> list = new ArrayList<CitiesDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select sgg_code, emd_code, sgg_name, emd_name, lat, lng \n";
			sql += "from cities \n";
			sql += "where emd_name like '%'||?||'%' "; // "%" + ? + "%"
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, address);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CitiesDto citiesDto = new CitiesDto();
				
				citiesDto.setSsgCode(rs.getInt("sgg_code"));
				citiesDto.setEmdCode(rs.getInt("emd_code"));
				citiesDto.setSsgName(rs.getString("sgg_name"));
				citiesDto.setEmdName(rs.getString("emd_name"));
				citiesDto.setLat(rs.getDouble("lat"));
				citiesDto.setLng(rs.getDouble("lng"));
				
				list.add(citiesDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;
	}

}
