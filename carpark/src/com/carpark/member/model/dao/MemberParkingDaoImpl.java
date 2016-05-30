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
	public void MemberParkingModify(ParkingDetailDto parkingDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			String sql = "";
			sql += "update parking \n";
			sql += "set park_id = ?, park_name = ?, park_capacity = ?, owner_id = ?, latitude = ?, \n";
			sql += "longitude = ?, park_type = ?, emd_code = ? \n";
			sql += "where park_id = ? \n";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, parkingDto.getParkId());
			pstmt.setString(2, parkingDto.getParkName());
			pstmt.setInt(3, parkingDto.getParkCapacity());
			pstmt.setString(4, parkingDto.getOwnerId());
			pstmt.setDouble(5, parkingDto.getLatitude());
			pstmt.setDouble(6, parkingDto.getLongtitude());
			pstmt.setString(7, parkingDto.getParkType());
			pstmt.setInt(8, parkingDto.getEmdCode());
			pstmt.setInt(9, parkingDto.getParkId());
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "update parking_facility \n";
			sql += "set park_id = ?, facility = ?, feature = ? \n";
			sql += "where park_id = ? \n";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, parkingDto.getParkId());
			pstmt.setString(2, parkingDto.getFacility());
			pstmt.setString(3, parkingDto.getFeature());
			pstmt.setInt(4, parkingDto.getParkId());
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "update parking_img \n";
			sql += "set park_id = ?, file_name = ?, file_path = ? \n";
			sql += "where park_id = ? \n";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, parkingDto.getParkId());
			pstmt.setString(2, parkingDto.getFileName());
			pstmt.setString(3, parkingDto.getFilePath());
			pstmt.setInt(4, parkingDto.getParkId());
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "update parking_detail \n";
			sql += "set park_id = ?, park_flag = ?, PAY_YN = ?, satur_pay_yn = ?, holi_pay_yn = ?, \n";
			sql += "fulltime_monthly_pay = ?, park_rate = ?, \n";
			sql += "park_time_rate = ?, add_park_rate = ?, day_max_pay = ? \n";
			sql += "where park_id = ? \n";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, parkingDto.getParkId());
			pstmt.setInt(2, parkingDto.getParkFlag());
			pstmt.setString(3, parkingDto.getPayYn());
			pstmt.setString(4, parkingDto.getSaturPayYn());
			pstmt.setString(5, parkingDto.getHoliPayYn());
			pstmt.setInt(6, parkingDto.getFullTimeMonthlyPay());
			pstmt.setInt(7, parkingDto.getParkRate());
			pstmt.setInt(8, parkingDto.getParkTimeRate());
			pstmt.setInt(9, parkingDto.getAddParkRate());
			pstmt.setInt(10, parkingDto.getDayMaxPay());
			pstmt.setInt(11, parkingDto.getParkId());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}

	}

	@Override
	public List<ParkingDetailDto> MemberParkingList(String userId) {
		List<ParkingDetailDto> list = new ArrayList<ParkingDetailDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select p.park_id, park_name, park_capacity, owner_id, latitude, "
							+ "longitude, park_type, emd_code, content, \n";
			sql += "		facility, feature, file_name, file_path, file_num, \n";
			sql += "		park_flag, park_avgPoint, get_status, cur_parking, PAY_YN, satur_pay_yn, holi_pay_yn, "
							+ "fulltime_monthly_pay, park_rate, park_time_rate, add_park_rate, day_max_pay \n";
			sql += "from parking p, parking_facility f, parking_img i, parking_detail d \n";
			sql += "where p.park_id = f.park_id \n";
			sql += "and p.park_id = i.park_id \n";
			sql += "and p.park_id = d.park_id \n";
			sql += "and owner_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ParkingDetailDto parkingDto = new ParkingDetailDto();
				parkingDto.setParkId(rs.getInt("park_id"));
				parkingDto.setParkName(rs.getString("park_name"));
				parkingDto.setParkCapacity(rs.getInt("park_capacity"));
				parkingDto.setOwnerId(rs.getString("owner_id"));
				parkingDto.setLatitude(rs.getDouble("latitude"));
				parkingDto.setLongtitude(rs.getDouble("longitude"));
				parkingDto.setParkType(rs.getString("park_type"));
				parkingDto.setEmdCode(rs.getInt("emd_code"));
				parkingDto.setContent(rs.getString("content"));
				parkingDto.setFacility(rs.getString("facility"));
				parkingDto.setFeature(rs.getString("feature"));
				parkingDto.setFileName(rs.getString("file_name"));
				parkingDto.setFilePath(rs.getString("file_path"));
				parkingDto.setFileNum(rs.getInt("file_num"));
				parkingDto.setParkFlag(rs.getInt("park_flag"));
				parkingDto.setParkAvgPoint(rs.getInt("park_avgPoint"));
				parkingDto.setGetStatus(rs.getInt("get_status"));
				parkingDto.setCurParking(rs.getInt("cur_parking"));
				parkingDto.setPayYn(rs.getString("PAY_YN"));
				parkingDto.setSaturPayYn(rs.getString("satur_pay_yn"));
				parkingDto.setHoliPayYn(rs.getString("holi_pay_yn"));
				parkingDto.setFullTimeMonthlyPay(rs.getInt("fulltime_monthly_pay"));
				parkingDto.setParkRate(rs.getInt("park_rate"));
				parkingDto.setParkTimeRate(rs.getInt("park_time_rate"));
				parkingDto.setAddParkRate(rs.getInt("add_park_rate"));
				parkingDto.setDayMaxPay(rs.getInt("day_max_pay"));
				
				list.add(parkingDto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void MemberParkingDelete(int parkId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			String sql = "";
			sql += "delete parking_Detail \n";
			sql += "where park_id = ? \n";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, parkId);
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "delete parking_img \n";
			sql += "where parkId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, parkId);
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "delete parking_facility \n";
			sql += "where parkId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, parkId);
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "delete parking \n";
			sql += "where parkId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, parkId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
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
