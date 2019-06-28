package Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Commant.CommantDAO;
import Commant.CommantDTO;

public class InsertCommantCommand implements Command {

	@Override
	public void run(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		//넘겨줘야 할거 댓글 쓴사람,댓글 내용,해당 board 넘버
		CommantDTO dto = new CommantDTO();
		CommantDAO dao = new CommantDAO();
		
		int deNum= 1;
		
		dto.setCommantRedepth(deNum);
		dto.setCommantWriter(request.getParameter("Writer"));
		dto.setCommantContent(request.getParameter("Content"));
		dto.setCommantBoard(Integer.parseInt(request.getParameter("Number")));
		
		dao.insertCommant(dto);
	}

}
