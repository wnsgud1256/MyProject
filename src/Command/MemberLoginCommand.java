package Command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Member.MemberDAO;

public class MemberLoginCommand implements Command {

	@Override
	public void run(HttpServletRequest request, HttpServletResponse response) { //현재 login의 view단에 id와 pw에 대한 값이 request객체에 담겨서 넘어온 상태.
		// TODO Auto-generated method stub
		
		MemberDAO dao = new MemberDAO();
		int check; //db에 있는 값과 request에 담겨져서 넘겨온 값이 맞는지 확인 하기 위해 체크할 변수를 생성.
		
		String id = request.getParameter("id"); //request객체에서 name이 id에 있는 값을 꺼내 String형 객체에 담은
		String pw = request.getParameter("pw"); // 이하동문.
		
		check = dao.LoginMember(id, pw);//dao에 회원로그인에 관련된 메소드를 실행 인자로는 login뷰단에서 넘어온 id와 pw를 넘겨준다.
		//반환 값으로는 0,1,2,3 중 하나 일것이다. 0은 기본값(DB오류) 1은 로그인 성공 2는 비밀번호틀림 3은 아이디가 존재하지 않는다. 
		request.setAttribute("check", check);
		
		if(check == 1) {
			
			HttpSession session = request.getSession();
			session.setAttribute("sessionid", id);
			request.setAttribute("id", id);
			System.out.println("로그인 성공!");
		} else if(check == 2) {
			System.out.println("아이디 , 비밀번호 오류");
		} else if(check == 0) {
			System.out.println("데이터베이스 오류");
		} 
		
		
		System.out.println(check);
		
	}

}
