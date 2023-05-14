package com.lottery.multiboard.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lottery.FrontControl.Control;
import com.lottery.multiboard.service.MultiService;
import com.lottery.multiboard.service.MultiServiceImpl;

public class RemoveMultiControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mbId = req.getParameter("mbId");
		String mbGrade = req.getParameter("mbGrade");
		MultiService service = new MultiServiceImpl();
		service.removeBoard(Integer.parseInt(mbId));
		
		HttpSession session = req.getSession();
		session.setAttribute("mbGrade", mbGrade);
		
		return "listMulti.do";
	}

}
