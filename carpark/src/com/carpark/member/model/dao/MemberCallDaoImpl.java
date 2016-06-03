package com.carpark.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	public List<ZipDto> zipSearch(String dong) {
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
	
	
	
	
}
