package Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Member.MemberDAO;

public class MemberSignIdCheckCommand implements Command {

	@Override
	public void run(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		MemberDAO dao = new MemberDAO();
		
		int check;
		
		String id = request.getParameter("id");
		System.out.println(id);
		check = dao.signIdCheck(id);
		
		request.setAttribute("state", check);
	}

}
