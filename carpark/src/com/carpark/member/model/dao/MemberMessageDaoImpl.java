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
	public int writeArticle(MessageDto messageDto) {//쪽지보내기
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
	public MessageDto viewArticle(int seq) {//쪽지보기
		MessageDto messageDto = new MessageDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			String sql = "";
			sql += "update message set msg_flag = 1 \n";//쪽지 미확인->확인
			sql += "where seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
			pstmt.close();
			
			
			sql = "select b.seq, bcode, user_id, subject, contents, \n";
			sql += "		decode(to_char(logtime, 'yymmdd'), \n";
			sql += "				to_char(sysdate, 'yymmdd'), to_char(b.logtime, 'hh24:mi:ss'), \n";
			sql += "				to_char(b.logtime, 'yy.mm.dd')) logtime, \n";
			sql += "mseq, receiver_id, msg_flag \n";
			sql += "from board b, message m \n";
			sql += "where b.seq = m.seq \n";
			sql += "and b.seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			conn.commit();
			if(rs.next()) {
				messageDto.setSeq(seq);
				messageDto.setSubject(rs.getString("subject"));
				messageDto.setContent(rs.getString("contents"));
				messageDto.setUserID(rs.getString("user_id"));
				messageDto.setLogtime(rs.getString("logtime"));
				messageDto.setBcode(rs.getInt("bcode"));
				messageDto.setMseq(rs.getInt("mseq"));
				messageDto.setReceiverId(rs.getString("receiver_id"));
				messageDto.setMsgFlag(rs.getInt("msg_flag"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return messageDto;
	}

	@Override
	public void deleteArticle(int seq) {//쪽지삭제
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

	@Override
	public List<MessageDto> sendListArticle(Map<String, String> map) {//보낸쪽지목록
		List<MessageDto> sendList = new ArrayList<MessageDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String key = map.get("key");
		String word = map.get("word");
		String userId = map.get("userId");
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select b.* \n";
			sql += "from ( \n";
			sql += "select rownum rn, a.* \n";
			sql += "from ( \n";
			sql += "select b.seq, bcode, user_id, subject, contents, \n";
			sql += "		decode(to_char(logtime, 'yymmdd'), \n";
			sql += "				to_char(sysdate, 'yymmdd'), to_char(b.logtime, 'hh24:mi:ss'), \n";
			sql += "				to_char(b.logtime, 'yy.mm.dd')) logtime, \n";
			sql += "mseq, receiver_id, msg_flag \n";
			sql += "from board b, message m \n";
			sql += "where b.seq = m.seq \n";
			sql += "and user_id = ? \n";
			if(key != null && !key.isEmpty()) {
				if(word != null && !word.isEmpty()) {
					if("subject".equals(key))
						sql += "		and b.subject like '%'||?||'%' \n";
					else
						sql += "		and b." + key + " = ? \n";						
				}
			}
			sql += "		order by b.seq desc \n";
			sql += "	      ) a \n";
			sql += "	where rownum <= ? \n";
			sql += "      ) b \n";
			sql += "where b.rn > ? ";
			pstmt = conn.prepareStatement(sql);
			int idx = 0;
			pstmt.setString(++idx, userId);
			if(key != null && !key.isEmpty()) {
				if(word != null && !word.isEmpty()) {
					pstmt.setString(++idx, map.get("word"));				
				}
			}
			pstmt.setString(++idx, map.get("end"));
			pstmt.setString(++idx, map.get("start"));
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
	public List<MessageDto> receiveListArticle(Map<String, String> map) {//받은쪽지목록
		List<MessageDto> receiveList = new ArrayList<MessageDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String key = map.get("key");
		String word = map.get("word");
		String receiveId = map.get("receiveId");
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select b.* \n";
			sql += "from ( \n";
			sql += "select rownum rn, a.* \n";
			sql += "from ( \n";
			sql += "select b.seq, bcode, user_id, subject, contents, \n";
			sql += "		decode(to_char(logtime, 'yymmdd'), \n";
			sql += "				to_char(sysdate, 'yymmdd'), to_char(b.logtime, 'hh24:mi:ss'), \n";
			sql += "				to_char(b.logtime, 'yy.mm.dd')) logtime, \n";
			sql += "mseq, receiver_id, msg_flag \n";
			sql += "from board b, message m \n";
			sql += "where b.seq = m.seq \n";
			sql += "and receiver_id = ? \n";
			if(key != null && !key.isEmpty()) {
				if(word != null && !word.isEmpty()) {
					if("subject".equals(key))
						sql += "		and b.subject like '%'||?||'%' \n";
					else
						sql += "		and b." + key + " = ? \n";						
				}
			}
			sql += "		order by b.seq desc \n";
			sql += "	      ) a \n";
			sql += "	where rownum <= ? \n";
			sql += "      ) b \n";
			sql += "where b.rn > ? ";
			pstmt = conn.prepareStatement(sql);
			int idx = 0;
			pstmt.setString(++idx, receiveId);
			if(key != null && !key.isEmpty()) {
				if(word != null && !word.isEmpty()) {
					pstmt.setString(++idx, map.get("word"));				
				}
			}
			pstmt.setString(++idx, map.get("end"));
			pstmt.setString(++idx, map.get("start"));
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
