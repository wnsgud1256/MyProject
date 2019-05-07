package Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.BoardDAO;
import Board.BoardDTO;

public class BoardOneSelectCommand implements Command{

	@Override
	public void run(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		
		System.out.println((Integer.parseInt(request.getParameter("number"))));
		dto.setBoardNumber((Integer.parseInt(request.getParameter("number"))));
		
		dao.CountPlus(dao.getBoardCount(dto));
		dto = dao.oneBoard(dto);
		request.setAttribute("oneBoard", dto);
		
		
		
	}

}
