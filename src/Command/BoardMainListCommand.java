package Command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.BoardDAO;
import Board.BoardDTO;

public class BoardMainListCommand implements Command{

	@Override
	public void run(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> Mainlist = dao.mainSelectBoard();
		
		request.setAttribute("list", Mainlist);
	}

}
