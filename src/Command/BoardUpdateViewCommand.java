package Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.BoardDAO;
import Board.BoardDTO;

public class BoardUpdateViewCommand implements Command {

	@Override
	public void run(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		
		//업데이트할 정보를 불러옴
		dto.setBoardNumber((Integer.parseInt(request.getParameter("number"))));
		dto = dao.oneBoard(dto);
		
		request.setAttribute("Info", dto);
	}

}
