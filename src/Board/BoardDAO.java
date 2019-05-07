package Board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import Command.DBConnection;

public class BoardDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet res;
	
	
	public int updateBoard(BoardDTO dto) {
		
		String sql ="UPDATE m_board SET board_title = ?, board_content = ? ,board_lmd = sysdate WHERE board_number = ?";
		int u = 0;
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBoardTitle());
			pstmt.setString(2, dto.getBoardContent());
			pstmt.setInt(3, dto.getBoardNumber());
			u = pstmt.executeUpdate();
			System.out.println("게시판 update 작업 수행");
			
			
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
	
	public int deleteBoard(BoardDTO dto) {
		
		String sql="DELETE FROM m_board WHERE board_number = ?";
		int d = 0;
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBoardNumber());
			d = pstmt.executeUpdate();
			System.out.println("게시판 delete 작업 수행");
			
			
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
	
	public int insertBoard(BoardDTO dto) {
		
		String sql = "INSERT INTO m_board VALUES(board_num_seq.nextval,?,0,?,sysdate,?)";
		int i = 0;
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBoardWriter());
			pstmt.setString(2, dto.getBoardContent());
			pstmt.setString(3, dto.getBoardTitle());
			i = pstmt.executeUpdate();
			System.out.println("게시판 insert작업 수행");
			
			
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
	public BoardDTO oneBoard(BoardDTO dto) {
		
		String sql = "SELECT * FROM m_board WHERE board_number = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBoardNumber()); 
			res = pstmt.executeQuery();
			
			
			if(res.next())
			{
				
				dto.setBoardWriter(res.getString("BOARD_WRITER"));
				dto.setBoardContent(res.getString("BOARD_CONTENT"));
				dto.setBoardTitle(res.getString("BOARD_TITLE"));
				dto.setBoardDate(res.getString("BOARD_DATE"));
				dto.setBoardCount(res.getInt("BOARD_COUNT"));
				dto.setBoardNumber(res.getInt("BOARD_NUMBER"));
				dto.setBoardLmd(res.getString("BOARD_LMD"));
				
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
		
		return dto;
		
	}
	public BoardDTO getBoardCount(BoardDTO dto) {
		String sql = "SELECT board_count, board_number FROM m_board WHERE board_number = ?"; //해당 게시판의 넘버에 대해 조회수를 증가 시켜야 되기 떄문에 
		//카운트와 번호를 반환 값으로 받는다.
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBoardNumber());
			res = pstmt.executeQuery(); //result에 결과물을 담아야함. 
			
				if(res.next()) {
					dto.setBoardNumber(res.getInt("BOARD_NUMBER"));
					dto.setBoardCount(res.getInt("BOARD_COUNT"));
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
	
	public int CountPlus(BoardDTO dto) {
		String sql = "UPDATE m_board SET board_count = ? + 1 WHERE board_number = ?";
		
		int u = 0;
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBoardCount());
			pstmt.setInt(2, dto.getBoardNumber());
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
	
	public List<BoardDTO> mainSelectBoard() {
		
		String sql = "SELECT * FROM m_board";
		List<BoardDTO> list = new ArrayList<>();
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			res = pstmt.executeQuery();
			
			
			while(res.next())
			{
				BoardDTO dto = new BoardDTO();
				
				dto.setBoardWriter(res.getString("BOARD_WRITER"));
				dto.setBoardContent(res.getString("BOARD_CONTENT"));
				dto.setBoardTitle(res.getString("BOARD_TITLE"));
				dto.setBoardDate(res.getString("BOARD_DATE"));
				dto.setBoardCount(res.getInt("BOARD_COUNT"));
				dto.setBoardNumber(res.getInt("BOARD_NUMBER"));
				dto.setBoardLmd(res.getString("BOARD_LMD"));
				list.add(dto);
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
}
