package com.lottery.multiboard.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lottery.FrontControl.Control;
import com.lottery.common.PageDTO;
import com.lottery.multiboard.domain.MultiVO;
import com.lottery.multiboard.service.MultiService;
import com.lottery.multiboard.service.MultiServiceImpl;

public class ListMultiControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pageStr = req.getParameter("page");
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		HttpSession session = req.getSession();
		String mbGrade;
		if(session.getAttribute("mbGrade")!=null) {
			mbGrade=String.valueOf(session.getAttribute("mbGrade"));
			session.removeAttribute("mbGrade");
		}else {
			mbGrade = req.getParameter("mbGrade");
		}
		
		MultiService service = new MultiServiceImpl();
		int total = service.getCount(mbGrade);
		MultiVO pt = new MultiVO();
		pt.setMbGrade(mbGrade);
		pt.setPage(page);
		List<MultiVO> vo = service.listBoard(pt);
		
		
		PageDTO dto = new PageDTO(page, total);
		req.setAttribute("listInfo", vo);
		req.setAttribute("pageInfo", dto);
		req.setAttribute("totalcount", total);
		
		
		return "multi/listmulti.tiles";
	}

}
