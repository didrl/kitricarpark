package com.carpark.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.carpark.admin.model.ParkingDetailDto;
import com.carpark.common.model.CitiesDto;
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
			pstmt.setInt(++idx, parkingDto.getPark_id());
			pstmt.setString(++idx, parkingDto.getPark_name());
			pstmt.setInt(++idx, parkingDto.getPark_capacity());
			pstmt.setString(++idx, parkingDto.getOwner_id());
			pstmt.setDouble(++idx, parkingDto.getLatitude());
			pstmt.setDouble(++idx, parkingDto.getLongitude());
			pstmt.setString(++idx, parkingDto.getPark_type());
			pstmt.setInt(++idx, parkingDto.getEmd_code());
			//parking_facility table
			pstmt.setInt(++idx, parkingDto.getPark_id());
			pstmt.setString(++idx, parkingDto.getFacility());
			pstmt.setString(++idx, parkingDto.getFeature());
			//parking_img table
			pstmt.setInt(++idx, parkingDto.getPark_id());
			pstmt.setString(++idx, parkingDto.getImg_file_name());
			pstmt.setString(++idx, parkingDto.getImg_file_path());
			//parking_img table
			pstmt.setInt(++idx, parkingDto.getPark_id());
			pstmt.setInt(++idx, parkingDto.getPark_flag());
			pstmt.setString(++idx, parkingDto.getPay_yn());
			pstmt.setString(++idx, parkingDto.getSatur_pay_yn());
			pstmt.setString(++idx, parkingDto.getHoli_pay_yn());
			pstmt.setInt(++idx, parkingDto.getFulltime_monthly_pay());
			pstmt.setInt(++idx, parkingDto.getPark_rate());
			pstmt.setInt(++idx, parkingDto.getPark_time_rate());
			pstmt.setInt(++idx, parkingDto.getAdd_park_rate());
			pstmt.setInt(++idx, parkingDto.getDay_max_pay());

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

//	@Override
//	public List<ParkingDetailDto> MemberParkingList(String userId) {
//		List<ParkingDetailDto> list = new ArrayList<ParkingDetailDto>();
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//			conn = DBConnection.makeConnection();
//			String sql = "";
//			sql += "select p.park_id, park_name, park_capacity, owner_id, latitude, "
//							+ "longitude, park_type, emd_code, content, \n";
//			sql += "		facility, feature, file_name, file_path, file_num, \n";
//			sql += "		park_flag, park_avgPoint, get_status, cur_parking, PAY_YN, satur_pay_yn, holi_pay_yn, "
//							+ "fulltime_monthly_pay, park_rate, park_time_rate, add_park_rate, day_max_pay \n";
//			sql += "from parking p, parking_facility f, parking_img i, parking_detail d \n";
//			sql += "where p.park_id = f.park_id \n";
//			sql += "and p.park_id = i.park_id \n";
//			sql += "and p.park_id = d.park_id \n";
//			sql += "and owner_id = ?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, userId);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				ParkingDetailDto parkingDto = new ParkingDetailDto();
//				parkingDto.setParkId(rs.getInt("park_id"));
//				parkingDto.setParkName(rs.getString("park_name"));
//				parkingDto.setParkCapacity(rs.getInt("park_capacity"));
//				parkingDto.setOwnerId(rs.getString("owner_id"));
//				parkingDto.setLatitude(rs.getDouble("latitude"));
//				parkingDto.setLongtitude(rs.getDouble("longitude"));
//				parkingDto.setParkType(rs.getString("park_type"));
//				parkingDto.setEmdCode(rs.getInt("emd_code"));
//				parkingDto.setContent(rs.getString("content"));
//				parkingDto.setFacility(rs.getString("facility"));
//				parkingDto.setFeature(rs.getString("feature"));
//				parkingDto.setFileName(rs.getString("file_name"));
//				parkingDto.setFilePath(rs.getString("file_path"));
//				parkingDto.setFileNum(rs.getInt("file_num"));
//				parkingDto.setParkFlag(rs.getInt("park_flag"));
//				parkingDto.setParkAvgPoint(rs.getInt("park_avgPoint"));
//				parkingDto.setGetStatus(rs.getInt("get_status"));
//				parkingDto.setCurParking(rs.getInt("cur_parking"));
//				parkingDto.setPayYn(rs.getString("PAY_YN"));
//				parkingDto.setSaturPayYn(rs.getString("satur_pay_yn"));
//				parkingDto.setHoliPayYn(rs.getString("holi_pay_yn"));
//				parkingDto.setFullTimeMonthlyPay(rs.getInt("fulltime_monthly_pay"));
//				parkingDto.setParkRate(rs.getInt("park_rate"));
//				parkingDto.setParkTimeRate(rs.getInt("park_time_rate"));
//				parkingDto.setAddParkRate(rs.getInt("add_park_rate"));
//				parkingDto.setDayMaxPay(rs.getInt("day_max_pay"));
//				
//				list.add(parkingDto);
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		return list;
//	}

	@Override
	public List<ParkingDetailDto> MemberParkingList(String userId) {
		List<ParkingDetailDto> list = new ArrayList<ParkingDetailDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";

			sql += "select p.park_id, park_name, park_capacity, owner_id, latitude, \n";
			sql += "longitude, park_type, emd_code, content, \n";
			sql += "		park_flag, park_avgPoint, get_status, cur_parking, PAY_YN, satur_pay_yn, holi_pay_yn,\n";
			sql += "fulltime_monthly_pay, park_rate, park_time_rate, add_park_rate, day_max_pay \n";
			sql += "from parking p, parking_detail d \n";
			sql += "where p.park_id = d.park_id\n";
			sql += "and owner_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ParkingDetailDto parkingDto = new ParkingDetailDto();
				parkingDto.setPark_id(rs.getInt("park_id"));
				parkingDto.setPark_name(rs.getString("park_name"));
				parkingDto.setPark_capacity(rs.getInt("park_capacity"));
				parkingDto.setOwner_id(rs.getString("owner_id"));
				parkingDto.setLatitude(rs.getDouble("latitude"));
				parkingDto.setLongitude(rs.getDouble("longitude"));
				parkingDto.setPark_type(rs.getString("park_type"));
				parkingDto.setEmd_code(rs.getInt("emd_code"));
				parkingDto.setContent(rs.getString("content"));
				parkingDto.setPark_flag(rs.getInt("park_flag"));
				parkingDto.setPark_avgPoint(rs.getInt("park_avgPoint"));
				parkingDto.setGet_status(rs.getInt("get_status"));
				parkingDto.setCur_parking(rs.getInt("cur_parking"));
				parkingDto.setPay_yn(rs.getString("PAY_YN"));
				parkingDto.setSatur_pay_yn(rs.getString("satur_pay_yn"));
				parkingDto.setHoli_pay_yn(rs.getString("holi_pay_yn"));
				parkingDto.setFulltime_monthly_pay(rs.getInt("fulltime_monthly_pay"));
				parkingDto.setPark_rate(rs.getInt("park_rate"));
				parkingDto.setPark_time_rate(rs.getInt("park_time_rate"));
				parkingDto.setAdd_park_rate(rs.getInt("add_park_rate"));
				parkingDto.setDay_max_pay(rs.getInt("day_max_pay"));
				
				list.add(parkingDto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
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
