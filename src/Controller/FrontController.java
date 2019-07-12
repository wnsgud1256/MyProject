package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Command.BoardDeleteCommand;
import Command.BoardInsertCommand;
import Command.BoardMainListCommand;
import Command.BoardOneSelectCommand;
import Command.BoardUpdateViewCommand;
import Command.BoardUpdateOkCommand;
import Command.Command;
import Command.InsertCommantCommand;
import Command.MemberInsertCommand;
import Command.MemberLoginCommand;
import Command.MemberMypageCommand;
import Command.MemberSignIdCheckCommand;
import Command.MemberSignUpCommand;
import Command.MemberUpdateCommand;
import Command.ReCommantInsertCommand;
import Command.deleteCommantCommand;
import Command.updateCommantCommand;
import Member.MemberDTO;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public FrontController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) //view단에서 넘어온 요청이 request에 담긴상태!
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		Command command = null;
		
		HttpSession session = request.getSession();
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String cop = uri.substring(conPath.length());
		
		
		
		System.out.println(uri);
		System.out.println(conPath);
		System.out.println(cop);

		String viewPage = null;
		PrintWriter out = response.getWriter();
		
		if(cop.equals("/login.do")) {			//로그인 요청이 들어오면
			command = new MemberLoginCommand(); //회원 로그인과 관련된 커맨드를 실행.
			command.run(request, response);
			int num =(int)request.getAttribute("check");
			System.out.println("아이디"+request.getAttribute("id"));
			System.out.println("세션아이디"+session.getAttribute("sessionid"));
			out.println(num);
			out.close(); 
			return; // 출력객체를 쓰게 된다면 Redirect방식으로 쓰면 이전에 쓰던 요청은 쓸수 없게 되므로 forward단에서 에러가 나게됨
				//그렇기 때문에 리턴을 해줘서 로그인 단에만 Redirect방식으로 url을 요청하게 만들어야함.
		} else if(cop.equals("/main.do")){
			command = new BoardMainListCommand();
			command.run(request, response);
			viewPage = "Main.jsp";
		} else if(cop.equals("/updatemember.do")) { 
			command = new MemberUpdateCommand(); 
			command.run(request, response);
			viewPage = "memberUpdate.jsp"; //요청이 들어오면 보여주는 페이지
			
		}else if(cop.equals("/mypage.do")) {
			command = new MemberMypageCommand();
			command.run(request, response);
			viewPage = "myPage.jsp";
			
		}else if(cop.equals("/SignIdCheck.do")) {
			command = new MemberSignIdCheckCommand();
			command.run(request, response);
			int state = (int)request.getAttribute("state");
			out.println(state);
			out.close();
			viewPage = "idCheckForm.jsp";
			return;
		}else if(cop.equals("/SignUpOk.do")) {
			command = new MemberInsertCommand();
			command.run(request, response);
			viewPage = "Login.jsp";
		}else if(cop.equals("/SignUp.do")) {
			command = new MemberSignUpCommand();
			command.run(request, response);
			viewPage = "signUpOk.jsp";
		}else if(cop.equals("/logOut.do")) {
			session.invalidate();
			viewPage = "logout.jsp";
		}else if(cop.equals("/boardinsert.do")) {
			command = new BoardInsertCommand();
			command.run(request, response);
			viewPage = "main.do";
		}else if(cop.equals("/oneselect.do")) {
			command = new BoardOneSelectCommand();
			command.run(request, response);
			viewPage = "boardOneSelect.jsp";
		}else if(cop.equals("/boardDelete.do")) {
			command = new BoardDeleteCommand();
			command.run(request, response);
			viewPage = "main.do";
		}else if(cop.equals("/boardUpdate.do")) {
			command = new BoardUpdateViewCommand();
			command.run(request, response);
			viewPage = "boardUpdate.jsp";
		}else if(cop.equals("/boardUpdateOk.do")) {
			command = new BoardUpdateOkCommand();
			command.run(request, response);
			viewPage = "oneselect.do";
		}else if(cop.equals("/insertcommant.do")) {
			command = new InsertCommantCommand();
			command.run(request, response);
			return;
		}else if(cop.equals("/deletecommant.do")) {
			command = new deleteCommantCommand();
			command.run(request, response);
			int delState = (int)request.getAttribute("delState");
			out.println(delState);
			out.close();
			return;
		}else if(cop.equals("/updatecommant.do")) {
			command = new updateCommantCommand();
			command.run(request, response);
			int upState = (int)request.getAttribute("upState");
			out.println(upState);
			out.close();
			return;
		}else if(cop.equals("/recommant.do")) {
			command = new ReCommantInsertCommand();
			command.run(request, response);
			return;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		// 받아온 request값을 view단으로 보내는 작업을 해야함. forward를 쓴다면 최초로 요청받은 정보를
		//다음 url에서도 쓸수가 있게된다.
		
	}
}
