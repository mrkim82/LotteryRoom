package com.lottery.csboard.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lottery.FrontControl.Control;
import com.lottery.csboard.service.CSService;
import com.lottery.csboard.service.CSServiceImpl;

public class RemoveCSControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cbId = req.getParameter("cbId");
		String cbGrade = req.getParameter("cbGrade");
		CSService service = new CSServiceImpl();
		service.removeBoard(Integer.parseInt(cbId));
		
		HttpSession session = req.getSession();
		session.setAttribute("cbGrade", cbGrade);
		
		return "listCS.do";
	}

}

