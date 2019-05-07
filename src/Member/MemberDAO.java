package Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import Command.DBConnection;

public class MemberDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet res;
	
	public int signIdCheck(String id) {
		
		String sql = "SELECT member_id FROM m_member WHERE member_id = ?";
		System.out.println(id);
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			res = pstmt.executeQuery(); //검색된 행의 수가 ch에 저장됨.
			
			
			if(res.next()) {
				if(res.getString(1).equals(id)) {
					return 1; //아이디 중복
				}else 
					return 0; //중복 x
			
			}
			
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
		
		
		return 0;
	}
	
	public MemberDTO oneSelectMember(MemberDTO dto) {
		
		String sql = "SELECT * FROM m_member WHERE member_id = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMemberId());
			res = pstmt.executeQuery();
			
			if(res.next()) {
				
				dto.setMemberId(res.getString("MEMBER_ID"));
				dto.setMemberPw(res.getString("MEMBER_PW"));
				dto.setMemberName(res.getString("MEMBER_NAME"));
				dto.setMemberBirth(res.getString("MEMBER_BIRTH"));
				dto.setMemberEmail(res.getString("MEMBER_EMAIL"));
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
	
	public int updateMember(MemberDTO dto) {
		
		String sql = "UPDATE m_member SET member_pw = ?, member_birth = ? , member_email = ? WHERE member_id = ?";
		
		int u=0;
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMemberPw());
			pstmt.setString(2, dto.getMemberBirth());
			pstmt.setString(3, dto.getMemberEmail());
			pstmt.setString(4, dto.getMemberId());
			u = pstmt.executeUpdate();
			System.out.println("회원 정보 수정 작업");
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
	
	public int insertMember(MemberDTO dto){
		
		//(member_id, member_pw, member_name, member_birth, member_email)
		String sql = "INSERT INTO m_member (member_number, member_id, member_pw, member_name, member_birth, member_email) VALUES (member_num_seq.nextval,?,?,?,?,?)";
		int i=0;
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMemberId());
			pstmt.setString(2, dto.getMemberPw());
			pstmt.setString(3, dto.getMemberName());
			pstmt.setString(4, dto.getMemberBirth());
			pstmt.setString(5, dto.getMemberEmail());
			i = pstmt.executeUpdate();
			System.out.println("멤버 추가 작업");
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
	
	public int LoginMember(String id, String pw) { //로그인과 관련된 기능이 있는 메소드다. 인자로는 login.jsp 뷰단 에서 넘어온  id와 pw다.
		
		String sql = "SELECT member_pw FROM m_member WHERE member_id = ?"; //DB에 아이디가 있는지 확인.
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id); //넘어온 인자 id에 있는 값을 sql에 ?에 셋팅.
			res=pstmt.executeQuery();//결과가 존재한다면 , SELECT는 반환값이 존재 하기 때문에 리턴이 존재함. 
			
			if(res.next()) { //해당 코드 실행
			
				if(res.getString(1).equals(pw)) { //resultSet에는 현재 sql쿼리대한 결과값이 담겨져 있다. equals는 비교를 위한 메소드다. 객체를 비교하기 위한 메소드 ==연산과는 다름.
					//그리고 equals는 해당 객체에 대한 데이터값을 비교하지만 ==연산을 주소값을 비교한다.
					//데이터 베이스에 존재하는 값과 뷰단에서 요청한 비밀번호와 일치한다면? 
					return 1; //로그인 성공!
				}else //넘어온 인자값과 resultSet에 있는 값이 다르거나 존재 하지 않는다면.
					return 2; //비밀번호 불일치,
			}
			return 2; //아이디가 없음, return문은 해당 조건문을 가진 메소드를 종료시키기때문에 만약 위에 있는 리턴문을 종료시키면 로그인 체크메소드가 종료가 될것이다.
			
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
		
		return 0;
	}
}
