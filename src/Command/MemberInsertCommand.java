package Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Member.MemberDAO;
import Member.MemberDTO;

public class MemberInsertCommand implements Command{

	@Override
	public void run(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		
		dto.setMemberId(request.getParameter("id"));
		dto.setMemberPw(request.getParameter("pw"));
		dto.setMemberName(request.getParameter("name"));
		dto.setMemberEmail(request.getParameter("email"));
		dto.setMemberBirth(request.getParameter("birth"));
		
		dao.insertMember(dto);
		
	}

}
