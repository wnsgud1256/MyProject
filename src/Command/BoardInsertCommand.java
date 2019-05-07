package Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.BoardDAO;
import Board.BoardDTO;

public class BoardInsertCommand implements Command {

	@Override
	public void run(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		BoardDTO dto = new BoardDTO();
		BoardDAO dao = new BoardDAO();
		
		int i;
		
		dto.setBoardWriter(request.getParameter("writer"));
		dto.setBoardContent(request.getParameter("content"));
		dto.setBoardTitle(request.getParameter("title"));
		
		i = dao.insertBoard(dto);
		
		request.setAttribute("IB", i);
		
	}

}
