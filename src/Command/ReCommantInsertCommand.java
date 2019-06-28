package Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Commant.CommantDAO;
import Commant.CommantDTO;

public class ReCommantInsertCommand implements Command {

	@Override
	public void run(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		CommantDAO dao = new CommantDAO();
		CommantDTO dto = new CommantDTO();
		
		
		
		dto.setCommantWriter(request.getParameter("Writer"));
		dto.setCommantContent(request.getParameter("Content"));
		dto.setCommantBoard(Integer.parseInt(request.getParameter("Number")));
		dto.setCommantReNum(Integer.parseInt(request.getParameter("CommantNum")));
		if(request.getParameter("RecommantId") != null) {
		dto.setCommantReid(request.getParameter("RecommantId"));
		}
		dao.RedepthPlus(dao.getRedepth(dto));
		dao.insertCommant(dto);
		
	}

}
