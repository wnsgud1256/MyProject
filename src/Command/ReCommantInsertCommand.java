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
		
		
		dto.setCommantWriter(request.getParameter("ReWriter"));
		dto.setCommantContent(request.getParameter("ReContent"));
		dto.setCommantBoard(Integer.parseInt(request.getParameter("ReBoNum")));
		dto.setCommantReNum(Integer.parseInt(request.getParameter("ReCommantNum")));		
		dto.setCommantReid(request.getParameter("RecommantId"));
		dao.getRedepth(dto);
		
		//깊이 증가시키는 추가 작업 해야하고 뷰단 조정 하면 해당 프로젝트는 끝남.
		
	}

}
