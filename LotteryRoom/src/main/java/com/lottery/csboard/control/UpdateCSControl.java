package com.lottery.csboard.control;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lottery.FrontControl.Control;
import com.lottery.csboard.domain.CSVO;
import com.lottery.csboard.service.CSService;
import com.lottery.csboard.service.CSServiceImpl;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UpdateCSControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getMethod().equals("GET")) {
			String cbId = req.getParameter("cbId");
			CSService service = new CSServiceImpl();
			CSVO vo = service.getBoard(Integer.parseInt(cbId));
			req.setAttribute("VOInfo", vo);
			
			return "cs/updatecs.tiles";
			
		} else if (req.getMethod().equals("POST")) {
			String saveDir = req.getServletContext().getRealPath("images");
			int maxSize = 5 * 1024 * 1024;
			String encoding = "UTF-8";
			DefaultFileRenamePolicy rn = new DefaultFileRenamePolicy();
			MultipartRequest multi = new MultipartRequest(req, saveDir, maxSize, encoding, rn);
			
			Enumeration<?> enu = multi.getFileNames();
			while (enu.hasMoreElements()) {
				String file = (String) enu.nextElement();
				System.out.println("file : " + file);
			}
			String cbId = multi.getParameter("cbId");
			String cbTitle = multi.getParameter("cbTitle");
			String cbSubject = multi.getParameter("cbSubject");
			String cbAttach = multi.getFilesystemName("cbAttach");
			String cbGrade = multi.getParameter("cbGrade");
			
			CSVO vo = new CSVO();
			
			vo.setCbId(Integer.parseInt(cbId));
			vo.setCbTitle(cbTitle);
			vo.setCbSubject(cbSubject);
			vo.setCbAttach(cbAttach);

			HttpSession session = req.getSession();
			session.setAttribute("cbGrade", cbGrade);
			
			CSService service = new CSServiceImpl();
			service.modifyBoard(vo);
		}
		
		return "listCS.do";
	}
}
