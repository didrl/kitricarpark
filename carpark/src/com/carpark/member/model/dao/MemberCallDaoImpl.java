package com.carpark.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.carpark.common.model.CallDto;
import com.carpark.common.model.ZipDto;
import com.carpark.db.DBClose;
import com.carpark.db.DBConnection;

public class MemberCallDaoImpl implements MemberCallDao {

	private static MemberCallDao memberCallDao;
	
	static {
		memberCallDao = new MemberCallDaoImpl();
	}
	
	private MemberCallDaoImpl(){}

	public static MemberCallDao getMemberCallDao() {
		return memberCallDao;
	}

	@Override
	public List<ZipDto> zipSearchList(String dong) {
		List<ZipDto> list =new ArrayList<ZipDto>();
		Connection conn =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		try {
			conn=DBConnection.makeConnection();
			String sql="";
			sql+="select substr(zipcode,1,instr(zipcode,'-')-1)zip1, \n";
			sql+="substr(zipcode,instr(zipcode,'-')+1)zip2, \n";
			sql+="sido,gugun,dong,nvl(bunji,' ') bunji \n"; 
			sql+="from zipcode \n";
			sql+="where dong like '%'||?||'%' \n";
			
			//자바의 "%"+dong+"%" 와 비슷
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1,dong);
			rs=pstmt.executeQuery();
			while(rs.next()){
				ZipDto zipDto =new ZipDto();
				zipDto.setZip1(rs.getString("zip1"));
				zipDto.setZip2(rs.getString("zip2"));
				zipDto.setSido(rs.getString("sido"));
				zipDto.setGugun(rs.getString("gugun"));
				zipDto.setDong(rs.getString("dong"));
				zipDto.setBunji(rs.getString("bunji"));
				
				list.add(zipDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}
	
	
	@Override
	public int register(CallDto callDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql+= "insert all \n";
			sql += "into board (seq, user_id, subject, contents, bcode, logtime) \n";
			sql += "values (?, ?, ?, ?, ?, sysdate) \n";
			sql+= "into call \n";
			sql+= "values() \n";
			pstmt = conn.prepareStatement(sql);
			count = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt);
		}
		return count;
	}
	
	
	
	
	@Override
	public List<CallDto> sendList(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CallDto callSendDto = null;
		List<CallDto>list = new ArrayList<CallDto>();
		try {
			
			conn = DBConnection.makeConnection();
			String sql = "";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
}
