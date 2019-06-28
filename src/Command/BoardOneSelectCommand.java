package Command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.BoardDAO;
import Board.BoardDTO;
import Commant.CommantDAO;
import Commant.CommantDTO;

public class BoardOneSelectCommand implements Command{

	@Override
	public void run(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		CommantDTO cdto = new CommantDTO();
		CommantDAO cdao = new CommantDAO();
		
		
		dto.setBoardNumber((Integer.parseInt(request.getParameter("number"))));	
		
		cdto.setCommantBoard((Integer.parseInt(request.getParameter("number"))));
		List<CommantDTO> oneCommantList = cdao.commantList(cdto);
		
		dao.CountPlus(dao.getBoardCount(dto));
		dto = dao.oneBoard(dto);
		request.setAttribute("oneBoard", dto);
		request.setAttribute("onecommantlist", oneCommantList);
		
		
		
	}

}
