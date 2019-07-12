package Commant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import Command.DBConnection;

public class CommantDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet res;
	
	public List<CommantDTO> commantList(CommantDTO cdto){
		
		String sql ="SELECT * "
				+ "FROM commant "
				+ "WHERE commant_board = ? "
				+ "ORDER BY commant_number DESC";
		
		List<CommantDTO> list = new ArrayList<>();
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cdto.getCommantBoard());
			System.out.println(sql);
			res = pstmt.executeQuery();
			
			while(res.next())
			{
				CommantDTO dtos = new CommantDTO();
				dtos.setCommantNumber(res.getInt("COMMANT_NUMBER"));
				dtos.setCommantWriter(res.getString("COMMANT_WRITER"));
				dtos.setCommantContent(res.getString("COMMANT_CONTENT"));
				dtos.setCommantDate(res.getString("COMMANT_DATE"));
				dtos.setCommantRedepth(res.getInt("COMMANT_REDEPTH"));
				dtos.setCommantBoard(res.getInt("COMMANT_BOARD"));
				list.add(dtos);
			}
			
		} catch (ClassNotFoundException | SQLException | NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
				if(res != null) res.close();
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		return list;
	
	}
	
	public int insertCommant(CommantDTO dto) {
		
		String sql ="INSERT INTO commant (commant_number, commant_writer, commant_content, commant_date, commant_redepth, commant_board, commant_re_id, commant_re_num) VALUES "
				+ "(commant_num_seq.nextval,? ,? ,sysdate,?,?,?,?)";
		
		int i = 0;
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCommantWriter());
			pstmt.setString(2, dto.getCommantContent());
			pstmt.setInt(3, dto.getCommantBoard());
			pstmt.setString(4, dto.getCommantReid());
			pstmt.setInt(5, dto.getCommantReNum());
			System.out.println(sql);
			i = pstmt.executeUpdate();
					
					
					
		} catch (ClassNotFoundException | SQLException | NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return i;
	}
	
	public int deleteCommant(CommantDTO dto) {
		
		String sql = "DELETE FROM commant WHERE commant_number = ?";
		
		int d = 0;
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getCommantNumber());
			d = pstmt.executeUpdate();
			
		} catch (ClassNotFoundException | SQLException | NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		return d;
	}
	
	public int updateCommant(CommantDTO dto) {
		
		String sql = "UPDATE commant SET commant_content = ? , commant_date = sysdate WHERE commant_number = ?";
		
		int u = 0;
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCommantContent());
			pstmt.setInt(2, dto.getCommantNumber());
			u = pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException | NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		return u;
	}
	
	//대댓글 기능
	
	public CommantDTO getRedepth(CommantDTO dto) {
		String sql = "SELECT commant_redepth FROM commant WHERE commant_re_num = ?"; 
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getCommantReNum());
			res = pstmt.executeQuery();
			System.out.println("깊이 : "+ dto.getCommantRedepth());
				if(res.next()) {
					dto.setCommantRedepth(res.getInt("COMMANT_REDEPTH"));
					System.out.println("결과값:"+dto.getCommantRedepth());
				}
			
		} catch (ClassNotFoundException | SQLException | NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
				if(pstmt != null) conn.close();
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return dto;
	}
	
	public int ReCommantInsert(CommantDTO dto) {
		
		String sql = "INSERT INTO commant (commant_number, commant_writer, commant_content, commant_date, commant_redepth, commant_board, commant_re_id, commant_re_num) VALUES "
				+ "							(commant_num_seq.nextval,? ,? ,sysdate,? + 1,?,?,?)";
		
		int re = 0;
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCommantWriter());
			pstmt.setString(2, dto.getCommantContent());
			pstmt.setInt(3, dto.getCommantRedepth());
			pstmt.setInt(4, dto.getCommantBoard());
			pstmt.setString(5, dto.getCommantReid());
			pstmt.setInt(6, dto.getCommantReNum());
			re = pstmt.executeUpdate();
			System.out.println("깊이 : "+dto.getCommantRedepth());
		} catch (ClassNotFoundException | SQLException | NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		return re;
	}
	
}
