package com.carpark.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.carpark.db.DBClose;
import com.carpark.db.DBConnection;
import com.carpark.member.model.MessageDto;
import com.carpark.member.model.ReviewDto;

public class MemberReviewDaoImpl implements MemberReviewDao {

	private static MemberReviewDao memberReviewDao;
	
	static {
		memberReviewDao = new MemberReviewDaoImpl();
	}
	
	private MemberReviewDaoImpl(){}

	public static MemberReviewDao getMemberReviewDao() {
		return memberReviewDao;
	}

	@Override
	public ArrayList<ReviewDto> listReview(String park_id) {
		ReviewDto reviewDto = null;
		ArrayList<ReviewDto> list = new ArrayList<ReviewDto>();
		Connection conn =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			conn=DBConnection.makeConnection();
			String sql="";

			sql +="select b.contents, b.subject,b.user_id,a.park_id,a.avgpoint, b.logtime \n";
			sql +="from review r, board b, avgpoint a, parking p\n";
			sql +="where r.seq=b.seq\n";
			sql +="			and r.rseq=a.rseq\n";
			sql +="			and a.park_id = p.park_id\n";
			sql +="			and a.park_id =?\n";
		
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1,park_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				//이름,이메일,보유코인 필요
				reviewDto =new ReviewDto();		
				reviewDto.setContent(rs.getString("contents"));
				reviewDto.setUser_id(rs.getString("user_id"));
				reviewDto.setSubject(rs.getString("subject"));
				reviewDto.setLogtime(rs.getString("logtime"));
				reviewDto.setPark_id(rs.getInt("park_id"));
				reviewDto.setAvgPoint(rs.getInt("avgpoint"));
				
				list.add(reviewDto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public int writeArticle(ReviewDto reviewDto) {

		int seq = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			
			sql += "insert all \n";
			//sql += "into board(seq, bcode, user_id, subject, contents, logtime, photo_key) \n";
			sql += "into board(seq, bcode, user_id, subject, contents, logtime) \n";
			sql += "values(board_num_seq.nextval,0,?,?,?,sysdate) \n";
			sql += "into review(seq, rseq, aval_code, get_point, avaled_id, host_flag) \n";
			sql += "values(board_num_seq.currval,review_num_rseq.nextval,0,?,?,?) \n";
			sql += "into AVGPOINT (RSEQ, SEQ, PARK_ID, AVGPOINT)\n";
			sql += "values(review_num_rseq.currval,board_num_seq.currval,?,?)\n";
			sql += "SELECT * FROM dual";
			pstmt = conn.prepareStatement(sql);
			int idx = 0;
			pstmt.setString(++idx, reviewDto.getUser_id());
			pstmt.setString(++idx, reviewDto.getSubject());
			pstmt.setString(++idx, reviewDto.getContent());
			
			pstmt.setDouble(++idx, reviewDto.getAvgPoint());
			pstmt.setString(++idx, reviewDto.getAvaled_id());
			pstmt.setInt(++idx, reviewDto.getHost_flag());
			
			pstmt.setInt(++idx, reviewDto.getPark_id());
			pstmt.setDouble(++idx, reviewDto.getAvgPoint());
			System.out.println(sql);
			
			pstmt.executeUpdate();
			seq = reviewDto.getSeq();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		return seq;
	}

	@Override
	public ReviewDto viewArticle(int seq) {
		ReviewDto reviewDto = new ReviewDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			
			sql += "select b.user_id, b.subject, b.contents,r.aval_code, r.get_point, r.avaled_id,r.host_flag,b.logtime, r.resq \n";
			sql += "from review r, board b \n";
			sql += "where r.seq=b.seq \n";
			sql += "and b.seq = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				reviewDto.setSeq(seq);
				reviewDto.setSubject(rs.getString("subject"));
				reviewDto.setContent(rs.getString("contents"));
				reviewDto.setUser_id(rs.getString("user_id"));
				reviewDto.setAvaled_id(rs.getString("avaled_id"));
				reviewDto.setLogtime(rs.getString("logtime"));
				reviewDto.setBcode(rs.getInt("bcode"));
				reviewDto.setRseq(rs.getInt("rseq"));
				reviewDto.setAvgPoint(rs.getDouble("get_point"));
				reviewDto.setHost_flag(rs.getInt("host_flag"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return reviewDto;
	}

	@Override
	public List<ReviewDto> sendListArticle(String userId) {
		ReviewDto reviewDto = null;
		ArrayList<ReviewDto> list = new ArrayList<ReviewDto>();
		Connection conn =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			conn=DBConnection.makeConnection();
			String sql="";

			sql +="select b.user_id, b.subject, b.contents,r.aval_code, r.get_point, r.avaled_id,r.host_flag \n";
			sql +="from review r, board b\n";
			sql +="where r.seq=b.seq\n";
			sql +="and b.user_id=?\n";
		
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1,userId);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				//이름,이메일,보유코인 필요
				reviewDto =new ReviewDto();		
				reviewDto.setSubject(rs.getString("subject"));
				reviewDto.setContent(rs.getString("contents"));
				reviewDto.setUser_id(rs.getString("user_id"));
				reviewDto.setAvaled_id(rs.getString("avaled_id"));
				reviewDto.setLogtime(rs.getString("logtime"));
				reviewDto.setBcode(rs.getInt("bcode"));
				reviewDto.setRseq(rs.getInt("rseq"));
				reviewDto.setAvgPoint(rs.getDouble("get_point"));
				reviewDto.setHost_flag(rs.getInt("host_flag"));
				
				list.add(reviewDto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public List<ReviewDto> receiveListArticle(String receiveId) {
		ReviewDto reviewDto = null;
		ArrayList<ReviewDto> list = new ArrayList<ReviewDto>();
		Connection conn =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			conn=DBConnection.makeConnection();
			String sql="";

			sql +="select b.user_id, b.subject, b.contents,r.aval_code, r.get_point, r.avaled_id,r.host_flag \n";
			sql +="from review r, board b\n";
			sql +="where r.seq=b.seq\n";
			sql +="and r.avaled_id=?\n";
		
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1,receiveId);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				//이름,이메일,보유코인 필요
				reviewDto =new ReviewDto();		
				reviewDto.setSubject(rs.getString("subject"));
				reviewDto.setContent(rs.getString("contents"));
				reviewDto.setUser_id(rs.getString("user_id"));
				reviewDto.setAvaled_id(rs.getString("avaled_id"));
				reviewDto.setLogtime(rs.getString("logtime"));
				reviewDto.setBcode(rs.getInt("bcode"));
				reviewDto.setRseq(rs.getInt("rseq"));
				reviewDto.setAvgPoint(rs.getDouble("get_point"));
				reviewDto.setHost_flag(rs.getInt("host_flag"));
				
				list.add(reviewDto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public void deleteArticle(int seq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			
			String sql = "";
			sql = "delete from avgpoint where seq = ? \n";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "delete from review where seq = ? \n";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "delete from board where seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
	}
	
}
