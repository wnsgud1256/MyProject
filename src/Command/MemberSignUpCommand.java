package Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Member.MemberDTO;

public class MemberSignUpCommand implements Command{

	@Override
	public void run(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		MemberDTO dto = new MemberDTO();
		
		System.out.println(request.getParameter("id"));
		System.out.println(request.getParameter("pw"));
		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("birth"));
		System.out.println(request.getParameter("email"));
		
		dto.setMemberId(request.getParameter("id"));
		dto.setMemberPw(request.getParameter("pw"));
		dto.setMemberName(request.getParameter("name"));
		dto.setMemberBirth(request.getParameter("birth"));
		dto.setMemberEmail(request.getParameter("email"));
		
		request.setAttribute("sign", dto);
	}

}
