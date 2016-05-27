package com.carpark.member.model.dao;

import java.sql.*;
import java.util.*;

import com.carpark.db.DBClose;
import com.carpark.db.DBConnection;
import com.carpark.member.model.MessageDto;

public class MemberMessageDaoImpl implements MemberMessageDao {

	private static MemberMessageDao memberMessageDao;
	
	static {
		memberMessageDao = new MemberMessageDaoImpl();
	}
	
	private MemberMessageDaoImpl(){}

	public static MemberMessageDao getMemberMessageDao() {
		return memberMessageDao;
	}

	@Override
	public int writeArticle(MessageDto messageDto) {
		int seq = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "insert all \n";
			sql += "into board (seq, user_id, subject, contents, bcode, logtime) \n";
			sql += "values (?, ?, ?, ?, ?, sysdate) \n";
			sql += "into message (mseq, seq, receiver_id, msg_flag) \n";
			sql += "values (message_num_mseq.nextval, ?, ?, ?) \n";
			sql += "select * from dual";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			int idx = 0;
			pstmt.setInt(++idx, messageDto.getSeq());
			pstmt.setString(++idx, messageDto.getUserID());
			pstmt.setString(++idx, messageDto.getSubject());
			pstmt.setString(++idx, messageDto.getContent());
			pstmt.setInt(++idx, messageDto.getBcode());
			pstmt.setInt(++idx, messageDto.getSeq());
			pstmt.setString(++idx, messageDto.getReceiverId());
			pstmt.setInt(++idx, messageDto.getMsgFlag());

			pstmt.executeUpdate();
			seq = messageDto.getSeq();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		
		return seq;
	}

	@Override
	public MessageDto viewArticle(int seq) {
		MessageDto messageDto = new MessageDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select b.seq, bcode, user_id, subject, contents, \n";
			sql += "		decode(to_char(logtime, 'yymmdd'), \n";
			sql += "				to_char(sysdate, 'yymmdd'), to_char(b.logtime, 'hh24:mi:ss'), \n";
			sql += "				to_char(b.logtime, 'yy.mm.dd')) logtime, \n";
			sql += "mseq, receiver_id, msg_flag \n";
			sql += "from board b, message m \n";
			sql += "where b.seq = m.seq \n";
			sql += "and b.seq = ?";
			pstmt = conn.prepareStatement(sql);
			System.out.println(sql);
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				messageDto.setSeq(seq);
				messageDto.setSubject(rs.getString("subject"));
				messageDto.setContent(rs.getString("contents"));
				messageDto.setUserID(rs.getString("user_id"));
				messageDto.setLogtime(rs.getString("logtime"));
				messageDto.setBcode(rs.getInt("bcode"));
				messageDto.setMseq(rs.getInt("mseq"));
				messageDto.setReceiverId(rs.getString("receiver_id"));
				messageDto.setMsgFlag(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return messageDto;
	}

	@Override
	public void deleteArticle(int seq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			
			String sql = "";
			sql = "delete from message where seq = ? \n";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
			pstmt.close();
			System.out.println(sql);
			sql = "delete from board where seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
			System.out.println(sql);
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		
	}

	@Override
	public List<MessageDto> sendListArticle(String userId) {
		List<MessageDto> sendList = new ArrayList<MessageDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select b.seq, bcode, user_id, subject, contents, \n";
			sql += "		decode(to_char(logtime, 'yymmdd'), \n";
			sql += "				to_char(sysdate, 'yymmdd'), to_char(b.logtime, 'hh24:mi:ss'), \n";
			sql += "				to_char(b.logtime, 'yy.mm.dd')) logtime, \n";
			sql += "mseq, receiver_id, msg_flag \n";
			sql += "from board b, message m \n";
			sql += "where b.seq = m.seq \n";
			sql += "and user_id = ? \n";
			sql += "order by logtime desc";
			//정렬 수정해야함(rownum) 
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MessageDto messageDto = new MessageDto();
				messageDto.setSeq(rs.getInt("seq"));
				messageDto.setBcode(rs.getInt("bcode"));
				messageDto.setUserID(rs.getString("user_id"));
				messageDto.setSubject(rs.getString("subject"));
				messageDto.setContent(rs.getString("contents"));
				messageDto.setLogtime(rs.getString("logtime"));
				messageDto.setMseq(rs.getInt("mseq"));
				messageDto.setReceiverId(rs.getString("receiver_id"));
				messageDto.setMsgFlag(rs.getInt("msg_flag"));
				
				sendList.add(messageDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}

		return sendList;
	}

	@Override
	public List<MessageDto> receiveListArticle(String receiveId) {
		List<MessageDto> receiveList = new ArrayList<MessageDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select b.seq, bcode, user_id, subject, contents, \n";
			sql += "		decode(to_char(logtime, 'yymmdd'), \n";
			sql += "				to_char(sysdate, 'yymmdd'), to_char(b.logtime, 'hh24:mi:ss'), \n";
			sql += "				to_char(b.logtime, 'yy.mm.dd')) logtime, \n";
			sql += "mseq, receiver_id, msg_flag \n";
			sql += "from board b, message m \n";
			sql += "where b.seq = m.seq \n";
			sql += "and receiver_id = ? \n";
			sql += "order by logtime desc";
			//정렬 수정 필요(rownum)
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, receiveId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MessageDto messageDto = new MessageDto();
				messageDto.setSeq(rs.getInt("seq"));
				messageDto.setBcode(rs.getInt("bcode"));
				messageDto.setUserID(rs.getString("user_id"));
				messageDto.setSubject(rs.getString("subject"));
				messageDto.setContent(rs.getString("contents"));
				messageDto.setLogtime(rs.getString("logtime"));
				messageDto.setMseq(rs.getInt("mseq"));
				messageDto.setReceiverId(rs.getString("receiver_id"));
				messageDto.setMsgFlag(rs.getInt("msg_flag"));
				
				receiveList.add(messageDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}

		return receiveList;
	}
	
	
}
