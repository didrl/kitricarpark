package com.carpark.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.carpark.admin.model.GradeDto;
import com.carpark.common.model.ParkingDetailDto;
import com.carpark.common.model.ParkingDto;
import com.carpark.db.DBClose;
import com.carpark.db.DBConnection;
import com.carpark.member.model.MemberCarDto;
import com.carpark.member.model.MemberDto;

public class MemberDaoImpl implements MemberDao {
	private static MemberDao memberDao;
	
	private MemberDaoImpl(){}
	
	static{
		memberDao = new MemberDaoImpl();
	}
	
	public static MemberDao getMemberDao() {
		return memberDao;
	}

	@Override
	public int register(MemberDto memberDto) {

		int count=0;
		Connection conn=null;
		PreparedStatement pstmt =null;
		try {
			conn=DBConnection.makeConnection();
			String sql="";
			sql += "insert into member(user_name,user_id,user_pass,email,tel,grade_id,user_avgpoint,coin,host_flag,login_key) \n";
			sql += "values(?,?,?,?,?,3,0,0,0,null)";//치환변수 
			pstmt = conn.prepareStatement(sql);//미리 sql 문장을 가져가서 검사하고 틀린게 없을 때 실행
			int idx =1;//중간에 없어지거나 추가될때 필요
			pstmt.setString(idx++, memberDto.getUser_name());
			pstmt.setString(idx++, memberDto.getUser_id());
			pstmt.setString(idx++, memberDto.getUser_pass());
			pstmt.setString(idx++, memberDto.getEmail());
			pstmt.setString(idx++, memberDto.getTel());
			
			System.out.println("id"+memberDto.getUser_id());
			System.out.println("pass"+memberDto.getUser_pass());
			
			count=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt);
		}	
		return count;
	}

	@Override
	public int idcheck(String id) {
		int count=1;
		Connection conn =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			conn=DBConnection.makeConnection();
			String sql="";

			sql+="select user_id \n";
			sql+="from member \n";
			sql+="where user_id=? \n";
		
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				//이름,이메일,보유코인 필요	
				count = 0;	
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}
		return count;
	}

	@Override
	public MemberDto getMember(String id) {
		MemberDto memberDto = null;
		Connection conn =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			conn=DBConnection.makeConnection();
			String sql="";

			sql+="select m.user_name,m.user_id,m.coin,m.user_avgpoint,m.penalty, \n";
			sql+="m.email,m.tel,m.grade_id,m.user_pass, \n";
			sql+="g.grade_name, g.grade_id,g.avgpoint,g.benefit,g.penalty \n";
			sql+="from member m, grade g \n";
			sql+="where m.user_id=? \n";
			sql+="and m.grade_id=g.grade_id";
		
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				//이름,이메일,보유코인 필요
				memberDto =new MemberDto();		
				memberDto.setUser_name(rs.getString("user_name"));
				memberDto.setUser_id(rs.getString("user_id"));
				memberDto.setCoin(rs.getInt("coin"));
				memberDto.setGrade_id(rs.getInt("grade_id"));
				memberDto.setUser_avgPoint(rs.getInt("user_avgpoint"));
				memberDto.setPenalty(rs.getInt("penalty"));
				memberDto.setEmail(rs.getString("email"));
				memberDto.setTel(rs.getString("tel"));
				memberDto.setUser_pass(rs.getString("user_pass"));
				memberDto.setGrade_name(rs.getString("grade_name"));
				memberDto.setBenefit(rs.getInt("benefit"));
				memberDto.setAvgpoint(rs.getInt("avgpoint"));
				memberDto.setPenalty(rs.getInt("penalty"));		
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}
		return memberDto;
	}



	@Override
	public int delete(String id) {
		int count=0;
		Connection conn=null;
		PreparedStatement pstmt =null;
		try {
			conn=DBConnection.makeConnection();
			conn.setAutoCommit(false);
		
			String sql="";
			sql+="delete \n";
			sql+="from message \n";
			sql+="where receiver_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);		
			count=pstmt.executeUpdate();
			conn.commit();
			pstmt.close();
			
			sql="";
			sql+="delete \n";
			sql+="from board \n";
			sql+="where user_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);		
			count=pstmt.executeUpdate();
			conn.commit();
			pstmt.close();
		
			sql="";
			sql+="delete \n";
			sql+="from member_car \n";
			sql+="where user_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);		
			count=pstmt.executeUpdate();
			conn.commit();
			pstmt.close();
			
			sql="";
			sql+="delete \n";
			sql+="from penalty \n";
			sql+="where user_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);		
			count=pstmt.executeUpdate();
			conn.commit();
			pstmt.close();
			
			sql="";
			sql+="delete \n";
			sql+="from reservation \n";
			sql+="where user_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);		
			count=pstmt.executeUpdate();
			conn.commit();
			pstmt.close();
			
			sql="";
			sql+="delete \n";
			sql+="from coin \n";
			sql+="where user_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);		
			count=pstmt.executeUpdate();
			conn.commit();
			pstmt.close();
			
			sql="";
			sql+="delete \n";
			sql+="from parking \n";
			sql+="where owner_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);		
			count=pstmt.executeUpdate();
			conn.commit();
			pstmt.close();
			
			sql="";
			sql+="delete \n";
			sql+="from favorite \n";
			sql+="where user_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);		
			count=pstmt.executeUpdate();
			conn.commit();
			pstmt.close();
			
			sql="";
			sql+="delete \n";
			sql+="from member \n";
			sql+="where user_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);		
			count=pstmt.executeUpdate();
			conn.commit();	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt);
		}	
		return count;
	}

	@Override
	public MemberDto login(Map<String, String> map) {
		MemberDto memberDto = null;
		Connection conn =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			conn=DBConnection.makeConnection();
			String sql="";

			sql+="select user_id,coin,grade_id,user_name,user_avgpoint,email,tel,user_pass,login_key, host_flag, profile_image, penalty, user_flag \n";
			sql+="from member \n";
			sql+="where user_id=? and user_pass=? \n";
		
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1,map.get("userid"));
			pstmt.setString(2,map.get("userpwd"));
			rs=pstmt.executeQuery();
			if(rs.next()){
				//이름,이메일,보유코인 필요
				memberDto =new MemberDto();				
				memberDto.setUser_id(rs.getString("user_id"));
				memberDto.setCoin(rs.getInt("coin"));
				memberDto.setGrade_id(rs.getInt("grade_id"));
				memberDto.setUser_name(rs.getString("user_name"));
				memberDto.setUser_avgPoint(rs.getInt("user_avgpoint"));
				memberDto.setHost_flag(rs.getInt("host_flag"));
				memberDto.setPenalty(rs.getInt("penalty"));
				memberDto.setUser_flag(rs.getInt("user_flag"));
				memberDto.setEmail(rs.getString("email"));
				memberDto.setTel(rs.getString("tel"));
				memberDto.setUser_pass(rs.getString("user_pass"));
				memberDto.setLogin_key(rs.getString("login_key"));
				memberDto.setProfile_image(rs.getString("profile_image"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}
		return memberDto;
	}

	@Override
	public List<ParkingDto> list(Map<String, String> map) {
		//지역정보,시작일,종료일 map에 담아옴
		List<ParkingDto> list=new ArrayList<ParkingDto>();
		ParkingDto parkingDto=null;
		Connection conn =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
	
		try {

			conn=DBConnection.makeConnection();
			String sql="";
			sql +="select distinct a.park_id, a.park_name,detail_addr, a.park_avgPoint, a.park_capacity, a.latitude, a.longitude,a.content\n";
			sql +="from (select p.park_id, p.park_name,detail_addr, pd.park_avgPoint,p.park_capacity,p.latitude,p.longitude,p.content\n";
			sql +="			from parking p , parking_detail pd\n";
			sql +="			where p.park_id = pd.park_id) a\n";
			sql +="where detail_addr like '%'||?||'%'\n";


			int idx=1;
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(idx++,map.get("city").trim());
//			pstmt.setString(idx++,map.get("from"));
//			pstmt.setString(idx++,map.get("to"));

			rs = pstmt.executeQuery();
			while (rs.next()) {

				parkingDto = new ParkingDto();
				parkingDto.setPark_id(rs.getInt("park_id"));
				parkingDto.setPark_name(rs.getString("park_name"));
				parkingDto.setDetailAddr(rs.getString("detail_addr")); 		
				parkingDto.setPark_capacity(rs.getInt("park_capacity"));
				parkingDto.setLongitude(rs.getDouble("longitude"));
				parkingDto.setLatitude(rs.getDouble("latitude"));
				parkingDto.setContent(rs.getString("content"));

				list.add(parkingDto);	
				}
			} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public ParkingDto parkingDetail(String parkingId) {
		ParkingDto parkingDto=null;
		Connection conn =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
	
		try {
			conn=DBConnection.makeConnection();
			String sql="";
			sql+="select p.park_id, p.park_name,detail_addr, pd.park_avgPoint,p.park_capacity, \n";
			sql+="p.latitude,p.longitude,p.owner_id,p.content \n";
			sql+="from parking p , parking_detail pd \n";
			sql+="where p.park_id = pd.park_id \n";
			sql+="and p.park_id=? ";
			int idx=1;
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(idx++,parkingId);
//			pstmt.setString(idx++,map.get("from"));
//			pstmt.setString(idx++,map.get("to"));

			rs = pstmt.executeQuery();
			while (rs.next()) {
				parkingDto = new ParkingDto();
				parkingDto.setPark_id(rs.getInt("park_id"));
				parkingDto.setPark_name(rs.getString("park_name"));
				parkingDto.setDetailAddr(rs.getString("detail_addr"));
				parkingDto.setPark_capacity(rs.getInt("park_capacity"));
				parkingDto.setLongitude(rs.getDouble("longitude"));
				parkingDto.setLatitude(rs.getDouble("latitude"));
				parkingDto.setOwner_id(rs.getString("owner_id"));
				parkingDto.setContent(rs.getString("content"));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}
		
		return parkingDto;
	}

	@Override
	public int addNewCar(MemberCarDto memberCarDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int cnt=0;
		try {
			conn = DBConnection.makeConnection();
			String sql = "insert into member_car(category, reg_num, user_id,car_name) \n";
			sql +="values (?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			int idx=0;
			pstmt.setString(++idx, memberCarDto.getCategory());
			pstmt.setString(++idx, memberCarDto.getReg_num());
			pstmt.setString(++idx, memberCarDto.getUser_id());
			pstmt.setString(++idx, memberCarDto.getModel());
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		return cnt;
	}
	
	@Override
	public ParkingDetailDto getParkingDetail_info(String park_id){
		ParkingDetailDto parkingDetailDto=null;
		Connection conn =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
	
		try {
			conn=DBConnection.makeConnection();
			String sql="";
			sql+="select distinct park_id, park_flag, park_avgpoint, get_status, cur_parking, pay_yn, \n";
			sql+="satur_pay_yn, holi_pay_yn, fulltime_monthly_pay, park_rate, park_time_rate, \n";
			sql+="add_park_rate, day_max_pay \n";
			sql+="from parking_detail \n";
			sql+="where park_id =?\n";
			int idx=1;
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(idx++,park_id);
 
			rs=pstmt.executeQuery();
			while(rs.next()){
				parkingDetailDto = new ParkingDetailDto();
				parkingDetailDto.setPark_id(rs.getInt("park_id"));
				parkingDetailDto.setPark_flag(rs.getInt("park_flag"));
				parkingDetailDto.setCur_parking(rs.getInt("cur_parking")); 		
				parkingDetailDto.setDay_max_pay(rs.getInt("day_max_pay"));
				parkingDetailDto.setFulltime_monthly_pay(rs.getInt("fulltime_monthly_pay"));
				parkingDetailDto.setGet_status(rs.getInt("get_status"));
				parkingDetailDto.setHoli_pay_yn(rs.getString("holi_pay_yn"));
				parkingDetailDto.setPark_avgPoint(rs.getDouble("park_avgpoint"));
				parkingDetailDto.setPark_flag(rs.getInt("park_flag"));
				parkingDetailDto.setPark_rate(rs.getInt("park_rate"));
				parkingDetailDto.setAdd_park_rate(rs.getInt("add_park_rate"));
				parkingDetailDto.setPark_time_rate(rs.getInt("park_time_rate"));
				parkingDetailDto.setPay_yn(rs.getString("pay_yn"));
				parkingDetailDto.setSatur_pay_yn(rs.getString("satur_pay_yn"));
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}
		
		return parkingDetailDto;
	}

	public int modify(MemberDto memberDto) {
		int count=0;
		Connection conn =null;
		PreparedStatement pstmt =null;
		
		try {
			conn=DBConnection.makeConnection();
			String sql="";
 
			sql+="update member \n";
			sql+="set user_name=?, user_pass=?, email=?, tel=? \n";
			sql+="where user_id=?";
			
			int idx=1;
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(idx++, memberDto.getUser_name());
			pstmt.setString(idx++, memberDto.getUser_pass());
			pstmt.setString(idx++, memberDto.getEmail());
			pstmt.setString(idx++, memberDto.getTel());
			pstmt.setString(idx++, memberDto.getUser_id());
			System.out.println("DAO name:"+memberDto.getUser_name());
			System.out.println("DAO pass:"+memberDto.getUser_pass());
			System.out.println("DAO email:"+memberDto.getEmail());
			System.out.println("DAO tel:"+memberDto.getTel());
			System.out.println("DAO id:"+memberDto.getUser_id());
			
			count =pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt);
		}
		return count;
	}

	@Override
	public GradeDto gradeInfo(String id) {
		GradeDto gradeDto = null;
		Connection conn =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
	
		try {
			conn=DBConnection.makeConnection();
			String sql="";
			sql+="select g.grade_id,g.grade_name,g.avgpoint,g.benefit,g.penalty  \n";
			sql+="from member m ,grade g \n";
			sql+="where m.grade_id=g.grade_id \n";
			sql+="and m.user_id = ?";
			int idx=1;
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(idx++,id);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				gradeDto = new GradeDto();
				gradeDto.setGrade_id(rs.getInt("grade_id"));
				gradeDto.setGrade_name(rs.getString("grade_name"));
				gradeDto.setAvgpoint(rs.getInt("avgpoint"));		
				gradeDto.setBenefit(rs.getInt("benefit"));
				gradeDto.setPenalty(rs.getInt("penalty"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}
		return gradeDto;
	}
}
