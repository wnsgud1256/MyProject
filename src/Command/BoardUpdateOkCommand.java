package Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.BoardDAO;
import Board.BoardDTO;

public class BoardUpdateOkCommand implements Command{

	@Override
	public void run(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		
		int up;
		
		dto.setBoardTitle(request.getParameter("title"));
		dto.setBoardContent(request.getParameter("content"));
		dto.setBoardNumber((Integer.parseInt(request.getParameter("number"))));
		
		up = dao.updateBoard(dto);
		
		request.setAttribute("update", up);
		
		
	}

}
