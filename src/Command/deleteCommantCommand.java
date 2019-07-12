package Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Commant.CommantDAO;
import Commant.CommantDTO;

public class deleteCommantCommand implements Command {

	@Override
	public void run(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		CommantDAO dao = new CommantDAO();
		CommantDTO dto = new CommantDTO();
		
		int del = 0;
		
		dto.setCommantNumber(Integer.parseInt(request.getParameter("CommantNum")));
		del = dao.deleteCommant(dto);
		
		request.setAttribute("delState", del);
	}

}
