package Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.BoardDAO;
import Board.BoardDTO;

public class BoardDeleteCommand implements Command{

	@Override
	public void run(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		
		dto.setBoardNumber(Integer.parseInt(request.getParameter("number")));
		dao.deleteBoard(dto);
		
	}

}
