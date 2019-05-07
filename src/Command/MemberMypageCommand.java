package Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Member.MemberDAO;
import Member.MemberDTO;

public class MemberMypageCommand implements Command{

	@Override
	public void run(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		
		String id = request.getParameter("id");
		
		HttpSession session = request.getSession();
		session.setAttribute("id", id);
		
		dto = dao.oneSelectMember(dto);
		request.setAttribute("mypage", dto);
	}

}
