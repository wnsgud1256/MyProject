package Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Commant.CommantDAO;
import Commant.CommantDTO;

public class updateCommantCommand implements Command {

	@Override
	public void run(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		CommantDAO dao = new CommantDAO();
		CommantDTO dto = new CommantDTO();
		
		int upCom = 0;
		dto.setCommantNumber(Integer.parseInt(request.getParameter("Number")));
		dto.setCommantContent(request.getParameter("reContent"));
		
		upCom = dao.updateCommant(dto);
		
		request.setAttribute("upState", upCom);
		
	}

}
