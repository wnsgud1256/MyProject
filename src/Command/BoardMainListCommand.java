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
		BoardDTO dto = new BoardDTO();
		
		int totalCount = dao.pageingCount();
		int listCount = 10; //한페이지에 보여줄 게시판의 개수
		int totalPage = totalCount / listCount; //보여줄 페이지의 개수 [1][2][3] 에 대항
		if (totalCount % listCount > 0) { //나누에 떨어질 경우 페이지가 하나 더있어야 하기 때문에 +1을 해줌
			totalPage++;
		}
		
		int page; //현재 보고있는 페이지 
		page = Integer.parseInt(request.getParameter("page"));
		System.out.println("넘어온 page값"+ page);
		if(totalPage < page) {
			page = totalPage;  //url에서 임의로 페이지수를 바꿀수 있기 때문에 총페이지 수보다 높은 페이지를 접근 못하게 함
		}
		int pageCount = 5; //하단에 보여줄 페이지 번호들의 개수
		int startPage = ((page -1 ) / pageCount) * pageCount + 1;
		//현재 페이지가 pageCount와 같을 때를 유의 하며(page-1)을 하고
		//+1은 첫 페이지가 0이나 10이 아니라 1이나 11로 하기 위함이다.
		int endPage = startPage + pageCount -1;
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		int from = (page * listCount) -(listCount-1);
		int to = (page * listCount);
		List<BoardDTO> Mainlist = dao.mainSelectBoard(from, to);
		
		request.setAttribute("list", Mainlist);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("listCount", listCount);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("page", page);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
	}

}
