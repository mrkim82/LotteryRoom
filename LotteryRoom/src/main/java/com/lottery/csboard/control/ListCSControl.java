package com.lottery.csboard.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lottery.FrontControl.Control;
import com.lottery.common.PageDTO;
import com.lottery.csboard.domain.CSVO;
import com.lottery.csboard.service.CSService;
import com.lottery.csboard.service.CSServiceImpl;

public class ListCSControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pageStr = req.getParameter("page");
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
				
		HttpSession session = req.getSession();
		String cbGrade;
		if(session.getAttribute("cbGrade")!=null) {
			cbGrade=String.valueOf(session.getAttribute("cbGrade"));
			session.removeAttribute("cbGrade");
		}else {
			cbGrade = req.getParameter("cbGrade");
		}
	
		CSService service = new CSServiceImpl();
		int total = service.getCount(cbGrade);
		CSVO pt = new CSVO();
		pt.setCbGrade(cbGrade);
		pt.setPage(page);
		List<CSVO> vo = service.listBoard(pt);
		
		
		PageDTO dto = new PageDTO(page, total);
		req.setAttribute("listInfo", vo);
		req.setAttribute("pageInfo", dto);
		req.setAttribute("totalcount", total);
		
		
		return "cs/listcs.tiles";
	}


}
